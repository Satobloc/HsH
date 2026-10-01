"""PLAYGROUND / SANDBOX probe for stacked holonomy composition.

This script checks one standard Lie-algebra fact used in
PLAYGROUND_001_STACKED_HOLONOMY_REPAIR.md:

    exp(alpha J12) exp(beta J23)

contains a leading BCH commutator term in the J13 plane.

It does not implement H(s)H physics and must not be treated as a theory solver.
"""

import numpy as np
from scipy.linalg import expm, logm


def J(i: int, j: int, n: int = 4) -> np.ndarray:
    """Antisymmetric plane-rotation generator in R^n."""
    M = np.zeros((n, n), dtype=float)
    M[i, j] = -1.0
    M[j, i] = +1.0
    return M


def frobenius_coeff(A: np.ndarray, G: np.ndarray) -> float:
    """Coefficient of A along generator G under Frobenius inner product."""
    return float(np.sum(A * G) / np.sum(G * G))


def run_case(alpha: float, beta: float) -> dict:
    J12 = J(0, 1)
    J23 = J(1, 2)
    J13 = J(0, 2)

    comm = J12 @ J23 - J23 @ J12

    H = expm(alpha * J12) @ expm(beta * J23)
    L = np.real_if_close(logm(H)).astype(float)

    measured_j13 = frobenius_coeff(L, J13)
    leading_bch_j13 = -0.5 * alpha * beta

    bch2 = alpha * J12 + beta * J23 + leading_bch_j13 * J13
    residual = float(np.linalg.norm(L - bch2, ord="fro"))

    return {
        "alpha": alpha,
        "beta": beta,
        "commutator_equals_minus_J13_error": float(
            np.linalg.norm(comm + J13, ord="fro")
        ),
        "measured_J13_coefficient": measured_j13,
        "leading_BCH_prediction": leading_bch_j13,
        "coefficient_error": measured_j13 - leading_bch_j13,
        "higher_order_frobenius_residual": residual,
    }


def main() -> None:
    cases = [(0.10, 0.20), (0.20, 0.20), (0.05, 0.05)]
    print("Stacked-holonomy commutator probe")
    print("Convention: [J12, J23] = -J13")
    print()

    for a, b in cases:
        result = run_case(a, b)
        print(result)


if __name__ == "__main__":
    main()
