use Mix.Config

config :logger, level: :info

# Configure your database
config :ecto_jsonb_example, EctoJsonbExample.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "",
  database: "ecto_jsonb_example",
  hostname: "localhost",
  pool_size: 10
