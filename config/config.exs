# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex2048,
  ecto_repos: [Ex2048.Repo]

# Configures the endpoint
config :ex2048, Ex2048Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "q+Z3fvvCSAawgKsN1ctizBjDqzrk5JsV//JWSRs5gZ4SyXZaLANRO5ogyl6S2beH",
  render_errors: [view: Ex2048Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Ex2048.PubSub,
  live_view: [signing_salt: "vu5V9lf/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
