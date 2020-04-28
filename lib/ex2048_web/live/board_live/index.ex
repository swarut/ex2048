defmodule Ex2048Web.BoardLive.Index do
  use Ex2048Web, :live_view

  # alias Ex2048.Game
  # alias Ex2048.Game.Board

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:boards, fetch_boards())
     |> assign(:cells, Enum.to_list(1..16))
     |> assign(:key, "nothing")}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  @impl true
  def handle_event("delete", %{"id" => _id}, socket) do
    {:noreply, socket}
  end

  def handle_event("update_board", %{"id" => _id}, socket) do
    {:noreply, socket}
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
