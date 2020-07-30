defmodule Mushu.Repo do
  use Ecto.Repo,
    otp_app: :mushu,
    adapter: Ecto.Adapters.Postgres
end
