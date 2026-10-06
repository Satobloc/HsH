#!/usr/bin/env python3
"""Decompose omitted-mode sign response into forward and refit curvature.

Sandbox-only. Imports the branch-aware finite-contact machinery from
support_mirror_mode_asymmetry.py and maps fixed-span support asymmetry against
controlled odd baseline moments.
"""
from __future__ import annotations

import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.linalg import solve_triangular

import support_mirror_mode_asymmetry as sm

SCALE = 0.0025
AMPS = np.array([0.00075, 0.00125, 0.00175, 0.00225, 0.00275, 0.00325])
RATIOS = np.array([0.50, 0.70, 0.85, 1.00, 1/0.85, 1/0.70, 2.00])
ODD_BASE = np.array([-0.015, -0.0075, 0.0, 0.0075, 0.015])
EVEN_BASE = -0.01
HREF = 1.30


def supports(ratio):
    """Fixed total span rp+rm=2 with ratio=rm/rp."""
    rp = 2.0/(1.0+ratio)
    return rp, ratio*rp


def unpack_local(x, rp0, rm0):
    return rp0*np.exp(x[0]), rm0*np.exp(x[1]), x[2:]


def local_forward(hs, x, rp0, rm0):
    rp, rm, eta = unpack_local(x, rp0, rm0)
    return sm.observe(hs, rp, rm, eta)


def jacobian(hs, x0, rp0, rm0, eps=2e-5):
    cols = []
    for j in range(len(x0)):
        step = eps*max(1.0, abs(x0[j]))
        xp=x0.copy(); xm=x0.copy(); xp[j]+=step; xm[j]-=step
        cols.append((local_forward(hs,xp,rp0,rm0)-local_forward(hs,xm,rp0,rm0))/(2*step))
    return np.column_stack(cols)


def signed_fit(rows, key):
    x=np.array([q["signed_delta"]/SCALE for q in rows])
    y=np.array([q[key] for q in rows])
    X=np.c_[x*x,x**3,x**4]
    c,*_=np.linalg.lstsq(X,y,rcond=None)
    return {"A":float(c[0]),"B":float(c[1]),"C":float(c[2]),
            "B_over_A":float(c[1]/c[0])}


def local_response_laws(records):
    """Fit the lowest parity-allowed response laws near the symmetric point."""
    layers=("raw","tangent_projected","full_refit")
    local=[q for q in records
           if (np.isclose(q["support_ratio_rm_over_rp"],0.85)
               or np.isclose(q["support_ratio_rm_over_rp"],1.0)
               or np.isclose(q["support_ratio_rm_over_rp"],1/0.85))
           and abs(q["odd_baseline_moment"]) <= 0.0075+1e-12]
    out={}
    for ell in (8,9):
        out[f"P{ell}"]={}
        qq=[q for q in local if q["mode"]==ell]
        a=np.array([(q["rho_minus"]-q["rho_plus"])/2.0 for q in qq])
        o=np.array([q["odd_baseline_moment"] for q in qq])
        for layer in layers:
            y=np.array([q["response_fits"][layer]["B_over_A"] for q in qq])
            if ell==8:
                X=np.c_[np.ones_like(a),a*a,a*o,o*o]
                names=("constant","a_squared","a_times_o","o_squared")
            else:
                X=np.c_[a,o]
                names=("a","o")
            c,*_=np.linalg.lstsq(X,y,rcond=None)
            resid=y-X@c
            fit={"coefficients":{k:float(v) for k,v in zip(names,c)},
                 "rmse":float(np.sqrt(np.mean(resid*resid))),
                 "max_abs_residual":float(np.max(np.abs(resid)))}
            if ell==9:
                fit["cancellation_o_over_a"]=-float(c[0]/c[1])
            out[f"P{ell}"][layer]=fit
    return out


