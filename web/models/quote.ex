defmodule Thefirehoseproject.Quote do
  use Thefirehoseproject.Web, :model

  schema "quotes" do
    field :saying, :string
    field :author, :string

    timestamps
  end

  @required_fields ~w(saying author)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  defmodule Queries do
    def random do
      query = Ecto.Adapters.SQL.query(
        Thefirehoseproject.Repo,
        "SELECT id, saying, author from quotes ORDER BY RANDOM() LIMIT 1",
        [])
      {:ok, %{rows: [row]}} = query
      [id, saying, author] = row
      %Thefirehoseproject.Quote{id: id, saying: saying, author: author}
    end
  end
end
