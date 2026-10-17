#!/usr/bin/env python3
"""Ariadne: SO(4) oriented-bivector chirality gate.

GEN/DERIVED geometry fixture, not a SAT/H(s)H physical claim.

For sigma in {+1,-1}, define the closed double rotation

  gamma_sigma(t) = (R cos(pt), R sin(pt), r cos(qt), sigma r sin(qt)).

The two signs have identical speed, curvature, chord-distance function and
all O(4)-scalar data.  Their oriented area bivectors

  B_ij = 1/2 integral (x_i dx_j - x_j dx_i)

have Pfaffians Pf(B)=sigma*pi^2*p*q*R^2*r^2.  Pf(QBQ^T)=Pf(B) for
Q in SO(4), whereas an orientation-reversing O(4) map flips its sign.
Thus sign Pf(B) is a one-bit sufficient discriminator for this pair when
ambient orientation is calibrated; scalar compression is exactly aliased.
"""

from __future__ import annotations

import hashlib
import math

import numpy as np


P = 2
Q = 3
R = 1.0
r = 0.4
SEED = 20261014


def curve(n: int, sigma: int) -> np.ndarray:
    t = np.arange(n, dtype=float) * (2.0 * math.pi / n)
    return np.column_stack(
        (R * np.cos(P * t), R * np.sin(P * t),
         r * np.cos(Q * t), sigma * r * np.sin(Q * t))
    )


def area_bivector(x: np.ndarray) -> np.ndarray:
    """Polygonal B for arrays shaped (..., n, 4)."""
    y = np.roll(x, -1, axis=-2)
    return 0.5 * (
        np.einsum("...ni,...nj->...ij", x, y)
        - np.einsum("...ni,...nj->...ij", y, x)
    )


def pfaffian4(B: np.ndarray) -> np.ndarray:
    return (
        B[..., 0, 1] * B[..., 2, 3]
        - B[..., 0, 2] * B[..., 1, 3]
        + B[..., 0, 3] * B[..., 1, 2]
    )


def analytic_polygon_pf(n: int, sigma: int) -> float:
    b12 = 0.5 * n * R**2 * math.sin(2.0 * math.pi * P / n)
    b34 = 0.5 * n * sigma * r**2 * math.sin(2.0 * math.pi * Q / n)
    return b12 * b34


def random_so4(rng: np.random.Generator) -> np.ndarray:
    z = rng.normal(size=(4, 4))
    qmat, _ = np.linalg.qr(z)
    if np.linalg.det(qmat) < 0:
        qmat[:, 0] *= -1.0
    return qmat


def scalar_signature(x: np.ndarray) -> np.ndarray:
    """Rotation/reflection-invariant polygon scalars used for alias check."""
    dx = np.roll(x, -1, axis=0) - x
    length = np.linalg.norm(dx, axis=1).sum()
    B = area_bivector(x)
    svals = np.linalg.svd(B, compute_uv=False)
    # Chord-distance spectrum contains all labeled pairwise distances.
    D = np.linalg.norm(x[:, None, :] - x[None, :, :], axis=-1)
    return np.concatenate(([length, np.linalg.norm(B)], svals, np.sort(D.ravel())))


def noise_trial(
    rng: np.random.Generator,
    noise: float,
    n_points: int = 128,
    reps_per_sign: int = 20_000,
    chunk: int = 500,
) -> tuple[int, int]:
    errors = 0
    total = 0
    for sigma in (+1, -1):
        base = curve(n_points, sigma)
        for start in range(0, reps_per_sign, chunk):
            m = min(chunk, reps_per_sign - start)
            noisy = base[None, :, :] + noise * rng.normal(size=(m, n_points, 4))
            pred = np.where(pfaffian4(area_bivector(noisy)) >= 0.0, 1, -1)
            errors += int(np.count_nonzero(pred != sigma))
            total += m
    return errors, total


