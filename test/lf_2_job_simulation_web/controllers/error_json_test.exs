defmodule Lf2JobSimulationWeb.ErrorJSONTest do
  use Lf2JobSimulationWeb.ConnCase, async: true

  test "renders 404" do
    assert Lf2JobSimulationWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Lf2JobSimulationWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
