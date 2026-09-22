"""Typed equal-radius three-sphere carrier reconstruction for LAB-SBS-001.

Non-quarantined control implementation of RUN_085. Geometry and numerical
certification are deliberately separate outputs. No SAT/H(s)H physical claim is
encoded here.
"""
from __future__ import annotations

from dataclasses import dataclass
from enum import Enum
from math import isfinite, sqrt
from typing import Iterable, Optional, Sequence, Tuple

Vector = Sequence[float]


class Geometry(str, Enum):
    CARRIER_PRESENT = "CARRIER_PRESENT"
    CARRIER_COLLAPSE = "CARRIER_COLLAPSE"
    NO_REAL_CARRIER = "NO_REAL_CARRIER"
    GEOMETRIC_BOUNDARY_UNRESOLVED = "GEOMETRIC_BOUNDARY_UNRESOLVED"
    UNRESOLVED = "UNRESOLVED"


class Numerics(str, Enum):
    CERTIFIED = "CERTIFIED"
    DEGRADED = "DEGRADED"
    SINGULAR = "SINGULAR"
    FAILED = "FAILED"


@dataclass(frozen=True)
class Policy:
    tau_g: float = 1e-10
    rank_rel_tol: float = 1e-12
    residual_tol: float = 1e-12
    kappa_max: float = 500.0  # engineering guardrail, not geometry


@dataclass(frozen=True)
class CarrierResult:
    geometry: Geometry
    numerics: Numerics
    g: Optional[float]
    r_c: Optional[float]
    kappa2_k: float
    sigma_min_k: float
    relative_residual: Optional[float]
    circumcenter: Optional[Tuple[float, ...]]
    note: str = ""


def _sub(a: Vector, b: Vector) -> Tuple[float, ...]:
    if len(a) != len(b):
        raise ValueError("center dimensions differ")
    return tuple(float(x) - float(y) for x, y in zip(a, b))


def _dot(a: Vector, b: Vector) -> float:
    return sum(float(x) * float(y) for x, y in zip(a, b))


def _sym2_eigs(a: float, b: float, d: float) -> Tuple[float, float]:
    disc = sqrt(max(0.0, (a - d) ** 2 + 4.0 * b * b))
    hi = 0.5 * (a + d + disc)
    lo = 0.5 * (a + d - disc)
    return hi, lo


def reconstruct_carrier(c1: Vector, c2: Vector, c3: Vector, radius: float,
                        policy: Policy = Policy()) -> CarrierResult:
    """Reconstruct the common S1 carrier and return typed geometry/numerics.

    This uses the 2x2 Gram system K[alpha,beta]=0.5[|u|^2,|v|^2].
    If certification is lost, geometry is UNRESOLVED even if a raw G can be
    computed. CARRIER_COLLAPSE is intentionally *not* emitted by this point
    classifier; it requires certified event/bracket history (see classify_crossing).
    """
    if radius <= 0 or not isfinite(radius):
        raise ValueError("radius must be finite and positive")
    try:
        u, v = _sub(c2, c1), _sub(c3, c1)
        a, b, d = _dot(u, u), _dot(u, v), _dot(v, v)
        hi, lo = _sym2_eigs(a, b, d)
        if not all(isfinite(x) for x in (a, b, d, hi, lo)):
            return CarrierResult(Geometry.UNRESOLVED, Numerics.FAILED, None, None,
                                 float("inf"), 0.0, None, None, "non-finite Gram data")
        rank_floor = policy.rank_rel_tol * max(hi, 1.0)
        if lo <= rank_floor:
            return CarrierResult(Geometry.UNRESOLVED, Numerics.SINGULAR, None, None,
                                 float("inf"), max(lo, 0.0), None, None,
                                 "rank-deficient/collinear center stratum")
        kappa = hi / lo
        det = a * d - b * b
        rhs0, rhs1 = 0.5 * a, 0.5 * d
        alpha = (d * rhs0 - b * rhs1) / det
        beta = (-b * rhs0 + a * rhs1) / det
        r0 = a * alpha + b * beta - rhs0
        r1 = b * alpha + d * beta - rhs1
        rhs_norm = sqrt(rhs0 * rhs0 + rhs1 * rhs1)
        rel_resid = sqrt(r0 * r0 + r1 * r1) / max(rhs_norm, 1.0)
        center = tuple(float(x) + alpha * du + beta * dv
                       for x, du, dv in zip(c1, u, v))
        delta = _sub(center, c1)
        rc = sqrt(_dot(delta, delta))
        g = 1.0 - (rc / radius) ** 2
        if not all(isfinite(x) for x in (alpha, beta, rel_resid, rc, g)):
            return CarrierResult(Geometry.UNRESOLVED, Numerics.FAILED, None, None,
                                 kappa, lo, None, None, "non-finite solve output")
        if kappa > policy.kappa_max or rel_resid > policy.residual_tol:
            return CarrierResult(Geometry.UNRESOLVED, Numerics.DEGRADED, g, rc,
                                 kappa, lo, rel_resid, center,
                                 "engineering certification guardrail exceeded")
        if g > policy.tau_g:
            geom = Geometry.CARRIER_PRESENT
        elif g < -policy.tau_g:
            geom = Geometry.NO_REAL_CARRIER
        else:
            geom = Geometry.GEOMETRIC_BOUNDARY_UNRESOLVED
        return CarrierResult(geom, Numerics.CERTIFIED, g, rc, kappa, lo,
                             rel_resid, center)
    except (ArithmeticError, OverflowError):
        return CarrierResult(Geometry.UNRESOLVED, Numerics.FAILED, None, None,
                             float("inf"), 0.0, None, None, "solver arithmetic failure")


