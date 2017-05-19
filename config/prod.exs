use Mix.Config

config :app, App.Web.Endpoint,
  http: [port: {:system, "${PORT}"}],
  url: [
    host: {:system, "${APP_URL}"}
  ],
  on_init: {App.Web.Endpoint, :load_from_system_env, []},
  server: true

config :logger, level: :info

config :app, App.Web.Endpoint,
  secret_key_base: System.get_env("${SECRET_KEY_BASE}")

config :app, App.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "${RDS_USERNAME}",
  password: "${RDS_PASSWORD}",
  database: "${RDS_DB_NAME}",
  hostname: "${RDS_HOSTNAME}",
  port: "${RDS_PORT}" || 5432,
  ssl: true,
  pool_size: 15
