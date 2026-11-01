#!/usr/bin/env python3
"""Reproduce the source-faithful CKM-angle comparison for Nathan Direct 2026-03-21.

Inputs:
- B = 3/(4*pi), explicitly stated in the recovered user message.
- S = 0.2621, explicitly given there as an approximate Tc-98 smoothing factor;
  its reuse in the CKM equations is the source's notation, with no uncertainty supplied.
- PDG 2026 global-fit sin(theta_ij) values and asymmetric uncertainties.

This is a real-data comparison against PDG's reported global-fit parameters.
It is not a combined chi-square, an independent held-out test, or physical
validation. No fit or parameter adjustment is performed.
"""
import math
import json

B = 3.0 / (4.0 * math.pi)
S = 0.2621

# PDG 2026 Review of Particle Physics, CKM review, Eq. (12.28).
# These are global-fit values, not raw single-experiment measurements.
PDG = {
    "sin_theta12": {"value": 0.22517, "sigma_minus": 0.00068, "sigma_plus": 0.00068},
    "sin_theta23": {"value": 0.04189, "sigma_minus": 0.00069, "sigma_plus": 0.00081},
    "sin_theta13": {"value": 0.003763, "sigma_minus": 0.000083, "sigma_plus": 0.000088},
}

theta = {
    "theta12_rad": B * (1.0 - B**2),
    "theta23_rad": B**2 * (1.0 - S),
    "theta13_rad": B**3 * S,
}
predictions = {
    "sin_theta12": math.sin(theta["theta12_rad"]),
    "sin_theta23": math.sin(theta["theta23_rad"]),
    "sin_theta13": math.sin(theta["theta13_rad"]),
}
results = {}
for key, predicted in predictions.items():
    reference = PDG[key]
    residual = predicted - reference["value"]
    sigma = reference["sigma_minus"] if residual < 0 else reference["sigma_plus"]
    results[key] = {
        "prediction": predicted,
        "pdg_global_fit": reference["value"],
        "residual": residual,
        "one_sided_pull_sigma": residual / sigma,
    }

payload = {
    "B": B,
    "S_source_approx": S,
    "theta_radians": theta,
    "results": results,
    "status": "SOURCE_FAITHFUL_COMPARISON; NO_FIT; MODEL_UNCERTAINTY_UNAVAILABLE",
}
print(json.dumps(payload, indent=2, sort_keys=True))
