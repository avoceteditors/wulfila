defmodule Wulfila.Phoneme do
  defstruct letter: nil, type: []


  # TODO: Populate Source Code with Long Vowels and substitutes

  # Close Vowels
  def parse("i") do
    %Wulfila.Phoneme{letter: "i" , type: [:vowel, :front, :central, :unround, :short]}
  end

  def parse("y") do
    %Wulfila.Phoneme{letter: "y" , type: [:vowel, :front, :central, :round, :short]}
  end

  def parse("ɨ") do
    %Wulfila.Phoneme{letter: "ɨ" , type: [:vowel, :close, :central, :unround, :short]}
  end

  def parse("ʉ") do
    %Wulfila.Phoneme{letter: "ʉ" , type: [:vowel, :close, :central, :round, :short]}
  end


  def parse("ɯ") do
    %Wulfila.Phoneme{letter: "ɯ" , type: [:vowel, :close, :back, :unround, :short]}
  end


  def parse("u") do
    %Wulfila.Phoneme{letter: "u" , type: [:vowel, :close, :back, :round, :short]}
  end


  # Near-close Vowels
  def parse("ɪ") do
    %Wulfila.Phoneme{letter: "ɪ" , type: [:vowel, :nearclose, :front, :unround, :short]}
  end


  def parse("ʏ") do
    %Wulfila.Phoneme{letter: "ʏ" , type: [:vowel, :nearclose, :front, :round, :short]}
  end


  def parse("ʊ") do
    %Wulfila.Phoneme{letter: "ʊ" , type: [:vowel, :nearclose, :back, :round, :short]}
  end

  # Close-mid Vowels
  def parse("e") do
    %Wulfila.Phoneme{letter: "e" , type: [:vowel, :closemid, :front, :unround, :short]}
  end

  def parse("ø") do
    %Wulfila.Phoneme{letter: "ø", type: [:vowel, :closemid, :front, :round, :short]}
  end


  def parse("ɘ") do
    %Wulfila.Phoneme{letter: "ɘ", type: [:vowel, :closemid, :central, :unround, :short]}
  end


  def parse("ɵ") do
    %Wulfila.Phoneme{letter: "ɵ", type: [:vowel, :closemid, :central, :round, :short]}
  end

  def parse("ɤ") do
    %Wulfila.Phoneme{letter: "ɤ", type: [:vowel, :closemid, :back, :unround, :short]}
  end

  def parse("o") do
    %Wulfila.Phoneme{letter: "o", type: [:vowel, :closemid, :back, :round, :short]}
  end

  # Mid Vowels
  def parse("e̞") do
    %Wulfila.Phoneme{letter: "e̞", type: [:vowel, :mid, :front, :unround, :short]}
  end

  def parse("ø̞") do
    %Wulfila.Phoneme{letter: "ø̞", type: [:vowel, :mid, :front, :round, :short]}
  end


  def parse("ə") do
    %Wulfila.Phoneme{letter: "ə", type: [:vowel, :mid, :central, :short]}
  end

  def parse("ɤ̞") do
    %Wulfila.Phoneme{letter: "ɤ̞", type: [:vowel, :mid, :back, :unround, :short]}
  end


  def parse("o̞") do
    %Wulfila.Phoneme{letter: "o̞", type: [:vowel, :mid, :back, :round, :short]}
  end

  # Open-mid Vowels
  def parse("ɛ") do
    %Wulfila.Phoneme{letter: "ɛ", type: [:vowel, :openmid, :front, :unround, :short]}
  end

  def parse("œ") do
    %Wulfila.Phoneme{letter: "œ", type: [:vowel, :openmid, :front, :round, :short]}
  end

  def parse("ɜ") do
    %Wulfila.Phoneme{letter: "ɜ", type: [:vowel, :openmid, :central, :unround, :short]}
  end

  def parse("ɞ") do
    %Wulfila.Phoneme{letter: "ɞ", type: [:vowel, :openmid, :central, :round, :short]}
  end

  def parse("ʌ") do
    %Wulfila.Phoneme{letter: "ʌ", type: [:vowel, :openmid, :back, :unround, :short]}
  end

  def parse("ɔ") do
    %Wulfila.Phoneme{letter: "ɔ", type: [:vowel, :openmid, :back, :round, :short]}
  end

  ########################## Near Open ##########################################
  def parse("æ") do
    %Wulfila.Phoneme{letter: "æ", type: [:vowel, :nearopen, :front, :unround, :short]}
  end

  def parse("ɐ") do
    %Wulfila.Phoneme{letter: "ɐ", type: [:vowel, :nearopen, :central, :unround, :short]}
  end

  ########################### Open Vowels #####################################
  def parse("a") do
    %Wulfila.Phoneme{letter: "a", type: [:vowel, :open, :front, :unround, :short]}
  end

  def parse("ɶ") do
    %Wulfila.Phoneme{letter: "ɶ", type: [:vowel, :open, :front, :round, :short]}
  end

  def parse("ä") do
    %Wulfila.Phoneme{letter: "ä", type: [:vowel, :open, :central, :unround, :short]}
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

  def parse("ɑ-") do
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

  def parse("ɒ-") do
    parse("ɒː")
  end

  def parse(letter) do
    IO.puts("Unknown Phoneme: #{letter}")
    nil
  end
end
