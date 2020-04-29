defmodule Ex2048.Game do
  @moduledoc """
  The Game context.
  """
  alias Ex2048.Game.Board

  def init_game(board_width) do
    Board.init_game(board_width)
    |> Board.randomly_add_cell()
  end

  def merge_left(board, board_width) do
    Board.board_merge_left(board, board_width)
    |> Board.randomly_add_cell()
  end

  def merge_right(board, board_width) do
    Board.board_merge_right(board, board_width)
    |> Board.randomly_add_cell()
  end

  def merge_up(board, board_width) do
    Board.board_merge_up(board, board_width)
    |> Board.randomly_add_cell()
  end

  def merge_down(board, board_width) do
    Board.board_merge_down(board, board_width)
    |> Board.randomly_add_cell()
  end
end
