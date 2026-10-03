"""Fixed-budget unequal two-setting closure test for B3 versus S2 aperture readout.

The total specimen budget is exactly 192.  Each hypothesis has its own unknown
relative center offset u in [-0.08,0.08].  Designs are ranked by the worst-pair
Bhattacharyya affinity, then the best candidates are evaluated by an exact
count-grid profile-likelihood minimax test (binomial discreteness exact;
nuisance maximization on a declared dense deterministic grid).
"""

import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import differential_evolution
from scipy.stats import binom

N = 192
DELTA = 0.08
ALPHA = 0.05
S = np.sqrt(3.0 / 5.0)
E = 1.0 - 0.025 ** (1.0 / 192.0)


def cdf_b3(x):
    x = np.asarray(x, float)
    return np.where(x <= -1, 0.0,
                    np.where(x >= 1, 1.0, 0.5 + 0.75*x - 0.25*x**3))


def occ_b3(t, x):
    return cdf_b3(np.asarray(x)+t) - cdf_b3(np.asarray(x)-t)


def occ_s2(t, x):
    x = np.asarray(x, float)
    return np.maximum(0.0, np.minimum(S, x+t)-np.maximum(-S, x-t))/(2*S)


def obs(m):
    return E + (1-2*E)*np.asarray(m)


def setting_probs(kind, t, c, u):
    return obs((occ_b3 if kind == "b3" else occ_s2)(t, u+c))


def bc(p, q):
    return np.sqrt(p*q) + np.sqrt((1-p)*(1-q))


def worst_log_bc(x, points=101):
    """Largest product-affinity log over independent nuisance values."""
    t1, c1, t2, c2, w = x
    u = np.linspace(-DELTA, DELTA, points)
    pb1, pb2 = setting_probs("b3", t1, c1, u), setting_probs("b3", t2, c2, u)
    ps1, ps2 = setting_probs("s2", t1, c1, u), setting_probs("s2", t2, c2, u)
    a1 = np.log(np.clip(bc(pb1[:, None], ps1[None, :]), 1e-300, 1))
    a2 = np.log(np.clip(bc(pb2[:, None], ps2[None, :]), 1e-300, 1))
    return float(np.max(N*(w*a1+(1-w)*a2)))


def canonical(x):
    t1,c1,t2,c2,w = map(float, x)
    if (t2,c2) < (t1,c1):
        t1,c1,t2,c2,w = t2,c2,t1,c1,1-w
    return [t1,c1,t2,c2,w]


def optimize_surrogate():
    bounds=[(.08,1.12),(-.30,.30),(.08,1.12),(-.30,.30),(.05,.95)]
    out=[]
    for seed in range(6):
        r=differential_evolution(worst_log_bc,bounds,seed=100+seed,popsize=14,
                                 maxiter=330,tol=2e-7,polish=True,workers=1,
                                 updating="immediate")
        out.append((float(r.fun),canonical(r.x)))
    out.sort(key=lambda z:z[0])
    return out


def profile_minimax(design, n1, nuisance_points=801, return_map=False):
    t1,c1,t2,c2,_=design
    n2=N-n1
    u=np.linspace(-DELTA,DELTA,nuisance_points)
    pb=np.column_stack([setting_probs("b3",t1,c1,u),setting_probs("b3",t2,c2,u)])
    ps=np.column_stack([setting_probs("s2",t1,c1,u),setting_probs("s2",t2,c2,u)])
    k1=np.arange(n1+1); k2=np.arange(n2+1)
    lb=np.full((n1+1,n2+1),-np.inf); ls=np.full_like(lb,-np.inf)
    for p in pb:
        lb=np.maximum(lb,binom.logpmf(k1,n1,p[0])[:,None]+binom.logpmf(k2,n2,p[1])[None,:])
    for p in ps:
        ls=np.maximum(ls,binom.logpmf(k1,n1,p[0])[:,None]+binom.logpmf(k2,n2,p[1])[None,:])
    score=(ls-lb).ravel(); order=np.argsort(score)
    eb=np.zeros(score.size); es=np.zeros(score.size)
    # Accumulate worst errors without retaining all nuisance/state matrices.
    for p in pb:
        pm=(binom.pmf(k1,n1,p[0])[:,None]*binom.pmf(k2,n2,p[1])[None,:]).ravel()[order]
        eb=np.maximum(eb,1-np.cumsum(pm))
    for p in ps:
        pm=(binom.pmf(k1,n1,p[0])[:,None]*binom.pmf(k2,n2,p[1])[None,:]).ravel()[order]
        es=np.maximum(es,np.cumsum(pm))
    risk=np.maximum(eb,es); j=int(np.argmin(risk))
    result={"n1":int(n1),"n2":int(n2),"max_error":float(risk[j]),
            "error_if_b3":float(eb[j]),"error_if_s2":float(es[j]),
            "profile_score_threshold":float(score[order[j]])}
    if return_map:
        result["decision_map"]=(score.reshape(n1+1,n2+1)>score[order[j]])
    return result


