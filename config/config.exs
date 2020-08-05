# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mushu,
  ecto_repos: [Mushu.Repo]

# Configures the endpoint
config :mushu, MushuWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eAe35hI7VJmumB4SvKPBGweudzQZM5Fs5kv57cZofaty+Z45grvi6POTyJ6ofHVt",
  render_errors: [view: MushuWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mushu.PubSub, adapter: Phoenix.PubSub.PG2]

# Pow configuration
config :mushu, :pow,
  user: Mushu.Users.User,
  repo: Mushu.Repo

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
