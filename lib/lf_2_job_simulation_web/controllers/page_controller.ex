defmodule Lf2JobSimulationWeb.PageController do
  use Lf2JobSimulationWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
