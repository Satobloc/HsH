#!/usr/bin/env python3
"""Reproduce the published-summary GW170817 radius-sensitivity calculation.

Inputs are transcribed from:
- LIGO/Virgo, PRX 9, 011001 (2019), Tables II and IV:
  PhenomPNRT low-spin 90% HPD [70,720], high-spin one-sided 90% [0,630];
  low-spin waveform-family HPD upper endpoints 720, 830, 690, 730;
  high-spin one-sided upper endpoints 630, 730, 630, 640;
  source-frame chirp mass 1.186 +/- 0.001 Msun;
  q lower limits 0.73 (low spin), 0.53 (high spin).
- Raithel, Ozel & Psaltis (2018), arXiv:1803.07687, Eq. (6):
  Rhat ~= (11.2 +/- 0.2) (Mc/Msun) (tildeLambda/800)^(1/6) km;
  stated q validity domain q >= 0.6.

This is a conditional common-radius/EOS-insensitive translation, not an H(s)H
prediction and not a new posterior inference.  The waveform variants are
different analyses of the same event, not independent measurements.  The
coefficient and chirp-mass envelope below is a sensitivity envelope, not a
combined credible interval.  No raw strain or NPZ posterior samples are read.
No CODATA constants are used: the published relation already carries km and
solar-mass units.
"""
from decimal import Decimal, getcontext
import json

getcontext().prec = 50
D = Decimal

def sixth_root(x: Decimal) -> Decimal:
    if x <= 0:
        raise ValueError("sixth_root requires x > 0")
    return (x.ln() / D(6)).exp()

def radius_hat_km(mc_msun: Decimal, lambda_tilde: Decimal,
                  coefficient_km: Decimal = D("11.2")) -> Decimal:
    return coefficient_km * mc_msun * sixth_root(lambda_tilde / D(800))

# LIGO/Virgo PRX 2019, Table II.
low_spin_hpd = (D("70"), D("720"))
high_spin_one_sided = (D("0"), D("630"))
mc = D("1.186")
mc_low, mc_high = D("1.185"), D("1.187")
q_low_spin, q_high_spin, q_raithel_min = D("0.73"), D("0.53"), D("0.6")

# LIGO/Virgo PRX 2019, Tables II and IV, PhenomPNRT/TaylorF2/SEOBNRT/PhenomDNRT.
low_spin_waveform_upper = {
    "PhenomPNRT": D("720"),
    "TaylorF2": D("830"),
    "SEOBNRT": D("690"),
    "PhenomDNRT": D("730"),
}
high_spin_waveform_upper = {
    "PhenomPNRT": D("630"),
    "TaylorF2": D("730"),
    "SEOBNRT": D("630"),
    "PhenomDNRT": D("640"),
}

overlap = (max(low_spin_hpd[0], high_spin_one_sided[0]),
           min(low_spin_hpd[1], high_spin_one_sided[1]))
low_radius_by_waveform = {
    name: radius_hat_km(mc, upper)
    for name, upper in low_spin_waveform_upper.items()
}
high_radius_conditional_by_waveform = {
    name: radius_hat_km(mc, upper)
    for name, upper in high_spin_waveform_upper.items()
}

main_low_nominal = radius_hat_km(mc, D("720"))
main_low_sensitivity = (
    radius_hat_km(mc_low, D("720"), D("11.0")),
    radius_hat_km(mc_high, D("720"), D("11.4")),
)
all_low_sensitivity = (
    radius_hat_km(mc_low, min(low_spin_waveform_upper.values()), D("11.0")),
    radius_hat_km(mc_high, max(low_spin_waveform_upper.values()), D("11.4")),
)
radius_reduction_vs_800 = D(1) - sixth_root(D("720") / D("800"))

assert overlap == (D("70"), D("630"))
assert overlap[1] - overlap[0] == D("560")
assert q_low_spin >= q_raithel_min
assert q_high_spin < q_raithel_min
assert min(low_radius_by_waveform.values()) < max(low_radius_by_waveform.values())
assert all_low_sensitivity[0] < all_low_sensitivity[1]
assert abs(radius_reduction_vs_800 - D("0.0174068")) < D("0.0000001")

out = {
    "low_spin_PhenomPNRT_90pct_HPD": [str(x) for x in low_spin_hpd],
    "high_spin_PhenomPNRT_one_sided_90pct": [str(x) for x in high_spin_one_sided],
    "interval_intersection_only": [str(x) for x in overlap],
    "intersection_width": str(overlap[1] - overlap[0]),
    "source_frame_chirp_mass_Msun": str(mc),
    "source_frame_chirp_mass_90pct_range_Msun": [str(mc_low), str(mc_high)],
    "q_lower_limits": {
        "low_spin": str(q_low_spin),
        "high_spin": str(q_high_spin),
        "Raithel_validity_minimum": str(q_raithel_min),
    },
    "low_spin_radius_upper_km_by_waveform": {
        k: str(v) for k, v in low_radius_by_waveform.items()
    },
    "low_spin_main_nominal_radius_upper_km": str(main_low_nominal),
    "low_spin_main_coefficient_and_mass_sensitivity_km": [
        str(main_low_sensitivity[0]), str(main_low_sensitivity[1])
    ],
    "all_low_spin_waveform_coefficient_mass_sensitivity_km": [
        str(all_low_sensitivity[0]), str(all_low_sensitivity[1])
    ],
    "high_spin_radius_values_km_conditional_only_q_ge_0_6": {
        k: str(v) for k, v in high_radius_conditional_by_waveform.items()
    },
    "radius_reduction_720_vs_800": str(radius_reduction_vs_800),
    "logarithmic_sensitivity_dlnR_dlnLambda": "1/6",
    "assertions_passed": 7,
}
print(json.dumps(out, indent=2))
