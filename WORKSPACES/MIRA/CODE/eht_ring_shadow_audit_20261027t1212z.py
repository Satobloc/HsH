#!/usr/bin/env python3
"""Mira | EHT Sgr A* source-typed ring/shadow point-estimate audit.

Actual 2017 EHT Sgr A* observational system and orbital priors.
EHT Collaboration 2022 Paper I, ApJL 930 L12 Table 1,
DOI 10.3847/2041-8213/ac6674; Paper IV ac6736; Paper VI ac6756.
No invented observations, physical fixtures, or H(s)H predictions.
The first-order uncertainty approximation is NOT a posterior reconstruction.
"""
from decimal import Decimal as D, getcontext
import json
getcontext().prec = 48
ring, ring_sigma = D("51.8"), D("2.3")
shadow, shadow_sigma = D("48.7"), D("7.0")
theta = {"VLTI": D("5.125"), "Keck": D("4.92")}
theta_stat = {"VLTI": D("0.009"), "Keck": D("0.03")}
theta_sys = {"VLTI": D("0.020"), "Keck": D("0.01")}
k = 6 * D(3).sqrt()  # Schwarzschild shadow diameter / theta_g
result = {
    "source": "EHT Collaboration (2022), ApJL 930 L12 Table 1",
    "doi": "10.3847/2041-8213/ac6674",
    "units": "microarcseconds for d and theta_g; dimensionless ratios",
    "schwarzschild_coefficient": str(k),
    "ring": {"value": str(ring), "sigma_68pct": str(ring_sigma)},
    "shadow_calibrated": {"value": str(shadow), "sigma": str(shadow_sigma)},
    "ring_over_shadow": str(ring / shadow),
    "orbit_prior_channels": {},
}
for channel, t in theta.items():
    sig_t = (theta_stat[channel]**2 + theta_sys[channel]**2).sqrt()
    ring_scale, shadow_scale = ring / t, shadow / t
    result["orbit_prior_channels"][channel] = {
        "theta_g": str(t), "theta_stat": str(theta_stat[channel]),
        "theta_sys": str(theta_sys[channel]),
        "ring_over_theta": str(ring_scale),
        "shadow_over_theta": str(shadow_scale),
        "delta_if_ring_mistaken_for_shadow": str(ring_scale / k - 1),
        "delta_from_calibrated_shadow_central_value": str(shadow_scale / k - 1),
        "naive_sigma_ring_over_theta": str(((ring_sigma / t)**2 + (ring * sig_t / t**2)**2).sqrt()),
        "naive_sigma_shadow_over_theta": str(((shadow_sigma / t)**2 + (shadow * sig_t / t**2)**2).sqrt()),
    }
print(json.dumps(result, indent=2))