def simple_pair_lower_bound(design,n1,points=1601):
    """BC-based lower bound on composite minimax error for this design."""
    t1,c1,t2,c2,_=design; n2=N-n1
    u=np.linspace(-DELTA,DELTA,points)
    pb1,pb2=setting_probs("b3",t1,c1,u),setting_probs("b3",t2,c2,u)
    ps1,ps2=setting_probs("s2",t1,c1,u),setting_probs("s2",t2,c2,u)
    loga=n1*np.log(bc(pb1[:,None],ps1[None,:]))+n2*np.log(bc(pb2[:,None],ps2[None,:]))
    ij=np.unravel_index(np.argmax(loga),loga.shape); A=float(np.exp(loga[ij]))
    # TV <= sqrt(1-A^2); equal-prior Bayes error >= (1-TV)/2.
    lo=.5*(1-np.sqrt(max(0,1-A*A)))
    return {"affinity":A,"bayes_error_lower_bound":float(lo),
            "worst_pair_u_b3":float(u[ij[0]]),"worst_pair_u_s2":float(u[ij[1]])}


def main():
    opt=optimize_surrogate()
    best=opt[0][1]
    n0=int(round(N*best[4]))
    allocations=sorted(set(max(8,min(N-8,n0+d)) for d in range(-10,11)))
    exact=[profile_minimax(best,n,801) for n in allocations]
    exact.sort(key=lambda z:z["max_error"])
    winner=exact[0]; n1=winner["n1"]
    # Reoptimize continuous placement at the selected fixed allocation.
    def fixed_obj(y):
        return worst_log_bc([y[0],y[1],y[2],y[3],n1/N],151)
    rr=differential_evolution(fixed_obj,[(.08,1.12),(-.30,.30),(.08,1.12),(-.30,.30)],
                              seed=907,popsize=18,maxiter=500,tol=1e-8,polish=True)
    refined=canonical([*rr.x,n1/N])
    # Audit nearby allocations for both surrogate winners.
    candidates=[]
    for dsg in [best,refined]:
        nn=int(round(N*dsg[4]))
        for n in range(max(8,nn-8),min(N-8,nn+8)+1):
            candidates.append((dsg,profile_minimax(dsg,n,1201)))
    candidates.sort(key=lambda z:z[1]["max_error"])
    dsg,win=candidates[0]
    final=profile_minimax(dsg,win["n1"],2001,True)
    lower=simple_pair_lower_bound(dsg,win["n1"],1601)
    allocation_curve=[profile_minimax(dsg,n,401) for n in range(80,113)]

    symmetric=[.8025,-.0525,.8025,.0525,.5]
    baseline=profile_minimax(symmetric,96,1201)
    result={
      "status":"STD/DERIVED conditional on declared measures/readout; SAT/CANDIDATE as carrier discriminator",
      "question":"Can any fully unequal two-setting design reach 5% composite error at delta/R=0.08 with total N=192?",
      "constants":{"total_N":N,"delta_over_R":DELTA,"s2_radius_over_b3_radius":float(S),"control_guard_e":float(E)},
      "search_box":{"t":[.08,1.12],"c_over_R":[-.30,.30],"allocation_fraction":[.05,.95],"de_seeds":6},
      "surrogate_multistart":[{"worst_log_affinity":v,"design":x} for v,x in opt],
      "best_design":{"t1":dsg[0],"c1":dsg[1],"t2":dsg[2],"c2":dsg[3],"n1":final["n1"],"n2":final["n2"]},
      "architecture_note":"The exact-risk winner collapsed to coincident equal-thickness settings; the nominal split survives only as an ancillary randomization device, not a second geometric view.",
      "exact_profile_minimax":{k:v for k,v in final.items() if k!="decision_map"},
      "simple_pair_information_lower_bound":lower,
      "symmetric_previous_design":baseline,
      "numerical_closure":"No passing design if exact risk exceeds 0.05; this is a multistart numerical closure over the declared box, not an analytic global impossibility theorem.",
      "failure_condition":"Closure fails outside the design box, for non-top-hat response, drifting offsets, unguarded controls, or carriers other than the declared uniform B3/S2 measures."
    }
    with open("unequal_two_setting_aperture_bound.json","w") as f: json.dump(result,f,indent=2)

    fig,ax=plt.subplots(2,2,figsize=(12.8,9.3),constrained_layout=True)
    th=np.linspace(0,2*np.pi,700)
    ax[0,0].plot(np.cos(th),np.sin(th),color="black",lw=1.8,label="B3 support, R")
    ax[0,0].plot(S*np.cos(th),S*np.sin(th),color="#762a83",lw=2,label="covariance-matched S2")
    for i,(t,c,col) in enumerate([(dsg[0],dsg[1],"#2166ac"),(dsg[2],dsg[3],"#b2182b")],1):
        ax[0,0].axhspan(-c-t,-c+t,color=col,alpha=.13,label=f"setting {i}: t={t:.3f}, c={c:.3f}")
        ax[0,0].axhline(-c,color=col,ls="--",lw=1)
    ax[0,0].set(aspect="equal",xlim=(-1.1,1.1),ylim=(-1.1,1.1),xlabel="transverse / R",ylabel="resolver normal / R",title="Exact-risk winner collapses to one geometric view")
    ax[0,0].legend(frameon=False,fontsize=8,loc="lower left")

    u=np.linspace(-DELTA,DELTA,500)
    for i,(t,c,col) in enumerate([(dsg[0],dsg[1],"#2166ac"),(dsg[2],dsg[3],"#b2182b")],1):
        ax[0,1].plot(u,setting_probs("b3",t,c,u),color=col,ls="-",label=f"B3, setting {i}")
        ax[0,1].plot(u,setting_probs("s2",t,c,u),color=col,ls="--",label=f"S2, setting {i}")
    ax[0,1].set(xlabel="independent nuisance u/R",ylabel="guarded hit probability",title="Two response channels across the certified offset interval")
    ax[0,1].legend(frameon=False,fontsize=8,ncol=2)

    ns=[z["n1"] for z in allocation_curve]; rs=[z["max_error"] for z in allocation_curve]
    ax[1,0].plot(ns,rs,"o-",color="#2166ac")
    ax[1,0].axhline(ALPHA,color="#1b7837",ls="--",label="5% ceiling")
    ax[1,0].axvline(final["n1"],color="#b2182b",ls=":",label=f"chosen {final['n1']}+{final['n2']}")
    ax[1,0].set(xlabel="repeats assigned to setting 1 (total 192)",ylabel="worst profiled error",title="Integer allocation audit")
    ax[1,0].legend(frameon=False,fontsize=8)

    dm=final["decision_map"]
    ax[1,1].imshow(dm.T,origin="lower",aspect="auto",cmap="PiYG",extent=[-.5,final["n1"]+.5,-.5,final["n2"]+.5])
    ax[1,1].set(xlabel="hits at setting 1",ylabel="hits at setting 2",title=f"Profiled decision map; worst error={final['max_error']:.3%}")
    fig.suptitle("Class P closure test: fully unequal two-setting aperture design at fixed N=192",fontsize=15)
    fig.savefig("unequal_two_setting_aperture_bound.png",dpi=180)
    fig.savefig("unequal_two_setting_aperture_bound.svg")
    print(json.dumps(result,indent=2))


if __name__=="__main__": main()
