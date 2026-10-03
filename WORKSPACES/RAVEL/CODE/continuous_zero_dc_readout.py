"""Blind smooth temporal readout for the unresolved spectral tail.

The filter is chosen before inspecting any injected tail.  It is a cubic
B-spline on log time, has exact zero response to a constant tare, unit output
variance under the frozen one-octave OU covariance, and maximizes leverage on
tau>12 after projection away from the existing pole/residue row space.

A per-seed oracle over the *same* smooth basis is reported only as a feasibility
ceiling.  If that oracle cannot close the current epsilon=3e-4 gap, no linear
readout in this declared temporal architecture can do so.
"""

import json

import matplotlib.pyplot as plt
import numpy as np
from scipy.interpolate import BSpline
from scipy.linalg import cho_factor, cho_solve, eigh, null_space
from scipy.stats import chi2

from spectral_causal_zero_nullspace import calibrated_repeats, whitened_jacobian

SEED = 740024
TAU = np.geomspace(0.01, 48.0, 97)
T_MIN, T_MAX = 0.015, 192.0
N_TIME, N_BASIS, DEGREE = 320, 18, 3
TAU_EDGE = 12.0
LOG_CORR_LENGTH = np.log(2.0)
SV_FLOOR = 1.0
R = 192
EPS_REFERENCE = 3e-4
DF_VARIANCE = 2 * (R - 1)
STD_GUARD_95 = float(np.sqrt(chi2.ppf(.975, DF_VARIANCE) / DF_VARIANCE))


def bspline_basis(u, n_basis=N_BASIS, degree=DEGREE):
    n_internal = n_basis - degree - 1
    internal = np.linspace(u[0], u[-1], n_internal + 2)[1:-1]
    knots = np.r_[np.repeat(u[0], degree + 1), internal,
                  np.repeat(u[-1], degree + 1)]
    eye = np.eye(n_basis)
    return np.column_stack([BSpline(knots, eye[j], degree)(u)
                            for j in range(n_basis)])


def threshold(signal_norm, old_sigma, guarded=False):
    needed = np.sqrt(max(0.0, 1.0 - old_sigma**2))
    point = np.inf if needed == 0 else signal_norm * np.sqrt(R / 2.0) / needed
    return float(point / STD_GUARD_95 if guarded else point)


def coverage_boundary(rows, key, required):
    values = np.sort([row[key] for row in rows])
    return float(values[len(values) - required])


