"""A package with its own dependency: the project never sees `z` directly."""

import z_39b212b6


def chain() -> String:
    """Return 'a-><z label>', using a qualified call on purpose."""
    return "a->" + z_39b212b6.label()
