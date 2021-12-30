defmodule Wulfila.Phoneme do
  defstruct letter: nil, romani: nil, type: []

  def parse(letter) do
    Wulfila.Phoneme.Letter.parse(letter)
  end


end
