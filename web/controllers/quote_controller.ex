defmodule Thefirehoseproject.QuoteController do
  use Thefirehoseproject.Web, :controller

  def homepage(conn, _params) do
    render conn, "homepage.html"
  end
end
