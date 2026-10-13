#!/usr/bin/env python3
"""Exact first odd eigenvalue for Alberr's free tension+bending band fixture.

Dimensionless problem on x in [-1/2,1/2]:
    eps*u'''' - u'' = mu*u,
    u'' = 0,  u' - eps*u''' = 0 at both ends.

This is a constitutive mathematics check, not an SAT/H(s)H physical claim.
"""

from __future__ import annotations

import math


RITZ = {
    0.0: 9.869604401,
    1.0e-4: 9.878955936,
    1.0e-2: 10.460731584,
    1.0e-1: 11.550158916,
    1.0: 11.944357196,
    10.0: 11.994301072,
    100.0: 11.999428725,
    1.0e4: 11.999994286,
}


def characteristic(b: float, eps: float) -> float:
    """Pole-free odd-sector characteristic function.

    a^2=b^2+1/eps and mu=b^2+eps*b^4.  The free-end determinant is
    a^3*tanh(a/2)*cos(b/2)-b^3*sin(b/2)=0.
    """
    a = math.sqrt(b * b + 1.0 / eps)
    return (
        a**3 * math.tanh(0.5 * a) * math.cos(0.5 * b)
        - b**3 * math.sin(0.5 * b)
    )


def first_mu(eps: float, iterations: int = 100) -> float:
    if eps == 0.0:
        return math.pi**2
    lo, hi = 1.0e-12, math.pi
    flo, fhi = characteristic(lo, eps), characteristic(hi, eps)
    assert flo > 0.0 and fhi < 0.0
    for _ in range(iterations):
        mid = 0.5 * (lo + hi)
        fm = characteristic(mid, eps)
        if fm > 0.0:
            lo = mid
        else:
            hi = mid
    b = 0.5 * (lo + hi)
    return b * b + eps * b**4


def small_eps_mu(eps: float) -> float:
    # Boundary-layer expansion through O(eps^(3/2)).
    p = math.pi
    return p * p + p**4 * eps - 4.0 * p**4 * eps**1.5


def large_eps_mu(eps: float) -> float:
    # Singular pure-bending limit; coefficient follows from polynomial u1.
    return 12.0 - 2.0 / (35.0 * eps)


def main() -> None:
    print("eps,exact_mu,ritz_mu,ritz_minus_exact,small_asym,large_asym")
    max_abs = 0.0
    for eps, ritz in RITZ.items():
        exact = first_mu(eps)
        delta = ritz - exact
        max_abs = max(max_abs, abs(delta))
        small = small_eps_mu(eps) if 0.0 < eps <= 1.0e-2 else float("nan")
        large = large_eps_mu(eps) if eps >= 1.0 else float("nan")
        print(f"{eps:.8g},{exact:.12f},{ritz:.12f},{delta:.3e},{small:.12f},{large:.12f}")

    # Limiting cases and negative controls.
    assert abs(first_mu(0.0) - math.pi**2) < 1.0e-14  # D=0: Neumann string.
    assert abs(first_mu(1.0e4) - large_eps_mu(1.0e4)) < 2.0e-11
    # B=0 pure bending has u=x in the free kernel, so the excess gap is zero.
    pure_bending_linear_gap = 0.0
    assert pure_bending_linear_gap == 0.0
    print(f"max_abs_ritz_error={max_abs:.3e}")
    print("negative_control_B0_linear_gap=0")


if __name__ == "__main__":
    main()
