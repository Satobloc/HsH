"""Tare-calibrated nonlinear first-passage readout for the frozen 13 tails.

The specimen ensemble, relaxation support, repeat count, and covariance family
remain unchanged.  Thresholds are determined from null/tare histories only.
Tail outcomes enter only after the threshold is frozen.
"""

import json

import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import brentq
from scipy.stats import binom, norm

from spectral_causal_zero_nullspace import calibrated_repeats, whitened_jacobian

SEED = 2026100314
NULL_CALIBRATION = 60000
NULL_VALIDATION = 60000
POWER_DRAWS = 30000
N_TIME = 320
T_MIN, T_MAX = 0.015, 192.0
LOG_CORR_LENGTH = np.log(2.0)
R = 192
EPS_REFERENCE = 3e-4
ALPHA = 0.05
THRESHOLD_CONFIDENCE = 0.95
TARGET_POWER = 0.80
TAU = np.geomspace(0.01, 48.0, 97)


def ou_paths(rng, n, n_time=N_TIME):
    """Unit-variance OU paths on the fixed uniform log-time grid."""
    du = np.log(T_MAX / T_MIN) / (n_time - 1)
    rho = np.exp(-du / LOG_CORR_LENGTH)
    sd = np.sqrt(1.0 - rho * rho)
    z = np.empty((n, n_time), dtype=np.float32)
    z[:, 0] = rng.standard_normal(n)
    for j in range(1, n_time):
        z[:, j] = rho * z[:, j - 1] + sd * rng.standard_normal(n)
    return z, rho


def first_passage_power(noise, signal, epsilon, boundary):
    sigma = np.sqrt(2.0 / R) * epsilon
    crossed = np.abs(noise + signal[None, :] / sigma) >= boundary
    hit = np.any(crossed, axis=1)
    first = np.argmax(crossed, axis=1)
    return float(np.mean(hit)), first[hit]


def epsilon_for_power(noise, signal, boundary, target=TARGET_POWER):
    """Largest epsilon attaining target power, by fixed-noise bisection."""
    lo, hi = 1e-8, 1e-3
    for _ in range(22):
        mid = np.sqrt(lo * hi)
        p, _ = first_passage_power(noise, signal, mid, boundary)
        if p >= target:
            lo = mid
        else:
            hi = mid
    return float(lo)


def terminal_power(signal_last, epsilon, boundary):
    mu = abs(signal_last) / (np.sqrt(2.0 / R) * epsilon)
    return float(norm.sf(boundary - mu) + norm.cdf(-boundary - mu))


def terminal_epsilon_for_power(signal_last, boundary):
    f = lambda eps: terminal_power(signal_last, eps, boundary) - TARGET_POWER
    return float(brentq(f, 1e-9, 1e-2))


def boundary_12_of_13(values):
    return float(np.sort(values)[1])


