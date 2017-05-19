use Mix.Config

config :app, App.Web.Endpoint,
  http: [port: "${PORT}"],
  # on_init: {App.Web.Endpoint, :load_from_system_env, []},
  secret_key_base: "${SECRET_KEY_BASE}",
  server: true,
  url: [
    host: "${APP_URL}",
    port: "${PORT}",
    scheme: "http"
  ]

config :logger, level: :info

config :app, App.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "${RDS_DB_NAME}",
  username: "${RDS_USERNAME}",
  password: "${RDS_PASSWORD}",
  hostname: "${RDS_HOSTNAME}",
  port: "${RDS_PORT}" || 5432,
  ssl: true,
  pool_size: 15
