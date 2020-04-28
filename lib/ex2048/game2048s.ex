defmodule Ex2048.Game2048s do
  @moduledoc """
  The Game2048s context.
  """

  import Ecto.Query, warn: false
  alias Ex2048.Repo

  alias Ex2048.Game2048s.Board

  @doc """
  Returns the list of boards.

  ## Examples

      iex> list_boards()
      [%Board{}, ...]

  """
  def list_boards do
    raise "TODO"
  end

  @doc """
  Gets a single board.

  Raises if the Board does not exist.

  ## Examples

      iex> get_board!(123)
      %Board{}

  """
  def get_board!(id), do: raise "TODO"

  @doc """
  Creates a board.

  ## Examples

      iex> create_board(%{field: value})
      {:ok, %Board{}}

      iex> create_board(%{field: bad_value})
      {:error, ...}

  """
  def create_board(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a board.

  ## Examples

      iex> update_board(board, %{field: new_value})
      {:ok, %Board{}}

      iex> update_board(board, %{field: bad_value})
      {:error, ...}

  """
  def update_board(%Board{} = board, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Board.

  ## Examples

      iex> delete_board(board)
      {:ok, %Board{}}

      iex> delete_board(board)
      {:error, ...}

  """
  def delete_board(%Board{} = board) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking board changes.

  ## Examples

      iex> change_board(board)
      %Todo{...}

  """
  def change_board(%Board{} = board, _attrs \\ %{}) do
    raise "TODO"
  end
end
