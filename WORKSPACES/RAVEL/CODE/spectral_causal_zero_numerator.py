"""Blind spectrum inversion with a calibrated causal instrumental zero.

Extends spectral_calibrated_numerator.py by replacing the frequency-independent
readout numerator with

    N(z;a,nu) = exp(c0 + ca log(a) + cnu log(nu)) * (1 - i z tau_N).

The gain coefficients and tau_N are estimated independently in every repeat
from the same two known-load probes.  No constitutive relaxation component is
added.  This bounded run tests the declared native-support atomicity condition
on its unchanged 25/49/97-bin grids across all 50 seeds and 192 repeats.  The
expanded-support tail test is deliberately left as the next dependency.
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
TAU_N_TRUE = 0.40
BASE_CONFIGS = [c for c in CONFIGS if c[0] == "base"]


def design(a, nu):
    return np.column_stack([np.ones(len(a)), np.log(a),
                            np.full(len(a), np.log(nu))])


def gain(a, nu, coef=COEF_TRUE):
    return np.exp(design(a, nu) @ coef)


def numerator(z, a, nu, coef=COEF_TRUE, tau_n=TAU_N_TRUE):
    return gain(a, nu, coef) * (1 - 1j*z*tau_n)


def fit_calibration_per_repeat(a, rng):
    """Estimate gain law and one causal zero from known-load responses.

    For the tared reference, Y=H_cal D_cal=G(a,nu)(1-i omega tau_N).
    Re(Y) identifies G without tau_N; Im(Y) then identifies the common phase
    slope.  Both are refit in every repeat so uncertainty propagates forward.
    """
    obs = []
    for nu in NU:
        X = design(a, nu)
        g0 = gain(a, nu)
        for beta in CAL_BETA:
            omega = beta * nu / a
            dcal = (nu/a)**2 - omega**2
            y0 = g0 * (1 - 1j*omega*TAU_N_TRUE)
            h0 = y0 / dcal
            hreps = sample_repeats(
                h0, pole_cov(h0, sigma=SIGMA, rho=RHO_A, eta=ETA_RI),
                REPEATS, rng)
            obs.append((X, omega, hreps*dcal[None, :]))

    Xall = np.vstack([x for x, _, _ in obs])
    coef = np.empty((REPEATS, 3))
    tau = np.empty(REPEATS)
    for r in range(REPEATS):
        yall = np.concatenate([y[r] for _, _, y in obs])
        coef[r] = np.linalg.lstsq(
            Xall, np.log(np.maximum(yall.real, 1e-300)), rcond=None)[0]
        gall = np.exp(Xall @ coef[r])
        omega = np.concatenate([w for _, w, _ in obs])
        x = omega*gall
        tau[r] = -float(x @ yall.imag) / float(x @ x)
    return coef, tau


def gain_only_contamination(a):
    """Noiseless error left by fitting gain but omitting the causal zero."""
    rows = []
    for nu in NU:
        for beta in CAL_BETA:
            omega = beta*nu/a
            ratio = 1 - 1j*omega*TAU_N_TRUE
            rows.append({
                "nu": float(nu), "beta": float(beta),
                "median_abs_ratio_error": float(np.median(np.abs(ratio-1))),
                "max_abs_ratio_error": float(np.max(np.abs(ratio-1))),
                "max_phase_rad": float(np.max(np.abs(np.angle(ratio))))})
    return rows


def run_seed(seed):
    rng = np.random.default_rng(seed)
    a = np.logspace(-1, np.log10(3), 41)
    z0 = np.split(roots_joint(a, NU), len(NU))
    r0 = true_residues(a, z0)
    coef_reps, tau_reps = fit_calibration_per_repeat(a, rng)

    zreps, corrected = [], []
    n_errors, tau_errors = [], tau_reps-TAU_N_TRUE
    for nu, z, r in zip(NU, z0, r0):
        n0 = numerator(z, a, nu)
        raw = n0*r
        zr = sample_repeats(
            z, pole_cov(z, sigma=SIGMA, rho=RHO_A, eta=ETA_RI), REPEATS, rng)
        rr = sample_repeats(
            raw, pole_cov(raw, sigma=SIGMA, rho=RHO_A, eta=ETA_RI), REPEATS, rng)
        X = design(a, nu)
        ghat = np.exp(coef_reps @ X.T)
        nhat = ghat * (1 - 1j*zr*tau_reps[:, None])
        zreps.append(zr)
        corrected.append(rr/nhat)
        n_errors.append(np.abs(nhat/n0[None, :]-1))

    ne = np.concatenate(n_errors, axis=1)
    return {
        "seed": seed,
        "coef_mean": coef_reps.mean(axis=0).tolist(),
        "tau_n_mean": float(tau_reps.mean()),
        "tau_n_sd": float(tau_reps.std(ddof=1)),
        "tau_n_abs_error_median": float(np.median(np.abs(tau_errors))),
        "tau_n_abs_error_q975": float(np.quantile(np.abs(tau_errors), .975)),
        "numerator_rel_error_median": float(np.median(ne)),
        "numerator_rel_error_q975": float(np.quantile(ne, .975)),
        "numerator_rel_error_max": float(np.max(ne)),
        "configs": [run_config(a, zreps, corrected, *cfg) for cfg in BASE_CONFIGS],
    }


def summarize_base(rows):
    out = []
    for label, bins, interval in BASE_CONFIGS:
        rr = [next(c for c in s["configs"] if c["bins"] == bins) for s in rows]
        out.append({
            "interval_label": label, "bins": bins, "interval": list(interval),
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


def make_plot(summary, rows, contamination):
    fig, ax = plt.subplots(2, 2, figsize=(12.5, 9), constrained_layout=True)
    colors = {25: "#2166ac", 49: "#7b3294", 97: "#d73027"}
    for r in summary:
        ax[0, 0].plot(r["tau"], r["median_spectrum"], "o-", ms=2.5,
                      color=colors[r["bins"]], label=f"{r['bins']} bins")
    ax[0, 0].set_xscale("log")
    ax[0, 0].set(xlabel="relaxation time tau", ylabel="median normalized weight",
                 title="Zero-calibrated spectrum (native support)")
    ax[0, 0].legend(frameon=False)

    rr = summary
    ax[0, 1].plot([x["h"] for x in rr],
                  [x["fast_width"]["q975"] for x in rr], "o-", label="U95")
    ax[0, 1].plot([x["h"] for x in rr],
                  [x["fast_width"]["median"] for x in rr], "o--", label="median")
    ax[0, 1].invert_xaxis()
    ax[0, 1].set(xlabel="log-grid spacing h", ylabel="fast-sector log-width",
                 title="Atomicity after zero marginalization")
    ax[0, 1].legend(fontsize=8, frameon=False)

    tm = np.array([r["tau_n_mean"] for r in rows])
    ax[1, 0].hist(tm-TAU_N_TRUE, bins=14, color="#2166ac", alpha=.82)
    ax[1, 0].axvline(0, color="black", lw=1)
    ax[1, 0].set(xlabel="mean calibrated tau_N error", ylabel="seed count",
                 title="Instrumental-zero recovery across 50 seeds")

    labels = [f"nu={r['nu']:.2g}\nbeta={r['beta']:.2g}" for r in contamination]
    x = np.arange(len(contamination))
    ax[1, 1].bar(x, [r["max_abs_ratio_error"] for r in contamination],
                     color="#d73027", alpha=.8, label="max |N/G-1|")
    ax[1, 1].set_xticks(x, labels)
    ax[1, 1].set_yscale("log")
    ax[1, 1].set(ylabel="uncalibrated zero contamination",
                 title="Gain-only tare leaves a phase-slope artifact")
    ax[1, 1].legend(frameon=False)
    fig.suptitle("Class P diagnostic: causal instrumental-zero calibration", fontsize=15)
    fig.savefig("spectral_causal_zero_numerator.png", dpi=180)
    fig.savefig("spectral_causal_zero_numerator.svg")


def main():
    rows = []
    with ProcessPoolExecutor(max_workers=min(10, os.cpu_count() or 1)) as pool:
        futs = {pool.submit(run_seed, seed): seed for seed in SEEDS}
        for i, fut in enumerate(as_completed(futs), 1):
            rows.append(fut.result())
            print(f"completed {i}/{len(SEEDS)}", flush=True)
    rows.sort(key=lambda x: x["seed"])
    summary = summarize_base(rows)
    a = np.logspace(-1, np.log10(3), 41)
    contamination = gain_only_contamination(a)
    coef_mean = np.array([r["coef_mean"] for r in rows])
    payload = {
        "status": "GEN/CANDIDATE",
        "numerator_model": "exp(c0+ca log(a)+cnu log(nu))*(1-i z tau_N)",
        "true_parameters_posthoc": {"coefficients": COEF_TRUE.tolist(),
                                     "tau_N": TAU_N_TRUE},
        "calibration_probe_multipliers": CAL_BETA.tolist(),
        "calibration_assumption": "known tared reference denominator",
        "repeats": REPEATS, "seeds": SEEDS, "relative_noise": SIGMA,
        "coefficient_error_quantiles": {
            lab: quantiles(coef_mean[:, j]-COEF_TRUE[j])
            for j, lab in enumerate(["c0", "ca", "cnu"])},
        "tau_N_error": quantiles([r["tau_n_mean"]-TAU_N_TRUE for r in rows]),
        "tau_N_repeat_abs_error": {
            "median_of_seed_medians": float(np.median([r["tau_n_abs_error_median"] for r in rows])),
            "median_seed_q975": float(np.median([r["tau_n_abs_error_q975"] for r in rows]))},
        "numerator_relative_error": {
            "median_of_seed_medians": float(np.median([r["numerator_rel_error_median"] for r in rows])),
            "median_seed_q975": float(np.median([r["numerator_rel_error_q975"] for r in rows])),
            "max_over_all_seeds": float(np.max([r["numerator_rel_error_max"] for r in rows]))},
        "gain_only_contamination": contamination,
        "summary_blind": summary,
        "seed_results": rows,
    }
    json.dump(payload, open("spectral_causal_zero_numerator.json", "w"), indent=2)
    compact = {k: v for k, v in payload.items() if k != "seed_results"}
    json.dump(compact, open("spectral_causal_zero_numerator_summary.json", "w"), indent=2)
    make_plot(summary, rows, contamination)
    print(json.dumps({k: v for k, v in compact.items()
                      if k != "summary_blind"}, indent=2))
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
