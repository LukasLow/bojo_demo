"""Demo project: a Mojo package, a bundled Python and some numpy math."""

from addition import add, multiply
from std.python import Python


def main() raises:
    print("bojo demo")
    print("2 + 40 =", add(2, 40))
    print("6 * 7  =", multiply(6, 7))
    print("----------------------------------------")

    var np = Python.import_module("numpy")
    print("numpy version:", np.__version__)

    # A symmetric positive definite 3x3 matrix.
    var a = np.array(
        Python.evaluate("[[2.0, 1.0, 0.0], [1.0, 3.0, 1.0], [0.0, 1.0, 4.0]]")
    )
    print("A =")
    print(a)
    print("det(A)   =", np.linalg.det(a))
    print("trace(A) =", np.trace(a))
    print("A^-1 =")
    print(np.linalg.inv(a))
    print("A @ A^-1 =")
    print(np.matmul(a, np.linalg.inv(a)))

    # Least squares fit y = m*x + c on slightly noisy data.
    var x = np.array(Python.evaluate("[0.0, 1.0, 2.0, 3.0, 4.0]"))
    var y = np.array(Python.evaluate("[1.0, 2.1, 2.9, 4.2, 5.05]"))
    var coeffs = np.polyfit(x, y, 1)
    print("fit: y =", coeffs[0], "* x +", coeffs[1])
    var pred = coeffs[0] * x + coeffs[1]
    print("residuals:", y - pred)
    print("rmse     =", np.sqrt(np.mean(np.square(y - pred))))

    # The matrix is SPD, so the eigenvalues must all be real and positive.
    print("eigenvalues:", np.linalg.eigvalsh(a))
