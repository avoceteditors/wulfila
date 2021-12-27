defmodule Wulfila.Common do


  def find_files(sources, pattern) do
    case sources do
      [source | rest] ->
        if File.dir?(source) do
          {:ok, files} = File.ls(source)
          find_files(files |> Enum.map(fn x -> Path.join(source, x) end), pattern)
        else
          if Path.extname(source) in pattern do
            [source | find_files(rest, pattern)]
          else
            find_files(rest, pattern)
          end
        end
      _ -> []
    end
  end
end
