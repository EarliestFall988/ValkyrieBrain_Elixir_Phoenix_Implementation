defmodule ValkSm.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ValkSmWeb.Telemetry,
      # Start the Ecto repository
      ValkSm.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ValkSm.PubSub},
      # Start Finch
      {Finch, name: ValkSm.Finch},
      # Start the Endpoint (http/https)
      ValkSmWeb.Endpoint
      # Start a worker by calling: ValkSm.Worker.start_link(arg)
      # {ValkSm.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ValkSm.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ValkSmWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
