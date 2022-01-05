defmodule Wulfila.Read do
  require Logger

  def get_files(sources, exts) do
    case sources do
      [source | rest] ->
        if File.dir?(source) do
          {:ok, files} = File.ls(source)
          fpaths = Enum.map(files, fn x -> Path.join(source, x) end)
          Enum.concat(fpaths, get_files(rest, exts))
        else
          if Path.extname(source) in exts do
            [source | get_files(rest, exts)]
          else
            get_files(rest, exts)
          end
        end
      [] -> []
    end
  end

  def read_yaml(sources) do
    sources
    |> read_files([".yml", ".yaml"])
    |> Stream.map(&Task.async(Wulfila.Read, :load_yaml, [&1]))
    |> Enum.map(&Task.await(&1))
  end


  def read_files(sources, search_pattern) do
    case sources do
      [source | rest] ->
        if File.dir?(source) do
          {:ok, files} = File.ls(source)

          fpaths = files
          |> Enum.map(
            fn x ->
              Path.join(source, x)
            end
          )
          Enum.concat(read_files(fpaths, search_pattern), read_files(rest, search_pattern))
        else
          if Path.extname(source) in search_pattern do
            [source | read_files(rest, search_pattern)]
          else
            read_files(rest, search_pattern)
          end
        end
      [] -> []
    end
  end

  def load_yaml(path) do
    case YamlElixir.read_from_file(path) do
      {:ok, data} -> data
      reason -> %{}
    end
  end

  def get_data(map, key) do
    if Map.has_key?(map, key) do
      Map.get(map, key)
    else
      nil
    end
  end


end
