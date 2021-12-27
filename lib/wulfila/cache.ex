defmodule Wulfila.Cache do
  use GenServer
  @moduledoc """
  Provides cache server for accessing and caching configuration data.
  """
  @moduledoc since: "0.1.0"


  @doc """
  Returns cache path, either the expanded path provided or the default.
  """
  @doc since: "0.1.0"
  def get_cache_path(src) do
    case src do
      nil -> Path.expand("~/.config/wulfila/cache.json")
      _ -> Path.expand(src)
    end
  end

  def get_cache_data(cache) do
    if File.exists?(cache) do
      case File.read(cache) do
        {:ok, content} ->
          case Poison.decode(content) do
            {:ok, data} -> data
            _ -> %{}
          end
        _ -> %{}
      end
    else
      %{}
    end
  end

  ############################# SERVER FUNCTIONS ##############################
  @impl true
  def init(cache) do
    path = get_cache_path(cache)
    data = get_cache_data(path)

    {:ok, {path, data}}
  end

  @impl true
  def handle_call(:close, _from, {path, index}) do
    IO.inspect index
    File.mkdir_p(Path.dirname(path))
    {:ok, json} = Poison.encode(index)
    File.write(path, json)
    {:reply, :ok, {path, index} }
  end

  @impl true
  def handle_call(:keys, _from, {path, index}) do
    {:reply, Map.keys(index), {path, index}}
  end

  @impl true
  def handle_call({:read, key}, _from, {path, index}) do
    {:reply, Map.get(index, key), {path, index}}
  end

  @impl true
  def handle_cast({:add, lang, path}, {cache, index}) do
    {:noreply,
      {cache, Map.put(index, lang,
        %{
          "project" => Path.expand("./.wulfila.yml"),
          "source" => Path.expand("./#{path}")
        })}}
  end


  ############################# CLIENT FUNCTIONS ##############################
  def start_link(cache) do
    GenServer.start_link(Wulfila.Cache, cache, name: :wulfila)
  end

  def add(lang, path) do
    GenServer.cast(:wulfila, {:add, lang, path})
  end

  def read() do
    GenServer.call(:wulfila, :keys)
  end

  def read(key) do
    GenServer.call(:wulfila, {:read, key})
  end

  def close do
    GenServer.call(:wulfila, :close)
  end

end
