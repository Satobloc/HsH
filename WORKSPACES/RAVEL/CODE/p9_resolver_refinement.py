#!/usr/bin/env python3
"""P9 resolver-refinement audit for the implicit normal-equation jet.

Sandbox only.  The 16/24/32/48 sequence is a matched-domain family, not a
strictly nested node sequence.  A second 16/31/61 sequence is truly nested in
log h and is included to distinguish density convergence from remeshing noise.
"""
from __future__ import annotations

import json
import numpy as np
from scipy.optimize import brentq

from p9_implicit_normal_jet import implicit_response
from p9_zero_curve_continuation import HREF

PRIMARY = (2e-5, 1e-4, 2e-5)
COARSE = (4e-5, 2e-4, 4e-5)
COUNTS = (16, 24, 32, 48)
TRUE_NESTED = (16, 31, 61, 121)
A_BULK = 0.055
SIDE_EPS = 1e-4


def grid(n):
    return HREF*np.geomspace(.14, 1.55, n)


def max_log_gap(h):
    return float(np.max(np.diff(np.log(h))))


def solve_root(a, h, steps=PRIMARY):
    cache = {}
    def f(o):
        k=round(float(o), 13)
        if k not in cache:
            cache[k]=implicit_response(float(a), float(o), h, *steps)
        return cache[k]["F_B_over_A"]
    lo, hi = -.045, .012
    flo, fhi = f(lo), f(hi)
    if flo*fhi > 0:
        xs=np.linspace(-.10,.05,31)
        fs=[f(x) for x in xs]
        pair=next(((xs[i],xs[i+1]) for i in range(len(xs)-1) if fs[i]*fs[i+1] <= 0),None)
        if pair is None:
            raise RuntimeError(f"root unbracketed at a={a}: {min(fs):g}..{max(fs):g}")
        lo,hi=pair
    root=float(brentq(f,lo,hi,xtol=2e-9,rtol=2e-11,maxiter=50))
    z=implicit_response(float(a),root,h,*steps)
    return root,z


def nearest_contact(h, target=.06):
    aa=np.asarray(h)-1.0
    valid=aa[(aa>.015)&(aa<.18)]
    return float(valid[np.argmin(abs(valid-target))])


def fit_limit(rows):
    x=np.array([r["max_log_gap"] for r in rows])
    y=np.array([r["root_o"] for r in rows])
    p1=np.polyfit(x,y,1)
    p2=np.polyfit(x,y,2) if len(rows)>=3 else [np.nan]*3
    return {"linear_gap_limit":float(p1[-1]),
            "quadratic_gap_limit":float(p2[-1]),
            "last_increment":float(y[-1]-y[-2]),
            "range":float(y.max()-y.min())}


def main():
    matched=[]
    sided=[]
    for n in COUNTS:
        h=grid(n)
        r,z=solve_root(A_BULK,h)
        rc,zc=solve_root(A_BULK,h,COARSE)
        matched.append({"channels":n,"a":A_BULK,"max_log_gap":max_log_gap(h),
                        "root_o":r,"coarse_root_o":rc,
                        "step_root_shift":float(r-rc),
                        "F_at_root":z["F_B_over_A"],
                        "hessian_condition":z["hessian_condition"],
                        "crosses_train_contact_stratum":z["crosses_train_contact_stratum"]})
        ac=nearest_contact(h)
        rm,zm=solve_root(ac-SIDE_EPS,h)
        rp,zp=solve_root(ac+SIDE_EPS,h)
        sided.append({"channels":n,"contact_a":ac,"epsilon":SIDE_EPS,
                      "max_log_gap":max_log_gap(h),"root_below":rm,
                      "root_above":rp,"sided_jump":float(rp-rm),
                      "crossing_below":zm["crosses_train_contact_stratum"],
                      "crossing_above":zp["crosses_train_contact_stratum"]})
        print(f"N={n:2d} bulk={r:+.9f} step={r-rc:+.2e} contact={ac:.9f} jump={rp-rm:+.3e}",flush=True)

    nested=[]
    nested_contact=[]
    inherited_contact=float(grid(16)[11]-1.0)
    for n in TRUE_NESTED:
        h=grid(n)
        r,z=solve_root(A_BULK,h)
        nested.append({"channels":n,"a":A_BULK,"max_log_gap":max_log_gap(h),
                       "root_o":r,"F_at_root":z["F_B_over_A"],
                       "crosses_train_contact_stratum":z["crosses_train_contact_stratum"]})
        rm,zm=solve_root(inherited_contact-SIDE_EPS,h)
        rp,zp=solve_root(inherited_contact+SIDE_EPS,h)
        nested_contact.append({"channels":n,"contact_a":inherited_contact,
            "max_log_gap":max_log_gap(h),"root_below":rm,"root_above":rp,
            "sided_jump":float(rp-rm),
            "crossing_below":zm["crosses_train_contact_stratum"],
            "crossing_above":zp["crosses_train_contact_stratum"]})
        print(f"nested N={n:3d} bulk={r:+.9f} inherited-jump={rp-rm:+.3e}",flush=True)

    jump_abs=np.array([abs(q["sided_jump"]) for q in sided])
    gaps=np.array([q["max_log_gap"] for q in sided])
    jump_fit=np.polyfit(gaps,jump_abs,1)
    out={
      "status":"sandbox resolver-refinement audit; not canonical theory",
      "geometry":{"h_min":float(.14*HREF),"h_max":float(1.55*HREF),
                  "bulk_a":A_BULK,"sided_epsilon":SIDE_EPS},
      "clarification":"16/24/32/48 is matched-domain refinement, not strict nesting; 16/31/61 is the strict log-grid nesting sequence.",
      "matched_domain":matched,
      "matched_limit_fits":fit_limit(matched),
      "strict_nested":nested,
      "strict_nested_limit_fits":fit_limit(nested),
      "strict_nested_inherited_contact":nested_contact,
      "contact_sided":sided,
      "contact_jump_linear_gap_intercept":float(jump_fit[-1]),
      "summary":{"matched_last_increment":float(matched[-1]["root_o"]-matched[-2]["root_o"]),
                 "nested_last_increment":float(nested[-1]["root_o"]-nested[-2]["root_o"]),
                 "max_abs_step_root_shift":float(max(abs(q["step_root_shift"]) for q in matched)),
                 "max_abs_contact_jump":float(jump_abs.max()),
                 "last_abs_contact_jump":float(jump_abs[-1]),
                 "nested_last_abs_contact_jump":float(abs(nested_contact[-1]["sided_jump"])),
                 "any_contact_crossing":bool(any(q["crossing_below"] or q["crossing_above"] for q in sided))}}
    with open("p9_resolver_refinement.json","w",encoding="utf-8") as f:
        json.dump(out,f,indent=2)
    print(json.dumps(out["summary"],indent=2))


if __name__=="__main__":
    main()
