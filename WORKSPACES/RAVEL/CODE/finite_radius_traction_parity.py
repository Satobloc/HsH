#!/usr/bin/env python3
"""Finite-radius helical traction parity test.

The script compares an azimuthally complete circular contact law with a
one-sided contact law.  It does not implement an H(s)H field equation; it tests
the geometric consequence of cross-sectional parity for a declared traction
profile.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


OUT = Path("finite_radius_traction_parity.json")
FIG = Path("finite_radius_traction_parity.svg")
GAMMA = 1.3


def torque_ratio(x: float, contact: str, n: int = 1_000_000) -> float:
    """Return normalized axial torque for x=a/R and f(r)=exp[-gamma(r-R)/R]."""
    if contact == "full":
        phi = np.linspace(0.0, 2.0 * np.pi, n, endpoint=False)
    elif contact == "half":
        phi = np.linspace(-0.5 * np.pi, 0.5 * np.pi, n, endpoint=False)
    else:
        raise ValueError(contact)
    c = np.cos(phi)
    return float(np.mean((1.0 + x * c) * np.exp(-GAMMA * x * c)))


def fit_coefficients(xs: np.ndarray, ys: np.ndarray, degree: int = 4) -> list[float]:
    """Fit delta torque in ascending powers of x."""
    return np.polynomial.polynomial.polyfit(xs, ys - 1.0, degree).tolist()


def local_log_slope(xs: np.ndarray, delta: np.ndarray) -> float:
    mask = np.abs(delta) > 1e-15
    return float(np.polyfit(np.log(xs[mask]), np.log(np.abs(delta[mask])), 1)[0])


def main() -> None:
    xs = np.geomspace(1e-4, 0.25, 80)
    full = np.array([torque_ratio(x, "full") for x in xs])
    half = np.array([torque_ratio(x, "half") for x in xs])

    small = xs <= 0.03
    full_fit = fit_coefficients(xs[small], full[small])
    half_fit = fit_coefficients(xs[small], half[small])

    # Analytic coefficients for f(r)=exp[-gamma(r-R)/R].
    full_linear = 0.0
    full_quadratic = GAMMA * GAMMA / 4.0 - GAMMA / 2.0
    half_linear = (2.0 / np.pi) * (1.0 - GAMMA)

    payload = {
        "model": {
            "radius_ratio": "x=a/R",
            "traction_profile": "f(r)=exp[-gamma(r-R)/R]",
            "gamma": GAMMA,
            "full_contact_domain": "phi in [0,2pi)",
            "half_contact_domain": "phi in [-pi/2,pi/2)",
            "normalized_torque": "mean[(1+x cos(phi)) exp(-gamma x cos(phi))]",
        },
        "analytic": {
            "full_linear_coefficient": full_linear,
            "full_quadratic_coefficient": full_quadratic,
            "half_linear_coefficient": half_linear,
        },
        "numerical": {
            "full_fit_coefficients_ascending": full_fit,
            "half_fit_coefficients_ascending": half_fit,
            "full_small_x_log_slope": local_log_slope(xs[:30], full[:30] - 1.0),
            "half_small_x_log_slope": local_log_slope(xs[:30], half[:30] - 1.0),
            "max_abs_full_odd_part": float(
                max(abs(torque_ratio(x, "full") - torque_ratio(-x, "full")) for x in xs[::8])
            ),
        },
        "samples": [
            {"a_over_R": float(x), "full": float(yf), "half": float(yh)}
            for x, yf, yh in zip(xs, full, half)
        ],
    }
    OUT.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")

    fig, axes = plt.subplots(1, 2, figsize=(10.2, 4.1))
    ax = axes[0]
    ax.plot(xs, full - 1.0, lw=2.2, label="complete circumference")
    ax.plot(xs, half - 1.0, lw=2.2, label="one-sided contact")
    ax.axhline(0.0, color="0.4", lw=0.8)
    ax.set_xlabel(r"tube ratio $a/R$")
    ax.set_ylabel(r"normalized torque correction $T/T_0-1$")
    ax.legend(frameon=False)
    ax.grid(alpha=0.25)

    ax = axes[1]
    ax.loglog(xs, np.abs(full - 1.0), lw=2.2, label="complete circumference")
    ax.loglog(xs, np.abs(half - 1.0), lw=2.2, label="one-sided contact")
    ax.loglog(xs, abs(full_quadratic) * xs**2, "--", lw=1.2, label=r"$\propto(a/R)^2$")
    ax.loglog(xs, abs(half_linear) * xs, ":", lw=1.4, label=r"$\propto a/R$")
    ax.set_xlabel(r"tube ratio $a/R$")
    ax.set_ylabel("absolute correction")
    ax.legend(frameon=False, fontsize=8)
    ax.grid(alpha=0.25, which="both")
    fig.suptitle("Cross-sectional parity separates quadratic and linear finite-radius response")
    fig.tight_layout()
    fig.savefig(FIG, format="svg", bbox_inches="tight")

    print(json.dumps(payload["analytic"], indent=2))
    print(json.dumps(payload["numerical"], indent=2))


if __name__ == "__main__":
    main()
