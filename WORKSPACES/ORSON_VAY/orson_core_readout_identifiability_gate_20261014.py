#!/usr/bin/env python3
"""Orson Vay: finite-core versus readout-blur identifiability gate.

Ravel CF033 gives, for Mercer's shrinking hollow profile,

  R_obs,j^2(eta) = L_eta^2 (R0^2 + 3 lambda^2)
                     + 3 c0^2 + 3 s_j^2,
  L_eta=(a eta)^(-1/4).

Here lambda is a co-moving core width in scaled coordinates, c0 a fixed
object-core width, and s_j an instrument/readout Gaussian width.  Therefore

  * R0^2 and 3 lambda^2 multiply the same eta^(-1/2) column;
  * 3 c0^2 and every unknown common readout variance occupy the same intercept;
  * with free instrument offsets v_j=3s_j^2, the design columns satisfy
        column(common intercept) = sum_j column(instrument j).

Radius-versus-eta data alone cannot assign these contributions to object or
readout.  The script verifies both null directions numerically, then shows
that calibrating one instrument variance makes the fixed intercept estimable
(but does not by itself give that intercept an ontological interpretation).

Status: GEN/DERIVED identifiability mathematics; cognition/readout model only;
no claim about particle ontology or actual instruments.
"""

from __future__ import annotations

import json
import math

import numpy as np


R0 = 1.7484885900275715
A = 0.8
LAMBDA = 0.25
FIXED_CORE = 0.04
INSTRUMENT_SIGMA = np.array([0.02, 0.06])
NOISE_SD_Y = 2.0e-4
SEED = 20_261_014


def design_and_truth(fixed_core: float = FIXED_CORE):
    eta = np.logspace(2.0, 12.0, 30)
    x = (A * eta) ** (-0.5)  # L_eta^2
    rows = []
    truth = []
    instrument = []
    slope = R0**2 + 3.0 * LAMBDA**2
    common = 3.0 * fixed_core**2
    offsets = 3.0 * INSTRUMENT_SIGMA**2
    for j in range(2):
        for value in x:
            rows.append([value, 1.0, float(j == 0), float(j == 1)])
            truth.append(slope * value + common + offsets[j])
            instrument.append(j)
    return (
        eta,
        x,
        np.asarray(rows),
        np.asarray(truth),
        np.asarray(instrument),
        slope,
        common,
        offsets,
    )


def calibrated_fit(y: np.ndarray, x_all: np.ndarray, instrument: np.ndarray, v0: float):
    # Subtract calibrated instrument-0 variance from every row.  Instrument 1
    # then carries only its offset difference relative to instrument 0.
    design = np.column_stack((x_all, np.ones_like(x_all), (instrument == 1).astype(float)))
    target = y - v0
    beta, *_ = np.linalg.lstsq(design, target, rcond=None)
    covariance = NOISE_SD_Y**2 * np.linalg.inv(design.T @ design)
    se = np.sqrt(np.diag(covariance))
    return design, beta, se


