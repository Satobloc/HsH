#!/usr/bin/env python3
"""Reproduce the CODATA 2022 evaluation of G from Table XXX.

Source: CODATA Recommended Values of the Fundamental Physical Constants: 2022,
Rev. Mod. Phys. 97, 025002 (2025), Table XXX and accompanying text.

Inputs are the 16 published laboratory determinations and the three published
nonzero correlation coefficients. Values and standard uncertainties are in
units of 1e-11 m^3 kg^-1 s^-2. The 3.9 uncertainty expansion factor is applied
only after forming the covariance matrix; it does not change the weighted mean.
This reproduces the published table-level evaluation, not raw laboratory data.
"""
from __future__ import annotations

import json
import numpy as np
from scipy.stats import chi2

NAMES = [
    "NIST-82", "TR&D-96", "LANL-97", "UWash-00", "BIPM-01", "UWup-02",
    "MSL-03", "HUST-05", "UZur-06", "HUST-09", "BIPM-14", "LENS-14",
    "UCI-14", "HUSTT-18", "HUSTA-18", "JILA-18",
]

# CODATA Table XXX, units 1e-11 m^3 kg^-1 s^-2.
VALUES = np.array([
    6.67248, 6.6729, 6.67398, 6.674255, 6.67559, 6.67422, 6.67387, 6.67222,
    6.67425, 6.67349, 6.67554, 6.67191, 6.67435, 6.674184, 6.674484, 6.67260,
], dtype=float)

# Parenthetical standard uncertainties from the same table, in table units.
UNCERTAINTIES = np.array([
    0.00043, 0.00050, 0.00070, 0.000092, 0.00027, 0.00098, 0.00027, 0.00087,
    0.00012, 0.00018, 0.00016, 0.00099, 0.00013, 0.000078, 0.000077, 0.00025,
], dtype=float)

CORRELATIONS = {
    ("NIST-82", "LANL-97"): 0.351,
    ("HUST-05", "HUST-09"): 0.134,
    ("HUST-09", "HUSTT-18"): 0.068,
}
EXPANSION_FACTOR = 3.9


def main() -> None:
    n = len(NAMES)
    assert n == 16 and len(VALUES) == n and len(UNCERTAINTIES) == n

    rho = np.eye(n)
    index = {name: i for i, name in enumerate(NAMES)}
    for (left, right), value in CORRELATIONS.items():
        i, j = index[left], index[right]
        rho[i, j] = rho[j, i] = value

    covariance = np.outer(UNCERTAINTIES, UNCERTAINTIES) * rho
    assert np.all(np.linalg.eigvalsh(covariance) > 0), "input covariance is not positive definite"

    ones = np.ones(n)
    inv_c_ones = np.linalg.solve(covariance, ones)
    mean = float((ones @ np.linalg.solve(covariance, VALUES)) / (ones @ inv_c_ones))
    u_unexpanded = float(np.sqrt(1.0 / (ones @ inv_c_ones)))

    expanded_covariance = covariance * EXPANSION_FACTOR**2
    residual = VALUES - mean
    chi2_value = float(residual @ np.linalg.solve(expanded_covariance, residual))
    dof = n - 1
    p_value = float(chi2.sf(chi2_value, dof))
    birge_ratio = float(np.sqrt(chi2_value / dof))

    normalized_residuals_before = residual / UNCERTAINTIES
    normalized_residuals_after = normalized_residuals_before / EXPANSION_FACTOR
    max_i = int(np.argmax(np.abs(normalized_residuals_after)))

    u_expanded = u_unexpanded * EXPANSION_FACTOR
    relative_u = u_expanded / mean

    output = {
        "source": "CODATA 2022, Rev. Mod. Phys. 97, 025002 (2025), Table XXX",
        "measurement_count": n,
        "table_units": "1e-11 m^3 kg^-1 s^-2",
        "correlations": [
            {"pair": [a, b], "rho": r} for (a, b), r in CORRELATIONS.items()
        ],
        "expansion_factor": EXPANSION_FACTOR,
        "weighted_mean_table_units": mean,
        "unexpanded_standard_uncertainty_table_units": u_unexpanded,
        "expanded_standard_uncertainty_table_units": u_expanded,
        "relative_standard_uncertainty": relative_u,
        "chi_square_after_expansion": chi2_value,
        "degrees_of_freedom": dof,
        "p_value_after_expansion": p_value,
        "Birge_ratio_after_expansion": birge_ratio,
        "max_abs_normalized_residual_before_expansion": float(np.max(np.abs(normalized_residuals_before))),
        "max_abs_normalized_residual_after_expansion": float(np.max(np.abs(normalized_residuals_after))),
        "largest_residual_source": NAMES[max_i],
        "largest_residual_after_expansion": float(normalized_residuals_after[max_i]),
        "SI_value": mean * 1e-11,
        "SI_standard_uncertainty": u_expanded * 1e-11,
        "classification": "table-level reproduction of evaluated input measurements; not raw laboratory reanalysis",
    }

    # CODATA rounding checks: 6.67430(15) x 1e-11, chi2 ~= 12.9, p ~= 0.61.
    assert abs(mean - 6.67430) < 5e-6
    assert abs(u_expanded - 0.00015) < 2.5e-6
    assert abs(chi2_value - 12.9) < 0.1
    assert abs(p_value - 0.61) < 0.02
    assert abs(birge_ratio - 0.93) < 0.02
    assert output["max_abs_normalized_residual_after_expansion"] < 2.0

    print(json.dumps(output, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
