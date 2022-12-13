defmodule AOC.Seven do
  @input File.stream!("input/07.txt")

  def get_dir_sizes(stream) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.reject(&(&1 == "$ ls" || match?("dir " <> _, &1)))
    |> Stream.concat(Stream.repeatedly(fn -> "$ cd .." end))
    |> Stream.transform(
      [0],
      fn
        "$ cd ..", [_last] ->
          {:halt, nil}

        "$ cd ..", [leaving_size, parent_size | stack] ->
          {[leaving_size], [leaving_size + parent_size | stack]}

        "$ cd " <> _, stack ->
          {[], [0 | stack]}

        file, [size | stack] ->
          [filesize, _] = String.split(file)
          {[], [size + String.to_integer(filesize) | stack]}
      end
    )
    |> Enum.to_list()
    |> Enum.reverse()
  end

  def part1(), do: part1(@input)

  def part1(stream) do
    stream
    |> get_dir_sizes()
    |> Enum.filter(&(&1 <= 100_000))
    |> Enum.sum()
  end

  def part2(), do: part2(@input)

  def part2(stream) do
    dir_sizes = get_dir_sizes(stream)
    disk_to_free = 30_000_000 + hd(dir_sizes) - 70_000_000

    dir_sizes
    |> Enum.filter(&(&1 > disk_to_free))
    |> Enum.min()
  end
end
