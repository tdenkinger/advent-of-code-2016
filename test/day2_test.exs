defmodule Advent.Day2Test do
  use ExUnit.Case, async: true
  alias Advent.Day2

  test "Gets simple code" do
    assert Day2.door_code(8,
                          ["ULL","RRDDD","LURDL","UUUUD"]
                         ) == 5
  end
end

