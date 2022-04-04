# EctoArrayBug

## GitHub Issue

https://github.com/elixir-ecto/ecto/issues/3857

## Problem

With `Post` schema defined like this:

```elixir
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
```

created with this migration:

```elixir
defmodule EctoArrayBug.Repo.Migrations.CreateTableWithArrayColumn do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add(:tags, {:array, :string}, default: [])
    end
  end
end

```

I think when doing

```elixir
%Post{}
|> Post.changeset()
|> Repo.insert!()
```

it should return this:

```elixir
%Post{
  tags: [],
  __meta__: #Ecto.Schema.Metadata<:loaded, "posts">,
  id: 1
}
```

instead of this:

```elixir
%Post{
  tags: nil,
  __meta__: #Ecto.Schema.Metadata<:loaded, "posts">,
  id: 1
}
```

## Setup

```
mix deps.get
MIX_ENV=test mix ecto.setup
```

## Run

```
mix test
```