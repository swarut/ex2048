defmodule Ex2048Web.BoardLive.Index do
  use Ex2048Web, :live_view

  alias Ex2048.Game2048s
  alias Ex2048.Game2048s.Board

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :boards, fetch_boards())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Board")
    |> assign(:board, Game2048s.get_board!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Board")
    |> assign(:board, %Board{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Boards")
    |> assign(:board, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    board = Game2048s.get_board!(id)
    {:ok, _} = Game2048s.delete_board(board)

    {:noreply, assign(socket, :boards, fetch_boards())}
  end

  defp fetch_boards do
    Game2048s.list_boards()
  end
end
