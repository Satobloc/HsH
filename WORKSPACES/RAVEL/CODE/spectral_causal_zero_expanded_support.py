"""Expanded-support audit for the calibrated causal-zero spectrum.

This is the frozen next step after spectral_causal_zero_numerator.py.  It
changes only the relaxation-time support from [0.04, 12] to [0.01, 48].
The 50 seeds, 192 repeats, measurement covariance, known-load calibration,
roughness-evidence averaging, joint pole/residue data, and 25/49/97 grids are
otherwise unchanged.
"""

import json
import os
from concurrent.futures import ProcessPoolExecutor, as_completed

import matplotlib.pyplot as plt
import numpy as np

import spectral_causal_zero_numerator as native
from spectral_lambda_path_ensemble import CONFIGS, SEEDS, quantiles
from spectral_joint_radius_frequency import NU, roots_joint

WIDE_CONFIGS = [c for c in CONFIGS if c[0] == "wide"]


def run_seed_wide(seed):
    # Set inside each worker so this remains correct under both fork and spawn.
    native.BASE_CONFIGS = WIDE_CONFIGS
    return native.run_seed(seed)


def summarize_wide(rows):
    out = []
    for label, bins, interval in WIDE_CONFIGS:
        rr = [next(c for c in s["configs"] if c["bins"] == bins) for s in rows]
        out.append({
            "interval_label": label,
            "bins": bins,
            "interval": list(interval),
            "h": rr[0]["h"],
            "fast_centroid": quantiles([r["clusters"][0]["centroid"] for r in rr]),
            "slow_centroid": quantiles([r["clusters"][1]["centroid"] for r in rr]),
            "fast_mass": quantiles([r["clusters"][0]["mass"] for r in rr]),
            "slow_mass": quantiles([r["clusters"][1]["mass"] for r in rr]),
            "fast_width": quantiles([r["clusters"][0]["log_width"] for r in rr]),
            "slow_width": quantiles([r["clusters"][1]["log_width"] for r in rr]),
            "endpoint_mass": quantiles([r["endpoint_mass"] for r in rr]),
            "effective_lambdas": quantiles([r["effective_lambdas"] for r in rr]),
            "median_spectrum": np.median([r["spectrum"] for r in rr], axis=0).tolist(),
            "tau": rr[0]["tau"],
        })
    return out


def kernel_geometry():
    """Exact residue-kernel geometry for the middle carrier frequency."""
    a = np.logspace(-1, np.log10(3), 41)
    zblocks = np.split(roots_joint(a, NU), len(NU))
    j = int(np.argmin(np.abs(np.asarray(NU) - 1.0)))
    z = zblocks[j]
    tau = np.geomspace(0.01, 48.0, 240)
    k2 = np.abs(1.0 / (1.0 - 1j*z[:, None]*tau[None, :])**2)
    # Normalize each radius row: this displays identifiability geometry rather
    # than the arbitrary response-amplitude scale.
    k2 /= np.maximum(k2.max(axis=1, keepdims=True), 1e-300)
    return a, tau, k2


def make_plot(summary):
    fig, ax = plt.subplots(2, 2, figsize=(12.8, 9.2), constrained_layout=True)
    colors = {25: "#2166ac", 49: "#7b3294", 97: "#d73027"}
    for r in summary:
        ax[0, 0].plot(r["tau"], r["median_spectrum"], "o-", ms=2.4,
                      color=colors[r["bins"]], label=f"{r['bins']} bins")
    ax[0, 0].set_xscale("log")
    ax[0, 0].set(xlabel="relaxation time τ", ylabel="median normalized weight",
                 title="Calibrated-zero spectrum: expanded support")
    ax[0, 0].legend(frameon=False)

    h = [r["h"] for r in summary]
    ax[0, 1].plot(h, [r["fast_width"]["q975"] for r in summary], "o-", label="U95")
    ax[0, 1].plot(h, [r["fast_width"]["median"] for r in summary], "o--", label="median")
    ax[0, 1].invert_xaxis()
    ax[0, 1].set(xlabel="log-grid spacing h", ylabel="fast-sector log-width",
                 title="Expanded-support atomicity test")
    ax[0, 1].legend(frameon=False)

    ax[1, 0].plot(h, [r["endpoint_mass"]["q975"] for r in summary], "o-", color="#b2182b")
    ax[1, 0].plot(h, [r["endpoint_mass"]["median"] for r in summary], "o--", color="#ef8a62")
    ax[1, 0].invert_xaxis()
    ax[1, 0].set(xlabel="log-grid spacing h", ylabel="endpoint spectral mass",
                 title="Boundary-leakage audit (solid: U95)")

    a, tau, k2 = kernel_geometry()
    mesh = ax[1, 1].pcolormesh(tau, a, k2, shading="auto", cmap="viridis",
                               rasterized=True)
    ax[1, 1].set_xscale("log")
    ax[1, 1].set(xlabel="candidate relaxation time τ", ylabel="finite-core radius a",
                 title=r"Readout geometry: normalized $|(1-izτ)^{-2}|$")
    fig.colorbar(mesh, ax=ax[1, 1], label="relative residue sensitivity")

    fig.suptitle("Class P diagnostic: causal-zero calibration on expanded support", fontsize=15)
    fig.savefig("spectral_causal_zero_expanded_support.png", dpi=180)
    fig.savefig("spectral_causal_zero_expanded_support.svg")


def main():
    rows = []
    with ProcessPoolExecutor(max_workers=min(10, os.cpu_count() or 1)) as pool:
        futs = {pool.submit(run_seed_wide, seed): seed for seed in SEEDS}
        for i, fut in enumerate(as_completed(futs), 1):
            rows.append(fut.result())
            print(f"completed {i}/{len(SEEDS)}", flush=True)
    rows.sort(key=lambda x: x["seed"])
    summary = summarize_wide(rows)
    payload = {
        "status": "GEN/CANDIDATE",
        "question": "Does calibrated-zero atomicity survive fourfold-expanded support?",
        "only_changed_input": {"relaxation_support": [0.01, 48.0]},
        "inherited_protocol": {
            "seeds": SEEDS,
            "repeats": native.REPEATS,
            "bins": [25, 49, 97],
            "relative_complex_noise": native.SIGMA,
            "numerator": "exp(c0+ca log(a)+cnu log(nu))*(1-i z tau_N)",
            "known_load_probe_multipliers": native.CAL_BETA.tolist(),
        },
        "summary_blind": summary,
        "seed_results": rows,
    }
    with open("spectral_causal_zero_expanded_support.json", "w") as f:
        json.dump(payload, f, indent=2)
    compact = {k: v for k, v in payload.items() if k != "seed_results"}
    with open("spectral_causal_zero_expanded_support_summary.json", "w") as f:
        json.dump(compact, f, indent=2)
    make_plot(summary)
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
