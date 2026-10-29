"""A package whose data travels with the binary.

`names.txt` is not Mojo code and cannot live in a precompiled module. It is
declared under `runtime`, copied into `.out/data/randomname/`, and found at run
time through `BOJO_DATA` (D60).
"""

from std.python import Python


def name(seed: Int) raises -> String:
    """Return a deterministic name for `seed`.

    The list is read from the bundle at run time, not embedded in the binary:
    a package can ship data without turning it into source.
    """
    var choose = Python.evaluate(
        "lambda s, base: __import__('random').Random(s).choice("
        "[n for n in open(__import__('os').path.join(base, 'randomname', 'names.txt'))"
        ".read().splitlines() if n.strip()])"
    )
    var base = Python.import_module("os").environ["BOJO_DATA"]
    return String(choose(seed, base))
