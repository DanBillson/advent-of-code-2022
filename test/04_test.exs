defmodule FourTest do
  use ExUnit.Case

  @input File.stream!("input/04_test.txt")

  test "calculates number of contained jobs" do
    assert 2 = AOC.Four.part1(@input)
  end

  test "calculates number of overlapping jobs" do
    assert 4 = AOC.Four.part2(@input)
  end
end
