#!/usr/bin/env python3
"""Source-locked S2 observational-fit to marked-Euclidean-curve gate.

GRAVITY Collaboration 2020, A&A 636 L5, Table 1 and Eq 1.
IAU 2015 B3 nominal GM_sun conversion (exact, NOT a measured constant).
Numbers are derived from jointly fitted orbital parameters; no H(s)H prediction.
"""
from math import pi, sqrt
import json

C = 299792458.0
AU = 149597870700.0
GM_SOLAR_NOMINAL = 1.3271244e20
# Published best fits and marginal formal-fit errors.
INPUTS = {
    "mass_million_nominal_solar": (4.261, 0.012),
    "distance_pc": (8246.7, 9.3),
    "a_mas": (125.058, 0.041),
    "e": (0.884649, 0.000066),
    "f_SP": (1.10, 0.19),
}

def calculate(x):
    mass, distance, a_mas, e, f = (x[k] for k in INPUTS)
    mu = mass * 1e6 * GM_SOLAR_NOMINAL
    a_m = a_mas * 1e-3 * distance * AU
    rp = a_m * (1-e)
    vp = sqrt(mu * (1+e) / rp)
    acceleration = mu / rp**2
    # Fixed affine Euclidean R4 graph X(w)=(x(w),w), w=ct,
    # perpendicular v and a at Newtonian-order pericenter.
    curvature = (acceleration/C**2) / (1+(vp/C)**2)
    precession = 6*pi*mu / (a_m*(1-e**2)*C**2) * 180/pi*60
    return {
        "semimajor_axis_AU": a_m/AU,
        "pericenter_AU": rp/AU,
        "speed_km_s": vp/1000,
        "newtonian_acceleration_m_s2": acceleration,
        "Euclidean_R4_extrinsic_curvature_m_inv": curvature,
        "GR_precession_arcmin_orbit": precession,
        "fitted_precession_arcmin_orbit": f*precession,
    }

x = {k:v[0] for k,v in INPUTS.items()}
result = calculate(x)
# Diagnostic marginal-error propagation; covariances are unknown.
uncertainties = {}
for target in result:
    terms = []
    for k,(v,sigma) in INPUTS.items():
        plus,minus=x.copy(),x.copy()
        plus[k],minus[k]=v+sigma,v-sigma
        terms.append((calculate(plus)[target]-calculate(minus)[target])/2)
    uncertainties[target] = {
        "diagonal_only_sigma_NOT_posterior":sqrt(sum(z*z for z in terms)),
        "sum_absolute_1sigma_shifts_NOT_CI":sum(abs(z) for z in terms),
    }

print(json.dumps({
    "source":"GRAVITY Collaboration 2020 A&A 636 L5 Table 1, Eq 1",
    "inputs_jointly_fitted":INPUTS,
    "derived":result,
    "sensitivity_diagnostics_only":uncertainties,
    "limitations":"No posterior covariance, no blind HsH prediction, no Euclidean-R4 physical force law",
},indent=2))
