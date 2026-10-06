#!/usr/bin/env python3
"""Strict-multistart continuation of the mirror-odd P9 zero set.

Sandbox-only numerical discriminator.  It asks whether the failed straight
cancellation line is replaced by a locally unique odd curve o=g(a), while
auditing nuisance-fit branch competition and Gauss-Newton rank.
"""
from __future__ import annotations

import json
from dataclasses import dataclass

import matplotlib.pyplot as plt
import numpy as np
from scipy.linalg import solve_triangular
from scipy.optimize import brentq, least_squares

import support_mirror_mode_asymmetry as sm

SCALE = 0.0025
HREF = 1.30
EVEN_BASE = -0.01
AMPS = np.array([0.0007, 0.0014, 0.0021, 0.0028, 0.0035])
A_POS = np.array([0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07])
SEED_SLOPE = -0.16981194198631053  # bracket seed only; not a fitted target


@dataclass
class FitDiag:
    rp: float
    rm: float
    eta: np.ndarray
    cost: float
    start: int
    distinct_solutions: int
    cost_gap: float
    hessian_min: float
    hessian_max: float
    hessian_condition: float
    x: np.ndarray


def supports(a):
    return 1.0-a, 1.0+a


def strict_fit(hs, y, chol, rp0, rm0, eta0, qorder, extra_start=None):
    lo = np.r_[-.2, -.2, np.full(sm.N_FIT, -1.)]
    hi = np.r_[ .2,  .2, np.full(sm.N_FIT,  1.)]

    def unpack(x):
        return rp0*np.exp(x[0]), rm0*np.exp(x[1]), x[2:]

    def residual(x):
        rp, rm, eta = unpack(x)
        r = solve_triangular(chol,
            sm.observe(hs, rp, rm, eta, qorder=qorder)-y,
            lower=True, check_finite=False)
        return np.r_[r, x[0]/sm.SUPPORT_PRIOR, x[1]/sm.SUPPORT_PRIOR]

    starts = ([] if extra_start is None else [np.asarray(extra_start)]) + [
              np.r_[0., 0., eta0], np.zeros(2+sm.N_FIT),
              np.r_[.01, -.01, [.03, -.03, .03, -.03, .03, -.03]],
              np.r_[-.01, .01, [-.03, .03, -.03, .03, -.03, .03]]]
    good=[]
    for i, start in enumerate(starts):
        ans=least_squares(residual,start,bounds=(lo,hi),x_scale="jac",
                          xtol=2e-9,ftol=2e-9,gtol=2e-9,max_nfev=2200)
        if ans.success and np.all(np.isfinite(ans.x)):
            good.append((float(ans.cost),i,ans.x.copy(),ans.jac.copy()))
    if not good:
        raise RuntimeError("all strict starts failed")
    good.sort(key=lambda z:z[0])
    best=good[0]
    distinct=[]
    for item in good:
        if not any(np.linalg.norm(item[2]-q[2]) < 2e-5 for q in distinct):
            distinct.append(item)
    gap=float("inf") if len(distinct)<2 else distinct[1][0]-distinct[0][0]
    eig=np.linalg.eigvalsh(best[3].T@best[3])
    emax=float(eig[-1]); emin=float(eig[0])
    cond=float(emax/emin) if emin>0 else float("inf")
    rp,rm,eta=unpack(best[2])
    return FitDiag(float(rp),float(rm),eta,float(best[0]),int(best[1]),
                   len(distinct),gap,emin,emax,cond,best[2].copy())


def signed_fit(samples):
    x=np.array([q["delta"]/SCALE for q in samples])
    y=np.array([q["chi"] for q in samples])
    X=np.c_[x*x,x**3,x**4]
    c,*_=np.linalg.lstsq(X,y,rcond=None)
    return {"A":float(c[0]),"B":float(c[1]),"C":float(c[2]),
            "F_B_over_A":float(c[1]/c[0])}


