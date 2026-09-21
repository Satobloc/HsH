#!/usr/bin/env python3
"""Helical ruler / toroidal winding diagnostic v0.1.

Sandbox reference implementation for RUN 093.

Separates:
  1) ordinary helix scale/pitch/closure ruler;
  2) finite stabilization estimates for nonuniform rung sequences;
  3) closed (m,n) toroidal winding topology;
  4) the induced-metric geodesic residual of a constant-slope torus winding.

This is model tooling, not a physical validation.
"""

from __future__ import annotations
from dataclasses import dataclass
import math
import numpy as np


@dataclass(frozen=True)
class HelixRuler:
    radius: float
    pitch_per_winding: float
    winding_count: int

    @property
    def axis_advance(self) -> float:
        return self.winding_count * self.pitch_per_winding

    @property
    def path_length_per_winding(self) -> float:
        return math.hypot(2.0 * math.pi * self.radius, self.pitch_per_winding)

    @property
    def path_length(self) -> float:
        return self.winding_count * self.path_length_per_winding

    @property
    def closure_density(self) -> float:
        return 1.0 / self.pitch_per_winding

    @property
    def chi(self) -> float:
        """Dimensionless pitch/circumference ratio p/(2*pi*R)."""
        return self.pitch_per_winding / (2.0 * math.pi * self.radius)

    @property
    def pitch_angle_from_axis(self) -> float:
        """Angle beta with tan(beta)=2*pi*R/p."""
        return math.atan2(2.0 * math.pi * self.radius, self.pitch_per_winding)


def cumulative_ruler(radii, pitches):
    """Return cumulative A_N/N, N/A_N and chi_N for rung sequences."""
    r = np.asarray(radii, dtype=float)
    p = np.asarray(pitches, dtype=float)
    if r.ndim != 1 or p.ndim != 1 or len(r) != len(p) or len(r) == 0:
        raise ValueError("radii and pitches must be equal nonempty 1D arrays")
    if np.any(r <= 0) or np.any(p <= 0):
        raise ValueError("radii and pitches must be positive")
    n = np.arange(1, len(p) + 1, dtype=float)
    A = np.cumsum(p)
    C = np.cumsum(2.0 * math.pi * r)
    return {
        "N": n,
        "A_N": A,
        "p_bar": A / n,
        "closure_density": n / A,
        "chi_N": A / C,
    }


def stabilization_count(values, rel_tol=1e-3, window=8):
    """First 1-based N whose next `window` values remain within rel_tol.

    This operationalizes an asymptotic ruler without requiring literal infinity.
    Returns None when the supplied sequence has not stabilized.
    """
    x = np.asarray(values, dtype=float)
    if x.ndim != 1 or len(x) < window + 1:
        return None
    for i in range(len(x) - window):
        denom = max(abs(x[i]), 1e-15)
        if np.all(np.abs(x[i + 1:i + 1 + window] - x[i]) / denom < rel_tol):
            return i + 1
    return None


def ring_torus_winding(R0, r, m, n, samples=20001):
    """Closed constant-slope (m,n) winding on an embedded ring torus.

    X(u,v)=((R0+r cos v)cos u,(R0+r cos v)sin u,r sin v),
    u=m t, v=n t, 0<=t<=2*pi.

    For coprime integers m,n this traces one closed winding class.  It is not
    assumed to be a geodesic.
    """
    if R0 <= r or r <= 0:
        raise ValueError("require ring torus R0 > r > 0")
    t = np.linspace(0.0, 2.0 * math.pi, samples)
    u = m * t
    v = n * t
    X = np.column_stack([
        (R0 + r * np.cos(v)) * np.cos(u),
        (R0 + r * np.cos(v)) * np.sin(u),
        r * np.sin(v),
    ])
    speed = np.sqrt((R0 + r * np.cos(v))**2 * m*m + r*r * n*n)
    length = float(np.trapezoid(speed, t))
    return t, X, length


def constant_slope_torus_geodesic_residual(R0, r, m, n, samples=20001):
    """Metric-norm residual of the torus geodesic equations for u=mt,v=nt.

    Ring-torus metric:
        ds^2 = (R0 + r cos v)^2 du^2 + r^2 dv^2.

    For constant u'=m, v'=n, the relevant coordinate residuals are
        Ru = -2 r sin(v)/(R0+r cos(v)) * m*n
        Rv =  (R0+r cos(v)) sin(v)/r * m^2.

    The returned norm uses the induced metric and is zero only when this
    constant-slope parametrization actually satisfies the geodesic equations.
    """
    t = np.linspace(0.0, 2.0 * math.pi, samples)
    v = n * t
    den = R0 + r * np.cos(v)
    Ru = -2.0 * r * np.sin(v) / den * m * n
    Rv = den * np.sin(v) / r * m*m
    residual_norm = np.sqrt(den*den * Ru*Ru + r*r * Rv*Rv)
    return {
        "rms": float(np.sqrt(np.mean(residual_norm**2))),
        "max": float(np.max(residual_norm)),
    }


def _self_test():
    # Exact ordinary helix identities.
    h = HelixRuler(radius=2.0, pitch_per_winding=3.0, winding_count=10)
    assert math.isclose(h.axis_advance, 30.0)
    assert math.isclose(h.chi, 3.0 / (4.0 * math.pi))
    assert math.isclose(h.path_length, 10.0 * math.hypot(4.0 * math.pi, 3.0))

    # Similarity covariance: chi fixed, ruler length scales with mu.
    mu = 1.7
    hs = HelixRuler(mu*h.radius, mu*h.pitch_per_winding, h.winding_count)
    assert math.isclose(hs.chi, h.chi, rel_tol=1e-12)
    assert math.isclose(hs.path_length_per_winding, mu*h.path_length_per_winding, rel_tol=1e-12)

    # Exact self-similar variable-rung sequence keeps cumulative chi fixed.
    radii = np.linspace(1.0, 3.0, 40)
    chi0 = 0.25
    pitches = chi0 * 2.0 * math.pi * radii
    c = cumulative_ruler(radii, pitches)
    assert np.allclose(c["chi_N"], chi0)

    # Constant-slope generic (1,1) torus winding is closed but not geodesic.
    _, _, length = ring_torus_winding(3.0, 1.0, 1, 1)
    gres = constant_slope_torus_geodesic_residual(3.0, 1.0, 1, 1)
    assert length > 0.0
    assert gres["rms"] > 0.0

    # Outer equator u=t,v=0 and meridian u=0,v=t satisfy this residual test.
    assert constant_slope_torus_geodesic_residual(3.0, 1.0, 1, 0)["max"] < 1e-12
    assert constant_slope_torus_geodesic_residual(3.0, 1.0, 0, 1)["max"] < 1e-12

    print("PASS: helical_ruler_diagnostic_v01")
    print("helix chi =", h.chi)
    print("(1,1) torus winding length =", length)
    print("(1,1) geodesic residual =", gres)


if __name__ == "__main__":
    _self_test()
