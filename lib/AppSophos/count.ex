defmodule SophosApp.Count do


 def count(list) do
  count(list, 0)
end
defp count([], n), do: n
defp count([h | t], n), do: count(t, n + 1 )


def modifyList(list) do
  modifyList(list, [])
end
defp modifyList([], list), do: list
defp modifyList([h | t], list), do: modifyList(t, list ++ [h*2])


end
