#!/usr/bin/env python3
"""MK143: exact global-reach gate for MK141/142's explicit escape ansatz.

Status: GEN/DERIVED sandbox geometry.  This proves a statement about the
declared Euclidean centerline family; it is not a global minimax result, a
constitutive law, or an SAT/H(s)H physics claim.

For the moving centerline

  c(s)=(0,H cos(theta(s)),H sin(theta(s)),s), 0<=s<=T,

with theta(s)=pi*(3u^2-2u^3), u=s/T, theta is monotone from 0 to pi.
For a<b,

  [c(b)-c(a)] dot c'(a)
    = (b-a)+H^2 theta'(a) sin(theta(b)-theta(a)) > 0.

Hence no distinct pair is doubly normal.  Endpoint-interior squared distance
also has strictly positive derivative.  The two fixed companion centerlines
remain exactly ell apart globally because their cross-distance squared is
ell^2+(a-b)^2.  Therefore, for capped tubes around this explicit three-line
union, there is no hidden global self-distance obstruction and

  reach = min(ell/2, 1/kappa_max).

This upgrades MK142's local focal-radius test to an exact reach test for this
ansatz.  Polynomial stationary-point enumeration finds kappa_max without a
sample-grid assumption.  A full-turn helix is included as a negative control:
it has a genuine doubly-normal pair and a smaller global reach.
"""

from __future__ import annotations

import json
import math

import numpy as np
from numpy.polynomial import Polynomial as P


ELL = 1.0
H = math.sqrt(3.0) * ELL / 2.0
A = 1.0
J = 0.36073338434168634
ALPHA = 3.0 * A * H**2 * math.pi**2 / 5.0
GAMMA = H**2 * J / 2.0
DELTA = H**2 * (12.0*math.pi**2 + 72.0*math.pi**4/35.0) / 2.0


def optimum_T(K: float, bending: float) -> float:
    """Minimize alpha/T+gamma*K*T+delta*bending/T^3 for K>0."""
    if K <= 0:
        return math.inf
    y = (ALPHA + math.sqrt(ALPHA**2 + 12*GAMMA*K*DELTA*bending))/(2*GAMMA*K)
    return math.sqrt(y)


def curvature_squared_polynomial(T: float):
    """Return numerator N and denominator D for curvature^2=N/D."""
    u = P([0.0, 1.0])
    p = (6.0*math.pi/T)*(u-u*u)
    q = (6.0*math.pi/T**2)*(P([1.0])-2.0*u)
    z = P([1.0]) + H**2*p*p
    numerator = H**2*(q*q + p**4*z)
    denominator = z**3
    return numerator, denominator


def curvature(T: float, u: float) -> float:
    n, d = curvature_squared_polynomial(T)
    return math.sqrt(max(0.0, n(u)/d(u)))


def certified_stationary_curvatures(T: float):
    """Enumerate every real stationary point via the derivative numerator."""
    n, d = curvature_squared_polynomial(T)
    critical_poly = n.deriv()*d - n*d.deriv()
    roots = critical_poly.roots()
    us = [0.0, 1.0]
    us.extend(float(z.real) for z in roots if abs(z.imag) < 1e-8 and 0.0 < z.real < 1.0)
    # Collapse numerical repeats from polynomial root finding.
    us = sorted({round(x, 13) for x in us})
    vals = [(u, curvature(T, u)) for u in us]
    return vals


def exact_ansatz_reach(T: float):
    candidates = certified_stationary_curvatures(T)
    ustar, kmax = max(candidates, key=lambda z: z[1])
    return min(ELL/2.0, 1.0/kmax), ustar, kmax, candidates


def max_spatial_slope(T: float) -> float:
    return 1.5*math.pi*H/T


def bending_for_target_T(K: float, target_T: float) -> float:
    """Invert the exact stationarity condition; clamp inactive threshold to 0."""
    value = (GAMMA*K*target_T**4 - ALPHA*target_T**2)/(3.0*DELTA)
    return max(0.0, value)


def bisection(f, lo: float, hi: float, iterations=100) -> float:
    flo = f(lo)
    for _ in range(iterations):
        mid = 0.5*(lo+hi)
        fm = f(mid)
        if flo*fm <= 0:
            hi = mid
        else:
            lo, flo = mid, fm
    return 0.5*(lo+hi)


def full_turn_negative_control(T=1.0):
    """Find doubly-normal pairs for theta=2*pi*s/T, demonstrating sensitivity."""
    omega = 2.0*math.pi/T
    beta = H**2*omega**2
    f = lambda x: x + beta*math.sin(x)
    grid = np.linspace(1.0e-10, 2.0*math.pi-1.0e-10, 20001)
    roots = []
    for a, b in zip(grid[:-1], grid[1:]):
        if f(a)*f(b) < 0:
            roots.append(bisection(f, float(a), float(b)))
    records = []
    for x in roots:
        ds = x/omega
        chord = math.sqrt(ds*ds + 4.0*H**2*math.sin(x/2.0)**2)
        records.append({"phase_separation": x, "s_separation": ds,
                        "half_chord": chord/2.0, "orthogonality_residual": f(x)})
    focal_radius = (1.0+H**2*omega**2)/(H*omega**2)
    return {"records": records, "focal_radius": focal_radius,
            "self_reach": min([focal_radius]+[x["half_chord"] for x in records])}


def main() -> None:
    # Reach cap is attained once endpoint curvature 6*pi*H/T^2 <= 2/ell.
    T_reach = math.sqrt(3.0*math.pi*H*ELL)
    # MK142's separate causal-slope gate is stronger in this fixture.
    T_slope = 1.5*math.pi*H

    rows = []
    for K in (0.4, 1.0, 2.0, 10.0, 100.0):
        bending_reach = bending_for_target_T(K, T_reach)
        bending_slope = bending_for_target_T(K, T_slope)
        bending_both = max(bending_reach, bending_slope)
        T = optimum_T(K, bending_both)
        reach, ustar, kmax, stationary = exact_ansatz_reach(T)
        rows.append({
            "K": K,
            "minimum_bending_for_exact_reach": bending_reach,
            "minimum_bending_for_slope": bending_slope,
            "minimum_bending_for_both": bending_both,
            "T": T,
            "max_spatial_slope": max_spatial_slope(T),
            "kappa_max": kmax,
            "u_at_kappa_max": ustar,
            "exact_union_reach": reach,
            "stationary_candidate_count": len(stationary),
        })

    negative = full_turn_negative_control()
    out = {
        "theorem": "monotone half-turn ansatz has no distinct doubly-normal pair",
        "exact_reach": "min(ell/2,1/kappa_max)",
        "T_reach": T_reach,
        "T_slope": T_slope,
        "thresholds": rows,
        "full_turn_negative_control": negative,
        "status": "GEN/DERIVED sandbox geometry; no global minimax or physics claim",
    }

    # Exact-structure and negative-control checks.
    assert all(abs(row["exact_union_reach"]-0.5) < 2e-12 for row in rows)
    assert all(row["max_spatial_slope"] <= 1.0+2e-13 for row in rows)
    assert abs(rows[3]["minimum_bending_for_both"]-0.8399484846974259) < 2e-12
    assert len(negative["records"]) == 2
    assert negative["self_reach"] < ELL/2.0
    assert max(abs(x["orthogonality_residual"]) for x in negative["records"]) < 2e-13
    print(json.dumps(out, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
