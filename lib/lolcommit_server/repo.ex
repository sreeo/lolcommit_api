defmodule LolcommitServer.Repo do
  use Ecto.Repo,
    otp_app: :lolcommit_server,
    adapter: Ecto.Adapters.Postgres
end
