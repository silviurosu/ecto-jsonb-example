defmodule EctoJsonbExample.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ecto_jsonb_example,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      elixirc_paths: elixirc_paths(Mix.env),
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {EctoJsonbExample.Application, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:ecto, ">= 2.1.6"},
      {:postgrex, ">= 0.13.3"},
      {:poison, ">= 3.1.0"},

      {:faker, "~> 0.9"},
      {:benchee, "~> 0.10", only: :dev}
    ]
  end

  defp aliases do
    ["ecto.setup": ["ecto.create", "run priv/repo/seeds.exs"],
    "ecto.reset": ["ecto.drop", "ecto.setup"],
    "test": ["ecto.create --quiet", "test"]]
  end
end
