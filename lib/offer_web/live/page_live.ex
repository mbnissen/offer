defmodule OfferWeb.PageLive do
  use OfferWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    o ohere
    <div class="h-screen w-screen"></div>
    """
  end
end
