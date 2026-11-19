import Config

if System.get_env("PHX_SERVER") do
  config :lf_2_job_simulation,
         Lf2JobSimulationWeb.Endpoint,
         server: true
end

if config_env() == :dev do
  config :lf_2_job_simulation, Lf2JobSimulationWeb.Endpoint,
    http: [port: String.to_integer(System.get_env("PORT", "4000"))],
    live_reload: [
      web_console_logger: true,
      patterns: [
        ~r"priv/static/(?!uploads/).*\.(js|css|png|jpeg|jpg|gif|svg)$",
        ~r"priv/gettext/.*\.po$",
        ~r"lib/lf_2_job_simulation_web/router\.ex$",
        ~r"lib/lf_2_job_simulation_web/(controllers|live|components)/.*\.(ex|heex)$"
      ]
    ]
end

if config_env() == :prod do
  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise "SECRET_KEY_BASE is missing"

  host =
    System.get_env("RENDER_EXTERNAL_HOSTNAME") ||
      "localhost"

  port =
    String.to_integer(System.get_env("PORT") || "10000")

  config :lf_2_job_simulation, Lf2JobSimulationWeb.Endpoint,
    url: [host: host, port: 443, scheme: "https"],
    http: [
      ip: {0, 0, 0, 0},
      port: port
    ],
    secret_key_base: secret_key_base
end
