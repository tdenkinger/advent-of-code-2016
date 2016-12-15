defmodule Advent.Day2Test do
  use ExUnit.Case, async: true
  alias Advent.Day2

  describe "A simple keypad" do
    test "Gets simple code" do
      keypad = Advent.Day2.SimpleKeypad
      assert Day2.door_code([], ["ULL","RRDDD","LURDL","UUUUD"], 5, keypad) == "1985"
    end

    test "Gets complex code" do
      keypad = Advent.Day2.SimpleKeypad
      assert Day2.door_code([], Advent.Data.day2, 5, keypad) == "47978"
    end
  end

  describe "A crazy, complex keypad" do
    test "Gets a simple code" do
      keypad = Advent.Day2.CrazyKeypad
      assert Day2.door_code([], ["ULL","RRDDD","LURDL","UUUUD"], 5, keypad) == "5DB3"
    end

    test "Gets a complex code" do
      keypad = Advent.Day2.CrazyKeypad
      assert Day2.door_code([], Advent.Data.day2, 5, keypad) == "659AD"
    end

  end
end

