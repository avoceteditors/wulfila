defmodule Wulfila.Database do
  use GenServer

  defp default do
    %{
      "phonemes" => [],
      "syllabary" => [],
      "terms" => []
    }
  end
  ######################### SERVER ###############################
  @impl true
  def init(map) do
    {:ok, map}
  end

  @impl true
  def handle_call({:set, "terms", data}, _from, state) do
    update = Enum.concat(
      Map.get(state, "terms"),
      data
      |> Enum.map(
        fn term ->
          if Map.has_key?(term, "term") do
            Map.put(term, "term",
              Map.get(term, "term")
              |> String.split(" ")
              |>  Enum.map(
                fn c -> Wulfila.Phoneme.parse(c) end)
            )
          else
            term
          end
        end
      )
    )
    {:reply, :ok, Map.replace(state, "terms", update)}
  end

  @impl true
  def handle_call({:set, key, data}, _from, state) do
    {:reply, :ok, Map.replace(state, key, data)}
  end

  @impl true
  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  @impl true
  def handle_call(:dump, _from, state) do
    {:reply, state, state}
  end

  ######################### CLIENT ###############################
  def start_link(path, force) do
    cache = Path.join(Path.dirname(path), "manifest.json")

    files = Wulfila.Read.get_files([path], [".yml", ".yaml"])

    if File.exists?(cache) do
      {:ok, cache_stat} = File.stat(cache)

      files_mtime =
        files
        |> Enum.map(
          fn file ->
            {:ok, file_stat} = File.stat(file)
            file_stat.mtime
          end
        )
        |> Enum.max
      if force != nil or cache_stat.mtime < files_mtime do
        GenServer.start_link(__MODULE__, default, name: :wulfila)
        process_files(files)
      else
        {:ok, text} = File.read(cache)
        GenServer.start_link(__MODULE__, Poison.decode!(text), name: :wulfila)
      end
    else
      GenServer.start_link(__MODULE__, default, name: :wulfila)
      process_files(files)
    end
  end

  def close(path) do
    data = GenServer.call(:wulfila, :dump)
    manifest = Path.join(Path.dirname(path), "manifest.json")
    File.write!(manifest, Poison.encode!(data))
  end

  def process_files(files) do
    files |> Wulfila.Read.read_yaml |> read_files
  end

  def read_files(files) do
    case files do
      [file | rest] ->
        [read_file(file, Map.keys(file)) | read_files(rest)]
      [] -> []
    end
  end

  def read_file(data, keys) do
    case keys do
      [key | rest ] ->
        [GenServer.call(:wulfila, {:set, key, Map.get(data, key)}) | read_file(data, rest)]
        [] -> []
    end
  end

  def get(key) do
    GenServer.call(:wulfila, {:get, key})
  end

  def dump do
    IO.inspect GenServer.call(:wulfila, :dump)
  end


end
