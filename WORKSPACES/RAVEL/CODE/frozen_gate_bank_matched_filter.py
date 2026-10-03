"""Covariance-whitened matched-filter test for the frozen six-gate bank.

No gate, tail seed, relaxation support, or constitutive component is changed.
The declared stationary covariance is Ornstein-Uhlenbeck in log gate time with
one-octave correlation length.  Two filters are reported:

1. a single preregisterable high-tail template, fixed without seed deltas;
2. a per-seed oracle matched filter, used only as an upper feasibility bound.
"""

import json

import matplotlib.pyplot as plt
import numpy as np
from scipy.linalg import cho_factor, cho_solve
from scipy.stats import chi2

from orthogonal_readout_design import gate_row

ORTHOGONAL_FILE = "orthogonal_readout_design.json"
NULLSPACE_FILE = "spectral_causal_zero_nullspace.json"
R = 192
EPS_REFERENCE = 3e-4
TAU_EDGE = 12.0
LOG_CORR_LENGTH = np.log(2.0)  # one octave, frozen before tail scoring
DF_VARIANCE = 2 * (R - 1)
STD_GUARD_95 = float(np.sqrt(chi2.ppf(.975, DF_VARIANCE) / DF_VARIANCE))


def ou_log_covariance(times):
    """Unit-marginal stationary OU covariance in u=log(T)."""
    u = np.log(np.asarray(times, float))
    return np.exp(-np.abs(u[:, None] - u[None, :]) / LOG_CORR_LENGTH)


def normalize_filter(template, covariance):
    """Return C^-1 template with unit output variance."""
    cf = cho_factor(covariance, lower=True, check_finite=True)
    raw = cho_solve(cf, template)
    norm = float(np.sqrt(template @ raw))
    return raw / norm, cf


def threshold(signal_norm, old_sigma, guarded=False):
    needed = np.sqrt(max(0.0, 1.0 - old_sigma**2))
    point = np.inf if needed == 0 else signal_norm * np.sqrt(R / 2.0) / needed
    return float(point / STD_GUARD_95 if guarded else point)


