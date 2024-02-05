defmodule ReactPhoenixTodoList.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ReactPhoenixTodoListWeb.Telemetry,
      # Start the Ecto repository
      ReactPhoenixTodoList.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ReactPhoenixTodoList.PubSub},
      # Start Finch
      {Finch, name: ReactPhoenixTodoList.Finch},
      # Start the Endpoint (http/https)
      ReactPhoenixTodoListWeb.Endpoint
      # Start a worker by calling: ReactPhoenixTodoList.Worker.start_link(arg)
      # {ReactPhoenixTodoList.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ReactPhoenixTodoList.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ReactPhoenixTodoListWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
