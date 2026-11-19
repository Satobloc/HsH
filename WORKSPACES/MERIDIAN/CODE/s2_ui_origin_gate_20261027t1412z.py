#!/usr/bin/env python3
"""Reproduce S2 origin sensitivity against the existing Meridian UI mapper.

Source of measured osculating elements: GRAVITY Collaboration (2020),
A&A 636 L5, Appendix E Table E.1, DOI 10.1051/0004-6361/202037813.
This uses a Newtonian Kepler comparator evaluated from measured-fit
parameters, NOT the original astrometry time series, a GR orbit fit, or
an H(s)H prediction. The full covariance matrix is not included.

Run from HsH checkout root:
  python WORKSPACES/MERIDIAN/CODE/s2_ui_origin_gate_20261027t1412z.py
"""
import math
import sys
from pathlib import Path
import numpy as np

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT / "WORKSPACES/MERIDIAN/SOLVER_HARNESS/UI_MAPPER"))
from ui_mapper_basic import build_ui_controls

# GRAVITY 2020 fitted central values; correlated formal errors omitted here.
a_mas, r0_pc, e, m_million_solar = 125.058, 8246.7, 0.884649, 4.261
AU = 149597870700.0                 # IAU exact, meters
GM_SUN = 1.3271244e20               # IAU nominal, m^3/s^2
c = 299792458.0                     # SI exact, m/s
a = a_mas * r0_pc / 1000 * AU
rp = a * (1 - e)
mu = m_million_solar * 1e6 * GM_SUN
n = math.sqrt(mu / a**3)

def xy_at(t):
    mean_anomaly = n * t
    E = mean_anomaly
    for _ in range(16):
        E -= (E - e * math.sin(E) - mean_anomaly) / (1 - e * math.cos(E))
    return a * (math.cos(E) - e), a * math.sqrt(1 - e**2) * math.sin(E)

t = np.linspace(-86400.0, 86400.0, 301) # evaluation grid, not observation times
x = np.array([[c*ti, *xy_at(ti), 0.0] for ti in t])
y = x.copy()
y[:,1] -= rp                     # same orbit; spatial origin at S2 pericenter

def summarize(arr):
    r, u, R, omega, rec, seed = build_ui_controls(arr, t, "e0 = (1,0,0,0)")
    k = len(t)//2
    return dict(
        pericenter_r_m=float(r[k]),
        valid=bool(r[k] > 1e-12),
        u_norm=float(np.linalg.norm(u[k])),
        reconstruction_error_m=float(np.linalg.norm(rec[k]-arr[k])),
        adjacent_direction_dot=float(np.dot(u[k-1],u[k+1])),
        max_omega_fro_per_s=float(np.linalg.norm(omega,axis=(1,2)).max())
    )

A, B = summarize(x), summarize(y)
assert A["pericenter_r_m"] > 0 and A["valid"]
assert B["pericenter_r_m"] == 0 and not B["valid"]
assert B["u_norm"] == 0 and B["reconstruction_error_m"] == 0
assert np.allclose(x[:,0],y[:,0]) and np.allclose(x[:,2:],y[:,2:])
print("SgrA_centered:", A)
print("pericenter_centered:", B)
print("PASS: coordinate-origin sensitivity; NOT a physical singularity")
