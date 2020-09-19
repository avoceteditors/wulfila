##############################################################################
# Copyright (c) 2020, Kenneth P. J. Dyer <kenneth@avoceteditors.com>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
# * Neither the name of the copyright holder nor the name of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
##############################################################################

# Module Imports
import argparse
import json
import logging
import pathlib
import re
import textwrap
import wget

datafile = pathlib.Path("data/cleasby-vigfuson-dictionary.txt")
cdef str datafile_url = "http://www.germanic-lexicon-project.org/txt/oi_cleasbyvigfusson.txt"

jsonfile = pathlib.Path("data/cleasby-vigfuson-dictionary.json")

pagenum= re.compile('<PAGE NUM="')
num = re.compile("^b[0-9]+")
bopen = re.compile("^\s*<B>")
newline = re.compile("\n\s+")
amp = re.compile("&")

cdef class Line(object):
    cdef public int headword
    cdef public str line
    cdef public int pagenum

    def __init__(self, str line, int pagenum):
        self.line = line
        self.pagenum = pagenum

        if re.match(bopen, line):
            self.headword = True
        else:
            self.headword = False

    def __repr__(self):
        return f"Line: headword='{self.headword}' on page='{self.pagenum}'"

##### CLEAN TEXT ###########

cdef list subs = [

    ("Á", re.compile("&Aacute;")),
    ("á", re.compile("&aacute;")),
    ("é", re.compile("&eacute;")),
    ("É", re.compile("&Eacute;")),
    ("í", re.compile("&iacute;")),
    ("Í", re.compile("&Iacute;")),
    ("ó", re.compile("&oacute;")),
    ("Ó", re.compile("&Oacute;")),
    ("ú", re.compile("&uacute;")),
    ("Ú", re.compile("&Uacute;")),
    ("ý", re.compile("&yacute;")),
    ("Ý", re.compile("&Yacute;")),

    ("æ", re.compile("&aelig;")),
    ("Æ", re.compile("&AElig;")),
    ("œ", re.compile("&oelig;")),
    ("Œ", re.compile("&OElig;")),
    ("ö", re.compile("&ouml;")),
    ("Ö", re.compile("&Ouml;")),

    ("ä", re.compile("&auml;")),
    ("Ä", re.compile("&Auml;")),
    ("ø", re.compile("&oslash;")),
    ("Ø", re.compile("&OSLASH;")),

    ("ð", re.compile("&eth;")),
    ("Ð", re.compile("&ETH;")),
    ("þ", re.compile("&thorn;")),
    ("Þ", re.compile("&THORN;")),
]

cdef str clean(str text):

    cdef str c
    cdef object pattern

    for (c, pattern) in subs:
        text = re.sub(pattern, c, text)

    return text

clear_ws = re.compile("\s+")
bsplit = re.compile("\s*?</B>\s*?")

cdef str italic = "\033[3m"
cdef str bold = "\033[1m"
cdef str clear = "\033[0m"

re_italic_open = re.compile("<I>")
re_close = re.compile("</I>|</B>")
re_bold_open = re.compile("<B>")
re_term_comma = re.compile(",$")

cdef class Word(object):

    cdef list lines
    cdef str definition
    cdef str term 

    def __init__(self):
        self.lines = []
        self.definition = ""
        self.term= ""

    def add(self, Line line):
        self.lines.append(line)

    def process(self):
        cdef str headline = self.lines[0].line

        cdef list split = re.split(bsplit, headline, maxsplit=1)
        self.term = re.sub(bopen, "", split[0])
        self.lines[0].line = split[1]

        split = []
        for line in self.lines:
            split.append(line.line)
        self.definition = " ".join(split)

        cdef str text = self.definition
        text = re.sub(clear_ws, " ", text)
        self.definition = text.strip()
        self.term = re.sub(re_term_comma, "", self.term)

        self.term = self.term.strip()

    def __iter__(self):
        yield 'term', self.term
        yield 'def', self.definition


cdef list preprocess_data(str base_data):

    base_data = clean(base_data)

    cdef list pages, data
    pages = re.split(pagenum, base_data)
    cdef list lines = []
    cdef Line line
    cdef str text

    cdef int pgnum = 0
    for page in pages:
        pgnum += 1
        if re.match(num, page):
            for text in re.split(newline, page):
                lines.append(Line(text, pgnum))

    cdef Word word = None

    cdef list base_words = []
    for line in lines:
        if line.headword:
            word = Word()
            word.add(line)
            base_words.append(word)
        elif word is not None:
            word.add(line)

    logging.debug(f"Number of Words: {len(base_words)}")

    cdef list words = [] 
    for word in base_words:
        word.process()
        words.append(dict(word))

    return words 

cdef void update_datafile():
    wget.download(datafile_url, str(datafile))

cdef void run():

    # Arugment Parser
    parser = argparse.ArgumentParser()
    parser.add_argument('-D', '--debug', action='store_true', help="Forces operations, overwriting files")
    parser.add_argument('-f', '--force', action='store_true', help="Forces operations, overwriting files")
    args = parser.parse_args()

    if args.debug:
        log_level = logging.DEBUG
    else:
        log_level = logging.WARN

    logging.basicConfig(format="[ %(levelname)s ]: %(message)s", level=log_level)
    logging.info("Updating Database")

    # Downlaod data from Germanic Lexicon Project
    if not datafile.exists() or args.force:
        logging.debug("Creating/Overwriting Data File")
        update_datafile()
    else:
        logging.warning("Data File exists, use --force to re-download")

    cdef str base_data
    with open(datafile, 'r') as f:
        base_data = f.read()

    cdef list data = preprocess_data(base_data)

    logging.debug("Saving data to JSON file")
    with open(jsonfile, 'w') as f:
        json.dump(data, f, ensure_ascii=False, indent=3)






