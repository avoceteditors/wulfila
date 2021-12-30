defmodule Wulfila.Phoneme.Letter do

  ##################################################################################
  ################################### CONSONANT ####################################
  ##################################################################################

  ################################## NASAL CONSONANTS ##############################

  # Bilabial Nasal Consonant

  def parse("m̥") do
    Wulfila.Phoneme.init{letter: "m", type: [ :consonant, :sonorant, :nasal, :bilabial, :voiceless]}
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
    parse("oː"
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
    parse("æ"ː)
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
