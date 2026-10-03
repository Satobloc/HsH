"""Precision boundary for the frozen [96,192] late-time gate.

Uses the already-fitted 13 wide-support tail displacements.  The gate time,
spectral support, roughness path, and constitutive model are unchanged.
Measurement is specimen minus an independent unit-impulse tare, each based on
192 repeats with equal additive single-repeat uncertainty epsilon.
"""

import json

import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import chi2

from orthogonal_readout_design import gate_row

NULLSPACE_FILE = "spectral_causal_zero_nullspace.json"
EXPANDED_FILE = "spectral_causal_zero_expanded_support.json"
R = 192
T_GATE = 96.0
TAU = np.geomspace(0.01, 48.0, 97)
DF_VARIANCE = 2 * (R - 1)
STD_GUARD_95 = float(np.sqrt(chi2.ppf(.975, DF_VARIANCE) / DF_VARIANCE))


def main():
    null = json.load(open(NULLSPACE_FILE))
    expanded = json.load(open(EXPANDED_FILE))
    by_seed = {r["seed"]: r for r in expanded["seed_results"]}
    gate = gate_row(T_GATE, TAU)

    rows = []
    for r in null["seed_results"]:
        cfg = next(c for c in by_seed[r["seed"]]["configs"] if c["bins"] == 97)
        wide = np.asarray(cfg["spectrum"]) * r["raw_wide_total_mass"]
        delta = np.asarray(r["delta"])
        restricted = wide - delta
        dy = float(gate @ delta)
        y0 = float(gate @ restricted)
        old_sigma = float(r["whitened_response_sigma"])
        needed_gate_sigma = float(np.sqrt(max(0.0, 1.0 - old_sigma**2)))
        # corrected mean variance = 2 epsilon^2 / R
        eps_max = (abs(dy) * np.sqrt(R / 2) / needed_gate_sigma
                   if needed_gate_sigma > 0 else np.inf)
        rows.append({
            "seed": int(r["seed"]),
            "normalized_endpoint_mass": float(cfg["endpoint_mass"]),
            "restricted_gate_signal": y0,
            "gate_displacement": dy,
            "existing_response_sigma": old_sigma,
            "gate_sigma_needed": needed_gate_sigma,
            "maximum_single_repeat_unit_tare_noise": float(eps_max),
            "maximum_noise_with_95pct_covariance_guard": float(eps_max / STD_GUARD_95),
        })

    thresholds = np.sort([r["maximum_single_repeat_unit_tare_noise"] for r in rows])
    threshold_12 = float(thresholds[1])
    threshold_13 = float(thresholds[0])
    eps_grid = np.geomspace(1e-6, 1e-3, 181)
    curves = []
    counts = []
    for eps in eps_grid:
        vals = []
        for r in rows:
            gate_sig = abs(r["gate_displacement"]) / (np.sqrt(2/R) * eps)
            vals.append(float(np.hypot(r["existing_response_sigma"], gate_sig)))
        curves.append(vals)
        counts.append(int(np.sum(np.asarray(vals) >= 1.0)))
    curves = np.asarray(curves)

    result = {
        "status": "GEN/CANDIDATE",
        "question": "What precision must the frozen [96,192] gate reach to resolve at least 12 of 13 prior tail displacements?",
        "gate_kernel": "exp(-96/tau)-exp(-192/tau)",
        "gate_time_window": [96.0, 192.0],
        "repeats_per_specimen_and_tare": R,
        "noise_model": "independent additive specimen and unit-impulse tare noise; corrected observable is their mean difference",
        "corrected_mean_sd": "sqrt(2/R)*epsilon",
        "variance_estimation_df": DF_VARIANCE,
        "std_guard_factor_95pct": STD_GUARD_95,
        "point_threshold_for_12_of_13": threshold_12,
        "point_threshold_for_13_of_13": threshold_13,
        "guarded_threshold_for_12_of_13": float(threshold_12 / STD_GUARD_95),
        "guarded_threshold_for_13_of_13": float(threshold_13 / STD_GUARD_95),
        "counts_at_reference_noise": {},
        "seed_results": rows,
        "noise_ladder": eps_grid.tolist(),
        "resolved_counts": counts,
    }
    for eps in [3e-4, 1e-4, 5e-5, 2e-5, 1.5e-5, 1e-5, 6e-6]:
        vals = [np.hypot(r["existing_response_sigma"],
                         abs(r["gate_displacement"]) / (np.sqrt(2/R)*eps))
                for r in rows]
        result["counts_at_reference_noise"][f"{eps:.1e}"] = int(np.sum(np.asarray(vals) >= 1))
    json.dump(result, open("frozen_late_gate_precision.json", "w"), indent=2)

    fig, ax = plt.subplots(2, 2, figsize=(12.8, 9.2), constrained_layout=True)
    ax[0, 0].plot(TAU, gate, color="#1a9850", lw=2)
    ax[0, 0].axvline(12, color="black", ls=":", label="native support edge")
    ax[0, 0].fill_between(TAU, 0, gate, where=TAU > 12, color="#1a9850", alpha=.25)
    ax[0, 0].set_xscale("log")
    ax[0, 0].set(xlabel="relaxation time tau", ylabel="gate kernel",
                 title="Frozen late-time readout")
    ax[0, 0].legend(frameon=False)

    for j, r in enumerate(rows):
        ax[0, 1].plot(eps_grid, curves[:, j], color="#2166ac", alpha=.38, lw=1)
    ax[0, 1].axhline(1, color="#b2182b", ls="--")
    ax[0, 1].axvline(threshold_12, color="black", ls=":", label="12/13 point boundary")
    ax[0, 1].set_xscale("log"); ax[0, 1].invert_xaxis()
    ax[0, 1].set(xlabel="single-repeat unit-tare noise epsilon",
                 ylabel="joint displacement [sigma]", title="Per-seed detectability")
    ax[0, 1].legend(frameon=False)

    ax[1, 0].step(eps_grid, counts, where="mid", color="#7b3294", lw=2)
    ax[1, 0].axhline(12, color="#b2182b", ls="--")
    ax[1, 0].axvline(threshold_12/STD_GUARD_95, color="black", ls=":",
                     label="95% covariance guard")
    ax[1, 0].set_xscale("log"); ax[1, 0].invert_xaxis()
    ax[1, 0].set(xlabel="single-repeat unit-tare noise epsilon",
                 ylabel="tails above 1 sigma", title="Frozen-gate success count")
    ax[1, 0].legend(frameon=False)

    endpoint = np.array([r["normalized_endpoint_mass"] for r in rows])
    th = np.array([r["maximum_single_repeat_unit_tare_noise"] for r in rows])
    ax[1, 1].scatter(endpoint, th, c=[r["existing_response_sigma"] for r in rows],
                     cmap="viridis", s=55)
    ax[1, 1].axhline(threshold_12, color="black", ls=":")
    ax[1, 1].set_yscale("log")
    ax[1, 1].set(xlabel="normalized endpoint mass", ylabel="maximum epsilon",
                 title="Precision burden by tail size")
    fig.suptitle("Class P diagnostic: frozen late-gate precision boundary", fontsize=15)
    fig.savefig("frozen_late_gate_precision.png", dpi=180)
    fig.savefig("frozen_late_gate_precision.svg")
    print(json.dumps({k: v for k, v in result.items()
                      if k not in ("seed_results", "noise_ladder", "resolved_counts")}, indent=2))


if __name__ == "__main__":
    main()
