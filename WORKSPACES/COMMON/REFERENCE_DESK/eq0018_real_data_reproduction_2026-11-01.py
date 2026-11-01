#!/usr/bin/env python3
"""Reproduce the archived EQ-0018 scale and reduced-Planck relation.

Inputs are source-backed: measured 3He+ hyperfine splitting (Nature 2022),
exact SI h and c, CODATA 2022 alpha, and the approximate m0/ell_f/B values
in Nathan's 2026-03-21 user-role message. The ell_f formula is dimensionally
invalid, so its numerical evaluation is reported only as a raw coordinate
dependent on SI base-unit choices, never as a physical length.
"""
import math
import json

# NIST 2022 CODATA: h and c exact; alpha recommended value.
h = 6.62607015e-34
c = 299_792_458.0
alpha = 7.2973525643e-3

# Schneider et al., Nature 606, 878-883 (2022), magnitude of measured
# zero-field 3He+ ground-state hyperfine splitting.
f_he3 = 8_665_649_865.77  # Hz; published value is negative by sign convention

# Approximate inputs from Nathan Direct, 2026-03-21.
m0 = 1.0073e-27            # kg, approximate; no uncertainty stated
ell_claim = 0.7937e-15     # m, claimed approximate scale; no uncertainty stated
B = 3.0 / (4.0 * math.pi)

hbar_reference = h / (2.0 * math.pi)

# Evaluate the printed upstream expression numerically, but do not call the
# result a length: [h*c/(f*alpha^2)]^(1/3) has dimensions M^(1/3)L T^(-1/3).
ell_raw_coordinate = (h * c / (2.0 * math.pi * f_he3 * alpha**2)) ** (1.0 / 3.0)

# Evaluate the later archived downstream relation hbar = m0*c*ell_f*B.
hbar_model = m0 * c * ell_claim * B

result = {
    "inputs": {
        "h_J_s": h,
        "c_m_s": c,
        "alpha_CODATA2022": alpha,
        "f_He3_Hz_magnitude": f_he3,
        "m0_kg_approx": m0,
        "ell_f_claim_m": ell_claim,
        "B": B,
    },
    "upstream_scale": {
        "raw_numeric_coordinate": ell_raw_coordinate,
        "dimension": "M^(1/3) L T^(-1/3), not length",
        "if_mislabelled_m": ell_raw_coordinate,
        "if_mislabelled_fm": ell_raw_coordinate / 1e-15,
        "source_claim_fm": ell_claim / 1e-15,
        "physical_length_status": "INVALID_DIMENSIONS",
    },
    "downstream_hbar": {
        "model_J_s": hbar_model,
        "reference_J_s": hbar_reference,
        "absolute_residual_J_s": hbar_model - hbar_reference,
        "relative_residual": hbar_model / hbar_reference - 1.0,
        "model_over_reference": hbar_model / hbar_reference,
        "statistical_pull": None,
        "reason_no_pull": "m0 and ell_f are approximate model inputs without stated uncertainties",
    },
    "status": "NUMERIC_REPRODUCTION_PASS; UPSTREAM_DIMENSIONAL_FAILURE; DOWNSTREAM_NUMERIC_MISMATCH",
}
print(json.dumps(result, indent=2, sort_keys=True))
