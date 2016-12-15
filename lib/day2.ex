defmodule Advent.Day2 do
  def door_code(positions, instructions, start, key_pad) do
    instructions
    |> press_door_code(start, positions, key_pad)
    |> Enum.reduce([], fn(i, acc) -> [List.first(i) | acc] end)
    |> Enum.join
  end

  def press_door_code([key_presses | t], starting_position, positions, key_pad) do
    line = key_presses
    |> String.split("", trim: :true)
    |> Enum.reduce([starting_position],
                   fn(i, acc) ->
                     [ key_pad.make_move(List.first(acc), i) | acc]
                   end)

    press_door_code(t, List.first(line), [line | positions], key_pad)
  end

  def press_door_code([], _, presses, _), do: presses
end

defmodule Advent.Day2.CrazyKeypad do
  def make_move(1, dir) do
    case dir do
      "D" -> 3
      _   -> 1
    end
  end

  def make_move(2, dir) do
    case dir do
      "R" -> 3
      "D" -> 6
      _   -> 2
    end
  end

  def make_move(3, dir) do
    case dir do
      "R" -> 4
      "L" -> 2
      "U" -> 1
      "D" -> 7
    end
  end

  def make_move(4, dir) do
    case dir do
      "L" -> 3
      "D" -> 8
      _   -> 4
    end
  end

  def make_move(5, dir) do
    case dir do
      "R" -> 6
      _   -> 5
    end
  end

  def make_move(6, dir) do
    case dir do
      "L" -> 5
      "R" -> 7
      "U" -> 2
      "D" -> "A"
    end
  end

  def make_move(7, dir) do
    case dir do
      "L" -> 6
      "R" -> 8
      "U" -> 3
      "D" -> "B"
    end
  end

  def make_move(8, dir) do
    case dir do
      "L" -> 7
      "R" -> 9
      "U" -> 4
      "D" -> "C"
    end
  end

  def make_move(9, dir) do
    case dir do
      "L" -> 8
      _   -> 9
    end
  end

  def make_move("A", dir) do
    case dir do
      "R" -> "B"
      "U" -> 6
      _   -> "A"
    end
  end

  def make_move("B", dir) do
    case dir do
      "R" -> "C"
      "L" -> "A"
      "U" -> 7
      "D" -> "D"
    end
  end

  def make_move("C", dir) do
    case dir do
      "L" -> "B"
      "U" -> 8
      _   -> "C"
    end
  end

  def make_move("D", dir) do
    case dir do
      "U" -> "B"
      _   -> "D"
    end
  end

end

defmodule Advent.Day2.SimpleKeypad do
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

