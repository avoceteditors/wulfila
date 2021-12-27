defmodule Wulfila.CLI.Commands do
  require Logger

  def docs_add do
    [{"add", "LANG"}, "Adds language to the cache."]
  end

  def process({opts, args, []}) do
    case args do
      ["add", lang, src | _] -> Wulfila.Add.run(opts[:source], lang, src)
      ["update" | _] -> Wulfila.Update.run(opts[:source])
      _ -> process({[], [], args})
    end
  end

  def process({_opts, _args, bad}) do
    Logger.critical("Invalid Arguments: #{Enum.join(bad, " ")}")
  end
end
