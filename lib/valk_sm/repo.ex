defmodule ValkSm.Repo do
  use Ecto.Repo,
    otp_app: :valk_sm,
    adapter: Ecto.Adapters.Postgres
end