def main() -> None:
    eta, x, design, y_exact, instrument, slope, common, offsets = design_and_truth()
    singular_values = np.linalg.svd(design, compute_uv=False)
    rank = int(np.linalg.matrix_rank(design))
    declared_null = np.array([0.0, 1.0, -1.0, -1.0])
    null_residual = float(np.linalg.norm(design @ declared_null))

    # An explicit redistribution between fixed core and both readout offsets
    # leaves every prediction unchanged.
    theta = np.array([slope, common, offsets[0], offsets[1]])
    delta = 1.0e-3
    theta_shifted = theta + delta * declared_null
    prediction_shift = float(np.max(np.abs(design @ theta - design @ theta_shifted)))

    # The co-moving core and unsmoothed source radius are likewise aliased.
    co_design = np.column_stack((np.tile(x, 2), 3.0 * np.tile(x, 2)))
    co_rank = int(np.linalg.matrix_rank(co_design))
    co_null = np.array([3.0, -1.0])
    co_null_residual = float(np.linalg.norm(co_design @ co_null))

    # Actually execute one noisy calibrated recovery.
    rng = np.random.default_rng(SEED)
    noisy = y_exact + rng.normal(0.0, NOISE_SD_Y, size=y_exact.size)
    x_all = design[:, 0]
    calibrated_design, beta, se = calibrated_fit(noisy, x_all, instrument, offsets[0])
    u_hat = float(beta[1])
    u_ci = (u_hat - 1.959963984540054 * se[1], u_hat + 1.959963984540054 * se[1])
    core_hat = math.sqrt(max(u_hat, 0.0) / 3.0)
    core_se = se[1] / (6.0 * core_hat)
    core_ci = (
        core_hat - 1.959963984540054 * core_se,
        core_hat + 1.959963984540054 * core_se,
    )

    # Zero-fixed-core negative control with a separate executed noise stream.
    _, _, _, y_zero, inst_zero, _, common_zero, offsets_zero = design_and_truth(0.0)
    rng_zero = np.random.default_rng(SEED + 1)
    noisy_zero = y_zero + rng_zero.normal(0.0, NOISE_SD_Y, size=y_zero.size)
    _, beta_zero, se_zero = calibrated_fit(noisy_zero, x_all, inst_zero, offsets_zero[0])
    zero_ci = (
        float(beta_zero[1] - 1.959963984540054 * se_zero[1]),
        float(beta_zero[1] + 1.959963984540054 * se_zero[1]),
    )

    assert rank == 3
    assert null_residual < 1e-14
    assert prediction_shift < 2e-17
    assert co_rank == 1
    assert co_null_residual < 1e-14
    assert np.linalg.matrix_rank(calibrated_design) == 3
    assert u_ci[0] < common < u_ci[1]
    assert zero_ci[0] < common_zero < zero_ci[1]

    payload = {
        "status": (
            "GEN/DERIVED identifiability mathematics; cognition/readout model only; "
            "no particle ontology or instrument claim"
        ),
        "fixture": {
            "eta_range": [float(eta[0]), float(eta[-1])],
            "eta_points_per_instrument": int(eta.size),
            "R0": R0,
            "a": A,
            "comoving_core_lambda": LAMBDA,
            "fixed_core": FIXED_CORE,
            "instrument_sigmas": INSTRUMENT_SIGMA.tolist(),
            "executed_noise_sd_in_squared_radius": NOISE_SD_Y,
            "seed": SEED,
        },
        "uncalibrated_fixed_core_readout_alias": {
            "design_shape": list(design.shape),
            "rank": rank,
            "parameter_count": int(design.shape[1]),
            "singular_values": singular_values.tolist(),
            "null_vector_parameters_slope_common_v0_v1": declared_null.tolist(),
            "null_residual": null_residual,
            "explicit_delta": delta,
            "maximum_prediction_change": prediction_shift,
        },
        "comoving_core_profile_alias": {
            "rank": co_rank,
            "parameter_count": 2,
            "null_vector_R0sq_lambda_sq": co_null.tolist(),
            "null_residual": co_null_residual,
            "identified_combination": "R0^2+3 lambda^2",
        },
        "one_instrument_calibrated_recovery": {
            "true_parameters_slope_common_delta_v1v0": [
                slope, common, offsets[1] - offsets[0]
            ],
            "estimated_parameters": beta.tolist(),
            "standard_errors": se.tolist(),
            "fixed_variance_estimate": u_hat,
            "fixed_variance_95ci": list(u_ci),
            "fixed_core_width_estimate": core_hat,
            "fixed_core_width_95ci_delta": list(core_ci),
        },
        "zero_fixed_core_negative_control": {
            "true_common_variance": common_zero,
            "estimated_common_variance": float(beta_zero[1]),
            "common_variance_95ci": list(zero_ci),
        },
        "conclusion": (
            "Radius scaling cannot decide whether a shared width belongs to the "
            "modeled object or the resolving apparatus. Independent calibration "
            "can estimate a residual width, but assigning it to object geometry "
            "still requires an additional discriminator or explicit model premise."
        ),
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
