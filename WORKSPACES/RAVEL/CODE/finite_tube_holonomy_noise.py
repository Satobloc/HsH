#!/usr/bin/env python3
"""Deterministic gate for holonomy noise versus local ring deformation noise."""

from __future__ import annotations

import json
import math

import numpy as np


def ou_double_integral(t: float, sigma2: float, tau_c: float) -> float:
    """Integral_0^t Integral_0^t sigma2 exp(-|u-v|/tau_c) du dv."""
    return 2.0 * sigma2 * (tau_c * t - tau_c**2 * (1.0 - math.exp(-t / tau_c)))


def main() -> None:
    q = 128
    theta = 2.0 * math.pi * np.arange(q) / q
    one = np.ones(q)
    cosine = np.cos(theta)
    sine = np.sin(theta)

    sigma0 = 0.20
    sigma1 = 0.30
    covariance = (
        sigma0**2 * np.outer(one, one)
        + sigma1**2 * np.outer(cosine, cosine)
        + sigma1**2 * np.outer(sine, sine)
    )
    eig = np.linalg.eigvalsh(covariance)
    weight = one / q
    k_phi = float(weight @ covariance @ weight)

    e0_over_hbar = 1.0
    d_hol = 4.0 * e0_over_hbar**2 * k_phi
    d_local = 0.04
    leakage_ratio = d_local / d_hol

    tau_c = 0.5
    times = [0.05, 0.5, 5.0]
    coherence_01 = []
    for t in times:
        j = ou_double_integral(t, sigma0**2, tau_c)
        exponent = -2.0 * e0_over_hbar**2 * j
        coherence_01.append(math.exp(exponent))

    result = {
        "grid_points": q,
        "covariance_min_eigenvalue": float(eig.min()),
        "covariance_rank_at_1e-10": int(np.sum(eig > 1e-10)),
        "holonomy_variance_K_phi": k_phi,
        "D_hol_in_E0_over_hbar_units": d_hol,
        "local_channel_D": d_local,
        "initial_population_rates_local_cos_theta": {
            "dP_0_dt": -d_local,
            "dP_plus1_dt": d_local / 2.0,
            "dP_minus1_dt": d_local / 2.0,
        },
        "population_leakage_to_holonomy_dephasing_ratio": leakage_ratio,
        "OU_tau_c": tau_c,
        "OU_times": times,
        "OU_abs_rho01_over_initial": coherence_01,
    }

    assert eig.min() > -1e-10
    assert abs(k_phi - sigma0**2) < 1e-12
    assert abs(sum(result["initial_population_rates_local_cos_theta"].values())) < 1e-12
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
