defmodule ElixirProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Web.Router, options: [port: 4000]},
      ElixirProject.Repo
      # Starts a worker by calling: ElixirProject.Worker.start_link(arg)
      # {ElixirProject.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirProject.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
