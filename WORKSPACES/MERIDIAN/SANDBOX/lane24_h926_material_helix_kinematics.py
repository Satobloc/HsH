#!/usr/bin/env python3
"""Source-parameter kinematics audit for Barckicke et al. (2026), m=1 case.

Source DOI: 10.1038/s41567-026-03175-w; source-data DOI: 10.6084/m9.figshare.30903347.
This is a derived calculation from paper-reported parameters, NOT a raw-data
reanalysis, independent prediction, or H(s)H test. Error boxes are propagated by
corner enumeration and are not confidence intervals; parameter correlations
and fit covariance are unknown.
"""
from itertools import product
import json, math

# Source: Barckicke, Falcon & Gissinger, Nature Physics 22 (2026),
# Fig. 3b / Methods. Values are source-reported best-fit parameters checked
# a posteriori against PIV/PTV; a0 is measured from contour data.
a0_m = 1.9e-3
Gamma_m2_s = 0.022
vz_m_s = 0.57

# Source-reported typical measurement scales, used only as a sensitivity box:
da_m = 0.1e-3
dGamma_m2_s = 5.1e-3
dvz_m_s = 0.05
c_m_s = 299_792_458.0  # exact SI-defined value

def calc(a, Gamma, vz):
    Omega = Gamma / (2 * math.pi * a**2)
    vtheta = a * Omega
    T = 2 * math.pi / Omega
    pitch = vz * T
    speed = math.hypot(vtheta, vz)
    a_c = a * Omega**2
    kappa3 = a * Omega**2 / speed**2
    torsion3 = Omega * vz / speed**2
    gamma = 1 / math.sqrt(1 - speed**2 / c_m_s**2)
    proper_accel = gamma**2 * a_c  # acceleration perpendicular to velocity
    kappa4_minkowski = proper_accel / c_m_s**2
    return {
        "Omega_rad_s": Omega,
        "vtheta_m_s": vtheta,
        "rotation_period_s": T,
        "pitch_m_per_turn": pitch,
        "v_z_over_vtheta": vz / vtheta,
        "speed_m_s": speed,
        "centripetal_accel_m_s2": a_c,
        "spatial_helix_curvature_m^-1": kappa3,
        "spatial_helix_torsion_m^-1": torsion3,
        "Lorentz_gamma": gamma,
        "proper_accel_m_s2": proper_accel,
        "Minkowski_worldline_curvature_m^-1": kappa4_minkowski,
    }

nominal = calc(a0_m, Gamma_m2_s, vz_m_s)
# Algebraic consistency checks for the constant-parameter helix.
assert math.isclose(nominal["vtheta_m_s"], a0_m * nominal["Omega_rad_s"], rel_tol=1e-14)
assert math.isclose(nominal["pitch_m_per_turn"], 2 * math.pi * vz_m_s / nominal["Omega_rad_s"], rel_tol=1e-14)
assert math.isclose(nominal["spatial_helix_curvature_m^-1"]**2 +
                     nominal["spatial_helix_torsion_m^-1"]**2,
                     nominal["Omega_rad_s"]**2 / nominal["speed_m_s"]**2, rel_tol=1e-14)
assert math.isclose(nominal["centripetal_accel_m_s2"], nominal["vtheta_m_s"]**2 / a0_m, rel_tol=1e-14)
corner_values = {k: [] for k in nominal}
for a, G, vz in product((a0_m-da_m, a0_m+da_m),
                         (Gamma_m2_s-dGamma_m2_s, Gamma_m2_s+dGamma_m2_s),
                         (vz_m_s-dvz_m_s, vz_m_s+dvz_m_s)):
    for k, v in calc(a, G, vz).items():
        corner_values[k].append(v)

sensitivity_box = {k: {"min": min(vs), "max": max(vs)}
                   for k, vs in corner_values.items()}
output = {
    "system": "Barckicke, Falcon & Gissinger (2026), air-core water vortex, m=1 case",
    "source_parameters": {
        "a0_m": a0_m, "Gamma_m2_s": Gamma_m2_s, "vz_m_s": vz_m_s,
        "source_typical_error_scales": {
            "da_m": da_m, "dGamma_m2_s": dGamma_m2_s, "dvz_m_s": dvz_m_s
        },
        "parameter_status": "a0 measured; Gamma and vz are best-fit dispersion parameters, checked a posteriori against PIV/PTV; covariance not reported",
    },
    "nominal_derived": nominal,
    "corner_sensitivity_box": sensitivity_box,
    "limitations": [
        "not raw-data reanalysis; Figshare files/version/bytes not retrieved",
        "source error scales are not joint confidence intervals",
        "corner box assumes independent ranges only; covariance and fit uncertainty unknown",
        "constant-Omega and constant-vz local helix is a reconstruction, not a directly tracked 3D particle trajectory",
        "Minkowski worldline curvature is standard kinematics; no H(s)H equivalence or prediction tested",
    ],
}
print(json.dumps(output, indent=2, sort_keys=True))