def main():
    rng = np.random.default_rng(SEED)
    time = np.geomspace(T_MIN, T_MAX, N_TIME)

    # Freeze familywise threshold from tare histories, then validate on an
    # independent null batch before any tail is exposed.
    null_cal, rho = ou_paths(rng, NULL_CALIBRATION)
    null_max = np.max(np.abs(null_cal), axis=1)
    # One-sided nonparametric confidence guard for the (1-alpha) quantile.
    # If U_(k) is the transformed kth order statistic, then
    # P[U_(k) >= 1-alpha] = P[Bin(n,1-alpha) <= k-1].
    order_k = int(binom.ppf(THRESHOLD_CONFIDENCE, NULL_CALIBRATION,
                            1.0 - ALPHA)) + 1
    crossing_boundary = float(np.sort(null_max)[order_k - 1])
    del null_cal
    null_val, _ = ou_paths(rng, NULL_VALIDATION)
    validation_false_alarm = float(np.mean(np.max(np.abs(null_val), axis=1) >= crossing_boundary))
    del null_val

    # Fixed common draws give stable paired power comparisons and bisections.
    power_noise, _ = ou_paths(rng, POWER_DRAWS)
    terminal_boundary = float(norm.ppf(1.0 - ALPHA / 2.0))

    frozen = json.load(open("spectral_causal_zero_nullspace.json"))
    impulse = np.exp(-time[:, None] / TAU[None, :]) / TAU[None, :]
    occupancy = 1.0 - np.exp(-time[:, None] / TAU[None, :])

    # Diagnose whether the apparently stronger endpoint channel is genuinely
    # independent or mostly a total-mass/gain direction already represented by
    # the calibrated pole/residue experiment.
    _, stats = calibrated_repeats(740024, TAU)
    J, _ = whitened_jacobian(stats)
    _, singular, vt = np.linalg.svd(J, full_matrices=False)
    old_rank = int(np.sum(singular >= 1.0))
    V_old = vt[:old_rank].T
    P_perp = np.eye(len(TAU)) - V_old @ V_old.T
    terminal_kernel = occupancy[-1]
    terminal_unit = terminal_kernel / np.linalg.norm(terminal_kernel)
    terminal_novelty = float(np.linalg.norm(P_perp @ terminal_unit))

    rows = []
    for record in frozen["seed_results"]:
        delta = np.asarray(record["delta"], float)
        s_impulse = impulse @ delta
        s_occupancy = occupancy @ delta

        p_cross, first = first_passage_power(
            power_noise, s_occupancy, EPS_REFERENCE, crossing_boundary)
        p_impulse, _ = first_passage_power(
            power_noise, s_impulse, EPS_REFERENCE, crossing_boundary)
        eps_cross = epsilon_for_power(power_noise, s_occupancy, crossing_boundary)
        p_terminal = terminal_power(s_occupancy[-1], EPS_REFERENCE, terminal_boundary)
        eps_terminal = terminal_epsilon_for_power(s_occupancy[-1], terminal_boundary)

        rows.append({
            "seed": int(record["seed"]),
            "existing_response_sigma": float(record["whitened_response_sigma"]),
            "occupancy_signal_endpoint": float(s_occupancy[-1]),
            "occupancy_signal_peak_abs": float(np.max(np.abs(s_occupancy))),
            "impulse_signal_peak_abs": float(np.max(np.abs(s_impulse))),
            "occupancy_first_passage_power_at_reference": p_cross,
            "impulse_first_passage_power_at_reference": p_impulse,
            "occupancy_first_passage_epsilon_at_80pct_power": eps_cross,
            "terminal_occupancy_power_at_reference": p_terminal,
            "terminal_occupancy_epsilon_at_80pct_power": eps_terminal,
            "median_first_passage_time_at_reference_given_hit": (
                float(np.median(time[first])) if len(first) else None),
            "occupancy_signal": s_occupancy.tolist(),
            "impulse_signal": s_impulse.tolist(),
        })

    cross_eps = [r["occupancy_first_passage_epsilon_at_80pct_power"] for r in rows]
    terminal_eps = [r["terminal_occupancy_epsilon_at_80pct_power"] for r in rows]
    result = {
        "status": "GEN/CANDIDATE structured readout failure",
        "question": "Can a tare-only thresholded first-passage time recover 12 of 13 frozen relaxation tails at the current noise after smooth linear weighting failed?",
        "object": "nonlinear event-time readout of a directly sampled cumulative intersection-state history",
        "state_kernel": "Q(t;tau)=1-exp(-t/tau)",
        "comparison_kernel": "h(t;tau)=exp(-t/tau)/tau",
        "readout": "T_cross=inf{t: |Y(t)-Y_tare(t)| >= b_alpha sigma_eff}",
        "noise_covariance": "stationary OU in log time with one-octave correlation length",
        "log_time_adjacent_correlation": rho,
        "repeats_per_specimen_and_tare": R,
        "reference_single_repeat_noise": EPS_REFERENCE,
        "effective_history_noise_at_reference": float(np.sqrt(2.0 / R) * EPS_REFERENCE),
        "alpha_familywise": ALPHA,
        "threshold_quantile_confidence": THRESHOLD_CONFIDENCE,
        "threshold_order_statistic_k": order_k,
        "crossing_boundary_sigma": crossing_boundary,
        "terminal_boundary_sigma": terminal_boundary,
        "existing_effective_row_rank": old_rank,
        "terminal_occupancy_row_space_novelty_sine": terminal_novelty,
        "tare_calibration_histories": NULL_CALIBRATION,
        "independent_tare_validation_histories": NULL_VALIDATION,
        "validation_false_alarm_rate": validation_false_alarm,
        "power_histories_per_seed": POWER_DRAWS,
        "target_power": TARGET_POWER,
        "first_passage_resolved_at_reference": int(sum(
            r["occupancy_first_passage_power_at_reference"] >= TARGET_POWER for r in rows)),
        "impulse_crossing_resolved_at_reference": int(sum(
            r["impulse_first_passage_power_at_reference"] >= TARGET_POWER for r in rows)),
        "terminal_occupancy_resolved_at_reference": int(sum(
            r["terminal_occupancy_power_at_reference"] >= TARGET_POWER for r in rows)),
        "first_passage_epsilon_boundary_12_of_13_at_80pct_power": boundary_12_of_13(cross_eps),
        "terminal_epsilon_boundary_12_of_13_at_80pct_power": boundary_12_of_13(terminal_eps),
        "failure_condition": "fewer than 12 of 13 fixed tails attain 80% power at alpha=0.05 and epsilon=3e-4",
        "time": time.tolist(),
        "null_max_abs_calibration": null_max.tolist(),
        "seed_results": rows,
    }
    with open("nonlinear_first_passage_readout.json", "w") as f:
        json.dump(result, f, indent=2)

    fig, ax = plt.subplots(2, 2, figsize=(12.8, 9.2), constrained_layout=True)
    sigma_ref = np.sqrt(2.0 / R) * EPS_REFERENCE
    for row in rows:
        ax[0, 0].plot(time, np.asarray(row["occupancy_signal"]) / sigma_ref,
                      alpha=.7, lw=1)
    ax[0, 0].axhline(crossing_boundary, color="#b2182b", ls="--")
    ax[0, 0].axhline(-crossing_boundary, color="#b2182b", ls="--")
    ax[0, 0].set_xscale("log")
    ax[0, 0].set(xlabel="time t", ylabel="mean occupancy displacement / sigma",
                 title="Frozen cumulative-state histories")

    ax[0, 1].hist(null_max, bins=80, density=True, color="#92c5de", alpha=.85)
    ax[0, 1].axvline(crossing_boundary, color="#b2182b", ls="--",
                     label=f"tare-only 95% boundary = {crossing_boundary:.3f}")
    ax[0, 1].set(xlabel="max_t |tare history| / sigma", ylabel="density",
                 title=f"Independent false alarm = {validation_false_alarm:.3%}")
    ax[0, 1].legend(frameon=False, fontsize=8)

    x = np.arange(len(rows))
    p_cross = [r["occupancy_first_passage_power_at_reference"] for r in rows]
    p_terminal = [r["terminal_occupancy_power_at_reference"] for r in rows]
    p_impulse = [r["impulse_first_passage_power_at_reference"] for r in rows]
    ax[1, 0].plot(x, p_cross, "o-", label="occupancy first passage", color="#762a83")
    ax[1, 0].plot(x, p_terminal, "s-", label="terminal occupancy", color="#1a9850")
    ax[1, 0].plot(x, p_impulse, ".-", label="impulse first passage", color="#2166ac")
    ax[1, 0].axhline(TARGET_POWER, color="black", ls=":")
    ax[1, 0].set(xlabel="fixed tail seed index", ylabel="detection probability",
                 title="Power at current noise", ylim=(0, 1.03))
    ax[1, 0].legend(frameon=False, fontsize=8)

    ax[1, 1].scatter(x, cross_eps, label="occupancy first passage", color="#762a83")
    ax[1, 1].scatter(x, terminal_eps, label="terminal occupancy", color="#1a9850")
    ax[1, 1].axhline(EPS_REFERENCE, color="#b2182b", ls="--", label="current noise")
    ax[1, 1].set_yscale("log")
    ax[1, 1].set(xlabel="fixed tail seed index", ylabel="max epsilon for 80% power",
                 title="Precision burden at 5% familywise false alarm")
    ax[1, 1].legend(frameon=False, fontsize=8)

    fig.suptitle("Class P diagnostic: tare-calibrated nonlinear first passage", fontsize=15)
    fig.savefig("nonlinear_first_passage_readout.png", dpi=180)
    fig.savefig("nonlinear_first_passage_readout.svg")

    compact = {k: v for k, v in result.items()
               if k not in {"time", "null_max_abs_calibration", "seed_results"}}
    print(json.dumps(compact, indent=2))


if __name__ == "__main__":
    main()
