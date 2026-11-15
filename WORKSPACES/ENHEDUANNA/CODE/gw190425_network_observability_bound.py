#!/usr/bin/env python3
"""Source-derived metadata and linear-algebra preflight for GW190425.

Sources:
- LIGO-P190425/007, GW190425 discovery paper.
- LIGO-P2000026-v2, parameter-estimation sample release.

This script does not load strain, posterior samples, PSDs, calibration files,
or calculate an event-specific antenna-response matrix.
"""
import json

EVENT = {
    "name": "GW190425",
    "active_detector_channels": ["L1", "V1"],
    "offline_detectors": ["H1"],
    "strain_unit": "dimensionless",
    "matched_filter_snr": {"L1": 12.9, "V1": 2.5},
    "single_detector_threshold": {"V1": 4.0},
    "calibration_uncertainty": {
        "LIGO": {"amplitude_percent": 6.0, "phase_degrees": 3.5},
        "Virgo": {"amplitude_percent": 5.0, "phase_degrees": 7.0},
    },
    "data_release": {
        "document": "LIGO-P2000026-v2",
        "posterior_hdf5_mb": 661.1,
        "example_html_mb": 9.7,
        "example_notebook_mb": 9.4,
        "contains_l1_v1_psd": True,
        "contains_calibration_envelopes": True,
        "contains_per_detector_log_likelihood": True,
        "contains_per_detector_snr": True,
        "contains_sky_and_polarization_parameters": True,
        "waveform_families": ["PhenomDNRT", "PhenomPNRT", "TaylorF2"],
        "spin_prior_strata": ["HS", "LS"],
    },
}

n_channels = len(EVENT["active_detector_channels"])
n_generic_metric_polarizations = 6
formal_rank_upper_bound = min(n_channels, n_generic_metric_polarizations)
rank_deficit_lower_bound = n_generic_metric_polarizations - formal_rank_upper_bound
l1_snr = EVENT["matched_filter_snr"]["L1"]
v1_snr = EVENT["matched_filter_snr"]["V1"]
v1_threshold = EVENT["single_detector_threshold"]["V1"]

result = {
    "event": EVENT["name"],
    "formal_detector_channel_count": n_channels,
    "generic_metric_polarization_count": n_generic_metric_polarizations,
    "response_matrix_shape_at_fixed_sample": [n_channels, n_generic_metric_polarizations],
    "formal_rank_upper_bound": formal_rank_upper_bound,
    "rank_deficit_lower_bound": rank_deficit_lower_bound,
    "L1_to_V1_snr_ratio_descriptive_only": round(l1_snr / v1_snr, 6),
    "V1_snr_as_fraction_of_single_detector_threshold": round(v1_snr / v1_threshold, 6),
    "effective_rank": "NOT_COMPUTED",
    "condition_number": "NOT_COMPUTED",
    "noise_weighted_singular_values": "NOT_COMPUTED",
    "calibration_marginalized_response": "NOT_COMPUTED",
    "raw_strain_or_hdf5_downloaded": False,
    "HSH_source_to_polarization_map": "NOT_FOUND",
    "interpretation_limit": (
        "The 2x6 rank bound applies to arbitrary independent six-polarization amplitudes "
        "at a fixed time/frequency sample and fixed sky/polarization frame. It does not "
        "treat subthreshold V1 as zero, prohibit waveform-model-conditioned inference, "
        "or establish an event-specific effective rank."
    ),
    "source_metadata": EVENT,
}

assert formal_rank_upper_bound == 2
assert rank_deficit_lower_bound == 4
assert abs(result["L1_to_V1_snr_ratio_descriptive_only"] - 5.16) < 1e-12
assert result["V1_snr_as_fraction_of_single_detector_threshold"] == 0.625
print(json.dumps(result, indent=2, sort_keys=True))
