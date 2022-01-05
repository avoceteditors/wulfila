defmodule Wulfila.Phoneme do
  @derive [Poison.Encoder]
  defstruct letter: nil, type: []

  def parse(letter) do
    Wulfila.Phoneme.Letter.parse(letter)
  end


end
