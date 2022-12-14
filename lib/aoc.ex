defmodule AOC do
  defdelegate one_p1, to: AOC.One, as: :part1
  defdelegate one_p2, to: AOC.One, as: :part2
  defdelegate two_p1, to: AOC.Two, as: :part1
  defdelegate two_p2, to: AOC.Two, as: :part2
  defdelegate three_p1, to: AOC.Three, as: :part1
  defdelegate three_p2, to: AOC.Three, as: :part2
  defdelegate four_p1, to: AOC.Four, as: :part1
  defdelegate four_p2, to: AOC.Four, as: :part2
  defdelegate five_p1, to: AOC.Five, as: :part1
  defdelegate five_p2, to: AOC.Five, as: :part2
  defdelegate six_p1, to: AOC.Six, as: :part1
  defdelegate six_p2, to: AOC.Six, as: :part2
  defdelegate seven_p1, to: AOC.Seven, as: :part1
  defdelegate seven_p2, to: AOC.Seven, as: :part2
end
