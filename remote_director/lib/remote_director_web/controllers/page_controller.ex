defmodule RemoteDirectorWeb.PageController do
  use RemoteDirectorWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
