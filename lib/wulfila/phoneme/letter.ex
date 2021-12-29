defmodule Wulfila.Phoneme.Letter do

  ################################ NEAR-CLOSE VOWELS ###############################

  # Near-Clos Front Unroundd Vowel
  def parse("ɪ") do
    %Wulfila.Phoneme{letter: "ɪ" , type: [:vowel, :nearclose, :front, :unround, :short]}
  end

  def parse("ɪː") do
    %Wulfila.Phoneme{letter: "ɪː" , type: [:vowel, :nearclose, :front, :unround, :long]}
  end

  def parse("ɪ") do
    parse("ɪː")
  end


  # Near-Close Front Rounded Vowel
  def parse("ʏ") do
    %Wulfila.Phoneme{letter: "ʏ" , type: [:vowel, :nearclose, :front, :round, :short]}
  end

  def parse("ʏː") do
    %Wulfila.Phoneme{letter: "ʏː" , type: [:vowel, :nearclose, :front, :round, :long]}
  end

  def parse("ʏ;") do
    parse("ʏː")
  end


  # Near-Close Back Rounded Vowel
  def parse("ʊ") do
    %Wulfila.Phoneme{letter: "ʊ" , type: [:vowel, :nearclose, :back, :round, :short]}
  end

  def parse("ʊː") do
    %Wulfila.Phoneme{letter: "ʊː" , type: [:vowel, :nearclose, :back, :round, :long]}
  end

  def parse("ʊ;") do
    parse("ʊː")
  end


  ################################### CLOSE-MID VOWELS #################################

  # Close-Mid Unrounded Vowel
  def parse("e") do
    %Wulfila.Phoneme{letter: "e" , type: [:vowel, :closemid, :front, :unround, :short]}
  end

  def parse("eː") do
    %Wulfila.Phoneme{letter: "eː" , type: [:vowel, :closemid, :front, :unround, :long]}
  end

  def parse("e;") do
    parse("eː")
  end


  # Close-Mid Front Rounded Vowel

  def parse("ø") do
    %Wulfila.Phoneme{letter: "ø", type: [:vowel, :closemid, :front, :round, :short]}
  end

  def parse("øː") do
    %Wulfila.Phoneme{letter: "øː", type: [:vowel, :closemid, :front, :round, :long]}
  end

  def parse("ø;") do
    parse("øː")
  end


  # Close-Mid Central Unrounded Vowel

  def parse("ɘ") do
    %Wulfila.Phoneme{letter: "ɘ", type: [:vowel, :closemid, :central, :unround, :short]}
  end

  def parse("ɘː") do
    %Wulfila.Phoneme{letter: "ɘː", type: [:vowel, :closemid, :central, :unround, :long]}
  end

  def parse("ɘ;") do
    parse("ɘː")
  end


  # Close-Mid Central Rounded Vowel

  def parse("ɵ") do
    %Wulfila.Phoneme{letter: "ɵ", type: [:vowel, :closemid, :central, :round, :short]}
  end

  def parse("ɵː") do
    %Wulfila.Phoneme{letter: "ɵː", type: [:vowel, :closemid, :central, :round, :long]}
  end

  def parse("ɵ;") do
    parse("ɵː")
  end


  # Close-Mid Back Unrounded Vowel

  def parse("ɤ") do
    %Wulfila.Phoneme{letter: "ɤ", type: [:vowel, :closemid, :back, :unround, :short]}
  end

  def parse("ɤː") do
    %Wulfila.Phoneme{letter: "ɤː", type: [:vowel, :closemid, :back, :unround, :long]}
  end

  def parse("ɤ;") do
    parse("ɤː")
  end


  # Close-Mid Back Rounded Vowel

  def parse("o") do
    %Wulfila.Phoneme{letter: "o", type: [:vowel, :closemid, :back, :round, :short]}
  end

  def parse("oː") do
    %Wulfila.Phoneme{letter: "oː", type: [:vowel, :closemid, :back, :round, :long]}
  end

  def parse("o;") do
    parse("oː"
  end


  ############################# MID VOWELS ##############################################

  # Mid Front Unrounded Vowel

  def parse("e̞") do
    %Wulfila.Phoneme{letter: "e̞", type: [:vowel, :mid, :front, :unround, :short]}
  end

  def parse("e̞ː") do
    %Wulfila.Phoneme{letter: "e̞ː", type: [:vowel, :mid, :front, :unround, :long]}
  end

  def parse("e̞;") do
    parse("e̞ː")
  end


  # Mid Front Rounded Vowel

  def parse("ø̞") do
    %Wulfila.Phoneme{letter: "ø̞", type: [:vowel, :mid, :front, :round, :short]}
  end

  def parse("ø̞ː") do
    %Wulfila.Phoneme{letter: "øː̞", type: [:vowel, :mid, :front, :round, :long]}
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


  # Mid Back Unrounded Vowel

  def parse("ɤ̞") do
    %Wulfila.Phoneme{letter: "ɤ̞", type: [:vowel, :mid, :back, :unround, :short]}
  end

  def parse("ɤ̞ː") do
    %Wulfila.Phoneme{letter: "ɤ̞ː", type: [:vowel, :mid, :back, :unround, :long]}
  end

  def parse("ɤ;̞") do
    parse("ɤ̞ː")
  end


  # Mid Back Rounded Vowel

  def parse("o̞") do
    %Wulfila.Phoneme{letter: "o̞", type: [:vowel, :mid, :back, :round, :short]}
  end

  def parse("o̞ː") do
    %Wulfila.Phoneme{letter: "o̞ː", type: [:vowel, :mid, :back, :round, :long]}
  end

  def parse("o̞;") do
    parse("o̞ː")
  end


  ################################ OPEN-MID VOWELS ###################################

  # Open-Mid Front Unrounded Vowel

  def parse("ɛ") do
    %Wulfila.Phoneme{letter: "ɛ", type: [:vowel, :openmid, :front, :unround, :short]}
  end

  def parse("ɛː") do
    %Wulfila.Phoneme{letter: "ɛː", type: [:vowel, :openmid, :front, :unround, :long]}
  end

  def parse("ɛ;") do
    parse("ɛː")
  end

  # Open-Mid Front Rounded Vowel

  def parse("œ") do
    %Wulfila.Phoneme{letter: "œ", type: [:vowel, :openmid, :front, :round, :short]}
  end

  def parse("œː") do
    %Wulfila.Phoneme{letter: "œː", type: [:vowel, :openmid, :front, :round, :long]}
  end

  def parse("œ;") do
    parse("œː")
  end


  # Open-Mid Central Rounded Vowel

  def parse("ɜ") do
    %Wulfila.Phoneme{letter: "ɜ", type: [:vowel, :openmid, :central, :unround, :short]}
  end

  def parse("ɜː") do
    %Wulfila.Phoneme{letter: "ɜː", type: [:vowel, :openmid, :central, :unround, :long]}
  end

  def parse("ɜ;") do
    parse("ɜː")
  end


  # Open-Mid Central Rounded Vowel

  def parse("ɞ") do
    %Wulfila.Phoneme{letter: "ɞ", type: [:vowel, :openmid, :central, :round, :short]}
  end

  def parse("ɞː") do
    %Wulfila.Phoneme{letter: "ɞː", type: [:vowel, :openmid, :central, :round, :long]}
  end

  def parse("ɞ;") do
    parse("ɞː")
  end


  # Open-Mid Back Unrounded Vowel

  def parse("ʌ") do
    %Wulfila.Phoneme{letter: "ʌ", type: [:vowel, :openmid, :back, :unround, :short]}
  end

  def parse("ʌː") do
    %Wulfila.Phoneme{letter: "ʌː", type: [:vowel, :openmid, :back, :unround, :long]}
  end

  def parse("ʌ;") do
    parse("ʌː")
  end


  # Open-Mid Back Rounded Vowel

  def parse("ɔ") do
    %Wulfila.Phoneme{letter: "ɔ", type: [:vowel, :openmid, :back, :round, :short]}
  end

  def parse("ɔː") do
    %Wulfila.Phoneme{letter: "ɔː", type: [:vowel, :openmid, :back, :round, :long]}
  end

  def parse("ɔ;") do
    parse("ɔː")
  end


  ################################ NEAR OPEN VOWELS ############################################

  # Near-Open Front Vowel
  def parse("æ") do
    %Wulfila.Phoneme{letter: "æ", type: [:vowel, :nearopen, :front, :unround, :short]}
  end

  def parse("æː") do
    %Wulfila.Phoneme{letter: "æː", type: [:vowel, :nearopen, :front, :unround, :long]}
  end

  def parse("æ;") do
    parse("æ"ː)
  end


  # Near-Open Central Vowel
  def parse("ɐ") do
    %Wulfila.Phoneme{letter: "ɐ", type: [:vowel, :nearopen, :central, :unround, :short]}
  end

  def parse("ɐː") do
    %Wulfila.Phoneme{letter: "ɐː", type: [:vowel, :nearopen, :central, :unround, :long]}
  end

  def parse("ɐ;") do
    parse("ɐː")
  end

  ################################### OPEN VOWELS ##############################################

  # Open Front Unrounded
  def parse("a") do
    %Wulfila.Phoneme{letter: "a", type: [:vowel, :open, :front, :unround, :short]}
  end

  def parse("aː") do
    %Wulfila.Phoneme{letter: "aː", type: [:vowel, :open, :front, :unround, :short]}
  end

  def parse("a;") do
    parse("aː")
  end

  # Open Front Rounded Vowel
  def parse("ɶ") do
    %Wulfila.Phoneme{letter: "ɶ", type: [:vowel, :open, :front, :round, :short]}
  end

  def parse("ɶː") do
    %Wulfila.Phoneme{letter: "ɶː", type: [:vowel, :open, :front, :round, :long]}
  end

  def parse("ɶ;") do
    parse("ɶː")
  end


  # Open Central Unrounded Vowel
  def parse("ä") do
    %Wulfila.Phoneme{letter: "ä", type: [:vowel, :open, :central, :unround, :short]}
  end

  def parse("äː") do
    %Wulfila.Phoneme{letter: "äː", type: [:vowel, :open, :central, :unround, :long]}
  end

  def parse("ä;") do
    parse("äː")
  end

  # Open Back Unrounded Vowel
  def parse("ɑ") do
    %Wulfila.Phoneme{letter: "ɑ", type: [:vowel, :open, :back, :unround, :short]}
  end
  def parse("ɑː") do
    %Wulfila.Phoneme{letter: "ɑː", type: [:vowel, :open, :back, :unround, :long]}
  end

  def parse("ɑ;") do
    parse("ɑː")
  end

  # Open Back Rounded Vowel
  def parse("ɒ") do
    %Wulfila.Phoneme{letter: "ɒ", type: [:vowel, :open, :back, :round, :short]}
  end

  def parse("ɒː") do
    %Wulfila.Phoneme{letter: "ɒː", type: [:vowel, :open, :back, :round, :long]}
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
