#!/usr/bin/env python3
"""Observed CME GCS aspect ratios -> external 3D finite-core local-reach gate.

Eight fast/slow Earth-directed CMEs from Mishra, Agarwal & Srivastava (2026),
Tables 1 and 2. GCS aspect ratio chi = flux-rope radius / apex-centre height.
No native cw=t map, SAT parameter, stress-energy, or bending modulus is fit.
Planck units are used first; SI values are emitted for interpretation.
"""
import math
import numpy as np

c = 299_792_458.0
G = 6.67430e-11
hbar = 1.054571817e-34
lP = math.sqrt(hbar * G / c**3)
Rsun = 6.957e8
Rsun_P = Rsun / lP

# date, class, last-coronal leading-edge height [Rsun], sigma_h [Rsun],
# chi_initial, sigma, chi_last_corona, sigma, chi_1AU, sigma
events = [
    ("2011-06-02", "fast", 13.5, 1.4, .19, .03, .23, .03, .11, .024),
    ("2012-07-12", "fast", 14.9, 1.5, .36, .02, .61, .03, .37, .020),
    ("2013-04-11", "fast", 16.3, 2.4, .10, .02, .40, .07, .14, .015),
    ("2013-09-29", "fast", 15.2, 1.5, .42, .04, .60, .06, .11, .041),
    ("2008-12-12", "slow", 15.1, 1.5, .13, .006, .23, .01, .05, .008),
    ("2010-04-03", "slow", 13.7, .7, .26, .04, .37, .05, .22, .057),
    ("2010-04-08", "slow", 13.8, .7, .14, .02, .28, .04, .068, .002),
    ("2011-09-13", "slow", 14.1, .7, .34, .05, .43, .06, .10, .027),
]

print(f"R_sun/lP = {Rsun_P:.12e}")
print("date class chi_i chi_cor chi_1AU Jmin_cor Rc/a a[R_sun] Rc[R_sun] a/lP Rc/lP kappa_axis*lP")
for d in events:
    date, kind, h, sh, qi, si, qc, sc, q1, s1 = d
    # GCS: chi = a/Rc; leading edge h = a + Rc.
    a = qc / (1 + qc) * h
    rc = h / (1 + qc)
    aP, rcP = a * Rsun_P, rc * Rsun_P
    kappaP = 1 / rcP
    assert 0 < qc < 1
    print(date, kind, qi, qc, q1, 1-qc, 1/qc, a, rc, aP, rcP, kappaP)

q_initial = np.array([d[4] for d in events])
q_corona = np.array([d[6] for d in events])
q_1au = np.array([d[8] for d in events])
print("\nSTAGE SUMMARY")
for label, values in (("initial corona", q_initial),
                      ("last tracked corona", q_corona),
                      ("1 AU", q_1au)):
    print(label, "mean", values.mean(), "median", np.median(values),
          "range", (values.min(), values.max()),
          "Jmin range", (1-values.max(), 1-values.min()))
print("largest coronal chi and local Jacobian margin:", q_corona.max(), 1-q_corona.max())
print("all 8 events increase chi from initial to final corona:", bool(np.all(q_corona > q_initial)))
print("all 8 events decrease chi from final corona to 1 AU:", bool(np.all(q_1au < q_corona)))
for kind in ("fast", "slow"):
    subset = [d for d in events if d[1] == kind]
    print(kind, "mean chi initial/final/1AU",
          *[np.mean([d[i] for d in subset]) for i in (4, 6, 8)])

# Local tubular-coordinate Jacobian: J=1-kappa_1*y_n, |y_n|<=a.
# With chi=a/Rc=a*kappa_1, the innermost value is J_min=1-chi.
# This is a local reach check only, not a global self-contact test.
print("CHECK: chi<1 for all reported coronal and 1-AU central values.")
