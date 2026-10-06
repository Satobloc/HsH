#!/usr/bin/env python3
"""Blind validation of the P9 parity-cancellation line.

Sandbox-only.  The cancellation slope is frozen from the preceding response-
surface build.  This script evaluates only new support asymmetries, new odd
baseline moments, and a new signed-amplitude ladder.
"""
from __future__ import annotations

import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.linalg import solve_triangular

import support_mirror_mode_asymmetry as sm

SCALE = 0.0025
HREF = 1.30
EVEN_BASE = -0.01
FULL_LINE_SLOPE = -0.16981194198631053  # frozen o/a prediction
RAW_LINE_SLOPE = -0.10104333148441043
A_VALUES = np.array([-0.07, -0.05, -0.03, 0.03, 0.05, 0.07])
OFFSETS = np.array([-0.003, -0.0015, 0.0, 0.0015, 0.003])
AMPS = np.array([0.0006, 0.0011, 0.0016, 0.0021, 0.0026, 0.0031, 0.0036])


def supports_from_a(a):
    """Fixed rho_plus+rho_minus=2; a=(rho_minus-rho_plus)/2."""
    return 1.0-a, 1.0+a


def unpack(x, rp0, rm0):
    return rp0*np.exp(x[0]), rm0*np.exp(x[1]), x[2:]


def forward(hs, x, rp0, rm0, qorder):
    rp, rm, eta = unpack(x, rp0, rm0)
    return sm.observe(hs, rp, rm, eta, qorder=qorder)


def jacobian(hs, x0, rp0, rm0, qorder, eps=2e-5):
    cols=[]
    for j in range(len(x0)):
        step=eps*max(1.0,abs(x0[j]))
        xp=x0.copy(); xm=x0.copy(); xp[j]+=step; xm[j]-=step
        cols.append((forward(hs,xp,rp0,rm0,qorder)
                     -forward(hs,xm,rp0,rm0,qorder))/(2*step))
    return np.column_stack(cols)


def signed_fit(samples, key):
    x=np.array([q["signed_delta"]/SCALE for q in samples])
    y=np.array([q[key] for q in samples])
    X=np.c_[x*x,x**3,x**4]
    c,*_=np.linalg.lstsq(X,y,rcond=None)
    return {"A":float(c[0]),"B":float(c[1]),"C":float(c[2]),
            "B_over_A":float(c[1]/c[0])}


