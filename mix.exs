defmodule ElixirProject.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_project,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ElixirProject.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.1"},
      {:ecto_sql, "~> 3.7.1"},
      {:postgrex, "~> 0.15.13"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
  
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run -e 'ElixirProjectMock.Seeds.seed!()'"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
    ]
  end
end
