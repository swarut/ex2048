defmodule Ex2048.Repo do
  use Ecto.Repo,
    otp_app: :ex2048,
    adapter: Ecto.Adapters.Postgres
end
