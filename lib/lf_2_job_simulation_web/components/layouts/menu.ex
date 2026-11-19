defmodule Lf2JobSimulationWeb.Layouts.Menu do
  use Lf2JobSimulationWeb, :html

  embed_templates "layouts/*"

  attr :userid, :string, required: true
  attr :test1, :boolean, required: true
  attr :test2, :boolean, required: true

  def menu(assigns) do
  end
end
