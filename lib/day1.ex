defmodule Advent.Day1 do
  def find_revisit(heading, coords, directions) do
    directions
    |> String.split(", ", trim: true)
    |> calc_moves(heading, coords)
    |> elem(0)
    |> Enum.reverse
    |> IO.inspect
  end

  def calculate(heading, coords, directions) do
    directions
    |> String.split(", ", trim: true)
    |> calc_moves(heading, coords)
    |> elem(0)
    |> List.first
    |> get_distance
  end

  def get_distance({x, y}), do: abs(x) + abs(y)

  def calc_moves([head | tail], heading, coords) do
    [direction, magnitude] = String.split(head, "", parts: 2)
    heading = turn(heading, direction)
    path    = update_location(heading,
                              String.to_integer(magnitude),
                              List.first(coords))

    calc_moves(tail, heading, path ++ coords)
  end

  def calc_moves([], _, coords), do: {coords}

  def update_location("e", magnitude, {x, y}) do
    x+1..x+magnitude
    |> Enum.reduce([], fn(i, acc) -> [{i, y} | acc] end)
  end

  def update_location("n", magnitude, {x, y}) do
    y+1..y+magnitude
    |> Enum.reduce([], fn(i, acc) -> [{x, i} | acc] end)
  end

  def update_location("w", magnitude, {x, y}) do
    x-1..x-magnitude
    |> Enum.reduce([], fn(i, acc) -> [{i, y} | acc] end)
  end

  def update_location("s", magnitude, {x, y}) do
    y-1..y-magnitude
    |> Enum.reduce([], fn(i, acc) -> [{x, i} | acc] end)
  end

  def turn("n", "R"), do: "e"
  def turn("n", "L"), do: "w"
  def turn("e", "R"), do: "s"
  def turn("e", "L"), do: "n"
  def turn("s", "R"), do: "w"
  def turn("s", "L"), do: "e"
  def turn("w", "R"), do: "n"
  def turn("w", "L"), do: "s"
end

