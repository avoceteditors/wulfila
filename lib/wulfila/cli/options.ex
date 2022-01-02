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
          all: :boolean,
          force: :boolean,
          output: :string,
          source: :string,
          verbose: :boolean
        ],
        aliases: [
          a: :all,
          f: :force,
          o: :output,
          s: :source,
          v: :verbose
        ]
      ])
  end
end
