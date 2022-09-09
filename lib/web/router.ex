defmodule Web.Router do
  use Plug.Router
  import Plug.Conn
  alias ElixirProject.Library

  plug Plug.Logger
  plug :match
  plug :dispatch
  get "/" do
    render conn, :index, courses: Library.get_records()
  end

  get "/search" do
    render conn, :index, courses: Library.search_records(Plug.Conn.fetch_query_params(conn).query_params["search"])
  end

  defp render(conn, template, assigns) do
    inner = apply(__MODULE__, template, [[conn: conn] ++ assigns])
    outer = layout([conn: conn, inner: inner] ++ assigns)
    send_resp(conn, 200, outer)
  end

  # Embed the views
  require EEx
  EEx.function_from_file :def, :index,  "lib/views/index.eex", [:assigns]
  EEx.function_from_file :def, :layout, "lib/views/layout.eex", [:assigns]
end
