defmodule Advent.Day3Test do
  use ExUnit.Case, async: true
  alias Advent.Day3

  test "Identifies triangles horizontally" do
    assert  Day3.find_triangles(Advent.Data.day3) == 917
  end

  test "Identifies triangles veritcally" do
    assert Day3.find_vert_triangles(Advent.Data.day3_part2) == 1649
  end
end

