defmodule OfferWeb.PageLive do
  use OfferWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="h-screen w-screen">
      <div id="map" class="h-screen w-screen" phx-hook="MapHook" data-access-token={@access_token} />
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    access_token =
      Application.get_env(:offer, :mapbox)
      |> Keyword.get(:access_token)

    {:ok, assign(socket, access_token: access_token)}
  end
end
