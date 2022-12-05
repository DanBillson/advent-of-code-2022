defmodule AOC.Four do
  @input File.stream!("input/04.txt")
  @doc """
  Takes the input `start-finish` e.g. `2-6` and returns the starting point and range

    ## Examples

      iex> AOC.Four.range("2-6")
      {2, 4}
  """
  def range(input) do
    [start, finish] = String.split(input, "-") |> Enum.map(&String.to_integer/1)

    {start, finish - start}
  end

  @doc """
  Compares two ranges to see if one range lies completely within another.
  We make it so that the first range is the smaller of the two and therefore we are checking
  if that lies within the second.
  """

  # Switches order for first range to be smaller
  def is_contained?({_, first_range} = first, {_, second_range} = second)
      when second_range < first_range,
      do: is_contained?(second, first)

  def is_contained?({first_start, _}, {second_start, _})
      when first_start < second_start,
      do: false

  def is_contained?({first_start, first_range}, {second_start, second_range}) do
    diff = first_start - second_start
    first_range <= second_range - diff
  end

  def part1(), do: part1(@input)

  def part1(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split(&1, ","))
    |> Enum.filter(fn [first, second] ->
      is_contained?(range(first), range(second))
    end)
    |> length()
  end

  # Do the swaperoonie here again but for the start position
  def has_overlap?({first_start, _} = first, {second_start, _} = second)
      when second_start < first_start,
      do: has_overlap?(second, first)

  def has_overlap?({first_start, first_range}, {second_start, _}) do
    first_start + first_range >= second_start
  end

  def part2(), do: part2(@input)

  def part2(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split(&1, ","))
    |> Enum.filter(fn [first, second] ->
      has_overlap?(range(first), range(second))
    end)
    |> length()
  end
end
