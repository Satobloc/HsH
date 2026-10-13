#!/usr/bin/env python3
"""MK142: curvature-regularized three-center normal-escape gate.

Continues MK141's explicit smoothstep ansatz.  This is a sandboxed
constitutive calculation, not a global minimax result or physical claim.
"""

from __future__ import annotations

import math


ELL = 1.0
A = 1.0
H = math.sqrt(3.0) * ELL / 2.0
J = 0.36073338434168634
ALPHA = 3.0 * A * H**2 * math.pi**2 / 5.0
GAMMA = H**2 * J / 2.0
DELTA = H**2 * (12.0 * math.pi**2 + 72.0 * math.pi**4 / 35.0) / 2.0


def optimum_T(K: float, kappa: float) -> float:
    """Exact minimizer of alpha/T + gamma*K*T + delta*kappa/T^3."""
    if K <= 0.0:
        return math.inf
    y = (ALPHA + math.sqrt(ALPHA**2 + 12.0 * GAMMA * K * DELTA * kappa)) / (
        2.0 * GAMMA * K
    )
    return math.sqrt(y)


def energy(T: float, K: float, kappa: float) -> float:
    if math.isinf(T):
        return 0.0
    return ALPHA / T + GAMMA * K * T + DELTA * kappa / T**3


def theta_derivatives(u: float, T: float) -> tuple[float, float]:
    p = 6.0 * math.pi * u * (1.0 - u) / T
    q = 6.0 * math.pi * (1.0 - 2.0 * u) / T**2
    return p, q


def curve_curvature(u: float, T: float) -> float:
    """Euclidean curvature of X(s)=(0,H cos(theta),H sin(theta),s)."""
    p, q = theta_derivatives(u, T)
    z = 1.0 + H * H * p * p
    return H * math.sqrt(q * q + p**4 * z) / z**1.5


def golden_max(f, lo: float, hi: float, iterations: int = 90) -> tuple[float, float]:
    g = (math.sqrt(5.0) - 1.0) / 2.0
    x1, x2 = hi - g * (hi - lo), lo + g * (hi - lo)
    f1, f2 = f(x1), f(x2)
    for _ in range(iterations):
        if f1 < f2:
            lo, x1, f1 = x1, x2, f2
            x2 = lo + g * (hi - lo)
            f2 = f(x2)
        else:
            hi, x2, f2 = x2, x1, f1
            x1 = hi - g * (hi - lo)
            f1 = f(x1)
    x = 0.5 * (lo + hi)
    return x, f(x)


def max_curvature(T: float) -> tuple[float, float]:
    # Symmetry reduces to u in [0,1/2]. Search all sampled local brackets.
    n = 4000
    us = [0.5 * i / n for i in range(n + 1)]
    vals = [curve_curvature(u, T) for u in us]
    candidates = [(us[0], vals[0]), (us[-1], vals[-1])]
    for i in range(1, n):
        if vals[i] >= vals[i - 1] and vals[i] >= vals[i + 1]:
            candidates.append(golden_max(lambda x: curve_curvature(x, T), us[i - 1], us[i + 1]))
    return max(candidates, key=lambda item: item[1])


def max_spatial_slope(T: float) -> float:
    return 1.5 * math.pi * H / T


def minimum_kappa_for_local_gates(K: float) -> float:
    """Solve slope<=1 and local focal radius>=ell/2 (necessary gates only)."""
    def passes(kappa: float) -> bool:
        T = optimum_T(K, kappa)
        _, kmax = max_curvature(T)
        return max_spatial_slope(T) <= 1.0 and 1.0 / kmax >= ELL / 2.0

    if passes(0.0):
        return 0.0
    lo, hi = 0.0, 1.0
    while not passes(hi):
        hi *= 2.0
    for _ in range(60):
        mid = 0.5 * (lo + hi)
        if passes(mid):
            hi = mid
        else:
            lo = mid
    return hi


def main() -> None:
    print(f"alpha={ALPHA:.12f},gamma={GAMMA:.12f},delta={DELTA:.12f}")
    print("K,kappa,Tstar,Emin,max_slope,u_at_kmax,kmax,local_focal_radius,cross_core_limit")
    for K in (0.1, 0.4, 1.0, 2.0, 10.0):
        for kappa in (0.0, 0.01, 0.1, 1.0):
            T = optimum_T(K, kappa)
            ustar, kmax = max_curvature(T)
            print(
                f"{K:.6g},{kappa:.6g},{T:.9f},{energy(T,K,kappa):.9f},"
                f"{max_spatial_slope(T):.9f},{ustar:.9f},{kmax:.9f},"
                f"{1.0/kmax:.9f},{ELL/2.0:.9f}"
            )

    # Exact stationarity and limiting controls.
    K, kappa = 0.4, 0.1
    T = optimum_T(K, kappa)
    residual = GAMMA * K - ALPHA / T**2 - 3.0 * DELTA * kappa / T**4
    assert abs(residual) < 1.0e-13
    assert abs(optimum_T(K, 0.0) - math.sqrt(ALPHA / (GAMMA * K))) < 1.0e-14
    assert optimum_T(0.0, 1.0) == math.inf and energy(math.inf, 0.0, 1.0) == 0.0

    # Negative control: deleting both K and kappa recovers alpha/T -> 0.
    assert energy(1.0e9, 0.0, 0.0) < 1.0e-8
    print("negative_control_K0_kappa0_infimum=0")
    for K in (2.0, 10.0, 100.0):
        kcrit = minimum_kappa_for_local_gates(K)
        Tcrit = optimum_T(K, kcrit)
        _, ccrit = max_curvature(Tcrit)
        print(
            f"K={K:.0f},minimum_kappa_local_gates={kcrit:.9f},"
            f"T={Tcrit:.9f},slope={max_spatial_slope(Tcrit):.9f},"
            f"focal_radius={1.0/ccrit:.9f}"
        )
    print("boundary=local focal radius and inter-core separation are necessary, not sufficient, tube-reach gates")


if __name__ == "__main__":
    main()
