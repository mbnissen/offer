defmodule Offer.Repo do
  use Ecto.Repo,
    otp_app: :offer,
    adapter: Ecto.Adapters.Postgres
end