def main():
    # Measurement time is sampled uniformly in log time.  The trapezoid
    # weights make A beta approximate integral w(t)x(t)dt.
    time = np.geomspace(T_MIN, T_MAX, N_TIME)
    u = np.log(time)
    q = np.empty_like(time)
    q[1:-1] = (time[2:] - time[:-2]) / 2
    q[0] = (time[1] - time[0]) / 2
    q[-1] = (time[-1] - time[-2]) / 2
    B = bspline_basis(u)
    A = q[:, None] * B

    # Frozen stationary noise model, identical in form and correlation length
    # to the preceding six-gate calculation.
    C = np.exp(-np.abs(u[:, None] - u[None, :]) / LOG_CORR_LENGTH)
    M = A.T @ C @ A
    M = (M + M.T) / 2

    # Exact constant/tare annihilation.  Z spans the admissible coefficient
    # space and removes one degree of freedom from the 18-basis architecture.
    dc = A.T @ np.ones(N_TIME)
    Z = null_space(dc[None, :])
    Mz = Z.T @ M @ Z
    ridge = 1e-12 * np.trace(Mz) / len(Mz)
    Mz_reg = Mz + ridge * np.eye(len(Mz))

    # Existing identifiable pole/residue row space, frozen from the prior
    # calibrated operator.  No injected tail participates in this step.
    _, stats = calibrated_repeats(SEED, TAU)
    J, shrinkage = whitened_jacobian(stats)
    _, s, vt = np.linalg.svd(J, full_matrices=False)
    rank = int(np.sum(s >= SV_FLOOR))
    Vold = vt[:rank].T
    Pperp = np.eye(len(TAU)) - Vold @ Vold.T

    # h(t;tau) is the causal relaxation impulse response.  It integrates over
    # [T,2T] to the exact frozen-gate kernel used in prior runs.
    H = np.exp(-time[:, None] / TAU[None, :]) / TAU[None, :]
    tail = TAU > TAU_EDGE
    D = np.diag(tail.astype(float))
    Q = A.T @ H @ Pperp @ D @ Pperp @ H.T @ A
    Q = (Q + Q.T) / 2
    Qz = Z.T @ Q @ Z
    values, vectors = eigh(Qz, Mz_reg)
    zbeta = vectors[:, -1]
    beta = Z @ zbeta
    beta /= np.sqrt(beta @ M @ beta)
    # Fix the physically irrelevant global sign for reproducibility.
    if (B @ beta)[-1] < 0:
        beta *= -1

    w = B @ beta
    a = A @ beta
    kernel = H.T @ a
    projected_kernel = Pperp @ kernel
    dc_residual = float(np.sum(a))
    noise_norm = float(np.sqrt(a @ C @ a))
    novelty = float(np.linalg.norm(projected_kernel) / np.linalg.norm(kernel))
    tail_fraction = float(np.sum(projected_kernel[tail] ** 2) /
                          np.sum(projected_kernel ** 2))

    null = json.load(open("spectral_causal_zero_nullspace.json"))
    cf = cho_factor(Mz_reg, lower=True, check_finite=True)
    rows = []
    for record in null["seed_results"]:
        delta = np.asarray(record["delta"], float)
        old = float(record["whitened_response_sigma"])
        selected_amplitude = float(abs(kernel @ delta))

        # Seed-specific best possible filter in the same smooth, zero-DC,
        # unit-noise space.  This is not an implementable selected readout.
        time_signal = H @ delta
        c = Z.T @ A.T @ time_signal
        oracle_amplitude = float(np.sqrt(max(0.0, c @ cho_solve(cf, c))))
        rows.append({
            "seed": int(record["seed"]),
            "existing_response_sigma": old,
            "selected_filter_amplitude": selected_amplitude,
            "oracle_filter_amplitude": oracle_amplitude,
            "selected_guarded_epsilon_max": threshold(selected_amplitude, old, True),
            "oracle_guarded_epsilon_max": threshold(oracle_amplitude, old, True),
        })

    eps_grid = np.geomspace(1e-6, 1e-3, 241)
    selected_counts, oracle_counts = [], []
    for eps in eps_grid:
        selected_counts.append(int(sum(
            np.hypot(r["existing_response_sigma"],
                     r["selected_filter_amplitude"] / (np.sqrt(2/R)*eps)) >= 1
            for r in rows)))
        oracle_counts.append(int(sum(
            np.hypot(r["existing_response_sigma"],
                     r["oracle_filter_amplitude"] / (np.sqrt(2/R)*eps)) >= 1
            for r in rows)))

    result = {
        "status": "GEN/CANDIDATE",
        "question": "Can a smooth zero-DC continuous temporal weighting recover the unresolved tau>12 tail at the current noise without retuning the tail specimens?",
        "object": "one scalar finite-duration temporal readout functional on the resolving intersection history",
        "domain": [T_MIN, T_MAX],
        "basis": {"type": "cubic B-spline in log time", "count": N_BASIS,
                  "degree": DEGREE, "admissible_dimension_after_zero_dc": int(Z.shape[1])},
        "impulse_response": "h(t;tau)=exp(-t/tau)/tau",
        "selection_rule": "maximize projected tau>12 spectral-kernel energy outside the frozen pole/residue row space, before reading any seed delta",
        "noise_covariance": "C(t,t')=exp(-|log(t/t')|/log(2))",
        "normalization": "integral integral w(t)C(t,t')w(t')dt dt'=1",
        "zero_dc_constraint": "integral w(t)dt=0",
        "zero_dc_numerical_residual": dc_residual,
        "unit_noise_numerical_norm": noise_norm,
        "existing_effective_rank": rank,
        "calibration_covariance_shrinkage": shrinkage,
        "spectral_kernel_novelty_sine": novelty,
        "projected_kernel_tail_energy_fraction": tail_fraction,
        "generalized_eigenvalue": float(values[-1]),
        "basis_noise_condition_number": float(np.linalg.cond(Mz_reg)),
        "ridge_relative_to_mean_diagonal": 1e-12,
        "repeats_per_specimen_and_tare": R,
        "reference_single_repeat_noise": EPS_REFERENCE,
        "std_guard_factor_95pct": STD_GUARD_95,
        "selected_guarded_boundary_12_of_13": coverage_boundary(rows, "selected_guarded_epsilon_max", 12),
        "selected_guarded_boundary_13_of_13": coverage_boundary(rows, "selected_guarded_epsilon_max", 13),
        "oracle_guarded_boundary_12_of_13": coverage_boundary(rows, "oracle_guarded_epsilon_max", 12),
        "oracle_guarded_boundary_13_of_13": coverage_boundary(rows, "oracle_guarded_epsilon_max", 13),
        "selected_resolved_at_reference": int(sum(r["selected_guarded_epsilon_max"] >= EPS_REFERENCE for r in rows)),
        "oracle_resolved_at_reference": int(sum(r["oracle_guarded_epsilon_max"] >= EPS_REFERENCE for r in rows)),
        "failure_condition": "oracle resolves fewer than 12 of 13 fixed tails at epsilon=3e-4",
        "time": time.tolist(),
        "weight": w.tolist(),
        "quadrature_coefficients": a.tolist(),
        "tau": TAU.tolist(),
        "spectral_kernel": kernel.tolist(),
        "projected_spectral_kernel": projected_kernel.tolist(),
        "seed_results": rows,
        "noise_ladder": eps_grid.tolist(),
        "selected_resolved_counts": selected_counts,
        "oracle_resolved_counts": oracle_counts,
    }
    with open("continuous_zero_dc_readout.json", "w") as f:
        json.dump(result, f, indent=2)

    fig, ax = plt.subplots(2, 2, figsize=(12.8, 9.2), constrained_layout=True)
    ax[0, 0].plot(time, w, color="#2166ac", lw=1.8)
    ax[0, 0].axhline(0, color="black", lw=.7)
    ax[0, 0].set_xscale("log")
    ax[0, 0].set(xlabel="time t", ylabel="weight w(t)",
                 title=f"Smooth temporal weight; DC residual {dc_residual:.1e}")

    ax[0, 1].plot(TAU, kernel, label="full kernel", color="#2166ac")
    ax[0, 1].plot(TAU, projected_kernel, label="outside old row space", color="#d73027")
    ax[0, 1].axvspan(TAU_EDGE, TAU.max(), alpha=.12, color="#1a9850", label="declared tail")
    ax[0, 1].set_xscale("log")
    ax[0, 1].set(xlabel="relaxation time tau", ylabel="spectral kernel",
                 title="Blind projected tail leverage")
    ax[0, 1].legend(frameon=False, fontsize=8)

    x = np.arange(len(rows))
    sel = np.array([r["selected_guarded_epsilon_max"] for r in rows])
    ora = np.array([r["oracle_guarded_epsilon_max"] for r in rows])
    ax[1, 0].scatter(x, sel, label="selected filter", color="#1a9850")
    ax[1, 0].scatter(x, ora, label="same-basis oracle", color="#762a83")
    ax[1, 0].axhline(EPS_REFERENCE, color="#b2182b", ls="--", label="current noise")
    ax[1, 0].set_yscale("log")
    ax[1, 0].set(xlabel="fixed tail seed index", ylabel="guarded maximum epsilon",
                 title="Precision burden")
    ax[1, 0].legend(frameon=False, fontsize=8)

    ax[1, 1].step(eps_grid, selected_counts, where="mid", label="selected", color="#1a9850")
    ax[1, 1].step(eps_grid, oracle_counts, where="mid", label="oracle ceiling", color="#762a83")
    ax[1, 1].axhline(12, color="black", ls=":")
    ax[1, 1].axvline(EPS_REFERENCE, color="#b2182b", ls="--")
    ax[1, 1].set_xscale("log")
    ax[1, 1].invert_xaxis()
    ax[1, 1].set(xlabel="single-repeat noise epsilon", ylabel="tails above 1 sigma",
                 title="Continuous-filter coverage")
    ax[1, 1].legend(frameon=False, fontsize=8)
    fig.suptitle("Class P diagnostic: smooth zero-DC temporal readout", fontsize=15)
    fig.savefig("continuous_zero_dc_readout.png", dpi=180)
    fig.savefig("continuous_zero_dc_readout.svg")

    compact = {k: v for k, v in result.items() if k not in {
        "time", "weight", "quadrature_coefficients", "tau", "spectral_kernel",
        "projected_spectral_kernel", "seed_results", "noise_ladder",
        "selected_resolved_counts", "oracle_resolved_counts"}}
    print(json.dumps(compact, indent=2))


if __name__ == "__main__":
    main()
