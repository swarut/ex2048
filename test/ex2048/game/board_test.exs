defmodule Ex2048.BoardTest do
  use Ex2048.DataCase

  alias Ex2048.Game.Board

  describe "init_game/1" do
    test "returns new board" do
      board = Board.init_game(2)
      assert board == [nil, nil, nil, nil]
    end
  end

  describe "randomly_add_cell/1" do
    test "returns new board" do
      board = [1, nil, 2, nil, 4, nil, nil, 6]
      nil_count = board |> Enum.filter(fn x -> x == nil end) |> length
      board = Board.randomly_add_cell([1, nil, 2, nil, 4, nil, nil, 6])
      nil_count_after = board |> Enum.filter(fn x -> x == nil end) |> length
      assert nil_count - nil_count_after == 1
      # IO.puts("board = #{inspect(board)}")
      # assert Enum.member?([1, 3, 5, 6], board)
    end
  end

  describe "pad/2" do
    test "returns padded list" do
      padded_list = Board.pad([1], 2)
      assert padded_list == [nil, 1]
      padded_list = Board.pad([1], 3)
      assert padded_list == [nil, nil, 1]
      padded_list = Board.pad([2, nil], 3)
      assert padded_list == [nil, 2, nil]
      padded_list = Board.pad([], 3)
      assert padded_list == [nil, nil, nil]
    end
  end

  describe "list_merge_left/2" do
    test "returns merged list" do
      # merged_list = Game.list_merge_left([2, 2, nil], [])
      # assert merged_list == [4]

      merged_list = Board.list_merge_left([nil, nil, 2], [])
      assert merged_list == [2]
    end
  end

  describe "board_merge_left/2" do
    test "returns board" do
      board = [2, 2, 2, nil, nil, nil, nil, nil, nil]
      merged_board = Board.board_merge_left(board, 3)
      assert merged_board == [4, 2, nil, nil, nil, nil, nil, nil, nil]

      board = [2, 4, 8, nil, nil, nil, 2, 2, 2]
      merged_board = Board.board_merge_left(board, 3)
      assert merged_board == [2, 4, 8, nil, nil, nil, 4, 2, nil]

      board = [2, nil, 2, nil, nil, nil, nil, nil, nil]
      merged_board = Board.board_merge_left(board, 3)
      assert merged_board == [4, nil, nil, nil, nil, nil, nil, nil, nil]
    end
  end

  describe "board_merge_right/2" do
    test "returns board" do
      board = [2, 2, 2, nil, nil, nil, nil, nil, nil]
      merged_board = Board.board_merge_right(board, 3)
      assert merged_board == [nil, 2, 4, nil, nil, nil, nil, nil, nil]

      board = [2, 4, 8, nil, nil, nil, 2, 2, 2]
      merged_board = Board.board_merge_right(board, 3)
      assert merged_board == [2, 4, 8, nil, nil, nil, nil, 2, 4]
    end
  end

  describe "board_merge_up/2" do
    test "returns board" do
      board = [2, 2, 2, nil, nil, nil, nil, nil, nil]
      merged_board = Board.board_merge_up(board, 3)
      assert merged_board == [2, 2, 2, nil, nil, nil, nil, nil, nil]

      board = [2, 2, 2, nil, nil, nil, 2, 2, 2]
      merged_board = Board.board_merge_up(board, 3)
      assert merged_board == [4, 4, 4, nil, nil, nil, nil, nil, nil]
    end
  end

  describe "board_merge_down/2" do
    test "returns board" do
      board = [2, 2, 2, nil, nil, nil, nil, nil, nil]
      merged_board = Board.board_merge_down(board, 3)
      assert merged_board == [nil, nil, nil, nil, nil, nil, 2, 2, 2]

      board = [2, 2, 2, nil, nil, nil, 2, 2, 2]
      merged_board = Board.board_merge_down(board, 3)
      assert merged_board == [nil, nil, nil, nil, nil, nil, 4, 4, 4]
    end
  end

  describe "horizontal_flip/2" do
    test "returns flipped board" do
      board = [1, 2, 3, nil, nil, nil, nil, nil, nil]
      flipped_board = Board.horizontal_flip(board, 3)
      assert flipped_board == [3, 2, 1, nil, nil, nil, nil, nil, nil]
    end
  end

  describe "transpose/2" do
    test "returns transposed board" do
      board = [1, 2, 3, nil, nil, nil, nil, nil, nil]
      flipped_board = Board.transpose(board, 3)
      assert flipped_board == [1, nil, nil, 2, nil, nil, 3, nil, nil]
    end
  end
end
