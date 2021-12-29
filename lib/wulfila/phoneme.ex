defmodule Wulfila.Phoneme do
  defstruct letter: nil, type: []


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




end
