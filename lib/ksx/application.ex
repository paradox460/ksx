defmodule Ksx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KsxWeb.Telemetry,
      Ksx.Repo,
      {DNSCluster, query: Application.get_env(:ksx, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Ksx.PubSub},
      # Start a worker by calling: Ksx.Worker.start_link(arg)
      # {Ksx.Worker, arg},
      # Start to serve requests, typically the last entry
      KsxWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ksx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KsxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
