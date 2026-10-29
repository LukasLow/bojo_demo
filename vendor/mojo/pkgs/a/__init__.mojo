"""A package with its own dependency: the project never sees `z` directly."""

from z_81464ee6 import label


def chain() -> String:
    """Return 'a-><z label>'."""
    return "a->" + label()
