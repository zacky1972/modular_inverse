defmodule ModularInverse do
  @moduledoc """
  A library for calculating modular multiplicative inverses in Elixir.

  The modular multiplicative inverse of an integer `a` modulo `m` is an integer `x`
  such that `(a * x) mod m = 1`. This inverse exists if and only if `a` and `m`
  are coprime (i.e., their greatest common divisor is 1).

  ## Examples

      iex> ModularInverse.of(3, 11)
      4
      iex> rem(3 * 4, 11)
      1

      iex> ModularInverse.of(7, 13)
      2
      iex> rem(7 * 2, 13)
      1

  ## Error Cases

  When the modular inverse does not exist (i.e., when `a` and `m` are not coprime),
  the function raises a `RuntimeError`:

      iex> ModularInverse.of(4, 8)
      ** (RuntimeError) The inverse of the given arguments does not exist, since they are not mutually prime.

  ## Algorithm

  This implementation uses the Extended Euclidean Algorithm to find the modular inverse.
  The algorithm efficiently computes the greatest common divisor and the Bézout coefficients,
  which are used to construct the modular inverse.

  ## Performance

  The time complexity is O(log min(a, m)), making it efficient for large numbers.
  """

  @doc """
  Calculates the modular multiplicative inverse of `a` modulo `m`.

  Returns the smallest non-negative integer `x` such that `(a * x) mod m = 1`.

  ## Parameters

    - `a` - The integer for which to find the modular inverse
    - `m` - The modulus (must be positive)

  ## Returns

    - `non_neg_integer()` - The modular multiplicative inverse of `a` modulo `m`

  ## Raises

    - `RuntimeError` - When the modular inverse does not exist (when `a` and `m` are not coprime)

  ## Examples

      iex> ModularInverse.of(3, 11)
      4
      iex> ModularInverse.of(7, 13)
      2
      iex> ModularInverse.of(1, 5)
      1

  ## Mathematical Background

  The modular multiplicative inverse exists if and only if `a` and `m` are coprime.
  When it exists, it is unique modulo `m`. The function returns the smallest
  non-negative representative of this inverse.

  For example, with `a = 3` and `m = 11`:
  - The inverse is `4` because `(3 * 4) mod 11 = 12 mod 11 = 1`
  - Other valid inverses would be `4 + 11k` for any integer `k`, but `4` is the smallest non-negative one.
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
