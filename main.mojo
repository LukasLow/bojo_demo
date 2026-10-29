"""Demo project: consumes the `addition` package from a remote repository."""

from addition import add, multiply


def main():
    print("bojo demo")
    print("2 + 40 =", add(2, 40))
    print("6 * 7  =", multiply(6, 7))
