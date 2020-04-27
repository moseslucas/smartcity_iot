defmodule SmartcityIot.Request.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :map

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
