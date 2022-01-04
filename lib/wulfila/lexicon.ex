defmodule Wulfila.Lexicon do

  def run(output) do
    terms =
      Wulfila.Database.get("terms")
      |> Enum.sort(
        &(Map.get(&1, "roman") > Map.get(&2, "roman"))
      )

    case output do
      [filename] -> output_file(terms, filename, Path.extname(filename))
      [] -> output_stdout(terms)
    end
  end

  def output_file(terms, filename, ext) do
    text = terms
    |> Stream.map(&Task.async(Wulfila.Lexicon, :format_term, [&1, ext]))
    |> Enum.map(&Task.await(&1))
    |> Enum.join("\n\n")

    File.write(filename, text)
  end

  def output_stdout(terms) do
  end
  def format_term(term, ext) when ext in [".tex", ".latex"] do
    [
      "\\entry{#{Map.get(term, "roman")}}",
      "{#{Map.get(term, "term")}}",
      "{#{format_gramm(Map.get(term, "gramm"), :tex)}}",
      "{#{Map.get(term, "short")}}",
      "{\n#{Enum.join(Map.get(term, "long", []), "\n\n")}\n}"
    ]
  end

  def format_gramm(%{"category" => "noun", "class" => class, "gender" => gender}, :tex) do
    "n. #{format_gender(gender)} #{class}"
  end

  def format_gramm(%{"category" => "partitive noun", "class" => class, "gender" => gender}, :tex) do
    "part. n. #{format_gender(gender)} #{class}"
  end

  def format_gender(gender) do
    case gender do
      "animate" -> "a."
      "inanimate" -> "ina."
      "masculine" -> "m."
      "feminine" -> "f."
      "bestial" -> "bstl."
      "spiritual" -> "sprtl."
      _ -> "UNKNOWN"
    end
  end

end
