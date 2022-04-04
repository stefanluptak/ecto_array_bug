import Config

config :ecto_array_bug,
  ecto_repos: [Repo]

config :ecto_array_bug, Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "ecto_array_bug_dev",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
