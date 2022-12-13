defmodule SevenTest do
  use ExUnit.Case

  @input File.stream!("input/07_test.txt")

  test "finds sum of dirs under 100000 in size" do
    95437 = AOC.Seven.part1(@input)
  end

  test "finds smallest directory to delete to have enough space for update" do
    24_933_642 = AOC.Seven.part2(@input)
  end
end
