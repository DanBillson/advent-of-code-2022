defmodule FiveTest do
  use ExUnit.Case

  @input File.stream!("input/05_test.txt")

  test "finds top crates after move" do
    assert "CMZ" = AOC.Five.part1(@input)
  end

  test "finds top crates after move with CrateMover 9001" do
    assert "MCD" = AOC.Five.part2(@input)
  end
end
