defmodule Ex2048Web.BoardLive.Index do
  use Ex2048Web, :live_view

  alias Ex2048.Game

  @board_size 4

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> assign(:board, Game.init_game(@board_size))}
  end

  @impl true
  def handle_event("update_board", %{"code" => key_code}, socket) do
    board = socket.assigns.board

    board =
      case key_code do
        "ArrowLeft" ->
          Game.merge_left(board, 4)

        "ArrowUp" ->
          Game.merge_up(board, 4)

        "ArrowRight" ->
          Game.merge_right(board, 4)

        "ArrowDown" ->
          Game.merge_down(board, 4)

        _ ->
          board
      end

    {:noreply, socket |> assign(:key, key_code) |> assign(:board, board)}
  end
end
