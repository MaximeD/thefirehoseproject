defmodule Thefirehoseproject.PageController do
  use Thefirehoseproject.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