def response(a,o,mode=9,qorder=sm.CONTACT_ORDER,amps=AMPS,warm_starts=None):
    rp0,rm0=supports(a)
    low=np.array([o,EVEN_BASE,o,EVEN_BASE,o,EVEN_BASE])
    eta_low=sm.eta_for_moments(low)
    eta_base=np.r_[eta_low,np.zeros(sm.N_TRUE-sm.N_FIT)]
    base_m=sm.moments(eta_base)
    train_h=HREF*np.geomspace(.14,1.55,16)
    hold_h=HREF*np.geomspace(.055,3.20,24)
    Lt=np.linalg.cholesky(sm.covariance(len(train_h)))
    Chi=np.linalg.inv(sm.covariance(len(hold_h)))
    y0=sm.observe(train_h,rp0,rm0,eta_base,qorder=qorder)
    yh0=sm.observe(hold_h,rp0,rm0,eta_base,qorder=qorder)
    samples=[]; diags=[]; max_drift=0.
    kfit=0
    for sign in (-1,1):
        for amp in amps:
            delta=sign*amp
            et=sm.individual_truth(base_m,mode,delta)
            max_drift=max(max_drift,float(np.max(np.abs(
                sm.moments(et)[:mode-1]-base_m[:mode-1]))))
            yt=sm.observe(train_h,rp0,rm0,et,qorder=qorder)
            yht=sm.observe(hold_h,rp0,rm0,et,qorder=qorder)
            warm=None if warm_starts is None else warm_starts[kfit]
            f=strict_fit(train_h,yt,Lt,rp0,rm0,eta_low,qorder,warm)
            r=yht-sm.observe(hold_h,f.rp,f.rm,f.eta,qorder=qorder)
            samples.append({"delta":float(delta),"chi":float(r@Chi@r)})
            diags.append(f)
            kfit+=1
    sf=signed_fit(samples)
    return {"a":float(a),"o":float(o),"mode":int(mode),"qorder":int(qorder),
            "fit":sf,"samples":samples,
            "diagnostics":{"max_lower_moment_drift":max_drift,
              "selected_starts":[d.start for d in diags],
              "max_distinct_solutions":max(d.distinct_solutions for d in diags),
              "min_cost_gap":float(min(d.cost_gap for d in diags)),
              "min_hessian_eigenvalue":float(min(d.hessian_min for d in diags)),
              "max_hessian_condition":float(max(d.hessian_condition for d in diags)),
              "max_fit_cost":float(max(d.cost for d in diags))},
            "_fit_x":[d.x for d in diags],
            "_fit_costs":[d.cost for d in diags]}


