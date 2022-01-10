defmodule Wulfila.Lexicon do

  def run(output) do
    terms =
      Wulfila.Database.get("terms")

    case output do
      [filename] -> output_file(terms, filename, Path.extname(filename))
      [] -> output_stdout(terms)
    end
  end

  def output_file(terms, filename, ext) do
    text = terms
    |> Stream.map(&Task.async(Wulfila.Lexicon, :format_term, [&1, ext]))
    |> Enum.map(&Task.await(&1))
    |> Enum.sort_by(fn {term, _} -> String.downcase(Map.get(term, "sort", Map.get(term, "roman")))end)
    |> Enum.map(fn {_, entry} -> entry end)
    |> Enum.join("\n\n")

    File.write(filename, text)
  end

  def output_stdout(terms) do
  end
  def format_term(term, ext) when ext in [".tex", ".latex"] do
    {term,
    [
      "\\entry{#{Map.get(term, "roman")}}",
      "{#{
          Map.get(term, "term")
          |> Enum.map(fn x -> Map.get(x, "letter") end)
          |> Enum.join("")
        }}",
      "{#{format_gramm(Map.get(term, "gramm"), :tex)}}",
      "{#{Map.get(term, "short")}}",
      "{\n#{Enum.join(Map.get(term, "long", []), "\n\n")}\n}"
    ]
    |> Enum.join("")}
  end

  def format_gramm(%{"category" => "verb", "transitivity" => trans, "conjugation" => conj}, :tex) do
    "v. #{format_transitivity(trans)} #{conj}"
  end

  def format_gramm(%{"category" => "adjective"}, :tex) do
    "adj."
  end

  def format_gramm(%{"category" => "adverb"}, :tex) do
    "adv."
  end

  def format_gramm(%{"category" => "preposition"}, :tex) do
    "prep."
  end

  def format_gramm(%{"category" => "postposition"}, :tex) do
    "postp.."
  end


  def format_transitivity(trans) do
    case trans do
      "transitive" -> "trans."
      "intransitive" -> "intrans."
    end
  end

  def format_gramm(%{"category" => "measure"}, :tex) do
    "measure"
  end
  def format_gramm(%{"category" => "root"}, :tex) do
    "r."
  end


  def format_gramm(%{"category" => "measure", "gender" => gender}, :tex) do
    "measure #{format_gender(gender)}"
  end

  def format_gramm(%{"category" => "noun", "class" => class, "gender" => gender}, :tex) do
    "n. #{format_gender(gender)} #{class}"
  end

  def format_gramm(%{"category" => "partitive noun", "class" => class, "gender" => gender}, :tex) do
    "part. n. #{format_gender(gender)} #{class}"
  end

  def format_gramm(%{"category" => "pronoun", "type" => pron, "person" => person, "gender" => gender}, :tex) do
    "pron. #{format_pronoun(pron)} #{format_gender(gender)} #{person}"
  end
  def format_gramm(%{"category" => "pronoun", "type" => pron, "gender" => gender}, :tex) do
    "pron. #{format_pronoun(pron)} #{format_gender(gender)}"
  end


  def format_pronoun(type) do
    case type do
      "personal" -> "pers."
      "possessive" -> "poss."
      "proximate demonstrative" -> "demon. prox."
      "proximate demonstrative possessive" -> "demon. prox. poss"
      "medioproximate demonstrative" -> "demon. medioprox."
      "medioproximate demonstrative possessive" -> "demon. medioprox. poss."
      "mediodistal demonstrative" -> "demon. mediodist."
      "mediodistal demonstrative possessive" -> "demon. mediodist. poss."
      "distal demonstrative" -> "demon. dist."
      "distal demonstrative possessive" -> "demon. dist. poss."
      "interogative" -> "interog."
    end
  end

  def format_gender(gender) do
    case gender do
      "animate" -> "a."
      "inanimate" -> "ina."
      "masculine" -> "m."
      "feminine" -> "f."
      "human" -> "h."
      "bestial" -> "bstl."
      "spiritual" -> "sprtl."
      _ -> "UNKNOWN"
    end
  end

end
