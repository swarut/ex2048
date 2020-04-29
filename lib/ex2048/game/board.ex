defmodule Ex2048.Game.Board do
  def init_game(board_width) do
    List.duplicate(nil, board_width * board_width)
  end

  def randomly_add_cell(board) do
    [random_index] =
      board
      |> Enum.with_index()
      |> Enum.reduce([], fn {value, index}, acc ->
        case value do
          nil -> [index | acc]
          _ -> acc
        end
      end)
      |> Enum.take_random(1)

    board |> List.update_at(random_index, fn _ -> 2 end)
  end

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
    |> Enum.zip()
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
      h == acc_h -> list_merge_left(t, [h + acc_h | acc_t])
      true -> list_merge_left(t, [h | acc])
    end
  end

  def list_merge_left([], acc) do
    acc
  end

  def pad(list, expected_length) do
    cond do
      length(list) == expected_length -> list
      true -> pad([nil | list], expected_length)
    end
  end
end
