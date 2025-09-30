defmodule RemoteDirector.OSC do
  use GenStage

  def start_link(_) do
    {:ok, client} = ExOSC.Client.start_link(ip: {127, 0, 0, 1}, port: 4560)
    {:ok, consumer} = GenStage.start_link(__MODULE__, client, name: __MODULE__)
    {:ok, _} = GenStage.sync_subscribe(consumer, to: client)
    {:ok, consumer}
  end

  @impl true
  def init(client) do
    {:consumer, %{client: client}}
  end

  def send_msg(name \\ "", answer \\ "") do
    GenStage.call(__MODULE__, {name, answer})
  end

  # -- Server side
  @impl true
  def handle_call({name, answer}, _from, %{client: client} = state) do
    ExOSC.Client.send_message(client, %OSC.Message{path: "/ping", args: [name, answer, 100]})
    {:reply, :ok, [], state}
  end

  @impl true
  def handle_events(events, {_, _}, %{client: client} = state) do
    events
    |> Enum.each(&IO.inspect/1)

    # Wait that milliseconds before reply before reply
    Process.sleep(500)
    ExOSC.Client.send_message(client, %OSC.Message{path: "/pong", args: [50, 100, 1]})

    {:noreply, [], state}
  end
end
