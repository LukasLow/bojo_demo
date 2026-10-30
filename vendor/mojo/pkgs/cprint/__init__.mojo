"""Bindings for the tiny C library that ships with this package.

The C source is part of the package on purpose: the consumer compiles it in its
own build (a `pre-build` hook) and links the result. A library never gets to run
a compiler on someone else's machine by itself (D57).
"""

from std.ffi import external_call


def banner():
    """Print a framed banner from C code."""
    external_call["cprint_banner", NoneType]()


def rule(width: Int):
    """Print a horizontal rule of `width` dashes from C code."""
    external_call["cprint_rule", NoneType](width)


def show(label: String, value: String):
    """Print `label = value` from C code."""
    external_call["cprint_text", NoneType](
        label.unsafe_ptr(), value.unsafe_ptr()
    )
