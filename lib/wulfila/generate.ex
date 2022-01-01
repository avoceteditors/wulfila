defmodule Wulfila.Generate do
  def run(source, spec) do
    data = Wulfila.Read.read_yaml([
      if source == nil do
        Path.expand("./src")
      else
        Path.expand(source)
      end
    ])

    phonemes = find_phonemes(data)

    #IO.inspect phonemes

  end

  def find_phonemes(data) do
    data
    |> find("phonemes")
    |> Enum.map(
      fn x ->
        Wulfila.Phoneme.parse(x)
      end
    )
    |> Enum.filter(
      fn x ->
        x != nil
      end
    )
  end

  def find(data, key) do
    data
    |> Stream.map(&Task.async(Wulfila.Read, :get_data, [&1, key]))
    |> Enum.map(&Task.await(&1))
    |> Enum.filter(
      fn x ->
        x != nil
      end
    )
  end

end
