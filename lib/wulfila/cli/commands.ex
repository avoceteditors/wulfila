defmodule Wulfila.CLI.Commands do
  require Logger


  def process({opts, args, []}) do
    case args do
      ["gen" | spec] -> Wulfila.Generate.run(opts[:source], spec)
      _ -> process({[], [], args})
    end
  end

  def process({_opts, _args, bad}) do
    Logger.critical("Invalid Arguments: #{Enum.join(bad, " ")}")
  end
end
