use Mix.Config

# Configure your database
config :smartcity_iot, SmartcityIot.Repo,
  username: "postgres",
  password: "postgres",
  database: "smartcity_iot_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :smartcity_iot, SmartcityIotWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
