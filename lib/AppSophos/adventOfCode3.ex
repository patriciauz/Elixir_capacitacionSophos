defmodule SophosApp.AdventOfCodeDay3 do
  def execPart1(route) do
    String.split(route,"")
    |>rule()
    |>move()
    |>Enum.uniq()
    |>Enum.count()
  end

  defp move(route) do
    Enum.scan(route, fn
      ([i,j],[ip,jp]) -> [i+ip,j+jp]
    end)
  end

  def execPart2(route) do
    String.split(route,"")
    |>rule()
    |>moveTwoSantas()
  end

  defp rule(route) do
    Enum.map(route, fn
      ""  -> [0,0]
      ">" -> [0,1]
      "<" -> [0,-1]
      "^" -> [1,0]
      "v" -> [-1,0]
      end)
  end

  defp moveTwoSantas(route) do
    santaRoute = (
      route
      |> Enum.with_index()
      |> Enum.map(fn {num,index} ->
        cond do
          rem(index, 2) == 1 -> num
          :true -> ""
        end
      end)
      |> Enum.filter(fn x -> x != "" end)
    )

    roboSantaRoute = (
      route
      |> Enum.with_index()
      |> Enum.map(fn {num,index} ->
        cond do
          rem(index, 2) == 0 -> num
          :true -> ""
        end
      end)
      |> Enum.filter(fn x -> x != "" end)
    )

    santaMove = move(santaRoute)
    roboSantaMove = move(roboSantaRoute)

    Enum.concat(santaMove,roboSantaMove)
    |>Enum.uniq()
    |>Enum.count()

  end

end
