use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bep, Bep.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :bep, Bep.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bep_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :bep,
  httpoison: Bep.Mock.HTTPoison,
  ex_aws: Bep.Mock.ExAws
