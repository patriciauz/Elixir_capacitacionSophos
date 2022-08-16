defmodule SophosApp.AdventOfCodeDay1 do
  defmodule Star1 do

    def evaluate_star_1(str) do
      fun = fn
        ")" -> -1
        "(" -> 1
      end

      str
      |> String.split("", trim: true)
      |> Enum.map(fun)
      |> Enum.sum()
    end
  end

  defmodule Star2 do

    def evaluate_star_2(str) do
      fun = fn
        ")" -> -1
        "(" -> 1
      end

      str
      |> String.split("", trim: true)
      |> Enum.map(fun)
      |> sum(0, 0)
    end

    defp sum([h | t], acc, index) when acc != -1, do: sum(t, acc + h, index + 1)
    defp sum(list, acc, index) when list == [] or acc == -1, do: index
  end
end
