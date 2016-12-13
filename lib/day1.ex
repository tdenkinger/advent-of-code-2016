defmodule Advent.Day1 do
  def find_revisit(heading, coords, directions) do
    directions
    |> String.split(", ", trim: true)
    |> calc_moves(heading, coords)
    |> Enum.reverse
    |> IO.inspect
  end

  def calculate(heading, starting_location, directions) do
    directions
    |> String.split(", ", trim: true)
    |> calc_moves(heading, starting_location)
    |> List.first
    |> get_distance
  end

  defp get_distance({x, y}), do: abs(x) + abs(y)

  defp calc_moves([head | tail], heading, visited) do
    [direction, magnitude] = String.split(head, "", parts: 2)

    heading = make_turn(heading, direction)
    path    = get_path(heading,
                       String.to_integer(magnitude),
                       List.first(visited))

    calc_moves(tail, heading, path ++ visited)
  end

  defp calc_moves([], _, visited), do: visited

  defp get_path("e", magnitude, {x, y}) do
    x+1..x+magnitude |> Enum.reduce([], fn(i, acc) -> [{i, y} | acc] end)
  end

  defp get_path("n", magnitude, {x, y}) do
    y+1..y+magnitude |> Enum.reduce([], fn(i, acc) -> [{x, i} | acc] end)
  end

  defp get_path("w", magnitude, {x, y}) do
    x-1..x-magnitude |> Enum.reduce([], fn(i, acc) -> [{i, y} | acc] end)
  end

  defp get_path("s", magnitude, {x, y}) do
    y-1..y-magnitude |> Enum.reduce([], fn(i, acc) -> [{x, i} | acc] end)
  end

  defp make_turn("n", "R"), do: "e"
  defp make_turn("n", "L"), do: "w"
  defp make_turn("e", "R"), do: "s"
  defp make_turn("e", "L"), do: "n"
  defp make_turn("s", "R"), do: "w"
  defp make_turn("s", "L"), do: "e"
  defp make_turn("w", "R"), do: "n"
  defp make_turn("w", "L"), do: "s"
end

