defmodule Repo do
  use Ecto.Repo,
    otp_app: :ecto_array_bug,
    adapter: Ecto.Adapters.Postgres
end
