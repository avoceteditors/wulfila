defmodule Wulfila.CLI do
  @moduledoc """
  Main command-line process called as an escript.
  """

  @doc false
  def main(args) do
    args 
    |> Wulfila.CLI.Options.parse
    |> Wulfila.CLI.Commands.process
  end
end
