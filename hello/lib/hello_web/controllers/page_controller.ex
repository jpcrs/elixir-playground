defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def show(conn, _params) do
    page = %{title: "foo"}
    render(conn, "show.json", page: page)
  end

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have an error.")
    |> render(:index)
  end

  def admin_index(conn, _params) do
    conn
    |> put_layout("admin.html") # Add the layout/admin.html main layout.
    |> render("index.html")
  end

  def not_found(conn, _params) do
    conn
    |> put_status(:not_found)
    |> put_view(HelloWeb.ErrorView)
    |> render("404.html")
  end

  def test(conn, _params) do
    render(conn, "test.html")
  end
end

# Example in case of authentication
# defmodule HelloWeb.MyFallbackController do
#   use Phoenix.Controller
#   alias HelloWeb.ErrorView

#   def call(conn, {:error, :not_found}) do
#     conn
#     |> put_status(:not_found)
#     |> put_view(ErrorView)
#     |> render(:"404")
#   end

#   def call(conn, {:error, :unauthorized}) do
#     conn
#     |> put_status(403)
#     |> put_view(ErrorView)
#     |> render(:"403")
#   end
# end

# defmodule HelloWeb.MyController do
#   use Phoenix.Controller
#   alias Hello.{Authorizer, Blog}

#   action_fallback HelloWeb.MyFallbackController  <----- Action fallback in case of 404 or 403.

#   def show(conn, %{"id" => id}, current_user) do
#     with {:ok, post} <- Blog.fetch_post(id),
#          :ok <- Authorizer.authorize(current_user, :view, post) do

#       render(conn, "show.json", post: post)
#     end
#   end
# end
