"""Blind spectrum inversion with a calibrated, non-unit transfer numerator.

The pole/residue fixture and all six spectral grids are inherited unchanged from
spectral_joint_location_residue.py.  The only new object is a preregistered
real-positive separable readout numerator, estimated independently in every
repeat from two known-load off-resonance calibration measurements per channel.
"""

import json
import os
from concurrent.futures import ProcessPoolExecutor, as_completed

import matplotlib.pyplot as plt
import numpy as np

from repeated_covariance_spectrum_selection import TRUE, pole_cov, sample_repeats
from spectral_lambda_path_ensemble import CONFIGS, Q_FIXED, REPEATS, SEEDS, quantiles
from spectral_joint_radius_frequency import NU, roots_joint
from spectral_joint_location_residue import true_residues, run_config, summarize

SIGMA = 3e-4
RHO_A = 0.75
ETA_RI = 0.35
CAL_BETA = np.array([0.45, 1.65])
COEF_TRUE = np.array([0.18, 0.35, -0.22])


def design(a, nu):
    return np.column_stack([np.ones(len(a)), np.log(a), np.full(len(a), np.log(nu))])


def gain(a, nu, coef=COEF_TRUE):
    return np.exp(design(a, nu) @ coef)


def fit_calibration_per_repeat(a, rng):
    """Fit log N=c0+ca log a+cnu log nu from known-load responses.

    Each off-resonance calibration uses a tared reference state whose denominator
    D_cal=(nu/a)^2-omega^2 is known.  Coefficients are estimated separately for
    every repeat, so their uncertainty propagates into corrected residue repeats.
    """
    yblocks = [[] for _ in range(REPEATS)]
    xblocks = []
    for nu in NU:
        X = design(a, nu)
        n0 = gain(a, nu)
        for beta in CAL_BETA:
            omega = beta * nu / a
            dcal = (nu / a) ** 2 - omega ** 2
            h0 = n0 / dcal
            hreps = sample_repeats(
                h0, pole_cov(h0, sigma=SIGMA, rho=RHO_A, eta=ETA_RI), REPEATS, rng
            )
            nest = np.maximum((hreps * dcal[None, :]).real, 1e-300)
            xblocks.append(X)
            for r in range(REPEATS):
                yblocks[r].append(np.log(nest[r]))
    Xall = np.vstack(xblocks)
    coef = np.array([np.linalg.lstsq(Xall, np.concatenate(y), rcond=None)[0]
                     for y in yblocks])
    return coef


def in_situ_contamination(a):
    """Noiseless diagnostic for the invalid shortcut H*D_bare=N in the live medium."""
    rows = []
    for nu in NU:
        n0 = gain(a, nu)
        for beta in CAL_BETA:
            omega = beta * nu / a
            d0 = (nu / a) ** 2 - omega ** 2
            kernel = (TRUE["A1"] / (1 - 1j * omega * TRUE["t1"])
                      + TRUE["A2"] / (1 - 1j * omega * TRUE["t2"]))
            dfull = d0 - 1j * omega * a ** Q_FIXED * kernel
            ratio = d0 / dfull
            rows.append({"nu": float(nu), "beta": float(beta),
                         "median_abs_ratio_error": float(np.median(np.abs(ratio - 1))),
                         "max_abs_ratio_error": float(np.max(np.abs(ratio - 1))),
                         "max_phase_rad": float(np.max(np.abs(np.angle(ratio))))})
    return rows


def run_seed(seed):
    rng = np.random.default_rng(seed)
    a = np.logspace(-1, np.log10(3), 41)
    z0 = np.split(roots_joint(a, NU), len(NU))
    r0 = true_residues(a, z0)
    coef_reps = fit_calibration_per_repeat(a, rng)
    zreps, corrected = [], []
    gain_errors = []
    for nu, z, r in zip(NU, z0, r0):
        n0 = gain(a, nu)
        raw = n0 * r
        zr = sample_repeats(z, pole_cov(z, sigma=SIGMA, rho=RHO_A, eta=ETA_RI), REPEATS, rng)
        rr = sample_repeats(raw, pole_cov(raw, sigma=SIGMA, rho=RHO_A, eta=ETA_RI), REPEATS, rng)
        X = design(a, nu)
        nhat = np.exp(coef_reps @ X.T)
        zreps.append(zr)
        corrected.append(rr / nhat)
        gain_errors.append(np.abs(nhat / n0[None, :] - 1))
    ge = np.concatenate(gain_errors, axis=1)
    return {
        "seed": seed,
        "coef_mean": coef_reps.mean(axis=0).tolist(),
        "coef_sd": coef_reps.std(axis=0, ddof=1).tolist(),
        "gain_rel_error_median": float(np.median(ge)),
        "gain_rel_error_q975": float(np.quantile(ge, 0.975)),
        "gain_rel_error_max": float(np.max(ge)),
        "configs": [run_config(a, zreps, corrected, *cfg) for cfg in CONFIGS],
    }


