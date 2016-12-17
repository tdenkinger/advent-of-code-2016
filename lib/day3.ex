defmodule Advent.Day3 do
  def find_vert_triangles(all_dimensions) do
    all_dimensions
    |> transpose
    |> find_triangles
  end

  def find_triangles(all_dimensions) do
    all_dimensions
    |> Enum.reduce([], fn(dims, acc) -> [triangle?(dims) | acc] end)
    |> Enum.count(fn(x) -> x == true end)
  end

  def transpose(dimensions) do
       (dimensions |> get_dimensions)
    ++ (dimensions |> List.delete_at(0) |> get_dimensions)
    ++ (dimensions |> List.delete_at(0) |> List.delete_at(0) |> get_dimensions)

  end

  def get_dimensions(dimensions) do
    dimensions
    |> Enum.take_every(3)
    |> Enum.chunk(3)
  end

  def triangle?(dimensions) do
    dimensions
    |> Enum.sort
    |> compare_dimensions
  end

  def compare_dimensions([a, b, c]) do
    a + b > c
  end
end

