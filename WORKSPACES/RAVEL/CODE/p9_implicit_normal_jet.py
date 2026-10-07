#!/usr/bin/env python3
"""Implicitly differentiate the P9 nuisance normal equations.

Sandbox only.  This removes the finite-amplitude polynomial-window used in
the residual-jet audit.  Partial derivatives of the forward map are still
computed by centered finite differences, so this is not an analytic/AD result.
"""
from __future__ import annotations

import json
import numpy as np
from scipy.linalg import solve_triangular
from scipy.optimize import brentq

import support_mirror_mode_asymmetry as sm
from p9_zero_curve_continuation import supports, EVEN_BASE, HREF, SCALE
from p9_local_limit_grid_audit import BASE, JITTER, DENSE, A_STAR

DESIGNS = {"base16": BASE, "jitter16": JITTER, "dense24": DENSE}
A_VALUES = np.array([A_STAR-1e-4, A_STAR+1e-4])
JAC_STEPS = [8e-5, 4e-5, 2e-5]
TRUTH_STEPS = [4e-4, 2e-4, 1e-4]
DIR_STEPS = [8e-5, 4e-5, 2e-5]


def setup(a, o, train_h, qorder=sm.CONTACT_ORDER, covariance_builder=None):
    rp0, rm0 = supports(a)
    low = np.array([o, EVEN_BASE, o, EVEN_BASE, o, EVEN_BASE])
    eta_low = sm.eta_for_moments(low)
    eta_base = np.r_[eta_low, np.zeros(sm.N_TRUE-sm.N_FIT)]
    base_m = sm.moments(eta_base)
    hold_h = HREF*np.geomspace(.055, 3.20, 24)
    if covariance_builder is None:
        covariance_builder = lambda hs: sm.covariance(len(hs))
    Lt = np.linalg.cholesky(covariance_builder(np.asarray(train_h)))
    Lh = np.linalg.cholesky(covariance_builder(np.asarray(hold_h)))
    x0 = np.r_[0., 0., eta_low]

    def unpack(x):
        return rp0*np.exp(x[0]), rm0*np.exp(x[1]), x[2:]

    def model(x, hs, chol, priors=False):
        rp, rm, eta = unpack(x)
        z = solve_triangular(chol, sm.observe(hs, rp, rm, eta, qorder=qorder),
                             lower=True, check_finite=False)
        return np.r_[z, x[0]/sm.SUPPORT_PRIOR, x[1]/sm.SUPPORT_PRIOR] if priors else z

    def truth(delta, hs, chol):
        et = sm.individual_truth(base_m, 9, float(delta))
        y = sm.observe(hs, rp0, rm0, et, qorder=qorder)
        return solve_triangular(chol, y, lower=True, check_finite=False)

    return dict(rp0=rp0, rm0=rm0, eta_low=eta_low, base_m=base_m,
                hold_h=hold_h, Lt=Lt, Lh=Lh, x0=x0, unpack=unpack,
                model=model, truth=truth, train_h=np.asarray(train_h))


def jacobian(fun, x, h):
    cols=[]
    for j in range(len(x)):
        xp=x.copy(); xm=x.copy()
        xp[j]+=h; xm[j]-=h
        cols.append((fun(xp)-fun(xm))/(2*h))
    return np.column_stack(cols)


def contact_signature(hs, rp, rm):
    # A branch point enters/leaves the integration interval when h/support=1.
    return tuple(np.r_[np.asarray(hs) < rp, np.asarray(hs) < rm].astype(int))


