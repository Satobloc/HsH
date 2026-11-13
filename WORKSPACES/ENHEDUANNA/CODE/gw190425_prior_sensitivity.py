#!/usr/bin/env python3
"""Reproduce descriptive interval arithmetic from GW190425 Table 1.

Source: Abbott et al. (2020), ApJL 892:L3,
https://doi.org/10.3847/2041-8213/ab75f5

This script does not load strain or posterior samples and does not perform
parameter estimation. It compares published low/high-spin-prior summaries.
The primary-mass interval is 0-90%; secondary-mass and mass-ratio intervals
are 10-100%, so their widths are descriptive and not central 90% widths.
"""

from dataclasses import dataclass
import json


@dataclass(frozen=True)
class PriorSummary:
    primary_mass_bounds_msun: tuple[float, float]
    secondary_mass_bounds_msun: tuple[float, float]
    mass_ratio_bounds: tuple[float, float]
    detector_chirp_mass_median_msun: float
    detector_chirp_mass_plus_msun: float
    detector_chirp_mass_minus_msun: float
    tidal_lambda_90_upper: float


LOW = PriorSummary(
    primary_mass_bounds_msun=(1.60, 1.87),
    secondary_mass_bounds_msun=(1.46, 1.69),
    mass_ratio_bounds=(0.80, 1.00),
    detector_chirp_mass_median_msun=1.4868,
    detector_chirp_mass_plus_msun=0.0003,
    detector_chirp_mass_minus_msun=0.0003,
    tidal_lambda_90_upper=600,
)

HIGH = PriorSummary(
    primary_mass_bounds_msun=(1.61, 2.52),
    secondary_mass_bounds_msun=(1.12, 1.68),
    mass_ratio_bounds=(0.40, 1.00),
    detector_chirp_mass_median_msun=1.4873,
    detector_chirp_mass_plus_msun=0.0006,
    detector_chirp_mass_minus_msun=0.0008,
    tidal_lambda_90_upper=1100,
)


def width(bounds: tuple[float, float]) -> float:
    return bounds[1] - bounds[0]


def width_ratio(low_bounds: tuple[float, float],
                high_bounds: tuple[float, float]) -> float:
    return width(high_bounds) / width(low_bounds)


primary_ratio = width_ratio(
    LOW.primary_mass_bounds_msun, HIGH.primary_mass_bounds_msun
)
secondary_ratio = width_ratio(
    LOW.secondary_mass_bounds_msun, HIGH.secondary_mass_bounds_msun
)
q_ratio = width_ratio(LOW.mass_ratio_bounds, HIGH.mass_ratio_bounds)
chirp_shift_msun = (
    HIGH.detector_chirp_mass_median_msun
    - LOW.detector_chirp_mass_median_msun
)
chirp_mean_msun = (
    HIGH.detector_chirp_mass_median_msun
    + LOW.detector_chirp_mass_median_msun
) / 2
chirp_shift_percent = 100 * chirp_shift_msun / chirp_mean_msun
tidal_upper_ratio = HIGH.tidal_lambda_90_upper / LOW.tidal_lambda_90_upper

result = {
    "primary_mass_width_low_msun": width(LOW.primary_mass_bounds_msun),
    "primary_mass_width_high_msun": width(HIGH.primary_mass_bounds_msun),
    "primary_mass_width_ratio": primary_ratio,
    "secondary_mass_width_low_msun": width(LOW.secondary_mass_bounds_msun),
    "secondary_mass_width_high_msun": width(HIGH.secondary_mass_bounds_msun),
    "secondary_mass_width_ratio": secondary_ratio,
    "mass_ratio_width_low": width(LOW.mass_ratio_bounds),
    "mass_ratio_width_high": width(HIGH.mass_ratio_bounds),
    "mass_ratio_width_ratio": q_ratio,
    "detector_chirp_mass_median_shift_msun": chirp_shift_msun,
    "detector_chirp_mass_relative_shift_percent": chirp_shift_percent,
    "tidal_lambda_upper_limit_ratio": tidal_upper_ratio,
}

assert round(primary_ratio, 2) == 3.37
assert round(secondary_ratio, 2) == 2.43
assert round(q_ratio, 2) == 3.00
assert round(chirp_shift_percent, 4) == 0.0336
assert round(tidal_upper_ratio, 2) == 1.83

print(json.dumps(result, indent=2, sort_keys=True))
