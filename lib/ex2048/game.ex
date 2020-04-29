defmodule Ex2048.Game do
  @moduledoc """
  The Game context.
  """

  def handle_key_event(key) do
    IO.puts("Game handles key event #{key}")
  end

  # def subscribe do
  #   Phoenix.PubSub.subscribe(Ex2048.PubSub, "game")
  # end

  # def broadcast({:ok, game}, event) do
  #   Phoenix.PubSub.broadcast(Ex2048.PubSub)
  # end
  def board_merge_left(board, board_width) do
    board
    |> Enum.chunk_every(board_width)
    |> Enum.map(fn list ->
      list_merge_left(list)
      |> pad(board_width)
      |> Enum.reverse()
    end)
    |> List.flatten()
  end

  def board_merge_right(board, board_width) do
    horizontal_flip(board, board_width)
    |> board_merge_left(board_width)
    |> horizontal_flip(board_width)
  end

  def board_merge_up(board, board_width) do
    transpose(board, board_width)
    |> board_merge_left(board_width)
    |> transpose(board_width)
  end

  def board_merge_down(board, board_width) do
    transpose(board, board_width)
    |> horizontal_flip(board_width)
    |> board_merge_left(board_width)
    |> horizontal_flip(board_width)
    |> transpose(board_width)
  end

  def horizontal_flip(board, board_width) do
    board
    |> Enum.chunk_every(board_width)
    |> Enum.map(&Enum.reverse(&1))
    |> List.flatten()
  end

  def transpose(board, board_width) do
    board
    |> Enum.chunk_every(board_width)
    |> List.zip()
    |> Enum.map(&Tuple.to_list(&1))
    |> List.flatten()
  end

  def list_merge_left(list) do
    list_merge_left(list, [])
  end

  def list_merge_left([nil | t], []) do
    list_merge_left(t, [])
  end

  def list_merge_left([h | t], []) do
    acc = [h]
    list_merge_left(t, acc)
  end

  def list_merge_left([nil | t], acc) do
    list_merge_left(t, acc)
  end

  def list_merge_left([h | t], [acc_h | acc_t] = acc) do
    cond do
      h == acc_h -> list_merge_left(t, [merge_cells(h, acc_h) | acc_t])
      true -> list_merge_left(t, [h | acc])
    end
  end

  def list_merge_left([], acc) do
    acc
  end

  def merge_cells(nil, nil) do
    nil
  end

  def merge_cells(cell1, cell2) do
    cell1 + cell2
  end

  def pad(list, expected_length) do
    cond do
      length(list) == expected_length -> list
      true -> pad([nil | list], expected_length)
    end
  end
end
