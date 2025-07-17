defmodule ModularInverse do
  @moduledoc """
  Documentation for `ModularInverse`.
  """

  @spec of(integer(), integer()) :: non_neg_integer()
  def of(a, m) do
    case BinaryExtendedGcd.of(a, m) do
      {1, x, _} ->
        case rem(x, m) do
          v when v < 0 -> v + m
          v -> v
        end

      _ ->
        raise RuntimeError,
              "The inverse of the given arguments does not exist, since they are not mutually prime."
    end
  end
end
