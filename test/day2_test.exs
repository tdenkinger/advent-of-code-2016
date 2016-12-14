defmodule Advent.Day2Test do
  use ExUnit.Case, async: true
  alias Advent.Day2

  test "Gets simple code" do
    assert Day2.door_code([], ["ULL","RRDDD","LURDL","UUUUD"], 5) == "1985"
  end

  test "Gets complex code" do
    assert Day2.door_code([], Advent.Data.day2, 5) == "47978"
  end
end

