defmodule Advent.Day1Test do
  use ExUnit.Case, async: true
  alias Advent.Day1

  test "Gets the distance from the origin" do
    assert Day1.calculate("n", [{0, 0}], Advent.data) == 300
  end

  test "Gets the coordinates first revisted" do
    assert Day1.find_revisit("n", [{0, 0}], Advent.data) == 159
  end
end

