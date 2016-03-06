defmodule Thefirehoseproject.QuoteController do
  use Thefirehoseproject.Web, :controller
  alias Thefirehoseproject.Quote

  plug :scrub_params, "quote" when action in [:create, :update]

  # `GET /`
  def homepage(conn, _params) do
    render conn, "homepage.html"
  end

  # `GET /quotes`: renders list of quotes
  def index(conn, _params) do
    quotes = Repo.all(Quote)
    render(conn, "index.html", quotes: quotes)
  end

  # `GET /quotes/new`: renders form to create a new quote
  def new(conn, _params) do
    changeset = Quote.changeset(%Quote{})
    render(conn, "new.html", changeset: changeset)
  end

  # `POST /quotes`: creates a new quote
  def create(conn, %{"quote" => quote_params}) do
    changeset = Quote.changeset(%Quote{}, quote_params)

    case Repo.insert(changeset) do
      {:ok, _quote} ->
        conn
        |> put_flash(:info, "Quote created successfully.")
        |> redirect(to: quote_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  # `GET /quotes/:id`: show a quote
  def show(conn, %{"id" => id}) do
    quote = Repo.get!(Quote, id)
    render(conn, "show.html", quote: quote)
  end
end
