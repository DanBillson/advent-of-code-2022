defmodule TwoTest do
  use ExUnit.Case

  @input File.stream!("input/02_test.txt")

  test "calculates total score" do
    assert 15 = AOC.Two.part1(@input)
  end

  test "calculates score with tactics" do
    assert 12 = AOC.Two.part2(@input)
  end
end
