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

# Logger Configuration
from logging import getLogger
logger = getLogger()

############################ LETTER SUPERCLASS ##############################
class Letter:
    string = "__NONE__"
    latex = "__NONE__"

    def __init__(self, string, latex=None):
        self.string = string
        if latex is not None:
            self.latex = latex
        else:
            self.latex = string

    def __repr__(self):
        return f'{self.string}'


########################### VOWELS ###########################################
class Vowel(Letter):
    pass

########################### CONSONANTS ###########################################
class Consonant(Letter):
    pass

########################### REGISTRY FOR READING IN DATA #################################
registry = {
    "a": Vowel("a"),
    "e": Vowel("e"),
    "i": Vowel("i"),
    "o": Vowel("o"),
    "u": Vowel("u"),
    "b": Consonant("b"),
    "b^w": Consonant("bʷ", "b\\textsuperscript{w}"),
    "b^h-": Consonant("bʱ", "b\\textsuperscript{\\texthth}"),
    "p^w": Consonant("pʷ", "p\\textsuperscript{w}"),
    "p^h-": Consonant("pʰ", "p\\textsuperscript{h}"),
    "d": Consonant("d"),
    "d^h": Consonant("d-h", "d\\textsuperscript{h}"),
    "d^w": Consonant("dw", "d\\textsuperscript{w}"),
    "g": Consonant("g"),
    "gw": Consonant("ɢ", "\\textscg{}"),
    "gh": Consonant("ɣ", "\\textbabygamma{}"),
    "q": Consonant("q"),
    "f": Consonant("f"),
    "dh": Consonant("ð", "\\dh{}"),
    "th": Consonant("þ", "\\th{}"),
    "r": Consonant("r"),
    "z": Consonant("z"),
    "zh": Consonant("ʒ","\\textyogh{}"),
    "sh": Consonant("ʃ", "\\textesh{}"),
    "x": Consonant("x"),
    "l": Consonant("l", "\\textscl{}"),
    "L": Consonant("ʟ", "\\textscl{}"),
    "l*": Consonant("ʎ", "\\textlambda{}"),
    "m": Consonant("m")
}
def get_letter(key):
    try:
        return registry[key]
    except:
        logger.warn(f"Unregistered Letter Pattern: {key}")
        return key