def implicit_response(a, o, train_h, hj, ht, hd, qorder=sm.CONTACT_ORDER,
                      covariance_builder=None):
    s=setup(a,o,train_h,qorder,covariance_builder)
    x0=s["x0"]
    mt=lambda x:s["model"](x,s["train_h"],s["Lt"],True)
    mh=lambda x:s["model"](x,s["hold_h"],s["Lh"],False)
    J=jacobian(mt,x0,hj)
    Jh=jacobian(mh,x0,hj)

    t0=s["truth"](0.,s["train_h"],s["Lt"])
    tp=s["truth"](ht,s["train_h"],s["Lt"])
    tm=s["truth"](-ht,s["train_h"],s["Lt"])
    y1=(tp-tm)/(2*ht)
    y2=(tp-2*t0+tm)/(ht*ht)
    y1=np.r_[y1,0.,0.]; y2=np.r_[y2,0.,0.]

    H=J.T@J
    theta1=np.linalg.solve(H,J.T@y1)
    r1=J@theta1-y1

    Jp=jacobian(mt,x0+hd*theta1,hj)
    Jm=jacobian(mt,x0-hd*theta1,hj)
    Q=(Jp-Jm)/(2*hd)
    q=Q@theta1
    theta2=np.linalg.solve(H, -Q.T@r1-J.T@(q-y2))

    th0=s["truth"](0.,s["hold_h"],s["Lh"])
    thp=s["truth"](ht,s["hold_h"],s["Lh"])
    thm=s["truth"](-ht,s["hold_h"],s["Lh"])
    yh1=(thp-thm)/(2*ht)
    yh2=(thp-2*th0+thm)/(ht*ht)
    Jhp=jacobian(mh,x0+hd*theta1,hj)
    Jhm=jacobian(mh,x0-hd*theta1,hj)
    Qh=(Jhp-Jhm)/(2*hd)
    qh=Qh@theta1
    e1=yh1-Jh@theta1
    e2=yh2-Jh@theta2-qh
    A=float(e1@e1)
    B=float(e1@e2)

    xp=x0+hd*theta1; xm=x0-hd*theta1
    rpp,rmp,_=s["unpack"](xp); rpm,rmm,_=s["unpack"](xm)
    sig0=contact_signature(train_h,s["rp0"],s["rm0"])
    crossed=(contact_signature(train_h,rpp,rmp)!=sig0 or
             contact_signature(train_h,rpm,rmm)!=sig0)
    eig=np.linalg.eigvalsh(H)
    return {"F_B_over_A":float(SCALE*B/A),"A_delta2":A,"B_delta3":B,
            "normal_residual":float(np.linalg.norm(J.T@r1)),
            "second_normal_residual":float(np.linalg.norm(Q.T@r1+J.T@(J@theta2+q-y2))),
            "hessian_min":float(eig[0]),"hessian_condition":float(eig[-1]/eig[0]),
            "theta1":theta1.tolist(),"theta2":theta2.tolist(),
            "directional_support_shift_max":float(max(abs(hd*theta1[0]),abs(hd*theta1[1]))),
            "crosses_train_contact_stratum":bool(crossed)}