def evaluate_point(a, offset, qorder=sm.CONTACT_ORDER, modes=(8,9), amps=AMPS):
    rp0,rm0=supports_from_a(a)
    odd=FULL_LINE_SLOPE*a+offset
    low=np.array([odd,EVEN_BASE,odd,EVEN_BASE,odd,EVEN_BASE])
    eta_low=sm.eta_for_moments(low)
    eta_base=np.r_[eta_low,np.zeros(sm.N_TRUE-sm.N_FIT)]
    base_m=sm.moments(eta_base)
    train_h=HREF*np.geomspace(.14,1.55,16)
    hold_h=HREF*np.geomspace(.055,3.20,24)
    Lt=np.linalg.cholesky(sm.covariance(len(train_h)))
    Chi=np.linalg.inv(sm.covariance(len(hold_h)))
    y0=sm.observe(train_h,rp0,rm0,eta_base,qorder=qorder)
    yh0=sm.observe(hold_h,rp0,rm0,eta_base,qorder=qorder)
    x0=np.r_[0.,0.,eta_low]
    Jt=jacobian(train_h,x0,rp0,rm0,qorder)
    Jh=jacobian(hold_h,x0,rp0,rm0,qorder)
    Aw=solve_triangular(Lt,Jt,lower=True,check_finite=False)
    Apr=np.zeros((2,len(x0)))
    Apr[0,0]=1/sm.SUPPORT_PRIOR; Apr[1,1]=1/sm.SUPPORT_PRIOR
    Aaug=np.vstack([Aw,Apr])
    result={"a":float(a),"offset_from_frozen_line":float(offset),
            "odd_baseline_moment":float(odd),"rho_plus":float(rp0),
            "rho_minus":float(rm0),"qorder":int(qorder),"modes":{}}
    max_drift=0.; retries=0
    for ell in modes:
        samples=[]
        for sign in (-1,1):
            for amp in amps:
                delta=sign*amp
                et=sm.individual_truth(base_m,ell,delta)
                drift=float(np.max(np.abs(sm.moments(et)[:ell-1]-base_m[:ell-1])))
                max_drift=max(max_drift,drift)
                yt=sm.observe(train_h,rp0,rm0,et,qorder=qorder)
                yht=sm.observe(hold_h,rp0,rm0,et,qorder=qorder)
                dyt=yt-y0; dyh=yht-yh0
                raw=float(dyh@Chi@dyh)
                bw=np.r_[solve_triangular(Lt,dyt,lower=True,check_finite=False),[0.,0.]]
                dx,*_=np.linalg.lstsq(Aaug,bw,rcond=None)
                rtan=dyh-Jh@dx
                tangent=float(rtan@Chi@rtan)
                fit=sm.fit_model(train_h,yt,Lt,rp0,rm0,eta_low,qorder=qorder)
                retries+=fit.retries
                rfull=yht-sm.observe(hold_h,fit.rp,fit.rm,fit.eta,qorder=qorder)
                full=float(rfull@Chi@rfull)
                samples.append({"signed_delta":float(delta),"raw":raw,
                                "tangent_projected":tangent,"full_refit":full,
                                "lower_moment_drift":drift})
        result["modes"][f"P{ell}"]={
            "fits":{k:signed_fit(samples,k)
                    for k in ("raw","tangent_projected","full_refit")},
            "samples":samples}
    result["audit"]={"max_lower_moment_drift":max_drift,
                     "optimizer_retries":retries}
    return result


def root_from_offsets(rows, mode, layer):
    x=np.array([q["offset_from_frozen_line"] for q in rows])
    y=np.array([q["modes"][mode]["fits"][layer]["B_over_A"] for q in rows])
    # A local quadratic allows curvature while retaining a stable central root.
    c=np.polyfit(x,y,2)
    roots=np.roots(c)
    real=[float(z.real) for z in roots if abs(z.imag)<1e-8 and x.min()<=z.real<=x.max()]
    root=min(real,key=abs) if real else float("nan")
    return {"coefficients_quadratic_linear_constant":c.tolist(),
            "root_offset":root,"values":y.tolist()}


def odd_cubic_surface(records, layer):
    """Post-hoc lowest mirror-allowed cubic surface for odd P9 response."""
    a=np.array([q["a"] for q in records])
    o=np.array([q["odd_baseline_moment"] for q in records])
    y=np.array([q["modes"]["P9"]["fits"][layer]["B_over_A"] for q in records])
    X=np.c_[a,o,a**3,a*a*o,a*o*o,o**3]
    c,*_=np.linalg.lstsq(X,y,rcond=None)
    resid=y-X@c
    names=("a","o","a_cubed","a_squared_o","a_o_squared","o_cubed")
    roots={}
    for av in A_VALUES:
        poly=[c[5],c[4]*av,c[1]+c[3]*av*av,c[0]*av+c[2]*av**3]
        rr=np.roots(poly)
        real=[float(z.real) for z in rr if abs(z.imag)<1e-9 and abs(z.real)<.03]
        roots[f"{av:+.3f}"]=min(real,key=lambda z:abs(z)) if real else float("nan")
    return {"form":"c10*a+c01*o+c30*a^3+c21*a^2*o+c12*a*o^2+c03*o^3",
            "coefficients":{k:float(v) for k,v in zip(names,c)},
            "rmse":float(np.sqrt(np.mean(resid*resid))),
            "max_abs_residual":float(np.max(np.abs(resid))),
            "zero_roots_o":roots}


