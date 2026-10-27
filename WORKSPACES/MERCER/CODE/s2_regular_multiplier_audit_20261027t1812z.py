#!/usr/bin/env python3
"""Measured S2 osculating ellipse; representation-gauge audit of SAT archive encoder.
GRAVITY Collaboration (2020), A&A 636 L5, Appendix E Table E.1.
Original assistant-authored script Git blob 52107ba00737e5098f8557595096cc251b075300.
Not observed trajectory samples; Kepler comparator derived from measured-fit inputs.
"""
import json
import numpy as np

a_mas, sigma_a_mas = 125.058, 0.041
R0_pc, sigma_R0_pc = 8246.7, 9.3
e, sigma_e = 0.884649, 0.000066
a = a_mas * R0_pc / 1000.0  # AU: 1 mas at 1 pc = 0.001 AU
b = a * np.sqrt(1 - e*e)
E = np.linspace(0, 2*np.pi, 4097)  # algorithmic resolution, not observed points
x, y = a*(np.cos(E)-e), b*np.sin(E)
r = np.hypot(x,y)
F = ((x+a*e)/a)**2+(y/b)**2-1
dFx, dFy = 2*(x+a*e)/a**2, 2*y/b**2
# h>0 on the entire plane; unlike REJECTED h=r/a, hF has no extra zero.
h = 1+(r/a)**2
dhx, dhy = 2*x/a**2, 2*y/a**2
g0 = np.hypot(dFx,dFy)
g1x, g1y = h*dFx+F*dhx, h*dFy+F*dhy
g1 = np.hypot(g1x,g1y)
unit_normal_max_gap = np.max(np.hypot(dFx/g0-g1x/g1,dFy/g0-g1y/g1))

# Faithful transcription of the original script's normalize_channel routine.
def normalize_channel(q):
    q = np.asarray(q,dtype=float)
    finite = np.isfinite(q)
    if not np.any(finite):
        return np.zeros_like(q), True
    mn, mx = float(np.min(q[finite])), float(np.max(q[finite]))
    if abs(mx-mn) < 1e-14:
        return np.full_like(q,0.5), True
    return (q-mn)/(mx-mn), False

q0, deg0 = normalize_channel(g0)
q1, deg1 = normalize_channel(g1)
p, ap = 0, len(E)//2
sigma_a = a*np.hypot(sigma_a_mas/a_mas,sigma_R0_pc/R0_pc)
sigma_peri = np.hypot((1-e)*sigma_a,a*sigma_e)
result = {
    "real_system":"S2 around Sgr A*, 2020 GRAVITY orbital fit",
    "source":"DOI:10.1051/0004-6361/202037813, Appendix E Table E.1",
    "source_code_blob":"52107ba00737e5098f8557595096cc251b075300",
    "inputs":{"a_mas":a_mas,"a_fit_sigma_mas":sigma_a_mas,
              "R0_pc":R0_pc,"R0_fit_sigma_pc":sigma_R0_pc,
              "eccentricity":e,"eccentricity_fit_sigma":sigma_e},
    "derived":{"a_AU":a,"b_AU":b,"pericenter_AU":a*(1-e),
               "pericenter_sigma_AU_independent_marginals_only":sigma_peri},
    "diagnostic":{"algorithmic_samples":len(E),"max_abs_F":float(np.max(np.abs(F))),
       "h_min":float(np.min(h)),"h_max":float(np.max(h)),
       "q_F_peri":float(q0[p]),"q_F_apo":float(q0[ap]),
       "q_hF_peri":float(q1[p]),"q_hF_apo":float(q1[ap]),
       "max_channel_difference":float(np.max(np.abs(q0-q1))),
       "unit_normal_max_gap":float(unit_normal_max_gap),
       "degenerate":[bool(deg0),bool(deg1)]},
    "caveat":"No fitted covariance; not a new H(s)H prediction or independent observation."
}
assert np.max(np.abs(F)) < 1e-12
assert not deg0 and not deg1
assert abs(q0[p]-q0[ap]) < 1e-10
assert abs(q1[p]-q1[ap]) > 0.05
assert unit_normal_max_gap < 1e-12
print(json.dumps(result,indent=2))
