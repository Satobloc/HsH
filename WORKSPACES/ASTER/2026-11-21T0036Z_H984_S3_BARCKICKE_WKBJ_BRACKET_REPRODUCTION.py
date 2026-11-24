#!/usr/bin/env python3
"""Reproduce the first-order WKBJ broadening estimate in Barckicke et al. (2026).

This is a source-parameter reproduction, not a raw Figshare reanalysis,
not a fitted H(s)H prediction, and not an independent measurement.
"""
import json
import math

# Source: Barckicke, Falcon & Gissinger, Nature Physics 22, 409–414 (2026),
# DOI 10.1038/s41567-026-03175-w, Methods, rendered PDF page 6.
# The rendered page shows k0/(2*pi) = 25 m^-1; text extraction can drop the "2".
# The paper's Figshare data DOI is 10.6084/m9.figshare.30903347.
k0_over_2pi_m_inv = 25.0
delta_a_m = 1.0e-3       # 1 mm typical axial core-radius variation (not measurement noise)
a0_m = 1.9e-3            # 1.9 mm measured mean core radius
euler_gamma = 0.57721566490153286060651209008240243104215933593992

k0_m_inv = 2.0 * math.pi * k0_over_2pi_m_inv
k0a0 = k0_m_inv * a0_m
delta_a_over_a0 = delta_a_m / a0_m
bracket = 2.0 * math.log(2.0 / k0a0) - 1.0 - 2.0 * euler_gamma
delta_k_over_2pi_m_inv = k0_over_2pi_m_inv * delta_a_over_a0 / bracket

result = {
    "status": "SOURCE_PARAMETER_REPRODUCTION",
    "system": "controlled air-water vortex in Barckicke et al. 2026",
    "article_doi": "10.1038/s41567-026-03175-w",
    "data_doi": "10.6084/m9.figshare.30903347",
    "source_location": "Methods, rendered PDF page 6, WKBJ estimate",
    "formula": "B = 2*ln(2/(k0*a0)) - 1 - 2*gamma_E; Delta_k/(2*pi) = (k0/(2*pi))*(delta_a/a0)/B",
    "inputs": {
        "k0_over_2pi_m_inv": k0_over_2pi_m_inv,
        "delta_a_m": delta_a_m,
        "a0_m": a0_m,
        "euler_gamma": euler_gamma
    },
    "derived": {
        "k0_m_inv": k0_m_inv,
        "k0a0_dimensionless": k0a0,
        "delta_a_over_a0_dimensionless": delta_a_over_a0,
        "logarithmic_bracket": bracket,
        "delta_k_over_2pi_m_inv": delta_k_over_2pi_m_inv
    },
    "checks": {
        "bracket_in_lean_interval_1_650_1_651": 1.650 < bracket < 1.651,
        "broadening_in_lean_interval_7_9_8_1_m_inv": 7.9 < delta_k_over_2pi_m_inv < 8.1
    },
    "uncertainty_and_fit_status": {
        "paper_typical_contour_measurement_uncertainty_m": 1.0e-4,
        "delta_a_is_measurement_noise": False,
        "delta_a_is_axial_core_radius_variation": True,
        "uncertainty_propagated_for_delta_a_or_a0": False,
        "reason": "The source gives typical contour measurement uncertainty but does not provide a separate uncertainty for the 1 mm axial variation used in this rough estimate.",
        "dispersion_parameters_gamma_and_vz": "fit to dispersion data, then checked a posteriori against PIV/PTV measurements",
        "this_wkbj_estimate": "first-order source-parameter estimate, not a blind prediction",
        "raw_figshare_files_downloaded": False,
        "hsh_prediction_or_fit": False,
        "independent_measurement": False
    }
}
print(json.dumps(result, indent=2, sort_keys=True))
