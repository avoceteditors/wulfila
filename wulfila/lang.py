# Module Imports
import re
import ipapy

space = re.compile("\s+")

def set_syllabary(data, lang):
    for datum in data:
        syllable = datum.get("pattern", "vowel") 
        freq = datum.get("freq", 1)

        for i in range(0, freq):
            lang["syllabary"].append(syllable)

def set_phonemes(data, lang):
    for letter in re.split(space, data):
        phoneme = ipapy.UNICODE_TO_IPA[letter]
        lang["phonemes"].append(phoneme)

def update_phonology(data, lang):

    # Append Phonemes
    if "phonemes" in data:
        set_phonemes(data["phonemes"], lang)

    if "syllabary" in data:
        set_syllabary(data["syllabary"], lang)

def update_lexicon(data, lang):

    for entry in data:
        term = entry.get("term", None)
        if term is not None:
            sort = entry.get("sort", term)

            # Set Default Information
            if "sort" not in entry:
                entry["sort"] = term

            if "long" not in entry:
                entry["long"] = []

            # Add Term to Lexicon
            if sort[0] not in lang:
                lang[sort[0]] = {}

            if sort in lang[sort[0]]:
                logger.warn("Term Reuse: %s", sort)

            lang[sort[0]][sort] = entry

def update(data, lang):

    # Set Name
    if "name" in data:
        lang["name"] = data["name"]

    # Check for Phonology
    if "phonology" in data:
        update_phonology(data["phonology"], lang)

    # Check for Lexicon
    if "terms" in data:
        update_lexicon(data["terms"], lang["lexicon"])