#!/usr/bin/env python3
"""Differentiate the optimized P9 residual before forming its norm.

Sandbox only. The previous paired quotient subtracts two O(delta^2)
noncentralities to isolate an O(delta^3) term. Here the held-out residual
vector is fitted directly as a jet in the P9 moment amplitude after each
strict nuisance refit. This moves differentiation ahead of the norm and
avoids the most destructive cancellation.
"""
from __future__ import annotations

import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.linalg import solve_triangular

import support_mirror_mode_asymmetry as sm
from p9_zero_curve_continuation import strict_fit, supports, EVEN_BASE, HREF, SCALE
from p9_local_limit_grid_audit import BASE, JITTER, DENSE, A_STAR

DESIGNS={"base16":BASE,"jitter16":JITTER,"dense24":DENSE}
A_VALUES=np.array([A_STAR-1e-4,A_STAR+1e-4])
AMPS=np.array([.00035,.00070,.00105,.00140,.00210,.00280])
WINDOWS={"narrow":.00140,"wide":.00280}


def optimized_residual_samples(a,o,train_h,qorder=sm.CONTACT_ORDER):
    rp0,rm0=supports(a)
    low=np.array([o,EVEN_BASE,o,EVEN_BASE,o,EVEN_BASE])
    eta_low=sm.eta_for_moments(low)
    eta_base=np.r_[eta_low,np.zeros(sm.N_TRUE-sm.N_FIT)]
    base_m=sm.moments(eta_base)
    hold_h=HREF*np.geomspace(.055,3.20,24)
    Lt=np.linalg.cholesky(sm.covariance(len(train_h)))
    Lh=np.linalg.cholesky(sm.covariance(len(hold_h)))
    rows=[]
    for delta in np.r_[-AMPS[::-1],AMPS]:
        et=sm.individual_truth(base_m,9,float(delta))
        yt=sm.observe(train_h,rp0,rm0,et,qorder=qorder)
        yht=sm.observe(hold_h,rp0,rm0,et,qorder=qorder)
        f=strict_fit(train_h,yt,Lt,rp0,rm0,eta_low,qorder)
        r=yht-sm.observe(hold_h,f.rp,f.rm,f.eta,qorder=qorder)
        rw=solve_triangular(Lh,r,lower=True,check_finite=False)
        rows.append({"delta":float(delta),"residual_whitened":rw,
                     "fit_x":f.x,"cost":f.cost,
                     "hessian_min":f.hessian_min,
                     "hessian_condition":f.hessian_condition,
                     "distinct_solutions":f.distinct_solutions,
                     "lower_moment_drift":float(np.max(np.abs(
                         sm.moments(et)[:8]-base_m[:8])))})
    return rows


def residual_jet(rows,max_amp):
    use=[r for r in rows if abs(r["delta"])<=max_amp+1e-15]
    d=np.array([r["delta"] for r in use])
    E=np.stack([r["residual_whitened"] for r in use])
    X=np.c_[d,d*d,d**3,d**4]
    C,*_=np.linalg.lstsq(X,E,rcond=None)
    pred=X@C
    c1,c2=C[0],C[1]
    A=float(c1@c1)
    B=float(2*c1@c2)
    return {"max_amplitude":float(max_amp),"n_signed_samples":len(use),
            "A_delta2":A,"B_delta3":B,
            "F_B_over_A":float(SCALE*B/A),
            "residual_jet_rmse_sigma":float(np.sqrt(np.mean((E-pred)**2))),
            "max_residual_jet_error_sigma":float(np.max(np.abs(E-pred)))}


