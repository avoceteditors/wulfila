defmodule Wulfila.CLI.Commands do
  require Logger


  def process({opts, args, []}) do
    Wulfila.Database.start_link(opts[:source])
    case args do
      ["gen" | spec] -> Wulfila.Generate.run(spec)
      ["lex" | output] -> Wulfila.Lexicon.run(output)
      _ -> process({[], [], args})
    end
  end

  def process({_opts, _args, bad}) do
    Logger.critical("Invalid Arguments: #{Enum.join(bad, " ")}")
  end
end
