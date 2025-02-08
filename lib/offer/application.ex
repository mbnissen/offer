defmodule Offer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      OfferWeb.Telemetry,
      Offer.Repo,
      {DNSCluster, query: Application.get_env(:offer, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Offer.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Offer.Finch},
      # Start a worker by calling: Offer.Worker.start_link(arg)
      # {Offer.Worker, arg},
      # Start to serve requests, typically the last entry
      OfferWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Offer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OfferWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
