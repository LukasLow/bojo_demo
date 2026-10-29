//! A tiny Rust library, used from Mojo through the C ABI.
//!
//! Nothing here is Mojo-specific: `extern "C"` plus `#[no_mangle]` is the whole
//! contract. The consumer compiles it (a `pre-build` hook runs `cargo build`),
//! exactly like the C package.

#[no_mangle]
pub extern "C" fn rssum_add(a: i64, b: i64) -> i64 {
    a.wrapping_add(b)
}

#[no_mangle]
pub extern "C" fn rssum_sum_of_squares(n: i64) -> i64 {
    (1..=n).map(|i| i * i).sum()
}

#[no_mangle]
pub extern "C" fn rssum_collatz_steps(start: i64) -> i64 {
    let mut n = start;
    let mut steps = 0;
    while n > 1 && steps < 10_000 {
        n = if n % 2 == 0 { n / 2 } else { 3 * n + 1 };
        steps += 1;
    }
    steps
}
