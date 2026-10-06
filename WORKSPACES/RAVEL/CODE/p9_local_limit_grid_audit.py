#!/usr/bin/env python3
"""P9 delta->0 local-response and resolver-grid audit.

Sandbox only. Replaces the finite signed-amplitude polynomial with a paired
quotient that converges directly to B/A, then extrapolates zero roots in
delta^2 under three acquisition-height designs.
"""
from __future__ import annotations

import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import brentq

import support_mirror_mode_asymmetry as sm
from p9_zero_curve_continuation import strict_fit, supports, EVEN_BASE, HREF, SCALE

DELTAS=np.array([.0035,.00175,.000875,.0004375])
BASE=HREF*np.geomspace(.14,1.55,16)
JITTER=BASE*(1+np.array([0,.006,-.004,.008,-.006,.003,-.007,.005,
                         -.003,.007,-.005,.004,-.006,.006,-.004,0]))
DENSE=HREF*np.geomspace(.14,1.55,24)
DESIGNS={"base16":BASE,"jitter16":JITTER,"dense24":DENSE}
A_STAR=float(BASE[11]-1)
A_VALUES=np.array([.04,.058,A_STAR-.0001,A_STAR+.0001,.07])


def local_response(a,o,delta,train_h,qorder=sm.CONTACT_ORDER):
    rp0,rm0=supports(a)
    low=np.array([o,EVEN_BASE,o,EVEN_BASE,o,EVEN_BASE])
    eta_low=sm.eta_for_moments(low)
    eta_base=np.r_[eta_low,np.zeros(sm.N_TRUE-sm.N_FIT)]
    base_m=sm.moments(eta_base)
    hold_h=HREF*np.geomspace(.055,3.20,24)
    Lt=np.linalg.cholesky(sm.covariance(len(train_h)))
    Chi=np.linalg.inv(sm.covariance(len(hold_h)))
    yh0=sm.observe(hold_h,rp0,rm0,eta_base,qorder=qorder)
    lam={}; diag=[]; drift=0.
    for sign in (-1,1):
        et=sm.individual_truth(base_m,9,sign*delta)
        drift=max(drift,float(np.max(np.abs(sm.moments(et)[:8]-base_m[:8]))))
        yt=sm.observe(train_h,rp0,rm0,et,qorder=qorder)
        yht=sm.observe(hold_h,rp0,rm0,et,qorder=qorder)
        f=strict_fit(train_h,yt,Lt,rp0,rm0,eta_low,qorder)
        r=yht-sm.observe(hold_h,f.rp,f.rm,f.eta,qorder=qorder)
        lam[sign]=float(r@Chi@r); diag.append(f)
    # If lambda=A*x^2+B*x^3+..., this tends to B/A in the script's x=delta/SCALE convention.
    F=SCALE*(lam[1]-lam[-1])/(delta*(lam[1]+lam[-1]))
    return {"F_local_B_over_A":float(F),"lambda_minus":lam[-1],
            "lambda_plus":lam[1],"max_lower_moment_drift":drift,
            "min_hessian_eigenvalue":float(min(d.hessian_min for d in diag)),
            "max_hessian_condition":float(max(d.hessian_condition for d in diag)),
            "max_distinct_solutions":int(max(d.distinct_solutions for d in diag))}


