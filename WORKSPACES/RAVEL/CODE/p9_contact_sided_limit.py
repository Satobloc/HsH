#!/usr/bin/env python3
"""Probe smaller P9 moment amplitudes on each side of a contact stratum.

Important type correction: delta perturbs the ninth morphology moment; it
does not perturb support asymmetry a. No delta probe crosses the contact
threshold. This script only diagnosed the subtractive numerical floor of the
paired-norm quotient at two fixed, separately stratified support settings.
"""
from __future__ import annotations

import json
import numpy as np
from scipy.optimize import brentq

from p9_local_limit_grid_audit import local_response, BASE, A_STAR

DELTAS=np.array([8e-5,4e-5,2e-5,1e-5])
A_VALUES=np.array([A_STAR-1e-4,A_STAR+1e-4])


def main():
    cache={}
    def ev(a,o,d):
        key=(round(float(a),12),round(float(o),12),round(float(d),12))
        if key not in cache:
            cache[key]=local_response(a,o,d,BASE)
        return cache[key]

    roots=[]
    for a in A_VALUES:
        for d in DELTAS:
            fun=lambda o:ev(a,o,d)["F_local_B_over_A"]
            root=float(brentq(fun,-.04,.002,xtol=3e-8,rtol=2e-10,maxiter=36))
            q=ev(a,root,d)
            roots.append({"a":float(a),"delta":float(d),"root_o":root,
                          "F_at_root":q["F_local_B_over_A"],
                          "diagnostics":{k:q[k] for k in (
                            "max_lower_moment_drift","min_hessian_eigenvalue",
                            "max_hessian_condition","max_distinct_solutions")}})
            print(f"a={a:.12f} d={d:.1e} o={root:+.9f}",flush=True)

    extrap=[]
    for a in A_VALUES:
        g=[q for q in roots if np.isclose(q["a"],a)]
        dd=np.array([q["delta"] for q in g]); oo=np.array([q["root_o"] for q in g])
        coef=np.polyfit(dd*dd,oo,1)
        pred=np.polyval(coef,dd*dd)
        extrap.append({"a":float(a),"side":"below" if a<A_STAR else "above",
                       "o_delta0":float(coef[-1]),
                       "coeff_delta2_constant":coef.tolist(),
                       "fit_rmse":float(np.sqrt(np.mean((oo-pred)**2))),
                       "last_step_change":float(abs(oo[-1]-oo[-2]))})

    out={"status":"sandbox same-stratum sided-limit audit; not canonical theory",
         "base_contact_threshold":float(A_STAR),"offset_from_threshold":1e-4,
         "deltas":DELTAS.tolist(),"roots":roots,"extrapolations":extrap,
         "jump_in_sided_delta0_roots":float(extrap[1]["o_delta0"]-extrap[0]["o_delta0"]),
         "summary":{"max_abs_root_residual":float(max(abs(q["F_at_root"]) for q in roots)),
                    "max_last_step_root_change":float(max(q["last_step_change"] for q in extrap)),
                    "max_fit_rmse":float(max(q["fit_rmse"] for q in extrap)),
                    "min_hessian_eigenvalue":float(min(q["diagnostics"]["min_hessian_eigenvalue"] for q in roots)),
                    "max_hessian_condition":float(max(q["diagnostics"]["max_hessian_condition"] for q in roots)),
                    "max_distinct_nuisance_solutions":int(max(q["diagnostics"]["max_distinct_solutions"] for q in roots)),
                    "max_lower_moment_drift":float(max(q["diagnostics"]["max_lower_moment_drift"] for q in roots))}}
    with open("p9_contact_sided_limit.json","w",encoding="utf-8") as f:
        json.dump(out,f,indent=2)
    print(json.dumps(out,indent=2))


if __name__=="__main__":
    main()
