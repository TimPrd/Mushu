defmodule MushuWeb.PageController do
  use MushuWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
