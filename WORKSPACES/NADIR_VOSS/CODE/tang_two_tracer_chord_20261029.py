#!/usr/bin/env python3
"""Tang et al. (2023), DOI 10.1038/s41467-023-38787-w, Fig. 2.
Measured projected half-separation 140.6 um; S2W fitted radius 140.8 um.
Printed decimals are rounded; no confidence interval or SAT prediction.
"""
from fractions import Fraction
import json, math

observed_half_um = Fraction(703, 5)
fitted_radius_um = Fraction(704, 5)
ratio = observed_half_um / fitted_radius_um
assert ratio == Fraction(703, 704)
assert fitted_radius_um - observed_half_um == Fraction(1, 5)
assert 1 - ratio**2 == Fraction(1407, 495616)
assert 0 < ratio < 1
# For true chord 2 R sin(delta/2) and projected chord <= true chord:
# sin(delta/2) >= observed_half_um/fitted_radius_um.
epsilon_deg = math.degrees(2 * math.acos(float(ratio)))
delta_min_deg = 180 - epsilon_deg
assert abs(epsilon_deg - 6.108473831179595) < 1e-11
# Sensitivity to assumed rounding to nearest 0.1 um, not error bars:
q_min = Fraction(2811, 20) / Fraction(2817, 20)
q_max = Fraction(2813, 20) / Fraction(2815, 20)
assert q_min < ratio < q_max
rounding_epsilon_max_deg = math.degrees(2 * math.acos(float(q_min)))
rounding_epsilon_min_deg = math.degrees(2 * math.acos(float(q_max)))
assert rounding_epsilon_min_deg < epsilon_deg < rounding_epsilon_max_deg
print(json.dumps({
  "observed_projected_half_separation_um": float(observed_half_um),
  "S2W_model_fitted_radius_um": float(fitted_radius_um),
  "ratio_of_printed_numbers": str(ratio),
  "min_minor_central_separation_deg": delta_min_deg,
  "max_antipodal_deviation_deg": epsilon_deg,
  "rounding_only_epsilon_min_deg": rounding_epsilon_min_deg,
  "rounding_only_epsilon_max_deg": rounding_epsilon_max_deg,
  "status": "conditional on S2W-fitted radius; no independent SAT prediction"
}, indent=2))
