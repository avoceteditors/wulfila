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
      {:ok, content} = File.read(cache)
      Poison.decode(content)
    else
      %{}
    end
  end

  ############################# SERVER FUNCTIONS ##############################
  @impl true
  def init(cache) do
    path = get_cache_path(cache)
    data = get_cache_data(path)

    data
    |> Map.keys

    {:ok, {path, data, %{}}}
  end


  @impl true
  def handle_cast({:close}, {path, index, data}) do
    IO.inspect index
    File.mkdir_p(Path.dirname(path))
    File.write(path, Poison.encode(index))
    {:noreply, {path, index, data}}
  end

  @impl true
  def handle_cast({:add, lang, path}, {cache, index, data}) do
    {:noreply, {cache, Map.put(index, lang, path), data}}
  end

  ############################# CLIENT FUNCTIONS ##############################
  def start_link(cache) do
    GenServer.start_link(Wulfila.Cache, cache, name: :wulfila)
  end

  def add(lang, path) do
    GenServer.cast(:wulfila, {:add, lang, path})
  end

  def close do
    GenServer.cast(:wulfila, {:close})
  end

  #def add(lang, path) do
  #  GenServer.cast(:wulfila, {:add, lang, path})
  #end


end
