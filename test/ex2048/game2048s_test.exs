defmodule Ex2048.Game2048sTest do
  use Ex2048.DataCase

  alias Ex2048.Game2048s

  describe "boards" do
    alias Ex2048.Game2048s.Board

    @valid_attrs %{size: 42}
    @update_attrs %{size: 43}
    @invalid_attrs %{size: nil}

    def board_fixture(attrs \\ %{}) do
      {:ok, board} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Game2048s.create_board()

      board
    end

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Game2048s.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Game2048s.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      assert {:ok, %Board{} = board} = Game2048s.create_board(@valid_attrs)
      assert board.size == 42
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Game2048s.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      assert {:ok, %Board{} = board} = Game2048s.update_board(board, @update_attrs)
      assert board.size == 43
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Game2048s.update_board(board, @invalid_attrs)
      assert board == Game2048s.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Game2048s.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Game2048s.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Game2048s.change_board(board)
    end
  end
end
