defmodule Wulfila.CLI.Commands do
  require Logger

  def docs_add do
    [{"add", "LANG"}, "Adds language to the cache."]
  end

  def process({opts, args, []}) do
    case args do
      ["add", lang, src] -> Wulfila.Add.run(opts[:source], lang, src)
      ["add" | _] -> Logger.info("Help text for add not yet written.")
      ["phono", lang] -> Wulfila.Phonology.run(opts[:source], lang)
      ["update" | langs] -> Wulfila.Update.run(opts[:source], opts[:force], langs)
      _ -> process({[], [], args})
    end
  end

  def process({_opts, _args, bad}) do
    Logger.critical("Invalid Arguments: #{Enum.join(bad, " ")}")
  end
end
