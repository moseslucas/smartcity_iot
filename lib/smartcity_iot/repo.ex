defmodule SmartcityIot.Repo do
  use Ecto.Repo,
    otp_app: :smartcity_iot,
    adapter: Ecto.Adapters.Postgres
end
