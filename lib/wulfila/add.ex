defmodule Wulfila.Add do

  def run(cache, lang, src) do
    # Initialize Cache Server
    Wulfila.Cache.start_link(cache)

    # Add Language
    Wulfila.Cache.add(lang, src)

    # Close Cach and Language Server
    Wulfila.Cache.close()
  end
end
