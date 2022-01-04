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
    update = Enum.concat(Map.get(state, "terms"), data)
    {:reply, :ok, Map.replace(state, "terms", update)}
  end

  @impl true
  def handle_call({:set, key, data}, _from, state) do
    {:reply, :ok, Map.put_new(state, key, data)}
  end

  @impl true
  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  @impl true
  def handle_call(:dump, _from, state) do
    IO.inspect state
    {:reply, :ok, state}
  end

  ######################### CLIENT ###############################
  def start_link(nil) do
    start_link("./src")
  end

  def start_link(src) do
    {:ok, pid} = GenServer.start_link(__MODULE__, default, name: :wulfila)
    files = Wulfila.Read.read_yaml([Path.expand(src)])

    read_files(files)
    {:ok, pid}
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
    GenServer.call(:wulfila, :dump)
  end


end
