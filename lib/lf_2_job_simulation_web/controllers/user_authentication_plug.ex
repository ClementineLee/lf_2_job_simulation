defmodule Lf2JobSimulationWeb.UserAuthenticationPlug do
  import Plug.Conn
  import Phoenix.Controller

  def check_and_create_userdata(conn, _opts) do
    IO.inspect(get_session(conn, :userdata), label: "AKTUELLE SESSION")
    userdata = get_session(conn, :userdata)

    userdata_save =
      if userdata != nil do
        Lf2JobSimulation.UserStore.get_user(Map.get(userdata, :userid, %{}), %{})
      end

    conn =
      if get_session(conn, :userdata) == nil or
           is_map(userdata) != true or
           Map.has_key?(userdata, :userid) == false or
           Map.has_key?(userdata, :test1) == false or
           Map.has_key?(userdata, :test2) == false or
           (userdata.test1 == true and Map.has_key?(userdata_save, :test1_result) == false) do
        userid = Ecto.UUID.generate()

        put_session(conn, :userdata, %{userid: userid, test1: false, test2: false})
        |> assign(userid: userid, test1: false, test2: false)
        |> put_flash(:clear_autosave, "true")
        |> put_flash(
          :error,
          "Ein Fehler ist aufgetreten. Ihr bisheriger Fortschritt wurde gelöscht. Wir bitten um Entschuldigung."
        )
      else
        conn
      end

    %{userid: userid} = get_session(conn, :userdata)

    if Lf2JobSimulation.UserStore.get_user(userid) == nil do
      Lf2JobSimulation.UserStore.create_user(userid)
    end

    conn
  end

  @doc """
  Used for routes that require the user to not be authenticated.
  """
end
