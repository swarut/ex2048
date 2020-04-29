use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :ex2048, Ex2048.Repo,
  username: "swarut",
  password: "",
  database: "ex2048_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ex2048, Ex2048Web.Endpoint,
  http: [port: 5002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
