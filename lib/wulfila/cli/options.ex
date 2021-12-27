defmodule Wulfila.CLI.Options do
  @moduledoc """
  Provides command-line options for escript.
  """

  # Option Help Text
  defp verbose do
    {{"v", "verbose"}, "Enables verbose output"}
  end

  def parse(args) do
    OptionParser.parse(
      args,
      [
        switches: [
          all: :bool,
          source: :string,
          verbose: :bool
        ],
        aliases: [
          a: :all,
          s: :source,
          v: :verbose
        ]
      ])
  end
end
