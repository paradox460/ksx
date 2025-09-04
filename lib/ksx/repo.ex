defmodule Ksx.Repo do
  use Ecto.Repo,
    otp_app: :ksx,
    adapter: Ecto.Adapters.Postgres
end
