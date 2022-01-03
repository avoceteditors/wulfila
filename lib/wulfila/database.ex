defmodule Wulfila.Database do
  use GenServer

  ######################### SERVER ###############################


  ######################### CLIENT ###############################
  def start_link(nil) do
    start_link("./src")
  end
  def start_link(src) do
    files = Wulfila.Read.read_yaml([Path.expand(src)])
    IO.inspect files
    #GenServer.start_link(Wulfila.Database, files, name: :wulfila)
  end
end