def main():
    design = json.load(open(ORTHOGONAL_FILE))
    null = json.load(open(NULLSPACE_FILE))
    tau = np.asarray(design["tau"], float)
    gate_times = np.asarray(design["candidate_time_gates"]["selected_T"], float)
    gates = np.vstack([gate_row(T, tau) for T in gate_times])

    covariance = ou_log_covariance(gate_times)
    # Fixed without tail outcomes: uniform log-support template over unresolved
    # tau in (12,48].  Grid is already uniform in log(tau).
    high_tail_template = gates[:, tau > TAU_EDGE].mean(axis=1)
    generic_w, cf = normalize_filter(high_tail_template, covariance)

    rows = []
    for record in null["seed_results"]:
        delta = np.asarray(record["delta"], float)
        signal = gates @ delta
        old = float(record["whitened_response_sigma"])

        generic_amplitude = float(abs(generic_w @ signal))
        oracle_energy = float(np.sqrt(signal @ cho_solve(cf, signal)))
        single_amplitude = float(abs(signal[0]))  # T=96 remains first/frozen

        rows.append({
            "seed": int(record["seed"]),
            "gate_signal_vector": signal.tolist(),
            "existing_response_sigma": old,
            "single_gate_amplitude": single_amplitude,
            "generic_filter_amplitude": generic_amplitude,
            "oracle_filter_amplitude": oracle_energy,
            "generic_point_epsilon_max": threshold(generic_amplitude, old),
            "generic_guarded_epsilon_max": threshold(generic_amplitude, old, True),
            "oracle_point_epsilon_max": threshold(oracle_energy, old),
            "oracle_guarded_epsilon_max": threshold(oracle_energy, old, True),
        })

    def coverage_boundary(key, required):
        values = np.sort([row[key] for row in rows])
        return float(values[len(values) - required])

    eps_grid = np.geomspace(1e-6, 1e-3, 241)
    generic_counts, oracle_counts = [], []
    for eps in eps_grid:
        generic_counts.append(int(sum(
            np.hypot(row["existing_response_sigma"],
                     row["generic_filter_amplitude"] / (np.sqrt(2/R)*eps)) >= 1
            for row in rows)))
        oracle_counts.append(int(sum(
            np.hypot(row["existing_response_sigma"],
                     row["oracle_filter_amplitude"] / (np.sqrt(2/R)*eps)) >= 1
            for row in rows)))

    result = {
        "status": "GEN/CANDIDATE",
        "question": "Can covariance whitening over the frozen six-gate bank close the late-tail precision gap without retuning?",
        "gate_times": gate_times.tolist(),
        "gate_kernel": "exp(-T/tau)-exp(-2T/tau)",
        "noise_covariance": "stationary OU in log gate time",
        "covariance_equation": "C_ij=exp(-|log(T_i/T_j)|/log(2))",
        "log_time_correlation_length": LOG_CORR_LENGTH,
        "covariance_eigenvalues": np.linalg.eigvalsh(covariance).tolist(),
        "covariance_condition_number": float(np.linalg.cond(covariance)),
        "generic_template": "uniform log-tau average of frozen gate kernels for 12<tau<=48",
        "generic_filter_weights": generic_w.tolist(),
        "repeats_per_specimen_and_tare": R,
        "reference_single_repeat_noise": EPS_REFERENCE,
        "variance_estimation_df": DF_VARIANCE,
        "std_guard_factor_95pct": STD_GUARD_95,
        "generic_guarded_boundary_12_of_13": coverage_boundary("generic_guarded_epsilon_max", 12),
        "generic_guarded_boundary_13_of_13": coverage_boundary("generic_guarded_epsilon_max", 13),
        "oracle_guarded_boundary_12_of_13": coverage_boundary("oracle_guarded_epsilon_max", 12),
        "oracle_guarded_boundary_13_of_13": coverage_boundary("oracle_guarded_epsilon_max", 13),
        "generic_resolved_at_reference": int(sum(x >= EPS_REFERENCE for x in [r["generic_guarded_epsilon_max"] for r in rows])),
        "oracle_resolved_at_reference": int(sum(x >= EPS_REFERENCE for x in [r["oracle_guarded_epsilon_max"] for r in rows])),
        "seed_results": rows,
        "noise_ladder": eps_grid.tolist(),
        "generic_resolved_counts": generic_counts,
        "oracle_resolved_counts": oracle_counts,
    }
    json.dump(result, open("frozen_gate_bank_matched_filter.json", "w"), indent=2)

    order = np.argsort(gate_times)
    fig, ax = plt.subplots(2, 2, figsize=(12.8, 9.2), constrained_layout=True)
    im = ax[0, 0].imshow(covariance[np.ix_(order, order)], vmin=0, vmax=1,
                         cmap="viridis", origin="lower")
    labels = [f"{gate_times[i]:.3g}" for i in order]
    ax[0, 0].set_xticks(range(6), labels, rotation=40)
    ax[0, 0].set_yticks(range(6), labels)
    ax[0, 0].set(xlabel="gate T", ylabel="gate T",
                 title="Frozen log-stationary covariance")
    fig.colorbar(im, ax=ax[0, 0], label="correlation")

    ax[0, 1].bar(np.arange(6), generic_w[order], color="#2166ac")
    ax[0, 1].set_xticks(range(6), labels, rotation=40)
    ax[0, 1].set(xlabel="gate T", ylabel="unit-variance weight",
                 title="Preregistered high-tail matched filter")

    x = np.arange(len(rows))
    generic_thr = np.array([r["generic_guarded_epsilon_max"] for r in rows])
    oracle_thr = np.array([r["oracle_guarded_epsilon_max"] for r in rows])
    ax[1, 0].scatter(x, generic_thr, label="single generic filter", color="#1a9850")
    ax[1, 0].scatter(x, oracle_thr, label="per-seed oracle ceiling", color="#762a83")
    ax[1, 0].axhline(EPS_REFERENCE, color="#b2182b", ls="--", label="current noise")
    ax[1, 0].set_yscale("log")
    ax[1, 0].set(xlabel="fixed tail seed index", ylabel="guarded maximum epsilon",
                 title="Precision burden after whitening")
    ax[1, 0].legend(frameon=False, fontsize=8)

    ax[1, 1].step(eps_grid, generic_counts, where="mid", label="generic", color="#1a9850")
    ax[1, 1].step(eps_grid, oracle_counts, where="mid", label="oracle ceiling", color="#762a83")
    ax[1, 1].axhline(12, color="black", ls=":")
    ax[1, 1].axvline(EPS_REFERENCE, color="#b2182b", ls="--")
    ax[1, 1].set_xscale("log"); ax[1, 1].invert_xaxis()
    ax[1, 1].set(xlabel="single-repeat noise epsilon", ylabel="tails above 1 sigma",
                 title="Frozen-bank coverage")
    ax[1, 1].legend(frameon=False)

    fig.suptitle("Class P diagnostic: covariance-whitened frozen gate bank", fontsize=15)
    fig.savefig("frozen_gate_bank_matched_filter.png", dpi=180)
    fig.savefig("frozen_gate_bank_matched_filter.svg")
    print(json.dumps({k: v for k, v in result.items()
                      if k not in ("seed_results", "noise_ladder", "generic_resolved_counts", "oracle_resolved_counts")}, indent=2))


if __name__ == "__main__":
    main()
