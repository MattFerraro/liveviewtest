defmodule Liveviewtest.Repo do
  use Ecto.Repo,
    otp_app: :liveviewtest,
    adapter: Ecto.Adapters.Postgres
end
