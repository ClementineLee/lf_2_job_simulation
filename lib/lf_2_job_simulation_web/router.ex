defmodule Lf2JobSimulationWeb.Router do
  use Lf2JobSimulationWeb, :router
  import Lf2JobSimulationWeb.UserAuthenticationPlug

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {Lf2JobSimulationWeb.Layouts, :root}
    plug :put_layout, html: {Lf2JobSimulationWeb.Layouts, :menu_layout}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :user_auth do
    # plug(CookbookWeb.UserAuthenticationPlug)
    # plug :fetch_current_division
  end

  scope "/", Lf2JobSimulationWeb do
    pipe_through [:browser, :check_and_create_userdata]

    get "/", PageController, :home
    get "/willkommen", PageController, :home
    get "/basis_informationen", PageController, :basic_information
    get "/quiz", PageController, :quiz
    post "/quiz/auswertung", PageController, :result_quiz
    get "/unsere_Produkte", PageController, :product_information
    get "/simulation", PageController, :simulation
    get "/impressum", PageController, :impressum
    get "/reset_session", PageController, :reset_session
  end

  # Other scopes may use custom stacks.
  # scope "/api", Lf2JobSimulationWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:lf_2_job_simulation, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: Lf2JobSimulationWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
