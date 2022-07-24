defmodule AppSophosTest do
  use ExUnit.Case
  doctest AppSophos

  test "greets the world" do
    assert AppSophos.hello() == :world
  end
end