def make_plot(summary, oracle, rows, contamination):
    fig, ax = plt.subplots(2, 2, figsize=(12.5, 9), constrained_layout=True)
    colors = {25: "#2166ac", 49: "#7b3294", 97: "#d73027"}
    for r in [x for x in summary if x["interval_label"] == "wide"]:
        ax[0, 0].plot(r["tau"], r["median_spectrum"], "o-", ms=2.5,
                      color=colors[r["bins"]], label=f"{r['bins']} bins")
    ax[0, 0].set_xscale("log")
    ax[0, 0].set(xlabel="relaxation time τ", ylabel="median normalized weight",
                 title="Calibrated-residue spectrum (wide support)")
    ax[0, 0].legend(frameon=False)

    for label, data, marker in (("unit-numerator oracle", oracle, "o"),
                                ("fitted numerator", summary, "s")):
        rr = [x for x in data if x["interval_label"] == "wide"]
        h = [x["h"] for x in rr]
        ax[0, 1].plot(h, [x["fast_width"]["q975"] for x in rr], marker=marker,
                      label=f"{label}: U95")
        ax[0, 1].plot(h, [x["fast_width"]["median"] for x in rr], marker=marker,
                      ls="--", label=f"{label}: median")
    ax[0, 1].invert_xaxis()
    ax[0, 1].set(xlabel="log-grid spacing h", ylabel="fast-sector log-width",
                 title="Width contraction after gain marginalization")
    ax[0, 1].legend(fontsize=8, frameon=False)

    cm = np.array([r["coef_mean"] for r in rows])
    labels = ["intercept", "log a", "log ν"]
    for j in range(3):
        ax[1, 0].scatter(np.full(len(cm), j), cm[:, j] - COEF_TRUE[j], s=13,
                         alpha=.65, color=colors[[25, 49, 97][j]])
    ax[1, 0].axhline(0, color="black", lw=1)
    ax[1, 0].set_xticks(range(3), labels)
    ax[1, 0].set(ylabel="coefficient error", title="Blind calibration recovery across 50 seeds")

    x = np.arange(len(contamination))
    ax[1, 1].bar(x - .18, [r["median_abs_ratio_error"] for r in contamination], .36,
                     label="median |D₀/D−1|")
    ax[1, 1].bar(x + .18, [r["max_abs_ratio_error"] for r in contamination], .36,
                     label="max |D₀/D−1|")
    ax[1, 1].set_xticks(x, [f"ν={r['nu']:.2g}\nβ={r['beta']:.2g}" for r in contamination])
    ax[1, 1].set_yscale("log")
    ax[1, 1].set(ylabel="relative contamination", title="Why live-medium ‘calibration’ is not a tare")
    ax[1, 1].legend(fontsize=8, frameon=False)
    fig.suptitle("Class P diagnostic: calibrated transfer numerator", fontsize=15)
    fig.savefig("spectral_calibrated_numerator.png", dpi=180)
    fig.savefig("spectral_calibrated_numerator.svg")


def main():
    rows = []
    with ProcessPoolExecutor(max_workers=min(6, os.cpu_count() or 1)) as pool:
        futs = {pool.submit(run_seed, seed): seed for seed in SEEDS}
        for i, fut in enumerate(as_completed(futs), 1):
            rows.append(fut.result())
            print(f"completed {i}/{len(SEEDS)}", flush=True)
    rows.sort(key=lambda x: x["seed"])
    summary = summarize(rows)
    oracle = json.load(open("spectral_joint_location_residue_summary.json"))["summary_blind"]
    a = np.logspace(-1, np.log10(3), 41)
    contamination = in_situ_contamination(a)
    coef_mean = np.array([r["coef_mean"] for r in rows])
    payload = {
        "status": "GEN/CANDIDATE",
        "numerator_model": "exp(c0 + ca log(a) + cnu log(nu))",
        "true_coefficients_posthoc": COEF_TRUE.tolist(),
        "calibration_probe_multipliers": CAL_BETA.tolist(),
        "calibration_assumption": "known tared reference denominator D_cal",
        "repeats": REPEATS,
        "seeds": SEEDS,
        "relative_noise": SIGMA,
        "coefficient_error_quantiles": {
            labels: quantiles(coef_mean[:, j] - COEF_TRUE[j])
            for j, labels in enumerate(["c0", "ca", "cnu"])
        },
        "gain_relative_error": {
            "median_of_seed_medians": float(np.median([r["gain_rel_error_median"] for r in rows])),
            "median_seed_q975": float(np.median([r["gain_rel_error_q975"] for r in rows])),
            "max_over_all_seeds": float(np.max([r["gain_rel_error_max"] for r in rows])),
        },
        "in_situ_off_resonance_contamination": contamination,
        "summary_blind": summary,
        "unit_numerator_oracle": oracle,
        "seed_results": rows,
    }
    json.dump(payload, open("spectral_calibrated_numerator.json", "w"), indent=2)
    compact = {k: v for k, v in payload.items() if k != "seed_results"}
    json.dump(compact, open("spectral_calibrated_numerator_summary.json", "w"), indent=2)
    make_plot(summary, oracle, rows, contamination)
    print(json.dumps({k: v for k, v in compact.items() if k not in ("summary_blind", "unit_numerator_oracle")}, indent=2))
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
