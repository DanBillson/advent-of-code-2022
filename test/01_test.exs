defmodule OneTest do
  use ExUnit.Case

  @input File.stream!("input/01_test.txt")

  test "finds elf with most calories" do
    assert 24000 = AOC.One.part1(@input)
  end

  test "finds top 3 elves with most calories" do
    assert 45000 = AOC.One.part2(@input)
  end
end
