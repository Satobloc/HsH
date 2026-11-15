#!/usr/bin/env python3
"""Independent SciPy reimplementation of the NIST BIPM point-mass comparator.

Primary source: S. Schlamminger et al., Metrologia 63 (2026) 025012,
DOI 10.1088/1681-7575/ae570f, final NIST PDF pub_id 961075.
Inputs: Table 2 mean copper mounting radii; Table 6 relative uncertainty
of eta. This is a model reconstruction, not a fit or measurement.
"""
from __future__ import annotations

import math
import json
import scipy
from scipy.optimize import brentq, minimize_scalar
from scipy.special import lpmv

RT_M = 120.0315e-3
RS_M = 213.9642e-3
U_ETA_REL = 2.6e-6
ETA = RT_M / RS_M


def gamma_pair(phi: float, eta: float = ETA) -> float:
    total = 0.0
    for i in range(4):
        for j in range(4):
            theta = phi + (j - i) * math.pi / 2.0
            d = 1.0 + eta * eta - 2.0 * eta * math.cos(theta)
            total += eta * math.sin(theta) / d**1.5
    return total / 8.0


def dgamma_pair(phi: float, eta: float = ETA) -> float:
    total = 0.0
    for i in range(4):
        for j in range(4):
            theta = phi + (j - i) * math.pi / 2.0
            c, s = math.cos(theta), math.sin(theta)
            d = 1.0 + eta * eta - 2.0 * eta * c
            total += c / d**1.5 - 3.0 * eta * s * s / d**2.5
    return eta * total / 8.0


def gamma_even_series(phi: float, eta: float = ETA, kmax: int = 120) -> float:
    """Derivative of every even degree 2k in Eq. (25); degree 2 is zero."""
    c, s = math.cos(phi), math.sin(phi)
    return -sum(
        eta ** (2 * k) * (lpmv(1, 2 * k, c) - lpmv(1, 2 * k, s))
        for k in range(1, kmax + 1)
    )


def gamma_printed_eq27(phi: float, eta: float = ETA, lmax: int = 60) -> float:
    """The printed Eq. (27) restriction to degrees 4l."""
    c, s = math.cos(phi), math.sin(phi)
    return -sum(
        eta ** (4 * ell) * (lpmv(1, 4 * ell, c) - lpmv(1, 4 * ell, s))
        for ell in range(1, lmax + 1)
    )


def gamma_max_at_eta(eta: float) -> tuple[float, float]:
    phi = brentq(lambda x: dgamma_pair(x, eta), 0.0, math.pi / 8.0,
                 xtol=1e-14)
    return phi, gamma_pair(phi, eta)


def main() -> None:
    phi, g_pair = gamma_max_at_eta(ETA)
    g_full = gamma_even_series(phi)
    g_eq27_at = gamma_printed_eq27(phi)
    restricted = minimize_scalar(
        lambda x: -gamma_printed_eq27(x),
        bounds=(0.0, math.pi / 8.0),
        method="bounded",
        options={"xatol": 1e-14},
    )
    phi_eq27 = float(restricted.x)
    g_eq27_max = -float(restricted.fun)
    omitted = g_pair - g_eq27_at
    degree6 = (63.0 / 32.0) * ETA**6 * math.sin(4.0 * phi)

    def max_factor(eta: float) -> float:
        return gamma_max_at_eta(eta)[1]

    step = 1e-6
    c_eta = (
        math.log(max_factor(ETA * (1.0 + step)))
        - math.log(max_factor(ETA * (1.0 - step)))
    ) / (
        math.log(ETA * (1.0 + step))
        - math.log(ETA * (1.0 - step))
    )

    series_residuals = {
        k: abs(gamma_even_series(phi, kmax=k) - g_pair)
        for k in (10, 20, 40, 80, 120)
    }

    assert abs(g_full - g_pair) < 1e-12
    assert abs(degree6) > 1e-3
    assert abs(g_eq27_at - g_pair) > 1e-2

    print(f"scipy_version={scipy.__version__}")
    print(f"Rt_m={RT_M:.10f}")
    print(f"Rs_m={RS_M:.10f}")
    print(f"eta={ETA:.15f}")
    print(f"u_eta_over_eta_ppm={U_ETA_REL * 1e6:.6f}")
    print(f"phi_max_pair_deg={math.degrees(phi):.12f}")
    print(f"gamma_pair_max={g_pair:.15f}")
    print(f"gamma_full_even_series={g_full:.15f}")
    print(f"full_series_minus_pair={g_full - g_pair:.3e}")
    print(f"phi_max_printed_eq27_deg={math.degrees(phi_eq27):.12f}")
    print(f"gamma_printed_eq27_max={g_eq27_max:.15f}")
    print(f"gamma_printed_eq27_at_pair_max={g_eq27_at:.15f}")
    print(f"omitted_4l_plus_2_terms={omitted:.15f}")
    print(f"omitted_fraction_of_full={omitted / g_pair:.9%}")
    print(f"degree6_contribution={degree6:.15f}")
    print(f"c_eta={c_eta:.12f}")
    print(f"eta_only_gamma_relative_uncertainty_ppm={c_eta * U_ETA_REL * 1e6:.6f}")
    print("series_abs_residuals=" + json.dumps(series_residuals, sort_keys=True))
    print("classification=SOURCE_BOUND_MODEL_RECONSTRUCTION_NOT_MEASUREMENT")


if __name__ == "__main__":
    main()
