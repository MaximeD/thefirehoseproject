defmodule Thefirehoseproject.Quote do
  use Thefirehoseproject.Web, :model

  schema "quotes" do
    field :saying, :string
    field :author, :string

    timestamps
  end
end
