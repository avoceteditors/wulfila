defmodule Wulfila.Phoneme.Letter do

  ##################################################################################
  ################################### CONSONANT ####################################
  ##################################################################################

  ################################## NASAL CONSONANTS ##############################

  # Bilabial Nasal Consonant

  def parse("m̥") do
    %Wulfila.Phoneme{letter: "m", type: [:consonant, :sonorant, :nasal, :bilabial, :voiceless]}
  end

  def parse("mo*") do
    parse("m̥")
  end

  def parse("m") do
    %Wulfila.Phoneme{letter: "m", type: [ :consonant, :sonorant, :nasal, :bilabial, :voiced]}
  end


  # Labio-Dental Nasal Voiced Consonant

  def parse("ɱ") do
    %Wulfila.Phoneme{letter: "ɱ", type: [:consonant, :sonorant, :nasal, :labiodental, :voiced]}
  end

  def parse("m,*") do
    parse("ɱ")
  end


  # Linguo-Labial Nasal Voiced Consonant

  def parse("n̼") do
    %Wulfila.Phoneme{letter: "n̼", type: [:consonant, :sonorant, :nasal, :liguolabial, :voiced]}
  end

  def parse("n-*") do
    parse("n̼")
  end


  # Alveolar Nasal Consonant

  def parse("n̥") do
    %Wulfila.Phoneme{letter: "n̥", type: [:consonant, :sonorant, :nasal, :alveolar, :voiceless]}
  end

  def parse("no*") do
    parse("n̥")
  end


  def parse("n") do
    %Wulfila.Phoneme{letter: "n", type: [:consonant, :sonorant, :nasal, :alveolar, :voiced]}
  end

  # Retroflex Nasal Consonant

  def parse("ɳ̊") do
    %Wulfila.Phoneme{letter: "ɳ̊", type: [:consonant, :sonorant, :nasal, :retroflex, :voceless]}
  end

  def parse("n,o*") do
    parse("ɳ̊")
  end


  def parse("ɳ") do
    %Wulfila.Phoneme{letter: "ɳ", type: [:consonant, :sonorant, :nasal, :retroflex, :voiced]}
  end

  def parse("n,*") do
    parse("ɳ")
  end

  # Palatal Nasal Consonant

  def parse("ɲ̊") do

    %Wulfila.Phoneme{letter: "ɲ̊", type: [:consonant, :sonorant, :nasal, :palatal, :voiceless]}
  end

  def parse(",no*") do
    parse("ɲ̊")
  end

  def parse("ɲ") do
    %Wulfila.Phoneme{letter: "ɲ", type: [:consonant, :sonorant, :nasal, :palatal, :voiced]}
  end

  def parse(",n*") do
    parse("ɲ")
  end


  # Velar Nasal Consonant

  def parse("ŋ̊") do
    %Wulfila.Phoneme{letter: "ŋ̊", type: [:consonant, :sonorant, :nasal, :velar, :voiceless]}
  end

  def parse("n-o*") do
    parse("ŋ̊")
  end

  def parse("ŋ") do
    %Wulfila.Phoneme{letter: "ŋ", type: [:consonant, :sonorant, :nasal, :velar, :voiced]}
  end

  def parse("n-*") do
    parse("ŋ")
  end

  # Uvular Nasal Consonant
  def parse("ɴ") do
    %Wulfila.Phoneme{letter: "ɴ", type: [:consonant, :sonorant, :nasal, :uvular, :voiced]}
  end

  def parse("N") do
    parse("ɴ")
  end

  ############################ PLOSIVE CONSONANTS #################################

  # Plosive Bilabial Consonants

  def parse("p") do
    %Wulfila.Phoneme{letter: "p", type: [:consonant, :obstruent, :plosive, :bilabial, :voiceless]}
  end

  def parse("b") do
    %Wulfila.Phoneme{letter: "b", type: [:consonant, :obstruent, :plosive, :bilabial, :voiced]}
  end


  # Plosive Labio-Dental Consonant

  def parse("p̪") do
    %Wulfila.Phoneme{letter: "p̪", type: [:consonant, :obstruent, :plosive, :labiodental, :voiceless]}
  end

  def parse("p~*") do
    parse("p̪")
  end

  def parse("b̪") do
    %Wulfila.Phoneme{letter: "b̪", type: [:consonant, :obstruent, :plosive, :labiodental, :voiced]}
  end

  def parse("b~*") do
    parse("b̪")
  end

  # Plosive Linguo-Labial Consonant

  def parse("t̼") do
    %Wulfila.Phoneme{letter: "t̼", type: [:consonant, :obstruent, :plosive, :linguolabial, :voiceless]}
  end

  def parse("t~*") do
    parse("t̼")
  end

  def parse("d̼") do
    %Wulfila.Phoneme{letter: "d̼", type: [:consonant, :obstruent, :plosive, :linguolabial, :voiced]}
  end

  def parse("d~*") do
    parse("d̼")
  end

  # Plosive Alveolar Consonant

  def parse("t") do
    %Wulfila.Phoneme{letter: "t", type: [:consonant, :obstruent, :plosive, :alveolar, :voiceless]}
  end

  def parse("d") do
    %Wulfila.Phoneme{letter: "d", type: [:consonant, :obstruent, :plosive, :alveolar, :voiced]}
  end

  # Plosive Retroflex Consonant

  def parse("ʈ") do
    %Wulfila.Phoneme{letter: "ʈ", type: [:consonant, :obstruent, :plosive, :retroflex, :voiceless]}
  end

  def parse("t-*") do
    parse("ʈ")
  end

  def parse("ɖ") do
    %Wulfila.Phoneme{letter: "ɖ", type: [:consonant, :obstrunt, :plosive, :retroflex, :voiced]}
  end

  def parse("d-*") do
    parse("ɖ")
  end


  # Plosive Palatal Consonants

  def parse("c") do
    %Wulfila.Phoneme{letter: "c", type: [:consonant, :obstruent, :plosive, :palatal, :voiceless]}
  end

  def parse("ɟ") do
    %Wulfila.Phoneme{letter: "ɟ", type: [:consonant, :obstruent, :plosive, :palatal, :voiced]}
  end

  def parse("fi*") do
    parse("ɟ")
  end


  # Plosive Velar Consonants

  def parse("k") do
    %Wulfila.Phoneme{letter: "k", type: [:consonant, :obstruent, :plosive, :velar, :voiceless]}
  end

  def parse("g") do
    %Wulfila.Phoneme{letter: "g", type: [:consonant, :obstruent, :plosive, :velar, :voiced]}
  end

  # Plosive Uvular Consonants

  def parse("q") do
    %Wulfila.Phoneme{letter: "q", type: [:consonant, :obstruent, :plosive, :uvular, :voiceless]}
  end

  def parse("ɢ") do
    %Wulfila.Phoneme{letter: "ɢ", type: [:consonant, :obstruent, :plosive, :uvular, :voiced]}
  end

  def parse("G") do
    parse("ɢ")
  end

  # Epiglottal Plosive

  def parse("ʡ") do
    %Wulfila.Phoneme{letter: "ʡ", type: [:consonant, :obstruent, :plosive, :epiglottal]}
  end

  def parse("cr+*") do
    parse("ʡ")
  end

  # Glottal Plosive
  def parse("ʔ") do
    %Wulfila.Phoneme{letter: "ʔ", type: [:consonant, :obstruent, :plosive, :glottal]}
  end

  def parse("cr-*") do
    parse("ʔ")
  end

  ######################### SIBILANT FRICATIVES ####################################

  # Alveolar Sibilant Consonants
  def parse("s") do
    %Wulfila.Phoneme{letter: "s", type: [:consonant, :obstruent, :fricative, :sibilant, :strident, :alveolar, :voiceless]}
  end

  def parse("z") do
    %Wulfila.Phoneme{letter: "z", type: [:consonant, :obstruent, :fricative, :sibilant, :strident, :alveolar, :voiced]}
  end


  # Post-Alveolar Sibilant Consonant

  def parse("ʃ") do
    %Wulfila.Phoneme{letter: "ʃ", type: [:consonant, :obstruent, :fricative, :sibilant, :strident, :postalveolar, :voiceless]}
  end

  def parse("sh") do
    parse("ʃ")
  end

  def parse("ʒ") do
    %Wulfila.Phoneme{letter: "ʒ", type: [:consonant, :obstruent, :fricative, :sibilant, :strident, :postalveolar, :voiced]}
  end

  def parse("zh") do
    parse("ʒ")
  end

  # Retroflex Sibilant Consonants
  def parse("ʂ") do
    %Wulfila.Phoneme{letter: "ʂ", type: [:consonant, :obstruent, :fricative, :sibilant, :strident, :retroflex, :voiceless]}
  end

  def parse("s,*") do
    parse("ʂ")
  end

  def parse("ʐ") do
    %Wulfila.Phoneme{letter: "ʐ", type: [:consonant, :obstruent, :fricative, :sibilant, :strident, :retroflex, :voiced]}
  end

  def parse("z,*") do
    parse("ʐ")
  end

  # Palatal Sibilant Consonants
  def parse("ɕ") do
    %Wulfila.Phoneme{letter: "ɕ", type: [:consonant, :obstruent, :fricative, :sibilant, :strident, :palatal, :voiceless]}
  end

  def parse("co*") do
    parse("ɕ")
  end

  def parse("ʑ") do
    %Wulfila.Phoneme{letter: "ʑ", type: [:consonant, :obstruent, :fricative, :sibilant, :stridnt, :palatal, :voiced]}
  end

  def parse("zo*") do
    parse("ʑ")
  end

  ############################# NON-SIBILANT FRICATIVES ###########################

  # Bilabial Fricative Consonant
  def parse("ɸ") do
    %Wulfila.Phoneme{letter: "ɸ", type: [:consonant, :obstruent, :fricative, :nonsibilant, :bilabial, :voiceless]}
  end

  def parse("φ") do
    parse("ɸ")
  end

  def parse("ff") do
    parse("ɸ")
  end

  def parse("β") do
    %Wulfila.Phoneme{letter: "β", type: [:consonant, :obstruent, :fricative, :nonsibilant, :bilabial, :voiced]}
  end

  def parse("B") do
    parse("β")
  end

  # Labio-Dental Fricative Consonant
  def parse("f") do
    %Wulfila.Phoneme{letter: "f", type: [:consonant, :obstruent, :fricative, :nonsibilant, :strident, :labiodental, :voiceless]}
  end

  def parse("v") do
    %Wulfila.Phoneme{letter: "v", type: [:consonant, :obstruent, :fricative, :nonsibilant, :strident, :labiodental, :voiced]}
  end

  # Linguo-Labial Fricative Consonant

  def parse("θ̼ ") do
    %Wulfila.Phoneme{letter: "θ̼ ", type: [:consonant, :obstruent, :fricative, :nonsibilant, :linguolabial, :voiceless]}
  end

  def parse("th_*") do
    parse("θ̼ ")
  end

  def parse("ð̼") do
    %Wulfila.Phoneme{letter: "ð̼", type: [:consonant, :obstruent, :fricative, :nonsibilant, :linguolabial, :voiced]}
  end

  def parse("dh_*") do
    parse("ð̼")
  end

  # Dental Fricative
  def parse("θ") do
    %Wulfila.Phoneme{letter: "θ", type: [:consonant, :obstruent, :fricative, :nonsibilant, :dental, :voiceless]}
  end

  def parse("th") do
    parse("θ")
  end

  def parse("ð") do
    %Wulfila.Phoneme{letter: "ð", type: [:consonant, :obstruent, :fricative, :nonsibilant, :dental, :voiced]}
  end

  def parse("dh") do
    parse("ð")
  end

  # Alveolar Fricative Consonant
  def parse("θ̠") do
    %Wulfila.Phoneme{letter: "θ̠", type: [:consonant, :obstruent, :fricative, :nonsibilant, :alveolar, :voiceless]}
  end

  def parse("th-*") do
    parse("θ̠")
  end

  def parse("ð̠") do
    %Wulfila.Phoneme{letter: "ð̠", type: [:consonant, :obstruent, :fricative, :nonsibilant, :alveolar, :voiced]}
  end

  def parse("dh-*") do
    parse("ð̠")
  end

  # Post-Alveolar Fricative Consonant
  def parse("ɹ̠̊˔") do
    %Wulfila.Phoneme{letter: "ɹ̠̊˔", type: [:consonant, :obstruent, :fricative, :nonsibilant, :postalveolar, :voiceless]}
  end

  def parse("dho") do
    parse("ɹ̠̊˔")
  end

  def parse("ɹ̠˔") do
    %Wulfila.Phoneme{letter: "ɹ̠˔", type: [:consonant, :obstruent, :fricative, :nonsibilant, :postalveolar, :voiced]}
  end

  def parse("tho") do
    parse("ɹ̠˔")
  end

  # Retroflex Fricative

  def parse("ɻ˔") do
    %Wulfila.Phoneme{letter: "ɻ˔", type: [:consonant, :obstruent, :fricative, :nonsibilant, :retroflex]}
  end

  def parse("thr") do
    parse("ɻ˔")
  end

  # Palatal Fricative Consonant
  def parse("ç") do
    %Wulfila.Phoneme{letter: "ç", type: [:consonant, :obstruent, :fricative, :nonsibilant, :palatal, :voiceless]}
  end

  def parse("c,*") do
    parse("ç")
  end

  def parse("ʝ") do
    %Wulfila.Phoneme{letter: "ʝ", type: [:consonant, :obstruent, :fricative, :nonsibilant, :palatal, :voiced]}
  end

  def parse("j_*") do
    parse("ʝ")
  end

  # Velar Fricative Consonant
  def parse("x") do
    %Wulfila.Phoneme{letter: "x", type: [:consonant, :obstruent, :fricative, :nonsibilant, :velar, :voiceless]}
  end

  def parse("ɣ") do
    %Wulfila.Phoneme{letter: "ɣ", type: [:consonant, :obstruent, :fricative, :nonsibilant, :velar, :voiced]}
  end

  def parse("bg") do
    parse("ɣ")
  end

  # Uvular Fricative
  def parse("χ") do
    %Wulfila.Phoneme{letter: "χ", type: [:consonant, :obstruent, :fricative, :nonsibilant, :uvular, :voiceless]}
  end

  def parse("X") do
    parse("χ")
  end

  def parse("ʁ") do
    %Wulfila.Phoneme{letter: "ʁ", type: [:consonant, :obstruent, :fricative, :nonsibilant, :uvular, :voiced]}
  end

  def parse("Ri") do
    parse("ʁ")
  end

  # Pharyngeal Fricative Consonants

  def parse("ħ") do
    %Wulfila.Phoneme{letter: "ħ", type: [:consonant, :obstruent, :fricative, :nonsibilant, :pharyngeal, :voiceless]}
  end

  def parse("h-") do
    parse("ħ")
  end

  def parse("ʕ") do
    %Wulfila.Phoneme{letter: "ʕ", type: [:consonant, :obstruent, :fricative, :nonsibilant, :pharyngeal, :voiced]}
  end

  def parse("c-") do
    parse("ʕ")
  end

  # Glottal Fricative Consonants
  def parse("h") do
    %Wulfila.Phoneme{letter: "h", type: [:consonant, :obstruent, :fricative, :nonsibilant, :glottal, :voiceless]}
  end

  def parse("ɦ") do
    %Wulfila.Phoneme{letter: "ɦ", type: [:consonant, :obstruent, :fricative, :nonsibilant, :glottal, :voiced]}
  end

  def parse("h~") do
    parse("ɦ")
  end

  ################################### APPROXIMANTS #################################

  # Labio-Dental Approximant
  def parse("ʋ") do
    %Wulfila.Phoneme{letter: "ʋ", type: [:consonant, :approximant, :labiodental, :voiced]}
  end

  def parse("υ-") do
    parse("ʋ")
  end

  # Alveolar Approximant
  def parse("ɹ") do
    %Wulfila.Phoneme{letter: "ɹ", type: [:consonant, :approximant, :rhotic, :alveolar, :voiced]}
  end

  def parse("ri") do
    parse("ɹ")
  end

  # Retroflex Approximant
  def parse("ɻ") do
    %Wulfila.Phoneme{letter: "ɻ", type: [:consonant, :approximant, :rhotic, :retroflex, :voiced]}
  end

  def parse("rit") do
    parse("ɻ")
  end

  # Palatal Approximant
  def parse("j") do
    %Wulfila.Phoneme{letter: "j", type: [:consonant, :approximant, :semivowel, :palatal, :voiced]}
  end

  # Velar Approximant
  def parse("ɰ") do
    %Wulfila.Phoneme{letter: "ɰ", type: [:cosonant, :approximant, :semivowel, :velar, :voiced]}
  end

  def parse("w,") do
    parse("ɰ")
  end

  # Glottal Approximant
  def parse("ʔ̞") do
    %Wulfila.Phoneme{letter: "ʔ̞", type: [:consonant, :approximant]}
  end

  def parse("?*") do
    parse("ʔ̞")
  end

  ##################################################################################
  #################################### LATERALS ####################################
  ##################################################################################



  ##################################################################################
  ################################## AFFRICATES ####################################
  ##################################################################################

  ##################################################################################
  ##################################### VOWELS #####################################
  ##################################################################################


  ################################## CLOSE VOWELS ##################################
  # Close Front Unroundeded Vowel
  def parse("i") do
    %Wulfila.Phoneme{letter: "i" , type: [:vowel, :close, :front, :unrounded, :short]}
  end

  def parse("iː") do
    %Wulfila.Phoneme{letter: "iː" , type: [:vowel, :close, :front, :unrounded, :short]}
  end

  def parse("i;") do
    parse("iː")
  end


  # Close Front Rounded Vowel

  def parse("y") do
    %Wulfila.Phoneme{letter: "y" , type: [:vowel, :front, :rounded, :short]}
  end

  def parse("yː") do
    %Wulfila.Phoneme{letter: "yː" , type: [:vowel, :front, :rounded, :long]}
  end

  def parse("y;") do
    parse("yː")
  end




  # Close Central Unroundeded Vowel
  def parse("ɨ") do
    %Wulfila.Phoneme{letter: "ɨ" , type: [:vowel, :close, :central, :unrounded, :short]}
  end

  def parse("ɨː") do
    %Wulfila.Phoneme{letter: "ɨː" , type: [:vowel, :close, :central, :unrounded, :long]}
  end

  def parse("ɨ;") do
    parse("ɨː")
  end



  # Close Central Rounded Vowel

  def parse("ʉ") do
    %Wulfila.Phoneme{letter: "ʉ" , type: [:vowel, :close, :central, :rounded, :short]}
  end

  def parse("ʉː") do
    %Wulfila.Phoneme{letter: "ʉː" , type: [:vowel, :close, :central, :rounded, :long]}
  end

  def parse("ʉ;") do
    parse("ʉː")
  end


  # Close Back Unroundeded Vowel

  def parse("ɯ") do
    %Wulfila.Phoneme{letter: "ɯ" , type: [:vowel, :close, :back, :unrounded, :short]}
  end

  def parse("ɯː") do
    %Wulfila.Phoneme{letter: "ɯː" , type: [:vowel, :close, :back, :unrounded, :long]}
  end

  def parse("ɯ;") do
    parse("ɯː")
  end


  # Close Back Rounded Vowel

  def parse("u") do
    %Wulfila.Phoneme{letter: "u" , type: [:vowel, :close, :back, :rounded, :short]}
  end

  def parse("uː") do
    %Wulfila.Phoneme{letter: "uː" , type: [:vowel, :close, :back, :rounded, :long]}
  end

  def parse("u;") do
    parse("uː")
  end



  ################################ NEAR-CLOSE VOWELS ###############################

  # Near-Close Front Unroundedd Vowel
  def parse("ɪ") do
    %Wulfila.Phoneme{letter: "ɪ" , type: [:vowel, :nearclose, :front, :unrounded, :short]}
  end

  def parse("ɪː") do
    %Wulfila.Phoneme{letter: "ɪː" , type: [:vowel, :nearclose, :front, :unrounded, :long]}
  end

  def parse("ɪ;") do
    parse("ɪː")
  end


  # Near-Close Front Rounded Vowel
  def parse("ʏ") do
    %Wulfila.Phoneme{letter: "ʏ" , type: [:vowel, :nearclose, :front, :rounded, :short]}
  end

  def parse("ʏː") do
    %Wulfila.Phoneme{letter: "ʏː" , type: [:vowel, :nearclose, :front, :rounded, :long]}
  end

  def parse("ʏ;") do
    parse("ʏː")
  end


  # Near-Close Back Rounded Vowel
  def parse("ʊ") do
    %Wulfila.Phoneme{letter: "ʊ" , type: [:vowel, :nearclose, :back, :rounded, :short]}
  end

  def parse("ʊː") do
    %Wulfila.Phoneme{letter: "ʊː" , type: [:vowel, :nearclose, :back, :rounded, :long]}
  end

  def parse("ʊ;") do
    parse("ʊː")
  end


  ################################### CLOSE-MID VOWELS #################################

  # Close-Mid Unroundeded Vowel
  def parse("e") do
    %Wulfila.Phoneme{letter: "e" , type: [:vowel, :closemid, :front, :unrounded, :short]}
  end

  def parse("eː") do
    %Wulfila.Phoneme{letter: "eː" , type: [:vowel, :closemid, :front, :unrounded, :long]}
  end

  def parse("e;") do
    parse("eː")
  end


  # Close-Mid Front Rounded Vowel

  def parse("ø") do
    %Wulfila.Phoneme{letter: "ø", type: [:vowel, :closemid, :front, :rounded, :short]}
  end

  def parse("øː") do
    %Wulfila.Phoneme{letter: "øː", type: [:vowel, :closemid, :front, :rounded, :long]}
  end

  def parse("ø;") do
    parse("øː")
  end


  # Close-Mid Central Unroundeded Vowel

  def parse("ɘ") do
    %Wulfila.Phoneme{letter: "ɘ", type: [:vowel, :closemid, :central, :unrounded, :short]}
  end

  def parse("ɘː") do
    %Wulfila.Phoneme{letter: "ɘː", type: [:vowel, :closemid, :central, :unrounded, :long]}
  end

  def parse("ɘ;") do
    parse("ɘː")
  end


  # Close-Mid Central Rounded Vowel

  def parse("ɵ") do
    %Wulfila.Phoneme{letter: "ɵ", type: [:vowel, :closemid, :central, :rounded, :short]}
  end

  def parse("ɵː") do
    %Wulfila.Phoneme{letter: "ɵː", type: [:vowel, :closemid, :central, :rounded, :long]}
  end

  def parse("ɵ;") do
    parse("ɵː")
  end


  # Close-Mid Back Unroundeded Vowel

  def parse("ɤ") do
    %Wulfila.Phoneme{letter: "ɤ", type: [:vowel, :closemid, :back, :unrounded, :short]}
  end

  def parse("ɤː") do
    %Wulfila.Phoneme{letter: "ɤː", type: [:vowel, :closemid, :back, :unrounded, :long]}
  end

  def parse("ɤ;") do
    parse("ɤː")
  end


  # Close-Mid Back Rounded Vowel

  def parse("o") do
    %Wulfila.Phoneme{letter: "o", type: [:vowel, :closemid, :back, :rounded, :short]}
  end

  def parse("oː") do
    %Wulfila.Phoneme{letter: "oː", type: [:vowel, :closemid, :back, :rounded, :long]}
  end

  def parse("o;") do
    parse("oː")
  end


  ############################# MID VOWELS ##############################################

  # Mid Front Unroundeded Vowel

  def parse("e̞") do
    %Wulfila.Phoneme{letter: "e̞", type: [:vowel, :mid, :front, :unrounded, :short]}
  end

  def parse("e̞ː") do
    %Wulfila.Phoneme{letter: "e̞ː", type: [:vowel, :mid, :front, :unrounded, :long]}
  end

  def parse("e̞;") do
    parse("e̞ː")
  end


  # Mid Front Rounded Vowel

  def parse("ø̞") do
    %Wulfila.Phoneme{letter: "ø̞", type: [:vowel, :mid, :front, :rounded, :short]}
  end

  def parse("ø̞ː") do
    %Wulfila.Phoneme{letter: "øː̞", type: [:vowel, :mid, :front, :rounded, :long]}
  end

  def parse("ø;̞") do
    parse("ø̞ː")
  end


  # Mid Central Vowel

  def parse("ə") do
    %Wulfila.Phoneme{letter: "ə", type: [:vowel, :mid, :central, :short]}
  end

  def parse("əː") do
    %Wulfila.Phoneme{letter: "əː", type: [:vowel, :mid, :central, :long]}
  end

  def parse("ə;") do
    parse("əː")
  end


  # Mid Back Unroundeded Vowel

  def parse("ɤ̞") do
    %Wulfila.Phoneme{letter: "ɤ̞", type: [:vowel, :mid, :back, :unrounded, :short]}
  end

  def parse("ɤ̞ː") do
    %Wulfila.Phoneme{letter: "ɤ̞ː", type: [:vowel, :mid, :back, :unrounded, :long]}
  end

  def parse("ɤ;̞") do
    parse("ɤ̞ː")
  end


  # Mid Back Rounded Vowel

  def parse("o̞") do
    %Wulfila.Phoneme{letter: "o̞", type: [:vowel, :mid, :back, :rounded, :short]}
  end

  def parse("o̞ː") do
    %Wulfila.Phoneme{letter: "o̞ː", type: [:vowel, :mid, :back, :rounded, :long]}
  end

  def parse("o̞;") do
    parse("o̞ː")
  end


  ################################ OPEN-MID VOWELS ###################################

  # Open-Mid Front Unroundeded Vowel

  def parse("ɛ") do
    %Wulfila.Phoneme{letter: "ɛ", type: [:vowel, :openmid, :front, :unrounded, :short]}
  end

  def parse("ɛː") do
    %Wulfila.Phoneme{letter: "ɛː", type: [:vowel, :openmid, :front, :unrounded, :long]}
  end

  def parse("ɛ;") do
    parse("ɛː")
  end

  # Open-Mid Front Rounded Vowel

  def parse("œ") do
    %Wulfila.Phoneme{letter: "œ", type: [:vowel, :openmid, :front, :rounded, :short]}
  end

  def parse("œː") do
    %Wulfila.Phoneme{letter: "œː", type: [:vowel, :openmid, :front, :rounded, :long]}
  end

  def parse("œ;") do
    parse("œː")
  end


  # Open-Mid Central Rounded Vowel

  def parse("ɜ") do
    %Wulfila.Phoneme{letter: "ɜ", type: [:vowel, :openmid, :central, :unrounded, :short]}
  end

  def parse("ɜː") do
    %Wulfila.Phoneme{letter: "ɜː", type: [:vowel, :openmid, :central, :unrounded, :long]}
  end

  def parse("ɜ;") do
    parse("ɜː")
  end


  # Open-Mid Central Rounded Vowel

  def parse("ɞ") do
    %Wulfila.Phoneme{letter: "ɞ", type: [:vowel, :openmid, :central, :rounded, :short]}
  end

  def parse("ɞː") do
    %Wulfila.Phoneme{letter: "ɞː", type: [:vowel, :openmid, :central, :rounded, :long]}
  end

  def parse("ɞ;") do
    parse("ɞː")
  end


  # Open-Mid Back Unroundeded Vowel

  def parse("ʌ") do
    %Wulfila.Phoneme{letter: "ʌ", type: [:vowel, :openmid, :back, :unrounded, :short]}
  end

  def parse("ʌː") do
    %Wulfila.Phoneme{letter: "ʌː", type: [:vowel, :openmid, :back, :unrounded, :long]}
  end

  def parse("ʌ;") do
    parse("ʌː")
  end


  # Open-Mid Back Rounded Vowel

  def parse("ɔ") do
    %Wulfila.Phoneme{letter: "ɔ", type: [:vowel, :openmid, :back, :rounded, :short]}
  end

  def parse("ɔː") do
    %Wulfila.Phoneme{letter: "ɔː", type: [:vowel, :openmid, :back, :rounded, :long]}
  end

  def parse("ɔ;") do
    parse("ɔː")
  end


  ################################ NEAR OPEN VOWELS ############################################

  # Near-Open Front Vowel
  def parse("æ") do
    %Wulfila.Phoneme{letter: "æ", type: [:vowel, :nearopen, :front, :unrounded, :short]}
  end

  def parse("æː") do
    %Wulfila.Phoneme{letter: "æː", type: [:vowel, :nearopen, :front, :unrounded, :long]}
  end

  def parse("æ;") do
    parse("æː")
  end


  # Near-Open Central Vowel
  def parse("ɐ") do
    %Wulfila.Phoneme{letter: "ɐ", type: [:vowel, :nearopen, :central, :unrounded, :short]}
  end

  def parse("ɐː") do
    %Wulfila.Phoneme{letter: "ɐː", type: [:vowel, :nearopen, :central, :unrounded, :long]}
  end

  def parse("ɐ;") do
    parse("ɐː")
  end

  ################################### OPEN VOWELS ##############################################

  # Open Front Unroundeded
  def parse("a") do
    %Wulfila.Phoneme{letter: "a", type: [:vowel, :open, :front, :unrounded, :short]}
  end

  def parse("aː") do
    %Wulfila.Phoneme{letter: "aː", type: [:vowel, :open, :front, :unrounded, :short]}
  end

  def parse("a;") do
    parse("aː")
  end

  # Open Front Rounded Vowel
  def parse("ɶ") do
    %Wulfila.Phoneme{letter: "ɶ", type: [:vowel, :open, :front, :rounded, :short]}
  end

  def parse("ɶː") do
    %Wulfila.Phoneme{letter: "ɶː", type: [:vowel, :open, :front, :rounded, :long]}
  end

  def parse("ɶ;") do
    parse("ɶː")
  end


  # Open Central Unroundeded Vowel
  def parse("ä") do
    %Wulfila.Phoneme{letter: "ä", type: [:vowel, :open, :central, :unrounded, :short]}
  end

  def parse("äː") do
    %Wulfila.Phoneme{letter: "äː", type: [:vowel, :open, :central, :unrounded, :long]}
  end

  def parse("ä;") do
    parse("äː")
  end

  # Open Back Unroundeded Vowel
  def parse("ɑ") do
    %Wulfila.Phoneme{letter: "ɑ", type: [:vowel, :open, :back, :unrounded, :short]}
  end
  def parse("ɑː") do
    %Wulfila.Phoneme{letter: "ɑː", type: [:vowel, :open, :back, :unrounded, :long]}
  end

  def parse("ɑ;") do
    parse("ɑː")
  end

  # Open Back Rounded Vowel
  def parse("ɒ") do
    %Wulfila.Phoneme{letter: "ɒ", type: [:vowel, :open, :back, :rounded, :short]}
  end

  def parse("ɒː") do
    %Wulfila.Phoneme{letter: "ɒː", type: [:vowel, :open, :back, :rounded, :long]}
  end

  def parse("ɒ;") do
    parse("ɒː")
  end

  # Default Report Unknown
  def parse(letter) do
    IO.puts("Unknown Phoneme: #{letter}")
    nil
  end

end