def classify_crossing(left: CarrierResult, right: CarrierResult,
                      refined: Optional[CarrierResult] = None) -> Geometry:
    """Certify a collapse only from a certified sign-changing bracket.

    `refined` may be a certified near-zero solve from bracket refinement. A
    point merely having |G| <= tau_g is never promoted by itself.
    """
    samples = (left, right) + ((refined,) if refined is not None else ())
    if any(s.numerics is not Numerics.CERTIFIED or s.g is None for s in samples):
        return Geometry.UNRESOLVED
    assert left.g is not None and right.g is not None
    if left.g == 0.0 or right.g == 0.0 or left.g * right.g < 0.0:
        return Geometry.CARRIER_COLLAPSE
    return Geometry.GEOMETRIC_BOUNDARY_UNRESOLVED


def _regression_checks() -> None:
    # Standard equilateral centers: rc=1/sqrt(3), carrier present for R=1.
    h_eq = sqrt(3.0) / 2.0
    eq = reconstruct_carrier((-0.5, 0.0), (0.5, 0.0), (0.0, h_eq), 1.0)
    assert eq.numerics is Numerics.CERTIFIED and eq.geometry is Geometry.CARRIER_PRESENT
    assert abs(eq.g - 2.0 / 3.0) < 1e-12

    # RUN_085 control A: collapse occurs while the solve remains regular.
    hc = 1.0 - sqrt(3.0) / 2.0
    near = reconstruct_carrier((-0.5, 0.0), (0.5, 0.0), (0.0, hc), 1.0)
    assert near.numerics is Numerics.CERTIFIED
    assert near.geometry is Geometry.GEOMETRIC_BOUNDARY_UNRESOLVED
    eps = 1e-6
    l = reconstruct_carrier((-0.5, 0.0), (0.5, 0.0), (0.0, hc - eps), 1.0)
    r = reconstruct_carrier((-0.5, 0.0), (0.5, 0.0), (0.0, hc + eps), 1.0)
    assert classify_crossing(l, r, near) is Geometry.CARRIER_COLLAPSE

    # RUN_085 control B: policy can degrade a solve while exact carrier exists.
    skinny = reconstruct_carrier((-0.0005, 0.0), (0.0005, 0.0), (0.0, 1.0), 1.0)
    assert skinny.numerics is Numerics.DEGRADED and skinny.geometry is Geometry.UNRESOLVED
    assert skinny.g is not None and skinny.g > 0.7

    # Collinear centers are numerical singularity, never geometric collapse.
    singular = reconstruct_carrier((-0.5, 0.0), (0.5, 0.0), (0.0, 0.0), 1.0)
    assert singular.numerics is Numerics.SINGULAR and singular.geometry is Geometry.UNRESOLVED


if __name__ == "__main__":
    _regression_checks()
    print("three_spheres_carrier: regression checks passed")