def main() -> None:
    rng = np.random.default_rng(SEED)
    exact_pf = math.pi**2 * P * Q * R**2 * r**2
    speed = math.sqrt((P * R) ** 2 + (Q * r) ** 2)
    length = 2.0 * math.pi * speed
    curvature = math.sqrt(P**4 * R**2 + Q**4 * r**2) / speed**2
    B_exact = np.zeros((4, 4))
    B_exact[0, 1] = math.pi * P * R**2
    B_exact[1, 0] = -B_exact[0, 1]
    B_exact[2, 3] = math.pi * Q * r**2
    B_exact[3, 2] = -B_exact[2, 3]
    # chi=2 Pf/(b1^2+b2^2)=4 Pf/||B||_F^2 lies in [-1,1].
    normalized_chirality = 4.0 * exact_pf / np.linalg.norm(B_exact) ** 2

    print("ARIADNE SO(4) BIVECTOR CHIRALITY GATE")
    print(f"fixture (p,q,R,r)          = ({P},{Q},{R},{r})")
    print(f"length, curvature          = {length:.12g}, {curvature:.12g}")
    print(f"exact |Pf(B)|              = {exact_pf:.15g}")
    print(f"normalized chirality       = +/-{normalized_chirality:.12g}")

    # Exact scalar alias and single-three-coordinate-view alias.
    xp = curve(128, +1)
    xm = curve(128, -1)
    scalar_gap = float(np.max(np.abs(scalar_signature(xp) - scalar_signature(xm))))
    view_gap = float(np.max(np.abs(xp[:, :3] - xm[:, :3])))
    print(f"max scalar-signature gap   = {scalar_gap:.3e}")
    print(f"first-3-coordinate gap     = {view_gap:.3e}")

    # Polygonal convergence to the continuous line integral.
    ns = (32, 64, 128, 256, 512, 1024)
    errs = []
    print("\nN       Pf_polygon          relative error")
    for n in ns:
        direct = float(pfaffian4(area_bivector(curve(n, +1))))
        formula = analytic_polygon_pf(n, +1)
        assert abs(direct - formula) < 2e-12
        err = abs(direct / exact_pf - 1.0)
        errs.append(err)
        print(f"{n:4d}  {direct:.12g}  {err:.8e}")
    orders = [math.log(errs[i] / errs[i + 1], 2.0) for i in range(len(errs) - 1)]
    print("convergence orders          = " + ", ".join(f"{x:.6f}" for x in orders))

    # SO(4) invariance; improper reflection is the negative control.
    max_so4_error = 0.0
    for _ in range(1000):
        S = random_so4(rng)
        transformed = S @ B_exact @ S.T
        max_so4_error = max(max_so4_error, abs(float(pfaffian4(transformed)) - exact_pf))
    reflection = np.diag([-1.0, 1.0, 1.0, 1.0])
    reflected_pf = float(pfaffian4(reflection @ B_exact @ reflection.T))
    print(f"1000-SO(4) max Pf error    = {max_so4_error:.3e}")
    print(f"det=-1 reflection Pf       = {reflected_pf:.15g}")

    # Noise discrimination.  Standard error is binomial; zero-error rows use
    # the conservative 95% rule-of-three upper bound.
    print("\nnoise/R  errors/40000  error rate       uncertainty")
    noise_results = []
    for noise in (0.10, 0.20, 0.30, 0.50, 1.00):
        errors, total = noise_trial(rng, noise)
        rate = errors / total
        uncertainty = 3.0 / total if errors == 0 else math.sqrt(rate * (1.0 - rate) / total)
        label = "95% upper" if errors == 0 else "1 sigma"
        noise_results.append((noise, errors, total, rate, uncertainty))
        print(
            f"{noise:7.2f}  {errors:6d}/{total:<6d}  {rate:.8f}  "
            f"{uncertainty:.8f} ({label})"
        )

    # Degenerate winding control: q=0 makes B34 and the Pfaffian vanish.
    degenerate_pf = math.pi**2 * P * 0 * R**2 * r**2
    print(f"q=0 degeneracy Pf          = {degenerate_pf:.1f}")

    assert scalar_gap < 5e-14
    assert view_gap == 0.0
    assert min(orders[-3:]) > 1.99
    assert max_so4_error < 3e-14
    assert abs(reflected_pf + exact_pf) < 2e-14
    assert noise_results[0][1] == 0
    assert 0.02 < noise_results[2][3] < 0.03
    assert 0.24 < noise_results[3][3] < 0.27
    assert degenerate_pf == 0.0

    digest = hashlib.sha256(open(__file__, "rb").read()).hexdigest()
    print(f"artifact sha256             = {digest}")
    print(
        "STATUS: GEN/DERIVED exact SO(4) geometry. Pfaffian sign is sufficient "
        "only given calibrated ambient orientation; it is not O(4)-invariant "
        "and does not validate a physical SAT/H(s)H mechanism."
    )


if __name__ == "__main__":
    main()
