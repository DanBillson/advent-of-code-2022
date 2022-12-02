defmodule AOC.Two do
  @moduledoc """
  Elf Rock Paper Scissors

  Key:
  A and X - Rock
  B and Y - Paper
  C and Z - Scissors

  Win - 6
  Draw - 3
  Loss - 0
  """
  @input File.stream!("input/02.txt")
  @moves %{
    "A" => 1,
    "B" => 2,
    "C" => 3,
    "X" => 1,
    "Y" => 2,
    "Z" => 3
  }

  def points("C", "X"), do: 6
  def points("A", "Y"), do: 6
  def points("B", "Z"), do: 6

  def points(a, b) do
    if @moves[a] == @moves[b], do: 3, else: 0
  end

  def result(them, me) do
    points(them, me) + @moves[me]
  end

  def part1(), do: part1(@input)

  def part1(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Enum.reduce(0, fn cur, acc ->
      [them, me] = String.split(cur)

      acc + result(them, me)
    end)
  end

  def outcome("X"), do: 0
  def outcome("Y"), do: 3
  def outcome("Z"), do: 6

  def move("A", "X"), do: 3
  def move("B", "X"), do: 1
  def move("C", "X"), do: 2
  def move(them, "Y"), do: @moves[them]
  def move(them, "Z"), do: rem(@moves[them], 3) + 1

  def part2(), do: part2(@input)

  def part2(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Enum.reduce(0, fn cur, acc ->
      [them, me] = String.split(cur)

      acc + outcome(me) + move(them, me)
    end)
  end
end
