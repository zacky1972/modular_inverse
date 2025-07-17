# ModularInverse

A fast and efficient Elixir library for calculating modular multiplicative inverses.

The modular multiplicative inverse of an integer `a` modulo `m` is an integer `x` such that `(a * x) mod m = 1`. This library provides a robust implementation using the Extended Euclidean Algorithm.

## Installation

The package can be installed
by adding `modular_inverse` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:modular_inverse, "~> 1.0"}
  ]
end
```

## Usage

### Basic Usage

```elixir
# Calculate the modular inverse of 3 modulo 11
iex> ModularInverse.of(3, 11)
4

# Verify the result: (3 * 4) mod 11 = 12 mod 11 = 1
iex> rem(3 * 4, 11)
1

# Another example
iex> ModularInverse.of(7, 13)
2
iex> rem(7 * 2, 13)
1
```

### Error Handling

When the modular inverse does not exist (i.e., when `a` and `m` are not coprime), the function raises a `RuntimeError`:

```elixir
iex> ModularInverse.of(4, 8)
** (RuntimeError) The inverse of the given arguments does not exist, since they are not mutually prime.
```

## Mathematical Background

### What is a Modular Multiplicative Inverse?

Given integers `a` and `m`, the modular multiplicative inverse of `a` modulo `m` is an integer `x` such that:

```
(a * x) mod m = 1
```

### When Does It Exist?

The modular multiplicative inverse exists if and only if `a` and `m` are coprime (i.e., their greatest common divisor is 1).

### Examples

- For `a = 3` and `m = 11`: The inverse is `4` because `(3 * 4) mod 11 = 12 mod 11 = 1`
- For `a = 7` and `m = 13`: The inverse is `2` because `(7 * 2) mod 13 = 14 mod 13 = 1`
- For `a = 4` and `m = 8`: No inverse exists because `gcd(4, 8) = 4 ≠ 1`

## Algorithm

This library uses the Extended Euclidean Algorithm to efficiently compute modular inverses. The algorithm:

1. Computes the greatest common divisor (GCD) of `a` and `m`
2. If the GCD is 1, calculates the Bézout coefficients
3. Uses the coefficients to construct the modular inverse
4. Normalizes the result to the smallest non-negative representative

### Performance

- **Time Complexity**: O(log min(a, m))
- **Space Complexity**: O(1)

This makes it efficient even for very large numbers.

## API Reference

### `ModularInverse.of(a, m)`

Calculates the modular multiplicative inverse of `a` modulo `m`.

#### Parameters

- `a` - The integer for which to find the modular inverse
- `m` - The modulus (must be positive)

#### Returns

- `non_neg_integer()` - The modular multiplicative inverse of `a` modulo `m`

#### Raises

- `RuntimeError` - When the modular inverse does not exist (when `a` and `m` are not coprime)

#### Examples

```elixir
iex> ModularInverse.of(3, 11)
4

iex> ModularInverse.of(7, 13)
2

iex> ModularInverse.of(1, 5)
1
```

## Applications

Modular multiplicative inverses are fundamental in many areas of mathematics and computer science:

- **Cryptography**: RSA encryption, elliptic curve cryptography
- **Number Theory**: Solving linear congruences
- **Computer Science**: Hash functions, checksums
- **Algebra**: Working in finite fields

## Testing

The library includes comprehensive randomized testing to ensure correctness across a wide range of inputs. The test suite validates the mathematical property that `(a * inverse) mod m = 1` for all valid inputs.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## License

Copyright (c) 2025 University of Kitakyushu

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Documentation

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/modular_inverse>.

