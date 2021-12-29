defmodule Wulfila.Read do
  require Logger

  def read_yaml(sources) do
    sources
    |> read_yaml_files
    |> Stream.map(&Task.async(Wulfila.Read, :load_yaml, [&1]))
    |> Enum.map(&Task.await(&1))
  end
  @spec read_yaml_files([
          binary
          | maybe_improper_list(
              binary | maybe_improper_list(any, binary | []) | char,
              binary | []
            )
        ]) :: maybe_improper_list
  def read_yaml_files(sources) do
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
          Enum.concat(read_yaml(fpaths), read_yaml(rest))
        else
          if Path.extname(source) in [".yml", ".yaml"] do
            [source | read_yaml(rest)]
          else
            read_yaml(rest)
          end
        end
      [] -> []
    end
  end

  def load_yaml(path) do
    case YamlElixir.read_from_file(path) do
      {:ok, data} -> data
      reason -> path
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
