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

    syllabary = find_syllabary(data, phonemes)
    IO.inspect syllabary

    #generate(phonemes, syllabary, spec)

  end

  @default_count 25
  @default_min_syl 2
  @default_max_syl 5
  def generate(phonemes, syllabary, []) do
    generate(phonemes, syllabary, [@default_count, @default_min_syl, @default_max_syl])
  end

  def generate(phonemes, syllabary, [count]) do
    generate(phonemes, syllabary, [count, @default_min_syl, @default_max_syl])
  end

  def generate(phonemes, syllabary, [count, min]) do
    generate(phonemes, syllabary, [count, min, @default_max_syl])
  end

  def generate(phonemes, syllabary, [count, min, max | _ignored]) do
    generate(phonemes, syllabary, [count, min, max], [])
  end

  def generate(phonemes, syllabary, [count, min, max], ret) do
    Enum.to_list(0..count)
    |> Enum.map(
      fn _ ->
        syls = Enum.to_list(min..max) |> Enum.random

        Enum.to_list(1..syls)
        |> Enum.map(
          fn _ ->
            Enum.random(syllabary)
          end
        )
      end
    )
  end

  def find_syllabary(data, phonemes) do
    data
    |> find("syllabary")
    |> List.flatten
    |> Enum.map(
      fn syl ->
        freq = Map.get(syl, "freq", 1)
        pattern = Enum.map(
          Map.get(syl, "pattern"),
          fn x ->
            key = String.to_atom(x)

            Enum.filter(
              phonemes,
              fn ph ->
                Enum.member?(ph.type, key)
              end
            )
          end)

        Enum.map(
          Enum.to_list(0..freq * 100),
          fn _ ->
            %{pattern: pattern}
          end
        )
      end
    )
    |> List.flatten
    |> Enum.map(
      fn x -> x[:pattern] end
    )
    |> Enum.shuffle
  end


  def find_phonemes(data) do
    data
    |> find("phonemes")
    |> List.flatten
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
