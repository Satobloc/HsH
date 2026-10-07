#!/usr/bin/env python3
"""Blind discriminator for a nested finite-core twist profile.

GEN/CANDIDATE sandbox calculation.  Numerical values are independently
declared synthetic controls; no historical constant or particle label is a
fit target.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import least_squares
from scipy.special import jv


ROOT = Path(__file__).resolve().parent
DATA = ROOT / "nested_twist_sideband.json"
FIGURE = ROOT / "nested_twist_sideband.svg"
FIGURE_PNG = ROOT / "nested_twist_sideband.png"
U = np.linspace(0.0, 1.0, 8001)
DU = 1.0 / (len(U) - 1)
TRAP = np.ones_like(U)
TRAP[[0, -1]] = 0.5
W = np.sin(np.pi * U) ** 2


def phase_profile(p: np.ndarray, carrier: int, nested: bool) -> np.ndarray:
    if nested:
        a_out, b_in, mu_nest, psi = p
    else:
        a_out, b_in, psi = p
        mu_nest = 0.0
    return (
        a_out * np.sin(np.pi * U)
        + b_in * np.sin(
            carrier * np.pi * U + mu_nest * np.sin(np.pi * U) + psi
        )
    )


def readout(xs: np.ndarray, p: np.ndarray, carrier: int, nested: bool) -> np.ndarray:
    phase = phase_profile(p, carrier, nested)
    return np.asarray([
        2.0 * DU * np.sum(W * np.exp(2j * (x * U + phase)) * TRAP)
        for x in xs
    ])


def fit_candidate(
    xs: np.ndarray,
    observed: np.ndarray,
    train: np.ndarray,
    sigma: float,
    carrier: int,
    nested: bool,
) -> dict:
    def residual(p: np.ndarray) -> np.ndarray:
        d = readout(xs[train], p, carrier, nested) - observed[train]
        return np.r_[d.real, d.imag] / sigma

    if nested:
        p0 = np.array([0.05, 0.05, 0.5, 0.0])
        bounds = ([-0.3, 0.0, -2.0, -np.pi], [0.3, 0.2, 2.0, np.pi])
    else:
        p0 = np.array([0.05, 0.05, 0.0])
        bounds = ([-0.3, 0.0, -np.pi], [0.3, 0.2, np.pi])
    fit = least_squares(
        residual, p0, bounds=bounds, max_nfev=1800,
        xtol=1e-12, ftol=1e-12, gtol=1e-12,
    )
    rss = float(np.sum(residual(fit.x) ** 2))
    n_obs = int(2 * np.sum(train))
    n_par = len(fit.x)
    aic = float(n_obs * np.log(rss / n_obs) + 2 * n_par)
    return {
        "carrier": carrier,
        "parameters": fit.x,
        "rss_sigma2": rss,
        "aic": aic,
        "success": bool(fit.success),
    }


def main() -> None:
    # Blind synthetic declaration, independent of source constants/labels.
    carrier_true = 14
    truth = np.array([0.085, 0.068, 0.92, 0.31])
    sigma = 2.0e-5
    xs = np.r_[np.linspace(0.4, 9.0, 9), np.linspace(12.0, 32.0, 25)]
    train = np.arange(len(xs)) % 3 != 1
    withheld = ~train
    clean = readout(xs, truth, carrier_true, True)
    rng = np.random.default_rng(20261007)
    observed = clean + sigma * (
        rng.normal(size=len(xs)) + 1j * rng.normal(size=len(xs))
    )

    carriers = range(8, 20)
    nested_scan = [fit_candidate(xs, observed, train, sigma, k, True) for k in carriers]
    carrier_scan = [fit_candidate(xs, observed, train, sigma, k, False) for k in carriers]
    best_nested = min(nested_scan, key=lambda z: z["aic"])
    best_carrier = min(carrier_scan, key=lambda z: z["aic"])

    pred_nested = readout(
        xs, best_nested["parameters"], best_nested["carrier"], True
    )
    pred_carrier = readout(
        xs, best_carrier["parameters"], best_carrier["carrier"], False
    )
    withheld_nested = float(np.sqrt(np.mean(np.abs(pred_nested[withheld] - clean[withheld]) ** 2)))
    withheld_carrier = float(np.sqrt(np.mean(np.abs(pred_carrier[withheld] - clean[withheld]) ** 2)))

    mu_fit = float(best_nested["parameters"][2])
    orders = np.arange(-4, 5)
    bessel_truth = jv(orders, truth[2])
    bessel_fit = jv(orders, mu_fit)

    # Linearized nested inner phase: sum_r J_r(mu) sin((k_c+r)pi u+psi).
    out = {
        "status": "GEN/CANDIDATE sandbox calculation",
        "model": "theta(u)=a_out sin(pi u)+b_in sin(k_c pi u+mu_N sin(pi u)+psi)",
        "readout": "G(x)=2 integral sin^2(pi u) exp(2i[xu+theta(u)]) du",
        "truth": {
            "carrier": carrier_true,
            "a_out": float(truth[0]),
            "b_in": float(truth[1]),
            "mu_N": float(truth[2]),
            "psi": float(truth[3]),
        },
        "training_biases": xs[train].tolist(),
        "withheld_biases": xs[withheld].tolist(),
        "noise_sigma_per_quadrature": sigma,
        "best_nested": {
            "carrier": best_nested["carrier"],
            "parameters": best_nested["parameters"].tolist(),
            "rss_sigma2": best_nested["rss_sigma2"],
            "aic": best_nested["aic"],
            "withheld_complex_rms": withheld_nested,
        },
        "best_single_carrier": {
            "carrier": best_carrier["carrier"],
            "parameters": best_carrier["parameters"].tolist(),
            "rss_sigma2": best_carrier["rss_sigma2"],
            "aic": best_carrier["aic"],
            "withheld_complex_rms": withheld_carrier,
        },
        "delta_aic_single_minus_nested": float(best_carrier["aic"] - best_nested["aic"]),
        "withheld_error_ratio_single_over_nested": float(withheld_carrier / withheld_nested),
        "bessel_sidebands": {
            "orders_r": orders.tolist(),
            "truth_Jr": bessel_truth.tolist(),
            "fit_Jr": bessel_fit.tolist(),
            "linearized_frequencies": (carrier_true + orders).tolist(),
            "weight_generated_triplet_rule": "each carrier-sideband k_c+r couples at k_c+r and k_c+r+/-2",
        },
        "nested_scan": [{
            "carrier": z["carrier"], "aic": z["aic"], "rss_sigma2": z["rss_sigma2"]
        } for z in nested_scan],
        "single_carrier_scan": [{
            "carrier": z["carrier"], "aic": z["aic"], "rss_sigma2": z["rss_sigma2"]
        } for z in carrier_scan],
    }
    DATA.write_text(json.dumps(out, indent=2) + "\n")

    fig, axes = plt.subplots(1, 3, figsize=(13.0, 4.1))
    outer = truth[0] * np.sin(np.pi * U)
    nested_profile = phase_profile(truth, carrier_true, True)
    axes[0].plot(U, outer, label="outer profile")
    axes[0].plot(U, nested_profile, label="nested profile", linewidth=1.1)
    axes[0].set(xlabel="material coordinate u", ylabel="transport phase",
                title="Finite-core nested morphology")
    axes[0].grid(alpha=.25)
    axes[0].legend(fontsize=8)

    nested_residual = np.abs(observed - pred_nested) / sigma
    carrier_residual = np.abs(observed - pred_carrier) / sigma
    axes[1].semilogy(xs, nested_residual, "o-", label="nested model")
    axes[1].semilogy(xs, carrier_residual, "o--", label="single-carrier null")
    axes[1].scatter(xs[withheld], carrier_residual[withheld], s=35, marker="x",
                    color="black", label="withheld biases", zorder=4)
    axes[1].set(xlabel="calibrated twist bias x", ylabel="complex residual / sigma",
                title="Bias-resolved sideband discriminator")
    axes[1].grid(alpha=.25, which="both")
    axes[1].legend(fontsize=8)

    kvals = np.array(list(carriers))
    naic = np.array([z["aic"] for z in nested_scan])
    caic = np.array([z["aic"] for z in carrier_scan])
    axes[2].plot(kvals, naic - naic.min(), "o-", label="nested model")
    axes[2].plot(kvals, caic - naic.min(), "o--", label="single carrier")
    axes[2].axvline(carrier_true, color="black", alpha=.35)
    axes[2].set(xlabel="integer carrier k_c", ylabel="AIC relative to best nested",
                title="Blind carrier scan")
    axes[2].grid(alpha=.25)
    axes[2].legend(fontsize=8)
    fig.tight_layout()
    fig.savefig(FIGURE)
    fig.savefig(FIGURE_PNG, dpi=180)
    print(json.dumps(out, indent=2))


if __name__ == "__main__":
    main()
