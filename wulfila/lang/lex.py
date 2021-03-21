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

# Local Imports
from .letter import *

# Configure Logger
from logging import getLogger
logger = getLogger()

gender = {
    "animate": "a.",
    "inanimate": "ina.",
    "masculine": "m.",
    "feminine": "f.",
    "neuter": "n.",
    "bestial": "bstl.",
    "spiritual": "s."
}

class Term:

    def __init__(self, data):
        self.valid = True
        self.syllables = 0
        self.size = 0
        self.phonetic = []
        self.gramm = ""
        self.gender = ""

        try:
            self.name = data["term"]

            for syl in self.name.split("."):
                self.syllables += 1
                phono_syl = []
                for base_letter in syl.split(","):
                    letter = get_letter(base_letter)
                    phono_syl.append(letter)
                self.phonetic.append(phono_syl)
            self.display = data.get("entry", self.name)
            self.definition = data.get("definition", "")
            self.gender = data.get("gender", "")
            self.gramm = data.get("gramm", "")

        except Exception as e:
            logger.warn(f"Invalid Term: {data}, due to {e}")
            self.valid = False

    @property
    def gender_abbrev(self):
        return gender.get(self.gender, self.gender)


    def latex_phono(self):
        text = []
        for syl in self.phonetic:
            tex_syl = []
            for letter in syl:
                tex_syl.append(letter.latex)
            text.append("".join(tex_syl))
        return ".".join(text)

    def __repr__(self):
        return f"<Term: {self.name}/>"

class Lexicon:

    def __init__(self):
        self.terms = {}

    def __repr__(self):
        return f'{len(self.terms)} entries'

    def append(self, entry):
        term = Term(entry)
        if term.valid:
            letter = term.name[0]
            if letter in self.terms:
                if term.name in self.terms[letter]:
                    self.terms[letter][term.name].append(term) 
                else:
                    self.terms[letter][term.name] = [term]
            else:
                self.terms[letter] = {}
                self.terms[letter][term.name] = [term]

def spec_lexicon(lang, terms):

    for entry in terms:
        lang.lexicon.append(entry)

