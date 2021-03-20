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
import random

# Local Imports
from .letter import *
from .word import *

# Configure Logger
from logging import getLogger
logger = getLogger()

class Phonology:

    def __init__(self):
        self.phonemes = {}
        self.syllables = {
            "initial": [],
            "medial": [],
            "terminal": []
        } 

    def __repr__(self):
        return f'Phonology(phonemes="{self.phonemes}" syllables="{self.syllables}")'

    def empty(self):
        return self.phonemes == {} or self.syllables == { "initial": [], "medial": [], "terminal": [] } 

    def update_phonemes(self, data):
        for key, val in data.items():
            if key not in self.phonemes:
                self.phonemes[key] = []
            for i in val.split():
                c = registry.get(i, i)
                if isinstance(c, str):
                    logger.warn(f"Unknown Character Type: {c}")
                elif isinstance(c, Letter):
                    self.phonemes[key].append(c)

    def update_syllabary(self, data):
        for key, val in data.items():
            if key in ["initial", "medial", "terminal"]:
                for pattern in val.split(" "):
                    if ":" in pattern:
                        (pattern, weight) = pattern.split(":")
                    pattern = pattern.split("-")
                    weight = int(weight)
                    for i in range(0, weight):
                        self.syllables[key].append(pattern)
            else:
                logger.warn(f"Invalid syllabary key {key}")

    def generate_words(self, num_words, min=2, max=5):
        logger.debug(f"Word Generation: {num_words} words, between {min} and {max} syllables")

        words = []

        # Patterns
        initials = self.syllables["initial"]
        medials = self.syllables["medial"]
        terminals = self.syllables["terminal"]
        
        init_len = len(initials) - 1
        med_len = len(medials) - 1
        term_len = len(terminals) - 1 

        phon_lens = {}

        while len(words) < num_words:

            # Initialize Word
            word = Word()

            # Determine Syllable Count
            count = random.randint(min, max)

            # Single Syllable
            if count == 1:
                pass
            elif count == 2:

                # Select Patterns
                init_pattern = random.randint(0, init_len)
                init = initials[init_pattern] 
                term_pattern = random.randint(0, term_len)
                term = terminals[term_pattern]

                # Apply Pattern
                for pattern in [init, term]:
                    self.form_syllable(word, pattern)
            elif count > 2:

                # Select Patterns
                init_pattern = random.randint(0, init_len)
                init = initials[init_pattern] 

                term_pattern = random.randint(0, term_len)
                term = terminals[term_pattern]

                # Add Initial:
                self.form_syllable(word, init)

                # Add Medials
                for s in range(0, count - 2):
                    med_pattern = random.randint(0, med_len)
                    med = medials[med_pattern]
                    self.form_syllable(word, med)

                # Add Terminal
                self.form_syllable(word, term)


            if word.valid:
                words.append(word)

        return words
            
    def form_syllable(self, word, pattern):
        syllable = []
        for lett_type in pattern:
            letters = self.phonemes[lett_type]
            syllable.append(letters[random.randint(0, len(letters) - 1)])
        word.append(syllable)



def spec_phonology(lang, data):
    lang.phonology.update_phonemes(data.get("phonemes", {}))
    lang.phonology.update_syllabary(data.get("syllables",{}))
