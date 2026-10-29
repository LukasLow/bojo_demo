"""Small pure-Mojo package used by the bojo examples.

Deliberately trivial: it proves that a package can be resolved, precompiled and
imported under its own route, without the consumer touching any `-I` flag.
"""


def add(a: Int, b: Int) -> Int:
    """Return the sum of two integers.

    Args:
        a: First summand.
        b: Second summand.

    Returns:
        The sum `a + b`.
    """
    return a + b


def multiply(a: Int, b: Int) -> Int:
    """Return the product of two integers.

    Args:
        a: First factor.
        b: Second factor.

    Returns:
        The product `a * b`.
    """
    return a * b
