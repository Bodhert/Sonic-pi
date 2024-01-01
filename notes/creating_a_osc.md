this is a simple osc `ping pong` server implement in Elixir and Sonic pi just 
for the sake of exploring and learning, there are a bunch of thing that I do not 
know and of course there is room for improvement always, feel free to share your though

```Elixir
# mix.exs
add the next to dependencies
  defp deps do
    [
      {:ex_osc, "~> 0.1.1"}
    ]
  end
```

Server code

```Elixir
defmodule OscElixir do
  @moduledoc """
  Documentation for `OscElixir`.
  """
  use GenStage

  def start_link() do
    {:ok, client} = ExOSC.Client.start_link(ip: {127, 0, 0, 1}, port: 4560)
    {:ok, consumer} = GenStage.start_link(__MODULE__, client, name: __MODULE__)
    {:ok, _} = GenStage.sync_subscribe(consumer, to: client)
  end

  @impl true
  def init(client) do
    {:consumer, %{client: client}}
  end

  def send_msg() do
    GenStage.call(__MODULE__, :test)
  end

  # -- Server side
  @impl true
  def handle_call(:test, _from, %{client: client} = state) do
    ExOSC.Client.send_message(client, %OSC.Message{path: "/ping", args: [50, 100, 1]})
    {:reply, :ok, [], state}
  end

  @impl true
  def handle_events(events, {_, _}, %{client: client} = state) do

    IO.inspect(state)

    events
    |> Enum.each(&IO.inspect/1)

    # Wait 5 second before reply
    Process.sleep(5000)
    ExOSC.Client.send_message(client, %OSC.Message{path: "/pong", args: [50, 100, 1]})

    {:noreply, [], state}
  end

end
```

Sonic pi code that will listen and send a reply to the server, leave it run it also
```ruby

##| port = ##| we do not yet from where we are going to see a reply 
##| use_osc "localhost", port

live_loop :ping do
  use_real_time
  a, b, c = sync "/osc*/ping"
  ##| synth :prophet, note: a, cutoff: b, sustain: c
  play 60
  osc "/pong"
end

live_loop :pong do
  use_real_time
  a, b, c = sync "/osc*/pong"
  play 65
end

```


then we can run the server using `iex -S mix`
we will enter in something call interactive shell, from there we can call function,
```Elixir
iex(1)> OscElixir.start_link
	{:ok, #Reference<0.1.2.3>}
iex(2)> OscElixir.send_msg
	:ok
```

We should here a `ping` msg sound, and if we inspect the cues console in sonic pi we should see something like
```ruby
/osc:127.0.0.1:12345/ping [50, 100, 1]
```

we should grab that `12345` and replace it as the port in the sonic pi code

```ruby

port = 12345
use_osc "localhost", port
```

now if we run the elixir commands again we should see something like 

```Elixir
iex(5)> OscElixir.send_msg
	:ok
	%{client: #PID<0.192.0>}
	%OSC.Message{path: "/pong", args: []}
```

if we see the OSC.Message means that our conection is working! also I just decide to reply with `pong`
to hear confirm with audio that is working

Happy Coding!
