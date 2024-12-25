defmodule PhoenixFlowbiteSample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixFlowbiteSampleWeb.Telemetry,
      {DNSCluster,
       query: Application.get_env(:phoenix_flowbite_sample, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixFlowbiteSample.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoenixFlowbiteSample.Finch},
      # Start a worker by calling: PhoenixFlowbiteSample.Worker.start_link(arg)
      # {PhoenixFlowbiteSample.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixFlowbiteSampleWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixFlowbiteSample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixFlowbiteSampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