def main():
    cache={}
    def ev(design,a,o,d):
        key=(design,round(float(a),12),round(float(o),12),round(float(d),12))
        if key not in cache:
            cache[key]=local_response(a,o,d,DESIGNS[design])
        return cache[key]
    roots=[]
    for design in DESIGNS:
        for a in A_VALUES:
            for d in DELTAS:
                fun=lambda o:ev(design,a,o,d)["F_local_B_over_A"]
                lo,hi=-.04,.002
                flo,fhi=fun(lo),fun(hi)
                if flo*fhi>0:
                    raise RuntimeError(f"no root: {design} a={a} d={d} F={flo},{fhi}")
                root=float(brentq(fun,lo,hi,xtol=8e-8,rtol=2e-10,maxiter=32))
                q=ev(design,a,root,d)
                roots.append({"design":design,"a":float(a),"delta":float(d),
                              "root_o":root,"F_at_root":q["F_local_B_over_A"],
                              "diagnostics":{k:q[k] for k in (
                                "max_lower_moment_drift","min_hessian_eigenvalue",
                                "max_hessian_condition","max_distinct_solutions")}})
                print(f"{design} a={a:.9f} d={d:.7f} o={root:+.9f}",flush=True)

    extrap=[]
    for design in DESIGNS:
        for a in A_VALUES:
            g=[q for q in roots if q["design"]==design and np.isclose(q["a"],a)]
            dd=np.array([q["delta"] for q in g]); oo=np.array([q["root_o"] for q in g])
            # Paired quotient has an even leading correction; retain quadratic and quartic terms.
            coef=np.polyfit(dd*dd,oo,2)
            pred=np.polyval(coef,dd*dd); o0=float(coef[-1])
            extrap.append({"design":design,"a":float(a),"o_delta0":o0,
                           "coeff_delta4_delta2_constant":coef.tolist(),
                           "fit_rmse":float(np.sqrt(np.mean((oo-pred)**2))),
                           "last_step_change":float(abs(oo[-1]-oo[-2]))})

    # Contact proximity of each tested a for each acquisition design.
    proximity={}
    for design,h in DESIGNS.items():
        proximity[design]={f"{a:.12f}":float(np.min(np.abs(h-(1+a)))) for a in A_VALUES}

    spread=[]
    for a in A_VALUES:
        vals=[q["o_delta0"] for q in extrap if np.isclose(q["a"],a)]
        spread.append({"a":float(a),"min":float(min(vals)),"max":float(max(vals)),
                       "spread":float(max(vals)-min(vals))})
    out={"status":"sandbox local-response audit; not canonical theory",
         "definition":{"F_delta":"SCALE*(lambda(+delta)-lambda(-delta))/(delta*(lambda(+delta)+lambda(-delta)))",
                       "limit":"F_delta -> B/A as delta -> 0"},
         "deltas":DELTAS.tolist(),"a_values":A_VALUES.tolist(),
         "design_heights":{k:v.tolist() for k,v in DESIGNS.items()},
         "base_contact_threshold":A_STAR,"contact_proximity":proximity,
         "roots":roots,"delta2_extrapolations":extrap,"grid_spread":spread,
         "summary":{"max_abs_root_residual":float(max(abs(q["F_at_root"]) for q in roots)),
                    "max_last_step_root_change":float(max(q["last_step_change"] for q in extrap)),
                    "max_delta2_fit_rmse":float(max(q["fit_rmse"] for q in extrap)),
                    "max_grid_spread_in_delta0_root":float(max(q["spread"] for q in spread)),
                    "min_hessian_eigenvalue":float(min(q["diagnostics"]["min_hessian_eigenvalue"] for q in roots)),
                    "max_hessian_condition":float(max(q["diagnostics"]["max_hessian_condition"] for q in roots)),
                    "max_distinct_nuisance_solutions":int(max(q["diagnostics"]["max_distinct_solutions"] for q in roots)),
                    "max_lower_moment_drift":float(max(q["diagnostics"]["max_lower_moment_drift"] for q in roots))}}
    with open("p9_local_limit_grid_audit.json","w",encoding="utf-8") as f:
        json.dump(out,f,indent=2)

    fig,axes=plt.subplots(1,3,figsize=(14.5,4.5))
    colors={"base16":"tab:blue","jitter16":"tab:orange","dense24":"tab:green"}
    for design in DESIGNS:
        for a in A_VALUES:
            g=sorted([q for q in roots if q["design"]==design and np.isclose(q["a"],a)],key=lambda q:q["delta"])
            axes[0].plot([q["delta"]**2 for q in g],[q["root_o"] for q in g],"o-",color=colors[design],alpha=.65)
        ex=[q for q in extrap if q["design"]==design]
        axes[1].plot([q["a"] for q in ex],[q["o_delta0"] for q in ex],"o-",label=design,color=colors[design])
    axes[0].set(xlabel=r"delta^2",ylabel="P9 zero root o",title="Local-limit convergence")
    axes[1].axvline(A_STAR,ls="--",color="0.4",lw=.9,label="base contact stratum")
    axes[1].set(xlabel="support asymmetry a",ylabel=r"extrapolated o(delta->0)",title="Resolver-grid dependence")
    axes[1].legend(fontsize=8)
    axes[2].plot([q["a"] for q in spread],[q["spread"] for q in spread],"o-",color="tab:red")
    axes[2].set(xlabel="support asymmetry a",ylabel="grid spread in local root",title="Intrinsic-curve failure metric")
    fig.suptitle("P9 local-response limit across acquisition-height grids")
    fig.tight_layout()
    fig.savefig("p9_local_limit_grid_audit.svg")
    fig.savefig("p9_local_limit_grid_audit.png",dpi=180)
    print(json.dumps(out["summary"],indent=2))


if __name__=="__main__": main()
