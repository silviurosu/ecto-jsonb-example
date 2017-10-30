use Mix.Config

config :ecto_jsonb_example,
  ecto_repos: [EctoJsonbExample.Repo]

import_config "#{Mix.env}.exs"
