defmodule Advent.Day2 do
  def door_code(positions, instructions, start) do
    instructions
    |> press_door_code(start, positions)
    |> Enum.reduce([], fn(i, acc) -> [List.first(i) | acc] end)
    |> Enum.join
  end

  def press_door_code([key_presses | t], starting_position, positions) do
    line = key_presses
    |> String.split("", trim: :true)
    |> Enum.reduce([starting_position],
                   fn(i, acc) ->
                     [ make_move(List.first(acc), i) | acc]
                   end)

    press_door_code(t, List.first(line), [line | positions])
  end

  def press_door_code([], _, presses), do: presses

  def make_move(1, dir) do
    case dir do
      "R" -> 2
      "D" -> 4
      _   -> 1
    end
  end

  def make_move(2, dir) do
    case dir do
      "L" -> 1
      "R" -> 3
      "D" -> 5
      _   -> 2
    end
  end

  def make_move(3, dir) do
    case dir do
      "L" -> 2
      "D" -> 6
      _   -> 3
    end
  end

  def make_move(4, dir) do
    case dir do
      "U" -> 1
      "D" -> 7
      "R" -> 5
      _   -> 4
    end
  end

  def make_move(5, dir) do
    case dir do
      "U" -> 2
      "D" -> 8
      "R" -> 6
      "L" -> 4
    end
  end

  def make_move(6, dir) do
    case dir do
      "U" -> 2
      "D" -> 9
      "L" -> 5
      _   -> 6
    end
  end

  def make_move(7, dir) do
    case dir do
      "U" -> 4
      "R" -> 8
      _   -> 7
    end
  end

  def make_move(8, dir) do
    case dir do
      "U" -> 5
      "L" -> 7
      "R" -> 9
      _   -> 8
    end
  end

  def make_move(9, dir) do
    case dir do
      "U" -> 6
      "L" -> 8
      _   -> 9
    end
  end

end

