defmodule SophosApp.AdventOfCodeDay2 do

  def exec_part_1(cadena) do
    cadena
    |> String.split("\n")
    |> Enum.map(&(String.split(&1, "x")))
    |> Enum.filter(&(&1 != [""]))
    |> Enum.map(fn x -> Enum.map(x, &String.to_integer/1) end)
    |> Enum.map(&area_superficial/1)
    |> Enum.sum()
  end


  defp area_superficial([l, w, h]) do
    areas = [l * w, w * h, l * h]
    areas
    |> Enum.sum()
    |> Kernel.*(2)
    |> Kernel.+(Enum.min(areas))
  end

  def execPart2(cadena) do
    cadena
    |> String.split("\n")
    |> Enum.map(&(String.split(&1, "x")))
    |> Enum.filter(&(&1 != [""]))
    |> Enum.map(fn x -> Enum.map(x, &String.to_integer/1) end)
    |> Enum.map(&largoListon/1)
    |> Enum.sum()
  end

  defp largoListon([_l, _w, _h] = dimensions) do
    [min, min2, tail] = dimensions |> Enum.sort()
    bow = min * min2 * tail
    length = min * 2 + min2 * 2
    bow + length
  end

end