def main():
    cache={}
    def ev(a,o,mode=9,qorder=sm.CONTACT_ORDER):
        key=(round(float(a),12),round(float(o),12),mode,qorder)
        if key not in cache:
            cache[key]=response(a,o,mode=mode,qorder=qorder)
        return cache[key]
    def F(a,o): return ev(a,o)["fit"]["F_B_over_A"]

    roots=[]; prev=[]
    for a in A_POS:
        pred=SEED_SLOPE*a if len(prev)<2 else (
            prev[-1][1]+(a-prev[-1][0])*(prev[-1][1]-prev[-2][1])/
            (prev[-1][0]-prev[-2][0]))
        width=.003
        lo,hi=pred-width,pred+width
        flo,fhi=F(a,lo),F(a,hi)
        while flo*fhi>0 and width<.018:
            width*=1.7; lo,hi=pred-width,pred+width
            flo,fhi=F(a,lo),F(a,hi)
        if flo*fhi>0:
            raise RuntimeError(f"no bracket at a={a}: {flo}, {fhi}")
        root=float(brentq(lambda o:F(a,o),lo,hi,xtol=2e-7,rtol=2e-10,maxiter=24))
        rr=ev(a,root)
        slope=(F(a,root+4e-4)-F(a,root-4e-4))/8e-4
        roots.append({"a":float(a),"o":root,"predictor":float(pred),
                      "bracket":[float(lo),float(hi)],
                      "F_at_root":rr["fit"]["F_B_over_A"],
                      "transverse_dF_do":float(slope),
                      "diagnostics":rr["diagnostics"]})
        prev.append((a,root))
        print(f"a={a:.3f} o={root:+.8f} F={roots[-1]['F_at_root']:+.3e}",flush=True)

    aa=np.array([q["a"] for q in roots]); oo=np.array([q["o"] for q in roots])
    beta,*_=np.linalg.lstsq(np.c_[aa,aa**3,aa**5],oo,rcond=None)
    fit=np.c_[aa,aa**3,aa**5]@beta

    # Mirror audits evaluate independent negative-support points, not copied signs.
    mirror=[]
    for a in (0.02,0.05,0.07):
        op=next(q["o"] for q in roots if np.isclose(q["a"],a))
        neg=ev(-a,-op)
        fp=next(q["F_at_root"] for q in roots if np.isclose(q["a"],a))
        mirror.append({"a_positive":a,"o_positive":op,
                       "F_positive":fp,
                       "F_negative_partner":neg["fit"]["F_B_over_A"],
                       "odd_covariance_error":abs(neg["fit"]["F_B_over_A"]+fp)})

    # Nearby transverse sign and P8 even-mode control.
    transverse=[]; p8=[]
    for a in (0.02,0.05,0.07):
        o=next(q["o"] for q in roots if np.isclose(q["a"],a))
        transverse.append({"a":a,"o":o,"minus":F(a,o-.001),"plus":F(a,o+.001)})
        p8.append(ev(a,o,mode=8))

    # Independent quadrature-order audit at two recovered roots.
    q32=[]
    for a in (0.03,0.07):
        o=next(q["o"] for q in roots if np.isclose(q["a"],a))
        hi=ev(a,o,qorder=2*sm.CONTACT_ORDER)
        lo=ev(a,o)
        q32.append({"a":a,"o":o,"F_order16":lo["fit"]["F_B_over_A"],
                    "F_order32":hi["fit"]["F_B_over_A"],
                    "absolute_difference":abs(hi["fit"]["F_B_over_A"]-
                                               lo["fit"]["F_B_over_A"])})

    finite_gaps=[q["diagnostics"]["min_cost_gap"] for q in roots
                 if np.isfinite(q["diagnostics"]["min_cost_gap"])]
    out={"status":"sandbox candidate; not canonical theory",
         "definition":{"a":"(rho_minus-rho_plus)/2 with sum=2",
                       "o":"common P1=P3=P5 baseline moment",
                       "F":"P9 full-refit signed-response B/A",
                       "zero_curve":"F(a,g(a))=0"},
         "method":{"a_positive":A_POS.tolist(),"amplitudes":AMPS.tolist(),
                   "strict_starts_per_fit":4,"quadrature_order":sm.CONTACT_ORDER,
                   "seed_slope_used_only_for_first_bracket":SEED_SLOPE},
         "roots":roots,
         "odd_polynomial":{"form":"o=beta1*a+beta3*a^3+beta5*a^5",
                           "beta1":float(beta[0]),"beta3":float(beta[1]),
                           "beta5":float(beta[2]),
                           "rmse":float(np.sqrt(np.mean((oo-fit)**2))),
                           "max_abs_residual":float(np.max(np.abs(oo-fit)))},
         "mirror_audits":mirror,"transverse_sign_audits":transverse,
         "P8_controls":[{"a":q["a"],"o":q["o"],
                         "F_B_over_A":q["fit"]["F_B_over_A"]} for q in p8],
         "quadrature_audits":q32,
         "summary":{"all_roots_bracketed":True,
                    "max_abs_F_at_root":float(max(abs(q["F_at_root"]) for q in roots)),
                    "min_abs_transverse_slope":float(min(abs(q["transverse_dF_do"]) for q in roots)),
                    "max_mirror_odd_error":float(max(q["odd_covariance_error"] for q in mirror)),
                    "min_hessian_eigenvalue":float(min(q["diagnostics"]["min_hessian_eigenvalue"] for q in roots)),
                    "max_hessian_condition":float(max(q["diagnostics"]["max_hessian_condition"] for q in roots)),
                    "min_finite_cost_gap":float(min(finite_gaps)) if finite_gaps else None,
                    "max_distinct_nuisance_solutions":int(max(q["diagnostics"]["max_distinct_solutions"] for q in roots)),
                    "all_transverse_sign_reversals":bool(all(q["minus"]*q["plus"]<0 for q in transverse)),
                    "max_order16_to_32_difference":float(max(q["absolute_difference"] for q in q32)),
                    "P8_control_min_abs":float(min(abs(q["fit"]["F_B_over_A"]) for q in p8))}}
    with open("p9_zero_curve_continuation.json","w",encoding="utf-8") as f:
        json.dump(out,f,indent=2)

    fig,axes=plt.subplots(1,3,figsize=(14.2,4.4))
    grid=np.linspace(-.075,.075,401)
    curve=beta[0]*grid+beta[1]*grid**3+beta[2]*grid**5
    axes[0].plot(grid,curve,label="odd continuation fit")
    axes[0].plot(aa,oo,"o",label="strict roots")
    axes[0].plot(-aa,-oo,"o",mfc="none",label="mirror partners")
    axes[0].plot(grid,SEED_SLOPE*grid,"--",color="0.4",label="rejected straight seed")
    axes[0].set(xlabel="support asymmetry a",ylabel="odd skew o",title="Recovered zero curve")
    axes[0].legend(fontsize=8)
    for q in transverse:
        axes[1].plot([-.001,0,.001],[q["minus"],0,q["plus"]],"o-",label=f"a={q['a']:.2f}")
    axes[1].axhline(0,color="black",lw=.8)
    axes[1].set(xlabel="transverse offset from root",ylabel="P9 F=B/A",title="Transverse sign discriminator")
    axes[1].legend(fontsize=8)
    axes[2].semilogy(aa,[q["diagnostics"]["max_hessian_condition"] for q in roots],"o-",label="max condition")
    ax=axes[2].twinx()
    ax.plot([q["a"] for q in out["P8_controls"]],[abs(q["F_B_over_A"]) for q in out["P8_controls"]],"s--",color="tab:purple",label="|P8 F|")
    axes[2].set(xlabel="support asymmetry a",ylabel="Gauss-Newton condition",title="Branch/rank control")
    ax.set_ylabel("|P8 B/A|",color="tab:purple")
    fig.suptitle("Strict-multistart continuation of the mirror-odd P9 zero set")
    fig.tight_layout()
    fig.savefig("p9_zero_curve_continuation.svg")
    fig.savefig("p9_zero_curve_continuation.png",dpi=180)
    print(json.dumps(out["summary"],indent=2))


if __name__ == "__main__":
    main()
