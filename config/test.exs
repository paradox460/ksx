import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :ksx, Ksx.Repo,
  database: :memory

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ksx, KsxWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Hod7wApWS5Bk3SNthX+Jz5gA2J3uLM0wZMa2QAnWQBrZZ4RROj1/V87byhycGEu6",
  server: false

# In test we don't send emails
config :ksx, Ksx.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
