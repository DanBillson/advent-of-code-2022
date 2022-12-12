defmodule SixTest do
  use ExUnit.Case

  @input File.stream!("input/06_test.txt")

  test "finds marker character in datastream" do
    7 = AOC.Six.part1(@input)
  end

  test "finds marker character in datastream with 14 unique chars" do
    19 = AOC.Six.part2(@input)
  end
end
