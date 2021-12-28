defmodule Wulfila.Update do
  @moduledoc """
  Provides functions for updating the language cache.
  """
  @moduledoc since: "0.1.0"

  def run(cache, force, langs) do
    Wulfila.Cache.start_link(cache)

    case langs do
      [] -> update_langs(Wulfila.Cache.read, force)
      _ -> update_langs(langs, force)
    end

    Wulfila.Cache.close()
  end

  def update_langs(langs, force) do
    case langs do
      [lang | rest] -> [update_lang(lang, force) | update_langs(rest, force)]
      _ -> []
    end
  end

  def update_lang(key, force) do
    %{"project" => cache, "source" => source} = Wulfila.Cache.read(key)
    Wulfila.Lang.start_link(key, cache, source, force)

  end

end
