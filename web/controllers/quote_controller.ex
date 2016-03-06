defmodule Thefirehoseproject.QuoteController do
  use Thefirehoseproject.Web, :controller

  # `GET /`
  def homepage(conn, _params) do
    render conn, "homepage.html"
  end

  # `GET /quotes`: renders list of quotes
  def index(conn, _params) do
    conn
    |> assign(:quotes, Repo.all(Thefirehoseproject.Quote))
    |> render("index.html")
  end
end
