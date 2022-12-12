defmodule AOC.Six do
  @input File.stream!("input/06.txt")

  def update_recent_chars(chars, new_char) do
    [new_char | chars |> Enum.reverse() |> tl() |> Enum.reverse()]
  end

  def has_duplicates?(list) do
    list
    |> Enum.reduce_while(%MapSet{}, fn x, acc ->
      if MapSet.member?(acc, x), do: {:halt, false}, else: {:cont, MapSet.put(acc, x)}
    end)
    |> is_boolean()
  end

  def find_marker(string, distinct) do
    string
    |> String.graphemes()
    |> Enum.with_index(0)
    |> Enum.reduce_while([], fn {char, index}, acc ->
      cond do
        length(acc) < distinct -> {:cont, [char | acc]}
        has_duplicates?(acc) -> {:cont, update_recent_chars(acc, char)}
        true -> {:halt, index}
      end
    end)
  end

  def part1(), do: part1(@input)

  def part1(stream) do
    stream
    |> Enum.map(&String.trim/1)
    |> hd()
    |> find_marker(4)
  end

  def part2(), do: part2(@input)

  def part2(stream) do
    stream
    |> Enum.map(&String.trim/1)
    |> hd()
    |> find_marker(14)
  end
end
