defmodule SmartcityIot.Repo.Migrations.CreateLogs do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :app_id, :string
      add :dev_id, :string
      add :hardware_serial, :string
      add :port, :integer
      add :counter, :integer
      add :payload_raw, :string
      add :payload_fields, :map
      add :metadata, :map
      add :download_url, :string

      timestamps()
    end

  end
end
