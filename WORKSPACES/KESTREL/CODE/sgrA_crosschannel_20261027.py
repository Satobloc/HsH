#!/usr/bin/env python3
"""Sgr A* 2017 EHT ring / GRAVITY-VLTI 2022 orbit cross-channel scale check.
No H(s)H forward prediction. Published values and uncertainties only.
Sources: EHT 2022 ApJL 930 L15 (doi:10.3847/2041-8213/ac6736)
         EHT 2022 ApJL 930 L17 (metric tests, VLTI orbit priors)
         GRAVITY 2022 A&A 657 L12 (doi:10.1051/0004-6361/202142465)
"""
import math
import json

# Observed EHT ring diameter (2017 April 230 GHz), 68% credible interval.
diameter_uas, diameter_sigma_uas = 51.8, 2.3
# Independent GRAVITY/VLTI stellar-orbit posterior quoted by EHT Paper VI.
theta_g_uas = 5.125
theta_g_stat_uas, theta_g_sys_uas = 0.009, 0.020
# GRAVITY 2022 joint fit, central values only; do not ignore M-D covariance.
mass_solar_nominal, distance_pc = 4.297e6, 8277
# IAU 2015 nominal solar GM and exact SI constants, not an adjusted CODATA test.
gm_sun_nominal, c, au = 1.3271244e20, 299792458, 149597870700
pc = au * 648000 / math.pi
uas_radian = math.pi / (180 * 3600 * 1e6)

theta_g_recomputed = mass_solar_nominal * gm_sun_nominal / (c*c*distance_pc*pc) / uas_radian
sigma_theta_g = math.hypot(theta_g_stat_uas, theta_g_sys_uas)
k_eff = diameter_uas / theta_g_uas
# Approximate delta-method uncertainty, assuming zero cross-instrument covariance.
sigma_k = k_eff * math.hypot(diameter_sigma_uas/diameter_uas, sigma_theta_g/theta_g_uas)
result = {
    "physical_system": "Sgr A*",
    "eht_diameter_uas": diameter_uas,
    "eht_diameter_68_sigma_uas": diameter_sigma_uas,
    "vlti_theta_g_uas": theta_g_uas,
    "vlti_theta_g_stat_uas": theta_g_stat_uas,
    "vlti_theta_g_sys_uas": theta_g_sys_uas,
    "vlti_theta_g_quadrature_uas": sigma_theta_g,
    "theta_g_from_gravity_mass_distance_uas": theta_g_recomputed,
    "k_eff_diameter_over_theta_g": k_eff,
    "k_eff_sigma_approx": sigma_k,
    "eht_grmhd_calibrated_theta_g_interval_uas": [4.1, 6.2],
    "vlti_theta_g_inside_eht_interval": 4.1 <= theta_g_uas <= 6.2,
    "prediction_status": "NO_HSH_PREDICTION; derived observational ratio only",
    "uncertainty_caveat": "M and D correlated; published theta_g posterior used. Cross-instrument covariance assumed zero for illustrative first-order k uncertainty; non-Gaussian EHT posteriors not propagated."
}
print(json.dumps(result, indent=2))
