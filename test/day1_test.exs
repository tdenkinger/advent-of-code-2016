defmodule Advent.Day1Test do
  use ExUnit.Case, async: true
  alias Advent.Day1

  test "Gets the distance from the origin" do
    assert Day1.calculate("n", [%{x: 0, y: 0}], Advent.data) == 300
  end

  # test "Gets the coordinates first revisted" do
  #   assert Day1.find_revisit("n", %{x: 0, y: 0}, "R8, R4, R4, R8") == 4
  # end
end

