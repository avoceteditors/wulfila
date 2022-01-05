defmodule Wulfila.CLI.Commands do
  require Logger


  def process({opts, args, []}) do
    path =
      if opts[:source] == nil do
        Path.expand("./src")
      else
        Path.expand(opts[:source])
      end

    Wulfila.Database.start_link(path, opts[:force])
    case args do
      ["gen" | spec] -> Wulfila.Generate.run(spec)
      ["lex" | output] -> Wulfila.Lexicon.run(output)
      _ -> process({[], [], args})
    end
    Wulfila.Database.close(path)
  end

  def process({_opts, _args, bad}) do
    Logger.critical("Invalid Arguments: #{Enum.join(bad, " ")}")
  end
end
