defmodule Wulfila.Build do

  def run(source, output, targets) do

    # Build Source and Output Directories
    src =
      if source == nil do
        Path.expand(".")
      else
        Path.expand(source)
      end
    out =
      if output == nil do
        Path.expand("./build")
      else
        Path.expand(output)
      end

    manifest = Path.join(src, "manifest.yml")

    if File.exists?(manifest) do
      if not File.exists?(out) do
        File.mkdir_p(out)
      end

      case YamlElixir.read_from_file(manifest) do
        {:ok, data} ->
          build(data, out, targets)
          |> IO.inspect
        x -> IO.inspect x
      end
    end
  end

  def build(src, out, targets) do
    src["builds"]
    |> prepare_targets(out)
  end

  def prepare_targets(targets, out) do
    targets
    |> Enum.map(
      fn target ->
        prepare(target, out, targets)
      end
    )
  end

  def prepare(target, out, targets) do
  end

end