def main():
    prior=json.load(open("p9_residual_jet_audit.json",encoding="utf-8"))
    roots={(q["design"],round(q["a"],12)):q["narrow"]["root_o"]
           for q in prior["recovered_roots"]}
    evaluations=[]
    offsets=(-.001,0.,.001)
    for design,h in DESIGNS.items():
        for a in A_VALUES:
            center=float(roots[(design,round(float(a),12))])
            for o in [center+x for x in offsets]:
                sweep=[]
                for hj,ht,hd in zip(JAC_STEPS,TRUTH_STEPS,DIR_STEPS):
                    z=implicit_response(float(a),float(o),h,hj,ht,hd)
                    z.update({"jac_step":hj,"truth_step":ht,"direction_step":hd})
                    sweep.append(z)
                evaluations.append({"design":design,"a":float(a),"o":float(o),
                                    "prior_residual_jet_root":center,"step_sweep":sweep})
                print(f"{design} a={a:.9f} o={o:+.8f} "
                      f"F={sweep[-1]['F_B_over_A']:+.6e} "
                      f"cross={sweep[-1]['crosses_train_contact_stratum']}",flush=True)

    # Bracket and solve the implicit response itself.  The three-point samples
    # above are retained as a local-linearity audit, not used as root claims.
    recovered=[]
    root_step_sweeps=[]
    primary_cache={(q["design"],round(q["a"],12),round(q["o"],12)):
                   q["step_sweep"][-1] for q in evaluations}
    for design in DESIGNS:
        for a in A_VALUES:
            g=sorted([q for q in evaluations if q["design"]==design and np.isclose(q["a"],a)],key=lambda q:q["o"])
            oo=np.array([q["o"] for q in g])
            ff=np.array([q["step_sweep"][-1]["F_B_over_A"] for q in g])
            c=np.polyfit(oo,ff,1); pred=np.polyval(c,oo)
            center=float(g[1]["prior_residual_jet_root"])
            def F(o):
                key=(design,round(float(a),12),round(float(o),12))
                if key not in primary_cache:
                    primary_cache[key]=implicit_response(float(a),float(o),DESIGNS[design],
                        JAC_STEPS[-1],TRUTH_STEPS[-1],DIR_STEPS[-1])
                return primary_cache[key]["F_B_over_A"]
            width=.001
            lo,hi=center-width,center+width
            flo,fhi=F(lo),F(hi)
            while flo*fhi>0 and width<.016:
                width*=1.7; lo,hi=center-width,center+width
                flo,fhi=F(lo),F(hi)
            if flo*fhi>0:
                raise RuntimeError(f"implicit root unbracketed: {design} {a} {flo} {fhi}")
            root=float(brentq(F,lo,hi,xtol=2e-9,rtol=2e-11,maxiter=40))
            sweep=[]
            for hj,ht,hd in zip(JAC_STEPS,TRUTH_STEPS,DIR_STEPS):
                z=implicit_response(float(a),root,DESIGNS[design],hj,ht,hd)
                z.update({"jac_step":hj,"truth_step":ht,"direction_step":hd})
                sweep.append(z)
            root_step_sweeps.append({"design":design,"a":float(a),"root_o":root,"step_sweep":sweep})
            recovered.append({"design":design,"a":float(a),"root_o":root,
                "prior_residual_jet_root":g[1]["prior_residual_jet_root"],
                "root_shift":float(root-g[1]["prior_residual_jet_root"]),
                "bracket":[float(lo),float(hi)],"F_at_root":float(F(root)),
                "local_line_slope_dF_do":float(c[0]),
                "local_line_fit_rmse":float(np.sqrt(np.mean((ff-pred)**2))),
                "root_step_change":float(abs(sweep[-1]["F_B_over_A"]-sweep[-2]["F_B_over_A"]))})
    sided={d:float(next(q for q in recovered if q["design"]==d and q["a"]>A_STAR)["root_o"]-
                   next(q for q in recovered if q["design"]==d and q["a"]<A_STAR)["root_o"])
           for d in DESIGNS}
    spread=[]
    for a in A_VALUES:
        vals=[q["root_o"] for q in recovered if np.isclose(q["a"],a)]
        spread.append({"a":float(a),"resolver_spread":float(max(vals)-min(vals)),
                       "min":float(min(vals)),"max":float(max(vals))})
    allz=[z for q in evaluations for z in q["step_sweep"]]
    convergence=[]
    for q in evaluations:
        vals=[z["F_B_over_A"] for z in q["step_sweep"]]
        convergence.append(abs(vals[-1]-vals[-2]))
    out={"status":"sandbox implicit-normal-equation jet; not canonical theory",
         "definition":{"normal_equation":"g(theta,delta)=J(theta)^T R(theta,delta)=0",
          "local_response":"F0=SCALE*<e1,e2>/<e1,e1>",
          "derivative_note":"nuisance optimum differentiated implicitly; forward/truth partials remain centered finite differences"},
         "steps":{"jacobian":JAC_STEPS,"truth":TRUTH_STEPS,"directional":DIR_STEPS},
         "base_contact_threshold":float(A_STAR),
         "recovered_roots":recovered,
         "root_step_convergence":[{"design":q["design"],"a":q["a"],"root_o":q["root_o"],
             "F_by_step":[z["F_B_over_A"] for z in q["step_sweep"]],
             "contact_crossing_by_step":[z["crosses_train_contact_stratum"] for z in q["step_sweep"]]}
             for q in root_step_sweeps],
         "sided_root_difference":sided,"resolver_spread":spread,
         "summary":{"max_abs_root_shift_from_residual_jet":float(max(abs(q["root_shift"]) for q in recovered)),
          "max_last_step_change":float(max(convergence)),
          "max_normal_residual":float(max(z["normal_residual"] for z in allz)),
          "max_second_normal_residual":float(max(z["second_normal_residual"] for z in allz)),
          "min_hessian_eigenvalue":float(min(z["hessian_min"] for z in allz)),
          "max_hessian_condition":float(max(z["hessian_condition"] for z in allz)),
          "max_directional_support_shift":float(max(z["directional_support_shift_max"] for z in allz)),
          "any_contact_stratum_crossing":bool(any(z["crosses_train_contact_stratum"] for z in allz)),
          "max_resolver_spread":float(max(q["resolver_spread"] for q in spread))}}
    with open("p9_implicit_normal_jet.json","w",encoding="utf-8") as f:
        json.dump(out,f,indent=2)
    print(json.dumps({"roots":recovered,"sided":sided,"spread":spread,"summary":out["summary"]},indent=2))


if __name__=="__main__":
    main()
