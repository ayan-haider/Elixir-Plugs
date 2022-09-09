import Config

config :elixir_project, ElixirProject.Repo,
  database: "elixir_project_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :elixir_project,
  ecto_repos: [ElixirProject.Repo]
