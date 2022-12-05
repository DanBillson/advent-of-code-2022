defmodule ThreeTest do
  use ExUnit.Case

  @input File.stream!("input/03_test.txt")

  test "calculates total value of rucksack duplicates" do
    assert 157 = AOC.Three.part1(@input)
  end

  test "calculates sum of group badges" do
    assert 70 = AOC.Three.part2(@input)
  end
end