def main():
    records=[]
    for a in A_VALUES:
        for d in OFFSETS:
            records.append(evaluate_point(a,d))
        print("a",a,"done",flush=True)

    roots={}
    for layer in ("raw","tangent_projected","full_refit"):
        roots[layer]={}
        for a in A_VALUES:
            rows=[q for q in records if np.isclose(q["a"],a)]
            roots[layer][f"{a:+.3f}"]=root_from_offsets(rows,"P9",layer)

    cubic={layer:odd_cubic_surface(records,layer)
           for layer in ("raw","tangent_projected","full_refit")}

    # Mirror covariance on the new grid: (a,d)->(-a,-d).
    mirror=[]
    for q in records:
        z=next(r for r in records if np.isclose(r["a"],-q["a"])
               and np.isclose(r["offset_from_frozen_line"],-q["offset_from_frozen_line"]))
        for mode,parity in (("P8",1),("P9",-1)):
            for layer in ("raw","tangent_projected","full_refit"):
                x=q["modes"][mode]["fits"][layer]["B_over_A"]
                y=z["modes"][mode]["fits"][layer]["B_over_A"]
                mirror.append(abs(y-parity*x))

    # Independent 16->32 quadrature audit at off-line, on-line, off-line points.
    audit_points=[(-.07,-.0015),(-.07,0.),(-.07,.0015),
                  (.03,-.0015),(.03,0.),(.03,.0015),
                  (.07,-.0015),(.07,0.),(.07,.0015)]
    q32=[]; qdiff=[]
    audit_amps=np.array([.0008,.0015,.0022,.0029,.0036])
    for a,d in audit_points:
        hi=evaluate_point(a,d,qorder=2*sm.CONTACT_ORDER,modes=(9,),amps=audit_amps)
        lo=evaluate_point(a,d,qorder=sm.CONTACT_ORDER,modes=(9,),amps=audit_amps)
        q32.append(hi)
        for layer in ("raw","tangent_projected","full_refit"):
            x=lo["modes"]["P9"]["fits"][layer]["B_over_A"]
            y=hi["modes"]["P9"]["fits"][layer]["B_over_A"]
            qdiff.append({"a":a,"offset":d,"layer":layer,"order16":x,"order32":y,
                          "absolute_difference":abs(y-x)})

    # Post-hoc confirmation only: evaluate the cubic surface's candidate zero
    # at new order-32 points.  These are not part of the blind validation.
    posthoc=[]
    for a in A_VALUES:
        oz=cubic["full_refit"]["zero_roots_o"][f"{a:+.3f}"]
        d=oz-FULL_LINE_SLOPE*a
        q=evaluate_point(a,d,qorder=2*sm.CONTACT_ORDER,modes=(9,))
        posthoc.append({"a":float(a),"candidate_o":float(oz),
                        "offset_from_frozen_line":float(d),
                        "order32_full_B_over_A":q["modes"]["P9"]["fits"]["full_refit"]["B_over_A"]})
    za=np.array([q["a"] for q in posthoc])
    zo=np.array([q["candidate_o"] for q in posthoc])
    beta,*_=np.linalg.lstsq(np.c_[za,za**3],zo,rcond=None)


    # Sign-bracketing and distance of observed full-refit zero from prediction.
    root_offsets=np.array([v["root_offset"] for v in roots["full_refit"].values()])
    brackets=[]
    for a in A_VALUES:
        rows=sorted([q for q in records if np.isclose(q["a"],a)],
                    key=lambda z:z["offset_from_frozen_line"])
        y0=rows[0]["modes"]["P9"]["fits"]["full_refit"]["B_over_A"]
        y1=rows[-1]["modes"]["P9"]["fits"]["full_refit"]["B_over_A"]
        brackets.append(y0*y1<0)

    out={"status":"sandbox candidate; not canonical theory",
         "blind_protocol":{"frozen_full_line_o_over_a":FULL_LINE_SLOPE,
                           "frozen_raw_line_o_over_a":RAW_LINE_SLOPE,
                           "new_a_values":A_VALUES.tolist(),
                           "new_offsets":OFFSETS.tolist(),
                           "new_amplitudes":AMPS.tolist(),
                           "definition":"o=frozen_full_line_o_over_a*a+offset"},
         "records":records,"blind_zero_line_fits":roots,
         "posthoc_odd_cubic_surfaces":cubic,
         "posthoc_zero_curve":{"form":"o=beta1*a+beta3*a^3",
                                "beta1":float(beta[0]),"beta3":float(beta[1]),
                                "order32_candidate_checks":posthoc},
         "quadrature32_records":q32,
         "audit":{"max_lower_moment_drift":max(q["audit"]["max_lower_moment_drift"] for q in records),
                  "optimizer_retries":sum(q["audit"]["optimizer_retries"] for q in records),
                  "optimizer_failures":0,
                  "max_mirror_B_over_A_error":float(max(mirror)),
                  "all_P9_endpoints_bracket_zero":bool(all(brackets)),
                  "max_abs_full_root_offset":float(np.nanmax(np.abs(root_offsets))),
                  "rms_full_root_offset":float(np.sqrt(np.nanmean(root_offsets**2))),
                  "max_abs_posthoc_order32_zero_residual":float(max(abs(q["order32_full_B_over_A"]) for q in posthoc)),
                  "max_order16_to_32_B_over_A_difference":float(max(q["absolute_difference"] for q in qdiff)),
                  "quadrature_differences":qdiff}}
    with open("p9_cancellation_blind_validation.json","w",encoding="utf-8") as f:
        json.dump(out,f,indent=2)

    fig,axes=plt.subplots(1,3,figsize=(14,4.4))
    cmap=plt.get_cmap("coolwarm")
    for i,a in enumerate(A_VALUES):
        rows=sorted([q for q in records if np.isclose(q["a"],a)],
                    key=lambda z:z["offset_from_frozen_line"])
        x=np.array([q["offset_from_frozen_line"] for q in rows])
        y=np.array([q["modes"]["P9"]["fits"]["full_refit"]["B_over_A"] for q in rows])
        axes[0].plot(x,y,"o-",color=cmap(i/(len(A_VALUES)-1)),label=f"a={a:+.2f}")
    axes[0].axhline(0,color="black",lw=.8); axes[0].axvline(0,color="black",lw=.8,ls="--")
    axes[0].set(xlabel="offset from frozen line",ylabel="P9 full-refit B/A",
                title="Blind sign reversal")
    axes[0].legend(fontsize=7,ncol=2)

    obs=[cubic["full_refit"]["zero_roots_o"][f"{a:+.3f}"] for a in A_VALUES]
    axes[1].plot(A_VALUES,FULL_LINE_SLOPE*A_VALUES,"k--",label="frozen prediction")
    axes[1].plot(A_VALUES,obs,"o-",label="post-hoc cubic zero")
    axes[1].set(xlabel="support asymmetry a",ylabel="zero-line odd skew o",
                title="Cancellation-line recovery")
    axes[1].legend(fontsize=8)

    p8=[]
    for a in A_VALUES:
        q=next(q for q in records if np.isclose(q["a"],a)
               and np.isclose(q["offset_from_frozen_line"],0.))
        p8.append(q["modes"]["P8"]["fits"]["full_refit"]["B_over_A"])
    axes[2].plot(A_VALUES,p8,"o-",color="tab:purple")
    axes[2].axhline(0,color="black",lw=.8)
    axes[2].set(xlabel="support asymmetry a",ylabel="P8 full-refit B/A",
                title="Even-mode intercept persists")
    fig.suptitle("Blind validation of parity-cancellation geometry")
    fig.tight_layout()
    fig.savefig("p9_cancellation_blind_validation.svg")
    fig.savefig("p9_cancellation_blind_validation.png",dpi=180)
    print(json.dumps(out["audit"],indent=2))


if __name__=="__main__":
    main()
