defmodule Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :tags, {:array, :string}, values: ["popular", "new"]
  end

  def changeset(user, params \\ %{}) do
    cast(user, params, [:tags])
  end
end
