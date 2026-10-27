#!/usr/bin/env python3
"""S2 measured-orbit audit of archived gradient channel (not an HsH prediction).
GRAVITY Collaboration 2020 A&A 636 L5 Table E.1.
Original assistant-authored encoder Git blob:
52107ba00737e5098f8557595096cc251b075300.
"""
import json
import math
import numpy as np
import sympy as sp

# Measured osculating-fit inputs, with marginal 1-sigma errors.
a_mas, sa_mas = 125.058, 0.041
R0_pc, sR0_pc = 8246.7, 9.3
e, se = 0.884649, 0.000066
a = a_mas * R0_pc / 1000  # AU, mas * kpc
b = a * math.sqrt(1-e*e)
X,Y,A,E = sp.symbols("X Y A E", real=True)
F = (X/A)**2 + (Y/(A*sp.sqrt(1-E**2)))**2 - 1
h = sp.sqrt((X-A*E)**2+Y**2)/A  # physical focus distance / a
G = h*F
dF = [sp.diff(F,z) for z in (X,Y)]
dG = [sp.diff(G,z) for z in (X,Y)]
rows = {}
for name,sign in [("pericenter",1),("apocenter",-1)]:
    sub = {A:a,E:e,X:sign*a,Y:0}
    normF = math.hypot(*(float(z.subs(sub)) for z in dF))
    normG = math.hypot(*(float(z.subs(sub)) for z in dG))
    hv = float(h.subs(sub))
    assert abs(float(F.subs(sub))) < 1e-12
    assert abs(float(G.subs(sub))) < 1e-12
    assert math.isclose(normG,hv*normF,rel_tol=1e-12)
    rows[name] = dict(h=hv,gradient_F_AU_inverse=normF,gradient_G_AU_inverse=normG)

# Source-code normalize_channel verbatim, tested at the two measured apsides.
def normalize_channel(q):
    q = np.asarray(q, dtype=float)
    finite = np.isfinite(q)
    if not np.any(finite):
        return np.zeros_like(q), True
    mn = float(np.min(q[finite]))
    mx = float(np.max(q[finite]))
    if abs(mx-mn) < 1e-14:
        return np.full_like(q,0.5), True
    return (q-mn)/(mx-mn), False

Fq = [rows[z]["gradient_F_AU_inverse"] for z in ("pericenter","apocenter")]
Gq = [rows[z]["gradient_G_AU_inverse"] for z in ("pericenter","apocenter")]
Fn,Fdeg = normalize_channel(Fq)
Gn,Gdeg = normalize_channel(Gq)
assert Fdeg and not Gdeg
assert np.allclose(Fn,[0.5,0.5]) and np.allclose(Gn,[0,1])
result = dict(a_AU=a,b_AU=b,a_sigma_AU_marginal_independence_approx=
    a*math.hypot(sa_mas/a_mas,sR0_pc/R0_pc),
    e=e,e_sigma=se,apsides=rows,
    G_gradient_apo_peri_ratio=(1+e)/(1-e),
    ratio_sigma_first_order=2*se/(1-e)**2,
    F_normalized=Fn.tolist(),G_normalized=Gn.tolist(),
    F_degenerate=bool(Fdeg),G_degenerate=bool(Gdeg),
    caveat="Fitted Kepler control; full fit covariance unavailable; no held-out HsH prediction")
print(json.dumps(result,indent=2))
