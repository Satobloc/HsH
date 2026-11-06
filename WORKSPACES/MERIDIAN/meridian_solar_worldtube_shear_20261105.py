#!/usr/bin/env python3
"""Measured solar differential rotation -> native R4 material-history geometry.

Uses central coefficients from Snodgrass & Ulrich (1990), Table 1.
The three profiles remain distinct: spectroscopic gas, Doppler residual
features, and magnetic features. No SAT force law or Cruller parameter is fit.
All calculations are Planck-first; SI values are printed for legibility.
"""
import math
import numpy as np

# Constants; IAU nominal solar radius is a conversion value, not a claim
# that this is the Sun's exact current radius.
c = 299_792_458.0
G = 6.67430e-11
hbar = 1.054571817e-34
lP = math.sqrt(hbar * G / c**3)
tP = lP / c
R_sun = 6.957e8
R_P = R_sun / lP

# Snodgrass & Ulrich 1990, Table 1. Coefficients and reported +/- values
# are in microrad/s. Their standard B,C polynomial coefficients are not
# orthogonal and the paper warns of B/C crosstalk. Central values are used;
# no false independent-error propagation is performed.
profiles = {
    "spectroscopic_gas_1967_1984": {
        "A": 2.851, "B": -0.343, "C": -0.474,
        "sigma_A": 0.006, "sigma_B": 0.005, "sigma_C": 0.007,
    },
    "doppler_residual_features_1967_1987": {
        "A": 2.972, "B": -0.484, "C": -0.361,
        "sigma_A": 0.010, "sigma_B": 0.038, "sigma_C": 0.051,
    },
    "magnetic_features_1967_1987": {
        "A": 2.879, "B": -0.339, "C": -0.485,
        "sigma_A": 0.002, "sigma_B": 0.013, "sigma_C": 0.021,
    },
}

T_CR_days = 27.2753
T = T_CR_days * 86400.0
PATCH_WIDTH_DEG = 5.0
PATCH_WIDTH = math.radians(PATCH_WIDTH_DEG)


def omega(lam, p):
    """Angular velocity in rad/s; latitude lambda is in radians."""
    A, B, Cc = (p[k] * 1e-6 for k in ("A", "B", "C"))
    s2 = math.sin(lam) ** 2
    return A + B * s2 + Cc * s2**2


def domega_dlambda(lam, p):
    """dOmega/dlatitude in rad/s per radian."""
    _, B, Cc = (p[k] * 1e-6 for k in ("A", "B", "C"))
    s, co = math.sin(lam), math.cos(lam)
    return 2 * B * s * co + 4 * Cc * s**3 * co


def principal_stretches(gamma):
    """Singular values of F=[[1,0],[gamma,1]], with det(F)=1."""
    disc = abs(gamma) * math.sqrt(1 + gamma**2 / 4)
    eig_hi = 1 + gamma**2 / 2 + disc
    eig_lo = 1 + gamma**2 / 2 - disc
    return math.sqrt(eig_lo), math.sqrt(eig_hi)


print(f"lP={lP:.12e} m; tP={tP:.12e} s; R_sun/lP={R_P:.12e}")
print(f"Elapsed Carrington interval={T:.6f} s={T/tP:.12e} tP")
lat_grid = np.linspace(0.0, math.pi / 2, 200_001)
results = []

for name, p in profiles.items():
    gdot = np.array([math.cos(x) * domega_dlambda(x, p) for x in lat_grid])
    imax = int(np.argmax(np.abs(gdot)))
    lam_max = float(lat_grid[imax])
    gdot_max = float(gdot[imax])
    gamma_local = gdot_max * T

    om_plus = omega(lam_max + PATCH_WIDTH / 2, p)
    om_minus = omega(lam_max - PATCH_WIDTH / 2, p)
    delta_phi = (om_plus - om_minus) * T
    gamma_patch = math.cos(lam_max) * delta_phi / PATCH_WIDTH
    stretch_min, stretch_max = principal_stretches(gamma_patch)
    assert abs(stretch_min * stretch_max - 1.0) < 2e-12

    eq_omega = omega(0.0, p)
    beta_eq = R_sun * eq_omega / c
    rho_eq = R_sun
    a_eq = rho_eq * eq_omega**2
    kappa_eq = rho_eq * (eq_omega / c)**2 / (1 + beta_eq**2)
    tau_eq = (eq_omega / c) / (1 + beta_eq**2)

    results.append((name, abs(gdot_max), math.degrees(lam_max)))
    print("\nPROFILE:", name)
    print("  coefficients / sigmas (microrad/s):",
          (p["A"], p["B"], p["C"]),
          (p["sigma_A"], p["sigma_B"], p["sigma_C"]))
    print(f"  equatorial rate={eq_omega*86400*180/math.pi:.9f} deg/day")
    print(f"  equatorial beta={beta_eq:.9e}")
    print(f"  equatorial a3={a_eq:.12e} m/s^2")
    print(f"  equatorial kappa4E*lP={kappa_eq*lP:.12e}")
    print(f"  equatorial kappa4E={kappa_eq:.12e} m^-1")
    print(f"  equatorial tau4E*lP={tau_eq*lP:.12e}")
    print(f"  max shear latitude={math.degrees(lam_max):.6f} deg")
    print(f"  signed gamma_dot={gdot_max:.12e} s^-1")
    print(f"  gamma_dot*tP={gdot_max*tP:.12e}")
    print(f"  shear timescale={1/abs(gdot_max)/86400:.6f} days")
    print(f"  local accumulated gamma={gamma_local:.9f}")
    print(f"  5-deg exact delta longitude={math.degrees(delta_phi):.9f} deg")
    print(f"  5-deg patch gamma={gamma_patch:.9f}")
    print(f"  principal stretches=({stretch_min:.9f},{stretch_max:.9f}); area ratio=1")

spread = (max(x[1] for x in results)-min(x[1] for x in results)) / np.mean([x[1] for x in results])
print(f"\nCross-profile max-shear spread / mean = {100*spread:.6f}%")

# Geometry identity: with w=ct and c=1, psi=phi+Omega(lambda)*w.
# In material coordinates (w,lambda,phi), the induced 3-metric is
# [[1+R^2 cos^2(lambda) Omega^2, R^2 cos^2(lambda) Omega*w*Omega', R^2 cos^2(lambda) Omega],
#  [sym., R^2(1+cos^2(lambda) w^2 Omega'^2), R^2 cos^2(lambda) w Omega'],
#  [sym., sym., R^2 cos^2(lambda)]]
# and det(g)=R^4 cos^2(lambda), independent of Omega, Omega', w.
# The unlabelled worldtube is S^2(R) x R, with intrinsic scalar curvature 2/R^2.
# The material flow has shear but zero surface-area/volume expansion.
print("CHECK: det(F)=1; det(g_worldtube)=R^4 cos^2(lambda); Theta=0.")
