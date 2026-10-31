"""Tiny consumer of two published bojo libraries.

`bojo_demo_math` is aliased to `mathx` in bojo.toml; `bojo_demo_hello` is used
under its full module path, which a library must always write.

Run it with `bojo build && .out/bojo_demo`.
"""

from gh.LukasLow.bojo_demo_hello import greet
from mathx import add


def main():
    print(greet("mojo"))
    print("2 + 3 =", add(2, 3))
