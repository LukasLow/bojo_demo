"""A package with its own dependency, imported by its full module path."""

from github.com.LukasLow.bojo_demo_pkg.z import label


def chain() -> String:
    """Return 'a-><z label>'."""
    return "a->" + label()
