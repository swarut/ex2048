defmodule Ex2048Web.BoardLive.Index do
  use Ex2048Web, :live_view

  # alias Ex2048.Game
  # alias Ex2048.Game.Board

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :boards, fetch_boards())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Boards")
    |> assign(:board, nil)
  end

  defp fetch_boards do
    # Game.list_boards()
    []
  end
end
