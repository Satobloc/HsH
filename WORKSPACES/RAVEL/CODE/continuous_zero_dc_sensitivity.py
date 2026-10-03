"""Discretization sensitivity for the smooth zero-DC oracle ceiling."""

import json

import numpy as np
from scipy.interpolate import BSpline
from scipy.linalg import cho_factor, cho_solve, null_space

from continuous_zero_dc_readout import (
    DF_VARIANCE, EPS_REFERENCE, LOG_CORR_LENGTH, R, STD_GUARD_95,
    T_MAX, T_MIN, TAU,
)


def basis(u, n_basis, degree=3):
    internal = np.linspace(u[0], u[-1], n_basis - degree - 1 + 2)[1:-1]
    knots = np.r_[np.repeat(u[0], degree + 1), internal,
                  np.repeat(u[-1], degree + 1)]
    return np.column_stack([
        BSpline(knots, np.eye(n_basis)[j], degree)(u) for j in range(n_basis)
    ])


def guarded(amplitude, old):
    needed = np.sqrt(max(0.0, 1.0 - old**2))
    return float(amplitude * np.sqrt(R / 2) / needed / STD_GUARD_95)


def run(n_time, n_basis, ridge_scale, records):
    time = np.geomspace(T_MIN, T_MAX, n_time)
    u = np.log(time)
    q = np.empty_like(time)
    q[1:-1] = (time[2:] - time[:-2]) / 2
    q[0] = (time[1] - time[0]) / 2
    q[-1] = (time[-1] - time[-2]) / 2
    B = basis(u, n_basis)
    A = q[:, None] * B
    C = np.exp(-np.abs(u[:, None] - u[None, :]) / LOG_CORR_LENGTH)
    M = A.T @ C @ A
    Z = null_space((A.T @ np.ones(n_time))[None, :])
    Mz = Z.T @ M @ Z
    ridge = ridge_scale * np.trace(Mz) / len(Mz)
    Mzr = Mz + ridge * np.eye(len(Mz))
    cf = cho_factor(Mzr, lower=True)
    H = np.exp(-time[:, None] / TAU[None, :]) / TAU[None, :]
    thresholds = []
    for record in records:
        delta = np.asarray(record["delta"])
        c = Z.T @ A.T @ (H @ delta)
        amp = np.sqrt(max(0.0, c @ cho_solve(cf, c)))
        thresholds.append(guarded(amp, float(record["whitened_response_sigma"])))
    thresholds = np.sort(thresholds)
    return {
        "n_time": n_time,
        "n_basis": n_basis,
        "ridge_scale": ridge_scale,
        "condition_number": float(np.linalg.cond(Mzr)),
        "oracle_guarded_boundary_12_of_13": float(thresholds[1]),
        "oracle_guarded_boundary_13_of_13": float(thresholds[0]),
        "oracle_best_seed_boundary": float(thresholds[-1]),
        "resolved_at_reference": int(np.sum(thresholds >= EPS_REFERENCE)),
    }


def main():
    records = json.load(open("spectral_causal_zero_nullspace.json"))["seed_results"]
    cases = []
    for n_time in (200, 320, 500):
        for n_basis in (12, 18, 24, 30):
            for ridge in (1e-10, 1e-12, 1e-14):
                cases.append(run(n_time, n_basis, ridge, records))
    out = {
        "status": "GEN/NUMERICAL-SENSITIVITY",
        "fixed_architecture": "cubic log-time B-spline, exact zero DC, one-octave log-time OU covariance",
        "reference_epsilon": EPS_REFERENCE,
        "cases": cases,
        "maximum_oracle_12_of_13_over_grid": max(c["oracle_guarded_boundary_12_of_13"] for c in cases),
        "maximum_best_seed_over_grid": max(c["oracle_best_seed_boundary"] for c in cases),
        "maximum_resolved_at_reference_over_grid": max(c["resolved_at_reference"] for c in cases),
    }
    json.dump(out, open("continuous_zero_dc_sensitivity.json", "w"), indent=2)
    print(json.dumps({k: v for k, v in out.items() if k != "cases"}, indent=2))


if __name__ == "__main__":
    main()
