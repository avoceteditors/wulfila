defmodule Wulfila.Lang do
  use GenServer


  ############################ SERVER CONFIGURATION #############################
  @impl true
  def init(cache) do
    {:ok, if File.exists?(cache) do
      {:ok, data} = YamlElixir.read_from_file(cache)
      {cache, data}
    else
      {cache, %{}}
    end}
  end

  @impl true
  def handle_call({:update, data}, _from, {cache, state}) do
    {:reply, :ok, {cache, Map.merge(state, data)}}
  end

  @impl true
  def handle_call(:close, _from, {cache, state}) do
    {:ok, json} = Poison.encode(state)
    File.write(cache, json)
    {:reply, :ok, {cache, state}}
  end

  ############################ CLIENT CONFIGURATION #############################
  def start_link(lang, cache, source, force) do
    # Extract Cache mtime
    cache_mtime =
      if File.exists?(cache) do
        {:ok, stat} = File.stat(cache)
        stat.mtime
      else
        {:ok, date} = Date.new(1970, 1, 1)
        {:ok, time} = Time.new(0, 0, 0)
        {:ok, datetime} = DateTime.new(date, time)
        datetime
      end

    # Extract Source File Information
    files = Wulfila.Common.find_files([source], [".yml", ".yaml"])
    files_max = files
    |> Enum.map(
      fn x ->
        {:ok, stat} = File.stat(x)
        stat.mtime
      end
    )
    |> Enum.max

    atom = String.to_atom(lang)
    GenServer.start_link(Wulfila.Lang, cache, name: atom)
    if cache_mtime < files_max or force or not File.exists?(cache) do
      files
      |> Stream.map(&Task.async(Wulfila.Lang, :read, [&1, atom]))
      |> Enum.map(&Task.await(&1))
    end
    {:ok, atom}
  end

  def close(atom) do
    GenServer.call(atom, :close)
  end


  ########################## HELPER FUNCTIONS #######################
  def read(path, key) do
    {:ok, data} = YamlElixir.read_from_file(path)
    GenServer.call(key, {:update, data})
  end
end
