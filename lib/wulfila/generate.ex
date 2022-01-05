defmodule Wulfila.Generate do
  def run(spec) do

    phonemes = find_phonemes
    syllabary = find_syllabary(phonemes)
    IO.inspect syllabary

    generate(phonemes, syllabary, spec)
    |> Enum.join("\n")
    |> IO.puts

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

    count_int =
      if is_integer(count) do
        count
      else
        String.to_integer(count)
      end

    min_int =
      if is_integer(min) do
        min
      else
        String.to_integer(min)
      end

    max_int =
      if is_integer(max) do
        max
      else
        String.to_integer(max)
      end

    words = Enum.to_list(0..count_int)
    |> Enum.map(
      fn _ ->
        syls = Enum.to_list(min_int..max_int) |> Enum.random

        Enum.to_list(1..syls)
        |> Enum.map(
          fn _ ->
            Enum.random(syllabary)
            |> Enum.map(fn x -> Enum.random(x) end)
            |> Enum.join("")
          end
        )
        |> Enum.join(".")
      end
    )
    |> Enum.sort
  end

  def find_syllabary(phonemes) do
    Wulfila.Database.get("syllabary")
    |> Enum.map(
      fn syl ->
        freq = Map.get(syl, "freq", 1)
        pattern = Enum.map(
          Map.get(syl, "pattern"),
          fn x ->
            key = String.to_atom(x)

            phonemes
            |> Enum.filter(
              fn ph ->
                Enum.member?(ph.type, key)
              end
            )
            |> Enum.map(fn ph -> ph.letter end)
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


  def find_phonemes do
    Wulfila.Database.get("phonemes")
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

end
