#!/usr/bin/env python3
"""Kerr-Newman control only; no H(s)H physics claim.
Actual electron and muon measured/adjusted CODATA 2022 input values.
https://physics.nist.gov/cuu/Constants/Table/allascii.txt
Repro: python3 WORKSPACES/RAVEL/CODE/kn_codata2022_control.py
"""
import json
import math

h = 6.62607015e-34
c = 299792458.0
e = 1.602176634e-19
hbar = h / (2 * math.pi)
G, uG = 6.67430e-11, 0.00015e-11
eps0, ueps0 = 8.8541878188e-12, 0.0000000014e-12
alpha, ualpha = 7.2973525643e-3, 0.0000000011e-3
masses = {
    "electron": (9.1093837139e-31, 0.0000000028e-31),
    "muon": (1.883531627e-28, 0.000000042e-28),
}

def calc(m, g=G, ep=eps0):
    mg = g * m / c**2
    a = hbar / (2 * m * c)
    q2 = g * e**2 / (4 * math.pi * ep * c**4)
    r0 = q2 / (2 * mg)
    return {
        "M_g_m": mg, "a_m": a, "Q_g_squared_m2": q2,
        "r0_m": r0, "q0": r0 / a, "mu": mg / a,
        "discriminant_equator_m2": mg**2 - q2,
        "discriminant_pole_m2": mg**2 - a**2 - q2,
    }

out = {
    "source": "NIST CODATA 2022 adjustment, NOT independent checks",
    "G_std_uncertainty": uG, "eps0_std_uncertainty": ueps0,
    "alpha_recommended": alpha, "alpha_std_uncertainty": ualpha,
    "systems": {},
}
for name, (m, um) in masses.items():
    central = calc(m)
    corners = [
        calc(mm, gg, ee)
        for mm in (m - um, m + um)
        for gg in (G - uG, G + uG)
        for ee in (eps0 - ueps0, eps0 + ueps0)
    ]
    keys = ("a_m", "r0_m", "q0", "mu", "discriminant_equator_m2",
            "discriminant_pole_m2")
    out["systems"][name] = {
        "m_kg": m, "m_std_uncertainty_kg": um, "central": central,
        "rectangular_1sigma_input_box_NOT_credible_interval": {
            key: [min(row[key] for row in corners), max(row[key] for row in corners)]
            for key in keys
        },
    }
out["q0_minus_recommended_alpha"] = out["systems"]["electron"]["central"]["q0"] - alpha
print(json.dumps(out, indent=2))
