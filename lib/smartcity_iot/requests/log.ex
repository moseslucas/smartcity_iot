defmodule SmartcityIot.Requests.Log do
  use Ecto.Schema
  import Ecto.Changeset

  schema "logs" do
    field :app_id, :string
    field :counter, :integer
    field :dev_id, :string
    field :download_url, :string
    field :hardware_serial, :string
    field :metadata, :map
    field :payload_fields, :map
    field :payload_raw, :string
    field :port, :integer

    timestamps()
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:app_id, :dev_id, :hardware_serial, :port, :counter, :payload_raw, :payload_fields, :metadata, :download_url])
    |> validate_required([:app_id, :dev_id, :hardware_serial, :port, :payload_fields, :metadata])
  end
end
