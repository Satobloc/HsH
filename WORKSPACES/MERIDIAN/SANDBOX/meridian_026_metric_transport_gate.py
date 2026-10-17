#!/usr/bin/env python3
"""Numerical checks for Meridian 026 transported-metric symmetry gate."""

import numpy as np


def matrices(eps: float):
    B = np.zeros((4, 4))
    B[0, 2] = B[2, 0] = 1.0
    S = np.eye(4) + eps * B
    P = np.diag([1.0, 1.0, -1.0, -1.0])
    Sinv = np.linalg.inv(S)
    Pe = S @ P @ Sinv
    G = Sinv.T @ Sinv
    return S, P, Pe, G


def carrier(s: np.ndarray):
    return np.vstack((np.cos(2*s), np.sin(2*s), np.cos(3*s), np.sin(3*s))) / np.sqrt(2.0)


def rms_pointwise_commutator(eps: float, n: int = 8192):
    S, _, Pe, G = matrices(eps)
    s = np.linspace(0.0, 2*np.pi, n, endpoint=False)
    Ht = S @ carrier(s)
    defects_e = []
    defects_g = []
    for j in range(n):
        h = Ht[:, j:j+1]
        M_e = h @ h.T
        M_g = h @ (h.T @ G)
        # Equivalent to M(s) Pe - Pe M(s+pi).
        hpi = Pe @ h
        defects_e.append(np.linalg.norm(M_e @ Pe - Pe @ (hpi @ hpi.T), ord="fro")**2)
        defects_g.append(np.linalg.norm(M_g @ Pe - Pe @ (hpi @ (hpi.T @ G)), ord="fro")**2)
    return (
        np.sqrt(np.mean(defects_e)),
        np.sqrt(np.mean(defects_g)),
        np.linalg.norm(Pe.T @ G @ Pe - G, ord="fro"),
        np.linalg.norm(Pe @ Pe - np.eye(4), ord="fro"),
    )


if __name__ == "__main__":
    rows = []
    for eps in (0.0, 0.01, 0.03, 0.1, 0.2):
        rows.append((eps, *rms_pointwise_commutator(eps)))
    print("eps,rms_euclidean_defect,rms_transported_metric_defect,G_orthogonality,involution")
    for row in rows:
        print(",".join(f"{x:.16e}" for x in row))

    # The genuine Euclidean defect is first order for this fixture.
    ratios = [row[1] / row[0] for row in rows[1:]]
    assert max(ratios) / min(ratios) < 1.15
    assert max(row[2] for row in rows) < 5e-14
    assert max(row[3] for row in rows) < 5e-14
    assert max(row[4] for row in rows) < 5e-14
