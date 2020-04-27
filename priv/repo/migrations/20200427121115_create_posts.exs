defmodule SmartcityIot.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :content, :jsonb

      timestamps()
    end

  end
end
