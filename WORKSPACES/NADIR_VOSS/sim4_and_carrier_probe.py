"""PLAYGROUND / SANDBOX numerical checks for Nadir Voss Playground 002.

Checks:
1. Sim^+(4) homogeneous-matrix composition against the analytic group law.
2. Exact singular values of the equal-3-sphere constraint Jacobian in R^4.
3. Critical square-root scaling of sigma_min near d = sqrt(3) R.

No SAT/H(s)H physical interpretation is assumed by this script.
"""

from __future__ import annotations

import numpy as np
from numpy.linalg import svd, norm
from scipy.linalg import expm


def skew4(seed: float) -> np.ndarray:
    """Deterministic so(4) element used only to make reproducible rotations."""
    A = np.array(
        [
            [0.0, -1.0, 0.2, 0.0],
            [1.0, 0.0, -0.3, 0.1],
            [-0.2, 0.3, 0.0, -0.7],
            [0.0, -0.1, 0.7, 0.0],
        ]
    )
    return seed * A


def sim4_matrix(t: np.ndarray, Q: np.ndarray, sigma: float) -> np.ndarray:
    H = np.eye(5)
    H[:4, :4] = np.exp(sigma) * Q
    H[:4, 4] = t
    return H


def sim4_compose_analytic(
    t2: np.ndarray,
    Q2: np.ndarray,
    s2: float,
    t1: np.ndarray,
    Q1: np.ndarray,
    s1: float,
):
    t = t2 + np.exp(s2) * Q2 @ t1
    Q = Q2 @ Q1
    s = s2 + s1
    return t, Q, s


def check_sim4() -> dict:
    Q1 = expm(skew4(0.17))
    Q2 = expm(skew4(-0.11).T)  # another proper orthogonal matrix
    t1 = np.array([0.2, -0.1, 0.4, 0.05])
    t2 = np.array([-0.3, 0.7, 0.1, -0.2])
    s1, s2 = 0.08, -0.03

    H1 = sim4_matrix(t1, Q1, s1)
    H2 = sim4_matrix(t2, Q2, s2)
    direct = H2 @ H1

    t, Q, s = sim4_compose_analytic(t2, Q2, s2, t1, Q1, s1)
    analytic = sim4_matrix(t, Q, s)

    return {
        "composition_frobenius_error": float(norm(direct - analytic, ord="fro")),
        "det_Q1": float(np.linalg.det(Q1)),
        "det_Q2": float(np.linalg.det(Q2)),
    }


def equilateral_centers(d: float) -> np.ndarray:
    a = d / np.sqrt(3.0)
    return np.array(
        [
            [a, 0.0, 0.0, 0.0],
            [-a / 2.0, np.sqrt(3.0) * a / 2.0, 0.0, 0.0],
            [-a / 2.0, -np.sqrt(3.0) * a / 2.0, 0.0, 0.0],
        ]
    )


def carrier_radius(R: float, d: float) -> float:
    r2 = R * R - d * d / 3.0
    return np.sqrt(max(r2, 0.0))


def carrier_jacobian(R: float, d: float) -> np.ndarray:
    centers = equilateral_centers(d)
    r = carrier_radius(R, d)
    x = np.array([0.0, 0.0, r, 0.0])
    return 2.0 * (x[None, :] - centers)


def exact_singular_values(R: float, d: float) -> np.ndarray:
    r = carrier_radius(R, d)
    vals = np.array([np.sqrt(2.0) * d, np.sqrt(2.0) * d, 2.0 * np.sqrt(3.0) * r])
    return np.sort(vals)[::-1]


def check_carrier(R: float = 1.0) -> list[dict]:
    ratios = [1.0, np.sqrt(2.0), 1.60, 1.70, np.sqrt(3.0) * (1.0 - 1e-4)]
    rows = []
    for ratio in ratios:
        d = ratio * R
        J = carrier_jacobian(R, d)
        measured = svd(J, compute_uv=False)
        exact = exact_singular_values(R, d)
        chi = 1.0 - d * d / (3.0 * R * R)
        r = carrier_radius(R, d)
        critical_prediction = 2.0 * np.sqrt(3.0) * R * np.sqrt(max(chi, 0.0))
        rows.append(
            {
                "d_over_R": ratio,
                "carrier_radius": r,
                "chi": chi,
                "measured_singular_values": measured.tolist(),
                "exact_singular_values": exact.tolist(),
                "sv_error": float(norm(measured - exact)),
                "sigma_min": float(measured[-1]),
                "critical_branch_prediction": float(critical_prediction),
            }
        )
    return rows


def main() -> None:
    print("Sim^+(4) composition check")
    print(check_sim4())
    print()

    print("Equal-three-3-sphere carrier checks in R^4")
    for row in check_carrier():
        print(row)


if __name__ == "__main__":
    main()
