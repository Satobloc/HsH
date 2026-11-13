#!/usr/bin/env python3
"""Reproduce descriptive interval arithmetic from GW190425 Table 1.

Primary source: Abbott et al. (2020), ApJL 892:L3, Table 1, p. 9.
Waveform family: PhenomPv2NRT.
https://doi.org/10.3847/2041-8213/ab75f5

Source-faithful detector-frame chirp-mass entries:
  low-spin:  1.4868 +0.0003/-0.0003 Msun
  high-spin: 1.4873 +0.0008/-0.0006 Msun

The asymmetric high-spin offsets were reversed in the first version of this
script. The PDF text-extraction layer for one copy also disagrees with the
raster Table 1 and independent DCC/author copies; the values here are checked
against the raster table and the DCC discovery PDF. The GWOSC event page lists
separate posterior summaries for other waveform families; those are not mixed
into this PhenomPv2NRT Table 1 comparison.

This script does not load strain or posterior samples and does not perform
parameter estimation. It reproduces arithmetic on published summaries.
The primary-mass interval is 0-90%; secondary-mass and mass-ratio intervals
are 10-100%, so their widths are descriptive and not central 90% widths.
"""

from dataclasses import dataclass
import json
import math


@dataclass(frozen=True)
class PriorSummary:
    prior_label: str
    spin_limit: str
    waveform_family: str
    source_table: str
    primary_mass_bounds_msun: tuple[float, float]
    secondary_mass_bounds_msun: tuple[float, float]
    mass_ratio_bounds: tuple[float, float]
    detector_chirp_mass_median_msun: float
    detector_chirp_mass_plus_msun: float
    detector_chirp_mass_minus_msun: float
    tidal_lambda_90_upper: float

    @property
    def detector_chirp_mass_lower_msun(self) -> float:
        return self.detector_chirp_mass_median_msun - self.detector_chirp_mass_minus_msun

    @property
    def detector_chirp_mass_upper_msun(self) -> float:
        return self.detector_chirp_mass_median_msun + self.detector_chirp_mass_plus_msun

    @property
    def detector_chirp_mass_interval_width_msun(self) -> float:
        return self.detector_chirp_mass_plus_msun + self.detector_chirp_mass_minus_msun

    @property
    def detector_chirp_mass_upper_lower_offset_ratio(self) -> float:
        return self.detector_chirp_mass_plus_msun / self.detector_chirp_mass_minus_msun


COMMON = {
    "waveform_family": "PhenomPv2NRT",
    "source_table": "Abbott et al. (2020), Table 1, p. 9",
}

LOW = PriorSummary(
    prior_label="low-spin",
    spin_limit="chi < 0.05",
    **COMMON,
    primary_mass_bounds_msun=(1.60, 1.87),
    secondary_mass_bounds_msun=(1.46, 1.69),
    mass_ratio_bounds=(0.80, 1.00),
    detector_chirp_mass_median_msun=1.4868,
    detector_chirp_mass_plus_msun=0.0003,
    detector_chirp_mass_minus_msun=0.0003,
    tidal_lambda_90_upper=600,
)

HIGH = PriorSummary(
    prior_label="high-spin",
    spin_limit="chi < 0.89",
    **COMMON,
    primary_mass_bounds_msun=(1.61, 2.52),
    secondary_mass_bounds_msun=(1.12, 1.68),
    mass_ratio_bounds=(0.40, 1.00),
    detector_chirp_mass_median_msun=1.4873,
    detector_chirp_mass_plus_msun=0.0008,
    detector_chirp_mass_minus_msun=0.0006,
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
chirp_interval_width_ratio = (
    HIGH.detector_chirp_mass_interval_width_msun
    / LOW.detector_chirp_mass_interval_width_msun
)
tidal_upper_ratio = HIGH.tidal_lambda_90_upper / LOW.tidal_lambda_90_upper

result = {
    "source": "Abbott et al. (2020), ApJL 892:L3, Table 1, p. 9",
    "source_doi": "10.3847/2041-8213/ab75f5",
    "waveform_family": "PhenomPv2NRT",
    "calculation_scope": "published posterior-summary arithmetic only; no raw strain or posterior samples loaded",
    "units": {"chirp_mass": "solar masses", "tidal_lambda": "dimensionless"},
    "low_spin": {
        "prior": LOW.prior_label,
        "spin_limit": LOW.spin_limit,
        "detector_chirp_mass_median_msun": LOW.detector_chirp_mass_median_msun,
        "detector_chirp_mass_minus_msun": LOW.detector_chirp_mass_minus_msun,
        "detector_chirp_mass_plus_msun": LOW.detector_chirp_mass_plus_msun,
        "detector_chirp_mass_lower_msun": LOW.detector_chirp_mass_lower_msun,
        "detector_chirp_mass_upper_msun": LOW.detector_chirp_mass_upper_msun,
        "detector_chirp_mass_interval_width_msun": LOW.detector_chirp_mass_interval_width_msun,
        "detector_chirp_mass_upper_lower_offset_ratio": LOW.detector_chirp_mass_upper_lower_offset_ratio,
    },
    "high_spin": {
        "prior": HIGH.prior_label,
        "spin_limit": HIGH.spin_limit,
        "detector_chirp_mass_median_msun": HIGH.detector_chirp_mass_median_msun,
        "detector_chirp_mass_minus_msun": HIGH.detector_chirp_mass_minus_msun,
        "detector_chirp_mass_plus_msun": HIGH.detector_chirp_mass_plus_msun,
        "detector_chirp_mass_lower_msun": HIGH.detector_chirp_mass_lower_msun,
        "detector_chirp_mass_upper_msun": HIGH.detector_chirp_mass_upper_msun,
        "detector_chirp_mass_interval_width_msun": HIGH.detector_chirp_mass_interval_width_msun,
        "detector_chirp_mass_upper_lower_offset_ratio": HIGH.detector_chirp_mass_upper_lower_offset_ratio,
    },
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
    "detector_chirp_mass_interval_width_ratio_high_to_low": chirp_interval_width_ratio,
    "tidal_lambda_upper_limit_ratio": tidal_upper_ratio,
}

# Source-transcription regression checks for the Table 1 PhenomPv2NRT values.
assert math.isclose(LOW.detector_chirp_mass_lower_msun, 1.4865, abs_tol=1e-12)
assert math.isclose(LOW.detector_chirp_mass_upper_msun, 1.4871, abs_tol=1e-12)
assert math.isclose(LOW.detector_chirp_mass_interval_width_msun, 0.0006, abs_tol=1e-12)
assert math.isclose(HIGH.detector_chirp_mass_lower_msun, 1.4867, abs_tol=1e-12)
assert math.isclose(HIGH.detector_chirp_mass_upper_msun, 1.4881, abs_tol=1e-12)
assert math.isclose(HIGH.detector_chirp_mass_interval_width_msun, 0.0014, abs_tol=1e-12)
assert math.isclose(chirp_interval_width_ratio, 2.3333333333333335, rel_tol=1e-12)
assert round(primary_ratio, 2) == 3.37
assert round(secondary_ratio, 2) == 2.43
assert round(q_ratio, 2) == 3.00
assert round(chirp_shift_percent, 4) == 0.0336
assert round(tidal_upper_ratio, 2) == 1.83

print(json.dumps(result, indent=2, sort_keys=True))
