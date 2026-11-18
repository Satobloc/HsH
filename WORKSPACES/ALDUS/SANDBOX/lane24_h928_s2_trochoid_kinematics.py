#!/usr/bin/env python3
"""Source-parameter kinematics for a translating + spinning vertical cylinder.

Primary source: Gehlert & Babinsky, AIAA SciTech 2019,
DOI 10.2514/6.2019-0347.
Dataset: Cambridge Apollo DOI 10.17863/CAM.37305 (1.26 GB; raw bytes not acquired).

The cylinder axis is vertical while the surge translation is horizontal and the
rotation is about the vertical axis. Therefore a material point's horizontal
trajectory is a planar trochoid, NOT a helix. Source inputs are rounded:
r=0.03 m, U=0.43 m/s, RPM=137/411 (reported alpha=1/3).
The paper reports ~1% translation-speed uncertainty; RPM/radius uncertainties
and covariance were not recovered. Sensitivity varies U only.

No raw PIV/force data are used; this is a nominal source-parameter
reconstruction, not a fit, prediction, independent validation, or H(s)H test.
"""
import math

U0 = 0.43
r = 0.03
c = 299792458.0
cases = [("reported alpha=1", 137), ("reported alpha=3", 411)]


def geometry(U, omega):
    vtheta = r * omega
    alpha = vtheta / U
    speed_min = abs(U - vtheta)
    speed_max = U + vtheta
    if math.isclose(alpha, 1.0, rel_tol=0, abs_tol=1e-12):
        classification = "cycloid (cusp)"
        kmin = 0.0
        kmax = float("inf")
    elif alpha > 1:
        classification = "prolate trochoid (looped)"
        kmin = r * omega**2 / (U + vtheta)**2
        kmax = r * omega**2 / (vtheta - U)**2
    else:
        classification = "curtate trochoid (non-looping)"
        kmin = 0.0
        kmax = r * omega**2 / (U - vtheta)**2
    acceleration = r * omega**2
    worldline_curvature_approx = acceleration / c**2
    return {
        "alpha_eff": alpha,
        "classification": classification,
        "speed_min_m_s": speed_min,
        "speed_max_m_s": speed_max,
        "curvature_min_m_inv": kmin,
        "curvature_max_m_inv": kmax,
        "acceleration_m_s2": acceleration,
        "worldline_curvature_approx_m_inv": worldline_curvature_approx,
    }


for name, rpm in cases:
    omega = rpm * 2 * math.pi / 60
    print("\\n", name, "rpm", rpm, "omega", omega)
    print("nominal", geometry(U0, omega))
    print("U +/-1% (radius and rpm held fixed):")
    for U in (U0 * 0.99, U0, U0 * 1.01):
        print("U=", U, geometry(U, omega))
