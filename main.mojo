from github.com.LukasLow.bojo_demo_pkg.addition import add, multiply
from github.com.LukasLow.bojo_demo_pkg.a import chain
from github.com.LukasLow.bojo_demo_pkg.cprint import banner, rule, show
from github.com.LukasLow.bojo_demo_pkg.randomname import name
from github.com.LukasLow.bojo_demo_pkg.rssum import add as rssum_add, sum_of_squares
from std.python import Python


def main() raises:
    banner()
    print("2 + 40 =", add(2, 40))
    print("6 * 7  =", multiply(6, 7))
    rule(38)
    show("transitive dep", chain())
    rule(38)
    show("rust 2+40", String(rssum_add(2, 40)))
    show("rust sum of squares(1..10)", String(sum_of_squares(10)))
    rule(38)
    show("name(0)", name(0))
    show("name(3)", name(3))
    show("name(7)", name(7))
    rule(38)

    var np = Python.import_module("numpy")
    print("numpy version:", np.__version__)
    var a = np.array(
        Python.evaluate("[[2.0, 1.0, 0.0], [1.0, 3.0, 1.0], [0.0, 1.0, 4.0]]")
    )
    show("det(A)", String(np.linalg.det(a)))
    show("trace(A)", String(np.trace(a)))
    rule(38)
