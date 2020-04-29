defmodule Ex2048Web.BoardLive.Index do
  use Ex2048Web, :live_view

  alias Ex2048.Game

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:boards, fetch_boards())
     |> assign(:cells, Game.init_game(4) |> Game.randomly_add_cell())
     #  |> assign(:cells, Enum.to_list(1..16))
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

  def handle_event("update_board", %{"code" => key_code}, socket) do
    board = socket.assigns.cells

    board =
      case key_code do
        "ArrowLeft" -> Game.board_merge_left(board, 4) |> Game.randomly_add_cell()
        "ArrowUp" -> Game.board_merge_up(board, 4) |> Game.randomly_add_cell()
        "ArrowRight" -> Game.board_merge_right(board, 4) |> Game.randomly_add_cell()
        "ArrowDown" -> Game.board_merge_down(board, 4) |> Game.randomly_add_cell()
      end

    cells = socket.assigns[:cells]
    IO.inspect(cells)
    {:noreply, socket |> assign(:key, key_code) |> assign(:cells, board)}
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
