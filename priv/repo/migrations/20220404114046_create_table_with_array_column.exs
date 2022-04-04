defmodule EctoArrayBug.Repo.Migrations.CreateTableWithArrayColumn do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add(:tags, {:array, :string}, default: [])
    end
  end
end
