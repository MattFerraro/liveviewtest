# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :liveviewtest,
  ecto_repos: [Liveviewtest.Repo]

# Configures the endpoint
config :liveviewtest, LiveviewtestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iid/AGVsv71quGTrFxBivLFGSunYodGcX/9A6MBQeJ30gtQZ7owvwjiamUCUrUpg",
  render_errors: [view: LiveviewtestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Liveviewtest.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "Xps0fYRjW5X6z4iwiQJJYmTVOA4ROpV+"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :phoenix, template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
