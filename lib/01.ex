defmodule AOC.One do
  @input File.stream!("input/01.txt")

  def stream_to_calorie_list(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.chunk_while(
      0,
      fn
        "", acc ->
          {:cont, acc, 0}

        value, acc ->
          {:cont, String.to_integer(value) + acc}
      end,
      fn acc -> {:cont, acc, 0} end
    )
  end

  def part1, do: part1(@input)
  def part1(stream), do: stream |> stream_to_calorie_list() |> Enum.max()

  def part2, do: part2(@input)

  def part2(stream),
    do: stream |> stream_to_calorie_list() |> Enum.sort(:desc) |> Enum.take(3) |> Enum.sum()
end
