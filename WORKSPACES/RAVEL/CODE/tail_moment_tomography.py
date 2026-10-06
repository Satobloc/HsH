#!/usr/bin/env python3
"""Numerical audit for two-orientation tail-moment tomography.

All symbols are local to the Ravel sandbox.  The script validates the
large-h expansion of the normalized quadratic-contact occupancy, recovers
the first three projected moments, and compares two morphology estimators
for the piecewise-stretched B3/S2 family.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from numpy.polynomial.legendre import leggauss


HERE = Path(__file__).resolve().parent


def reference_density(u: np.ndarray, bulk_weight: float) -> np.ndarray:
    bulk = 0.75 * (1.0 - u * u)
    boundary = 0.5 * np.ones_like(u)
    return bulk_weight * bulk + (1.0 - bulk_weight) * boundary


def stretched_z(u: np.ndarray, rho_plus: float, rho_minus: float) -> np.ndarray:
    return np.where(u < 0.0, rho_plus * u, rho_minus * u)


def occupancy(h: np.ndarray, rho_face: float, z: np.ndarray, weights: np.ndarray) -> np.ndarray:
    h = np.asarray(h, dtype=float)
    kernel = np.sqrt((1.0 - z[:, None] / h[None, :]) / (1.0 + rho_face / h[None, :]))
    return np.sum(weights[:, None] * kernel, axis=0)


def fit_coefficients(h: np.ndarray, obs: np.ndarray, order: int = 7) -> np.ndarray:
    # Scale the inverse thickness before fitting; raw powers of 1/h are badly
    # conditioned for the deliberately deep-tail samples used here.
    scale = float(np.min(h))
    inv_h_scaled = scale / h
    design = np.column_stack([inv_h_scaled ** k for k in range(1, order + 1)])
    coeff, *_ = np.linalg.lstsq(design, obs - 1.0, rcond=None)
    return np.array([coeff[k - 1] * scale**k for k in range(1, order + 1)])


def recover_moments(rho_face: float, coeff: np.ndarray) -> tuple[float, float, float]:
    c1, c2, c3 = coeff[:3]
    m1 = -2.0 * c1 - rho_face
    m2 = 3.0 * rho_face**2 + 2.0 * rho_face * m1 - 8.0 * c2
    m3 = -16.0 * c3 - 5.0 * rho_face**3 - 3.0 * rho_face**2 * m1 + rho_face * m2
    return m1, m2, m3


def exact_moments(z: np.ndarray, weights: np.ndarray) -> tuple[float, float, float]:
    return tuple(float(np.sum(weights * z**k)) for k in (1, 2, 3))


def mixture_from_first(mu: float, rho_plus: float, rho_minus: float) -> float:
    return 4.0 - 16.0 * mu / (rho_minus - rho_plus)


def mixture_from_second(m2: float, rho_plus: float, rho_minus: float) -> float:
    return 2.5 - 15.0 * m2 / (rho_plus**2 + rho_minus**2)


def main() -> None:
    nodes, quad_weights = leggauss(1200)
    h_ratios = np.geomspace(30.0, 600.0, 24)
    support_pairs = [(1.0, 1.0), (0.7, 1.3), (1.0, 1.8), (1.8, 0.6)]
    bulk_weights = [0.1, 0.5, 0.9]
    fixtures = []

    for rho_plus, rho_minus in support_pairs:
        scale = max(rho_plus, rho_minus)
        h = h_ratios * scale
        z = stretched_z(nodes, rho_plus, rho_minus)
        for bulk_weight in bulk_weights:
            p = reference_density(nodes, bulk_weight)
            weights = quad_weights * p
            weights /= np.sum(weights)
            true_m = exact_moments(z, weights)

            plus = occupancy(h, rho_plus, z, weights)
            minus = occupancy(h, rho_minus, -z, weights)
            c_plus = fit_coefficients(h, plus)
            c_minus = fit_coefficients(h, minus)
            rec_plus = recover_moments(rho_plus, c_plus)
            reverse = recover_moments(rho_minus, c_minus)
            rec_minus = (-reverse[0], reverse[1], -reverse[2])

            w_second = mixture_from_second(0.5 * (rec_plus[1] + rec_minus[1]), rho_plus, rho_minus)
            w_first = None
            if abs(rho_minus - rho_plus) > 1e-12:
                w_first = mixture_from_first(0.5 * (rec_plus[0] + rec_minus[0]), rho_plus, rho_minus)

            fixtures.append({
                "rho_plus": rho_plus,
                "rho_minus": rho_minus,
                "bulk_weight": bulk_weight,
                "true_moments": true_m,
                "recovered_plus": rec_plus,
                "recovered_minus": rec_minus,
                "bulk_from_first": w_first,
                "bulk_from_second": w_second,
                "family_closure": None if w_first is None else w_first - w_second,
            })

    # General-carrier counterexample on [-1, 1]: p_eps = (1 + eps P3)/2.
    # Orthogonality preserves m0, m1, m2; m3 changes.
    p3 = 0.5 * (5.0 * nodes**3 - 3.0 * nodes)
    counterexamples = []
    for eps in (-0.8, 0.0, 0.8):
        p = 0.5 * (1.0 + eps * p3)
        weights = quad_weights * p
        weights /= np.sum(weights)
        counterexamples.append({"epsilon": eps, "moments": exact_moments(nodes, weights)})

    max_moment_error = max(
        abs(f[f"recovered_{side}"][k] - f["true_moments"][k])
        for f in fixtures for side in ("plus", "minus") for k in range(3)
    )
    max_w2_error = max(abs(f["bulk_from_second"] - f["bulk_weight"]) for f in fixtures)
    max_closure = max(abs(f["family_closure"]) for f in fixtures if f["family_closure"] is not None)

    result = {
        "model": "quadratic-contact normalized occupancy; piecewise-stretched B3/S2 fixtures",
        "h_over_support": h_ratios.tolist(),
        "fixtures": fixtures,
        "general_carrier_counterexample": counterexamples,
        "summary": {
            "max_abs_moment_error_orders_1_to_3": max_moment_error,
            "max_abs_bulk_weight_error_second_moment": max_w2_error,
            "max_abs_first_second_family_closure": max_closure,
        },
    }
    (HERE / "tail_moment_tomography.json").write_text(json.dumps(result, indent=2) + "\n")

    fig, axes = plt.subplots(1, 3, figsize=(13.5, 4.2))
    # Panel 1: representative exact response and asymptotic fit.
    rp, rm, wb = 0.7, 1.3, 0.5
    z = stretched_z(nodes, rp, rm)
    p = reference_density(nodes, wb)
    weights = quad_weights * p
    weights /= np.sum(weights)
    h = h_ratios * max(rp, rm)
    obs = occupancy(h, rp, z, weights)
    coeff = fit_coefficients(h, obs)
    fit = 1.0 + sum(coeff[k - 1] / h**k for k in range(1, len(coeff) + 1))
    axes[0].plot(h / max(rp, rm), 1.0 - obs, "o", label="exact")
    axes[0].plot(h / max(rp, rm), 1.0 - fit, "-", label="tail fit")
    axes[0].set(xscale="log", yscale="log", xlabel=r"$h/\rho_{\max}$", ylabel=r"$1-\bar O_+$", title="Tail response")
    axes[0].legend(frameon=False)

    # Panel 2: second-moment inversion, including symmetric support.
    for rp, rm in support_pairs:
        subset = [f for f in fixtures if f["rho_plus"] == rp and f["rho_minus"] == rm]
        axes[1].plot([f["bulk_weight"] for f in subset], [f["bulk_from_second"] for f in subset], "o-", label=f"{rp:g}:{rm:g}")
    axes[1].plot([0, 1], [0, 1], "k--", lw=1)
    axes[1].set(xlabel="true bulk fraction", ylabel="second-moment recovery", title="Symmetry-safe morphology")
    axes[1].legend(title=r"$\rho_+:\rho_-$", frameon=False, fontsize=8)

    # Panel 3: same first two moments, distinct third moments.
    eps = [c["epsilon"] for c in counterexamples]
    m3 = [c["moments"][2] for c in counterexamples]
    axes[2].bar([str(x) for x in eps], m3, color=["#4C78A8", "#999999", "#E45756"])
    axes[2].axhline(0, color="black", lw=0.8)
    axes[2].set(xlabel=r"$\epsilon$ in $(1+\epsilon P_3)/2$", ylabel=r"third moment $m_3$", title="Two moments are not a density")

    fig.suptitle("Two-orientation tail-moment tomography", fontsize=14)
    fig.tight_layout()
    fig.savefig(HERE / "tail_moment_tomography.svg")
    fig.savefig(HERE / "tail_moment_tomography.png", dpi=180)
    print(json.dumps(result["summary"], indent=2))


if __name__ == "__main__":
    main()