def main():
    coarse=json.load(open("p9_local_limit_grid_audit.json",encoding="utf-8"))
    coarse_root={(q["design"],round(q["a"],12)):q["o_delta0"]
                 for q in coarse["delta2_extrapolations"]}
    evaluations=[]
    offset=.0010
    for design,h in DESIGNS.items():
        for a in A_VALUES:
            oc=float(coarse_root[(design,round(float(a),12))])
            for o in (oc-offset,oc,oc+offset):
                rows=optimized_residual_samples(float(a),float(o),h)
                jets={name:residual_jet(rows,amp) for name,amp in WINDOWS.items()}
                evaluations.append({"design":design,"a":float(a),"o":float(o),
                    "coarse_root":oc,"jets":jets,
                    "diagnostics":{"min_hessian_eigenvalue":float(min(r["hessian_min"] for r in rows)),
                      "max_hessian_condition":float(max(r["hessian_condition"] for r in rows)),
                      "max_distinct_solutions":int(max(r["distinct_solutions"] for r in rows)),
                      "max_lower_moment_drift":float(max(r["lower_moment_drift"] for r in rows)),
                      "max_fit_cost":float(max(r["cost"] for r in rows))}})
                print(f"{design} a={a:.9f} o={o:+.8f} "
                      f"Fn={jets['narrow']['F_B_over_A']:+.5e} "
                      f"Fw={jets['wide']['F_B_over_A']:+.5e}",flush=True)

    roots=[]
    for design in DESIGNS:
        for a in A_VALUES:
            g=sorted([q for q in evaluations if q["design"]==design and np.isclose(q["a"],a)],
                     key=lambda q:q["o"])
            row={"design":design,"a":float(a),"coarse_root":g[1]["coarse_root"]}
            for window in WINDOWS:
                oo=np.array([q["o"] for q in g])
                ff=np.array([q["jets"][window]["F_B_over_A"] for q in g])
                coef=np.polyfit(oo,ff,1)
                root=float(-coef[1]/coef[0])
                pred=np.polyval(coef,oo)
                row[window]={"root_o":root,"slope_dF_do":float(coef[0]),
                    "linear_fit_rmse":float(np.sqrt(np.mean((ff-pred)**2))),
                    "root_shift_from_coarse":float(root-g[1]["coarse_root"])}
            row["window_root_difference"]=float(row["narrow"]["root_o"]-row["wide"]["root_o"])
            roots.append(row)

    spread=[]
    for a in A_VALUES:
        vals=[q["narrow"]["root_o"] for q in roots if np.isclose(q["a"],a)]
        spread.append({"a":float(a),"min":float(min(vals)),"max":float(max(vals)),
                       "resolver_spread":float(max(vals)-min(vals))})
    sided={d:float(next(q for q in roots if q["design"]==d and q["a"]>A_STAR)["narrow"]["root_o"]-
                   next(q for q in roots if q["design"]==d and q["a"]<A_STAR)["narrow"]["root_o"])
           for d in DESIGNS}
    out={"status":"sandbox optimized-residual jet audit; not canonical theory",
         "definition":{"residual_jet":"e(delta)=c1 delta+c2 delta^2+c3 delta^3+c4 delta^4",
            "local_response":"F0=SCALE*2<c1,c2>/<c1,c1>",
            "important_type_note":"delta perturbs the P9 moment; it does not perturb support a or cross a contact stratum"},
         "amplitudes":AMPS.tolist(),"windows":WINDOWS,"base_contact_threshold":float(A_STAR),
         "evaluations":evaluations,"recovered_roots":roots,
         "resolver_spread":spread,"sided_root_difference":sided,
         "summary":{"max_abs_window_root_difference":float(max(abs(q["window_root_difference"]) for q in roots)),
            "max_abs_shift_from_coarse":float(max(abs(q["narrow"]["root_shift_from_coarse"]) for q in roots)),
            "max_resolver_spread":float(max(q["resolver_spread"] for q in spread)),
            "min_abs_transverse_slope":float(min(abs(q["narrow"]["slope_dF_do"]) for q in roots)),
            "max_narrow_jet_rmse_sigma":float(max(q["jets"]["narrow"]["residual_jet_rmse_sigma"] for q in evaluations)),
            "min_hessian_eigenvalue":float(min(q["diagnostics"]["min_hessian_eigenvalue"] for q in evaluations)),
            "max_hessian_condition":float(max(q["diagnostics"]["max_hessian_condition"] for q in evaluations)),
            "max_distinct_nuisance_solutions":int(max(q["diagnostics"]["max_distinct_solutions"] for q in evaluations)),
            "max_lower_moment_drift":float(max(q["diagnostics"]["max_lower_moment_drift"] for q in evaluations))}}
    with open("p9_residual_jet_audit.json","w",encoding="utf-8") as f:
        json.dump(out,f,indent=2,default=lambda z:z.tolist() if isinstance(z,np.ndarray) else z)

    fig,axes=plt.subplots(1,3,figsize=(14.2,4.5))
    colors={"base16":"tab:blue","jitter16":"tab:orange","dense24":"tab:green"}
    for design in DESIGNS:
        rr=[q for q in roots if q["design"]==design]
        axes[0].plot([q["a"] for q in rr],[q["narrow"]["root_o"] for q in rr],"o-",label=design,color=colors[design])
        axes[1].plot([q["a"] for q in rr],[q["window_root_difference"] for q in rr],"o-",color=colors[design])
    axes[0].axvline(A_STAR,color=".4",ls="--",lw=.9)
    axes[0].set(xlabel="support asymmetry a",ylabel="residual-jet P9 zero",title="Sided local roots")
    axes[0].legend(fontsize=8)
    axes[1].axhline(0,color=".5",lw=.8)
    axes[1].set(xlabel="support asymmetry a",ylabel="narrow - wide root",title="Jet-window stability")
    axes[2].bar(np.arange(len(sided)),list(sided.values()),color=[colors[k] for k in sided])
    axes[2].set_xticks(np.arange(len(sided)),list(sided),rotation=20)
    axes[2].set(ylabel="root above - root below",title="Contact-stratum sided jump")
    fig.suptitle("P9 optimized-residual jet: local limit without norm subtraction")
    fig.tight_layout()
    fig.savefig("p9_residual_jet_audit.svg")
    fig.savefig("p9_residual_jet_audit.png",dpi=180)
    print(json.dumps(out["summary"],indent=2))


if __name__=="__main__":
    main()
