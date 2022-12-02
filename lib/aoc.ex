defmodule AOC do
  defdelegate one_p1, to: AOC.One, as: :part1
  defdelegate one_p2, to: AOC.One, as: :part2
end
