"""Bindings for the Rust library in this package.

The library is built by the consumer with `cargo build --release`; a panic must
never cross the FFI boundary, so every function here is total.
"""

from std.ffi import external_call


def add(a: Int, b: Int) -> Int:
    """Return a + b, computed in Rust."""
    return Int(external_call["rssum_add", Int64](a, b))


def sum_of_squares(n: Int) -> Int:
    """Return 1² + 2² + … + n², computed in Rust."""
    return Int(external_call["rssum_sum_of_squares", Int64](n))


def collatz_steps(start: Int) -> Int:
    """Return the number of Collatz steps to reach 1, computed in Rust."""
    return Int(external_call["rssum_collatz_steps", Int64](start))