def main():
    train_h=HREF*np.geomspace(.14,1.55,16)
    hold_h=HREF*np.geomspace(.055,3.20,24)
    Lt=np.linalg.cholesky(sm.covariance(len(train_h)))
    Lh=np.linalg.cholesky(sm.covariance(len(hold_h)))
    Chi=np.linalg.inv(sm.covariance(len(hold_h)))
    records=[]; retries=0; failures=0; max_moment_drift=0.0

    for ratio in RATIOS:
        rp0,rm0=supports(ratio)
        for odd in ODD_BASE:
            low=np.array([odd,EVEN_BASE,odd,EVEN_BASE,odd,EVEN_BASE])
            eta_low=sm.eta_for_moments(low)
            eta_base=np.r_[eta_low,np.zeros(sm.N_TRUE-sm.N_FIT)]
            base_m=sm.moments(eta_base)
            y0=sm.observe(train_h,rp0,rm0,eta_base)
            yh0=sm.observe(hold_h,rp0,rm0,eta_base)
            x0=np.r_[0.,0.,eta_low]
            Jt=jacobian(train_h,x0,rp0,rm0)
            Jh=jacobian(hold_h,x0,rp0,rm0)
            # Whitened tangent fit, including the same 1% support prior.
            Aw=solve_triangular(Lt,Jt,lower=True,check_finite=False)
            Apr=np.zeros((2,len(x0))); Apr[0,0]=1/sm.SUPPORT_PRIOR; Apr[1,1]=1/sm.SUPPORT_PRIOR
            Aaug=np.vstack([Aw,Apr])
            rows={8:[],9:[]}
            for ell in (8,9):
                for sign in (-1,1):
                    for amp in AMPS:
                        delta=sign*amp
                        et=sm.individual_truth(base_m,ell,delta)
                        drift=float(np.max(np.abs(sm.moments(et)[:ell-1]-base_m[:ell-1])))
                        max_moment_drift=max(max_moment_drift,drift)
                        yt=sm.observe(train_h,rp0,rm0,et)
                        yht=sm.observe(hold_h,rp0,rm0,et)
                        dyt=yt-y0; dyh=yht-yh0
                        raw=float(dyh@Chi@dyh)
                        bw=np.r_[solve_triangular(Lt,dyt,lower=True,check_finite=False),[0.,0.]]
                        dx,*_=np.linalg.lstsq(Aaug,bw,rcond=None)
                        rtan=dyh-Jh@dx
                        tangent=float(rtan@Chi@rtan)
                        try:
                            fit=sm.fit_model(train_h,yt,Lt,rp0,rm0,eta_low)
                        except RuntimeError:
                            failures+=1
                            raise
                        retries+=fit.retries
                        rfull=yht-sm.observe(hold_h,fit.rp,fit.rm,fit.eta)
                        full=float(rfull@Chi@rfull)
                        rows[ell].append({"signed_delta":float(delta),"raw":raw,
                                          "tangent_projected":tangent,
                                          "full_refit":full,
                                          "lower_moment_drift":drift})
            for ell in (8,9):
                fits={k:signed_fit(rows[ell],k) for k in ("raw","tangent_projected","full_refit")}
                fits["refit_curvature_increment_B_over_A"]=(
                    fits["full_refit"]["B_over_A"]-fits["tangent_projected"]["B_over_A"])
                records.append({"support_ratio_rm_over_rp":float(ratio),
                                "rho_plus":float(rp0),"rho_minus":float(rm0),
                                "odd_baseline_moment":float(odd),"mode":ell,
                                "response_fits":fits,"samples":rows[ell]})
        print("ratio",ratio,"done",flush=True)

    # Mirror covariance on the coefficient surface: (r,o,l)->(1/r,-o,l),
    # with B/A unchanged for even l and sign-reversed for odd l.
    mirror_errors=[]
    for q in records:
        target=min(records,key=lambda z:abs(z["support_ratio_rm_over_rp"]-1/q["support_ratio_rm_over_rp"])
                   +abs(z["odd_baseline_moment"]+q["odd_baseline_moment"])
                   +(0 if z["mode"]==q["mode"] else 100))
        parity=1 if q["mode"]%2==0 else -1
        for layer in ("raw","tangent_projected","full_refit"):
            a=q["response_fits"][layer]["B_over_A"]
            b=target["response_fits"][layer]["B_over_A"]
            mirror_errors.append(abs(b-parity*a))

    laws=local_response_laws(records)
    symmetric={}
    for ell in (8,9):
        q=next(q for q in records if q["mode"]==ell
               and np.isclose(q["support_ratio_rm_over_rp"],1.0)
               and np.isclose(q["odd_baseline_moment"],0.0))
        vals={k:q["response_fits"][k]["B_over_A"]
              for k in ("raw","tangent_projected","full_refit")}
        vals["nonlinear_increment"]=vals["full_refit"]-vals["tangent_projected"]
        symmetric[f"P{ell}"]=vals

    out={"status":"sandbox candidate; not canonical theory",
         "question":"Does signed omitted-mode response arise in the forward map or nonlinear nuisance refit?",
         "fixture":{"support_span":2.0,"support_ratios":RATIOS.tolist(),
                    "odd_baseline_moments":ODD_BASE.tolist(),"even_baseline_moment":EVEN_BASE,
                    "amplitudes":AMPS.tolist(),"amplitude_scale":SCALE,
                    "sigma":sm.SIGMA,"ar1_phi":sm.AR_PHI,"cross_orientation":sm.CROSS,
                    "support_prior_fractional_std":sm.SUPPORT_PRIOR,
                    "contact_composite_gauss_order":sm.CONTACT_ORDER},
         "layer_definitions":{"raw":"holdout forward displacement with nuisance frozen",
                              "tangent_projected":"forward displacement after linear tangent/ridge projection",
                              "full_refit":"holdout residual after nonlinear training refit"},
         "local_response_laws":{"coordinates":{"a":"(rho_minus-rho_plus)/(rho_minus+rho_plus)",
                                                   "o":"common odd baseline moment P1=P3=P5"},
                                "domain":"ratios 0.85, 1, 1/0.85 and |o| <= 0.0075",
                                "forms":{"P8":"c0+c_aa*a^2+c_ao*a*o+c_oo*o^2",
                                         "P9":"alpha_a*a+alpha_o*o"},
                                "fits":laws},
         "exact_symmetric_point":symmetric,
         "records":records,
         "audit":{"max_mirror_B_over_A_error":float(max(mirror_errors)),
                  "max_lower_moment_drift":max_moment_drift,
                  "optimizer_retries":retries,"optimizer_failures":failures}}
    with open("signed_response_curvature_map.json","w",encoding="utf-8") as f:
        json.dump(out,f,indent=2)

    fig,axes=plt.subplots(2,3,figsize=(13,7.5),sharex=True,sharey=True)
    layers=["raw","tangent_projected","full_refit"]
    vmax=max(abs(q["response_fits"][lay]["B_over_A"]) for q in records for lay in layers)
    for i,ell in enumerate((8,9)):
        for j,lay in enumerate(layers):
            Z=np.array([[next(q["response_fits"][lay]["B_over_A"] for q in records
                              if q["mode"]==ell and np.isclose(q["support_ratio_rm_over_rp"],r)
                              and np.isclose(q["odd_baseline_moment"],o))
                         for r in RATIOS] for o in ODD_BASE])
            im=axes[i,j].imshow(Z,origin="lower",aspect="auto",cmap="coolwarm",vmin=-vmax,vmax=vmax)
            axes[i,j].set_title(f"P{ell}: {lay.replace('_',' ')}")
            axes[i,j].set_xticks(range(len(RATIOS)),[f"{r:.2g}" for r in RATIOS],rotation=30)
            axes[i,j].set_yticks(range(len(ODD_BASE)),[f"{o:+.4f}" for o in ODD_BASE])
            axes[i,j].set_xlabel(r"support ratio $\rho_-/\rho_+$")
            if j==0: axes[i,j].set_ylabel("odd baseline moments")
    fig.colorbar(im,ax=axes.ravel().tolist(),label=r"signed response $B/A$",shrink=.86)
    fig.suptitle("Forward-map versus nuisance-refit curvature of omitted-mode sign response")
    fig.subplots_adjust(left=.08,right=.90,bottom=.11,top=.90,wspace=.16,hspace=.30)
    fig.savefig("signed_response_curvature_map.svg")
    fig.savefig("signed_response_curvature_map.png",dpi=180)
    print(json.dumps(out["audit"],indent=2))


if __name__=="__main__":
    main()
