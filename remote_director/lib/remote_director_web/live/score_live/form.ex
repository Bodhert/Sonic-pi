defmodule RemoteDirectorWeb.ScoreLive.Form do
  use RemoteDirectorWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.form for={@form} id="score-form" phx-submit="submit">
        <% IO.inspect(@form) %>
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:answer]} type="text" label="Answer" />
        <footer>
          <.button phx-disable-with="Saving..." variant="primary">Submit answer</.button>
        </footer>
      </.form>
    </Layouts.app>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:form, to_form(%{"name" => "", "answer" => ""}))}
  end

  @impl true
  def handle_event("submit", %{"name" => name, "answer" => answer}, socket) do
    RemoteDirector.OSC.send_msg()

    {
      :noreply,
      socket
      |> put_flash(:info, "Thanks #{name}, your answer '#{answer}' has been received!")
    }
  end
end
