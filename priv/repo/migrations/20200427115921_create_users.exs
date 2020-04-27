defmodule SmartcityIot.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :role, :string
      add :first_name, :string
      add :last_name, :string
      add :encrypt_password, :string

      timestamps()
    end

    create unique_index(:users, [:email])

  end
end
