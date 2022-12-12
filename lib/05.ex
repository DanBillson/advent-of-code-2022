defmodule AOC.Five do
  @input File.stream!("input/05.txt")

  def place_crates(crates) do
    Enum.reverse(crates)
    |> tl()
    |> Enum.flat_map(fn level ->
      String.graphemes(level)
      |> Enum.chunk_every(3, 4, :discard)
      |> Enum.with_index(1)
    end)
    |> Enum.reduce(%{}, fn
      {["[", crate, "]"], stack}, acc -> Map.update(acc, stack, [crate], &[crate | &1])
      _, acc -> acc
    end)
  end

  def create_instructions(instructions) do
    instructions
    |> Enum.flat_map(&String.split(&1, ~r{[\D]}, trim: true))
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(3)
  end

  def move_crates({crates, instructions}, model) do
    stacks = place_crates(crates)

    create_instructions(instructions)
    |> Enum.reduce(stacks, fn [amount, from, to], stacks ->
      {crates, stacks} = pop_in(stacks, [from, Access.slice(0..(amount - 1))])
      Map.update(stacks, to, crates, &place_crate(model, crates, &1))
    end)
    |> Map.values()
    |> Enum.map(&hd/1)
    |> Enum.join()
  end

  def place_crate(9000, crates, stack), do: Enum.reverse(crates) ++ stack
  def place_crate(9001, crates, stack), do: crates ++ stack

  def part1(), do: part1(@input)

  def part1(stream) do
    stream
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Enum.split_while(&(&1 != ""))
    |> move_crates(9000)
  end

  def part2(), do: part2(@input)

  def part2(stream) do
    stream
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Enum.split_while(&(&1 != ""))
    |> move_crates(9001)
  end
end
