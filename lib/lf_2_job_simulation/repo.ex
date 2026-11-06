defmodule Lf2JobSimulation.Repo do
  use Ecto.Repo,
    otp_app: :lf_2_job_simulation,
    adapter: Ecto.Adapters.Postgres
end
