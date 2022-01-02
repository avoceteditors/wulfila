defmodule Wulfila.Paradigm do

  def run(source, words) do
    data = Wulfila.Read.read_yaml([
      if source == nil do
        Path.expand("./src")
      else
        Path.expand(source)
      end
    ])

    IO.inspect data
    terms = find_terms(data)

    IO.inspect terms
  end


  def find_terms(data) do
    data
    |> Enum.filter(fn x -> x != nil end)
    |> Stream.map(&Task.async(Wulfila.Read, :get_data, [&1, "terms"]))
    |> Enum.map(&Task.await(&1))
  end

end
