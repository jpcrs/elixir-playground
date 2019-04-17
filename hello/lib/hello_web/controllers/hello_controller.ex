defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"messenger" => messenger}) do
    render conn, "show.html", messenger: messenger

    # conn
    # |> assign(:message, "Welcome Back!")
    # |> assign(:name, "Dweezil")
    # |> render("index.html")
  end

  def show_id(conn, %{"id" => id}) do
    json(conn, %{id: id})
  end
end
