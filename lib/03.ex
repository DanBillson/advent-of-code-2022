defmodule AOC.Three do
  @input File.stream!("input/03.txt")
  def to_mapset(string) when is_binary(string),
    do: String.graphemes(string) |> Enum.into(MapSet.new())

  def to_mapset(list) when is_list(list), do: list |> Enum.into(MapSet.new())

  @doc """
  Calculates the value of the item from ascii
  e.g.
    'A' ascii value is 65 which should be 27 so we take away 38 (-64 + 28)
    'a' ascii value is 97 which should be 1 so we take away 96

  a - z = 1 - 26
  A - Z = 27 - 52
  """
  def ascii_to_rucksack(ascii) when ascii < 97, do: ascii - 38
  def ascii_to_rucksack(ascii), do: ascii - 96

  def find_common_items(list) do
    Enum.reduce(list, [], fn cur, acc ->
      find_common_items(cur, acc)
    end)
  end

  def find_common_items(list1, []), do: list1

  def find_common_items(list1, list2) do
    MapSet.intersection(to_mapset(list1), to_mapset(list2))
    |> MapSet.to_list()
  end

  def part1(), do: part1(@input)

  def part1(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Enum.reduce(0, fn cur, acc ->
      {first, second} = String.split_at(cur, div(String.length(cur), 2))

      acc + (find_common_items(first, second) |> hd |> :binary.first() |> ascii_to_rucksack)
    end)
  end

  def part2(), do: part2(@input)

  def part2(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.chunk_every(3)
    |> Stream.map(&find_common_items/1)
    |> Enum.reduce(0, fn cur, acc ->
      acc + (cur |> hd |> :binary.first() |> ascii_to_rucksack)
    end)
  end
end
