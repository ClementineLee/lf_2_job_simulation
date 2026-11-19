defmodule Lf2JobSimulation.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Lf2JobSimulationWeb.Telemetry,
      {DNSCluster,
       query: Application.get_env(:lf_2_job_simulation, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Lf2JobSimulation.PubSub},

      # ETS / GenServer
      Lf2JobSimulation.UserStore,

      # Phoenix Endpoint
      Lf2JobSimulationWeb.Endpoint
    ]

    opts = [
      strategy: :one_for_one,
      name: Lf2JobSimulation.Supervisor
    ]

    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    Lf2JobSimulationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
