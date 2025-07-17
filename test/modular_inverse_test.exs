defmodule ModularInverseTest do
  use ExUnit.Case
  doctest ModularInverse

  @max 1_000_000_000

  test "randomized test" do
    1..10_000
    |> Enum.map(fn _ -> {:rand.uniform(@max), :rand.uniform(@max)} end)
    |> Enum.map(fn {a, b} ->
      try do
        {ModularInverse.of(a, b), a, b}
      rescue
        RuntimeError -> {nil, a, b}
      end
    end)
    |> Enum.reject(fn {v, _, _} -> is_nil(v) end)
    |> Enum.map(fn {actual, a, b} ->
      e = rem(a * actual, b)
      assert e == 1 || e + b == 1
    end)
  end
end
