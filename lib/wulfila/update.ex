defmodule Wulfila.Update do


  def run(src) do
    src
    |> Wulfila.Cache.get_cache_path
    |> IO.inspect
  end
end
