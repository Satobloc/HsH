"""Signed-coordinate multi-bin discriminator for covariance-matched B3 vs S2.

Bin edges are fixed exclusively by the union/intersection of S2 supports under
the preregistered offset nuisance |u| <= delta.  Composite likelihoods profile
the nuisance independently under each candidate.  Threshold selection and
validation use independent Monte Carlo streams; multinomial sampling is exact.
"""

import json
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import beta

N=192
DELTA=.08
S=np.sqrt(3/5)
E_GUARD=1-(.025)**(1/192)
PROFILE_POINTS=121
TRUE_POINTS=49
N_CAL=30000
N_VAL=100000
SEED=20261003


def cdf_b3(x):
    x=np.asarray(x,float)
    y=np.clip(x,-1,1)
    return np.where(x<=-1,0,np.where(x>=1,1,.5+.75*y-.25*y**3))


def cdf_s2(x):
    return np.clip((np.asarray(x,float)+S)/(2*S),0,1)


EDGES=np.array([-np.inf,-S-DELTA,-S+DELTA,0,S-DELTA,S+DELTA,np.inf])
EDGE_FAMILIES={
    "3_union":np.array([-np.inf,-S-DELTA,S+DELTA,np.inf]),
    "4_union_sign":np.array([-np.inf,-S-DELTA,0,S+DELTA,np.inf]),
    "5_support":np.array([-np.inf,-S-DELTA,-S+DELTA,S-DELTA,S+DELTA,np.inf]),
    "6_support_sign":EDGES,
}


def confusion(e,m=6):
    """Conservative adjacent-bin assignment error with reflecting endpoints."""
    k=np.zeros((m,m))
    for i in range(m):
        k[i,i]=1-e
        if i==0:
            k[i,i]+=e/2; k[i,i+1]+=e/2
        elif i==m-1:
            k[i,i]+=e/2; k[i,i-1]+=e/2
        else:
            k[i,i-1]+=e/2; k[i,i+1]+=e/2
    return k


def probs(kind,u,e,edges=EDGES):
    cdf=cdf_b3 if kind=="b3" else cdf_s2
    p=np.diff(cdf(edges-u))
    return p@confusion(e,len(p))


def profile_tables(e,edges=EDGES):
    u=np.linspace(-DELTA,DELTA,PROFILE_POINTS)
    pb=np.array([probs("b3",x,e,edges) for x in u])
    ps=np.array([probs("s2",x,e,edges) for x in u])
    return u,np.log(np.clip(pb,1e-300,1)),np.log(np.clip(ps,1e-300,1))


def scores(counts,lb,ls):
    return np.max(counts@lb.T,axis=1)-np.max(counts@ls.T,axis=1)


def simulate_families(e,repeats,rng,edges=EDGES):
    _,lb,ls=profile_tables(e,edges)
    utrue=np.linspace(-DELTA,DELTA,TRUE_POINTS)
    outb=[]; outs=[]
    for u in utrue:
        outb.append(np.sort(scores(rng.multinomial(N,probs("b3",u,e,edges),size=repeats),lb,ls)))
        outs.append(np.sort(scores(rng.multinomial(N,probs("s2",u,e,edges),size=repeats),lb,ls)))
    return utrue,np.array(outb),np.array(outs)


def choose_threshold(sb,ss):
    pool=np.concatenate([sb.ravel()[::max(1,sb.size//20000)],ss.ravel()[::max(1,ss.size//20000)]])
    qs=np.linspace(.001,.999,3001)
    grid=np.unique(np.quantile(pool,qs))
    best=None
    for t in grid:
        eb=max(np.searchsorted(x,t,side="right")/x.size for x in sb)
        es=max(1-np.searchsorted(x,t,side="right")/x.size for x in ss)
        item=(max(eb,es),t,eb,es)
        if best is None or item<best: best=item
    return {"calibrated_max_error":float(best[0]),"threshold":float(best[1]),
            "calibrated_b3_error":float(best[2]),"calibrated_s2_error":float(best[3])}


def validate_case(e,edges=EDGES,seed_offset=0):
    rng_cal=np.random.default_rng(SEED+seed_offset+round(1e6*e))
    uc,sbc,ssc=simulate_families(e,N_CAL,rng_cal,edges)
    rule=choose_threshold(sbc,ssc); t=rule["threshold"]
    rng_val=np.random.default_rng(SEED+900000+seed_offset+round(1e6*e))
    uv,sb,ss=simulate_families(e,N_VAL,rng_val,edges)
    kb=np.array([np.searchsorted(x,t,side="right") for x in sb])
    ks=np.array([N_VAL-np.searchsorted(x,t,side="right") for x in ss])
    ib=int(np.argmax(kb)); is_=int(np.argmax(ks))
    # Bonferroni simultaneous 95% upper bound across 2*TRUE_POINTS cells.
    q=1-.05/(2*TRUE_POINTS)
    ub=float(beta.ppf(q,max(kb[ib],ks[is_])+1,N_VAL-max(kb[ib],ks[is_])))
    result={**rule,"assignment_error":float(e),"validation_repeats_per_cell":N_VAL,
            "validation_b3_error":float(kb[ib]/N_VAL),"worst_b3_u":float(uv[ib]),
            "validation_s2_error":float(ks[is_]/N_VAL),"worst_s2_u":float(uv[is_]),
            "validation_max_error":float(max(kb[ib],ks[is_])/N_VAL),
            "simultaneous_95_upper":ub}
    return result,(uv,sb,ss)


def affinity_audit(e,edges=EDGES):
    u=np.linspace(-DELTA,DELTA,801)
    pb=np.array([probs("b3",x,e,edges) for x in u]); ps=np.array([probs("s2",x,e,edges) for x in u])
    a=(np.sqrt(pb[:,None,:]*ps[None,:,:]).sum(axis=2))**N
    ij=np.unravel_index(np.argmax(a),a.shape); A=float(a[ij])
    return {"worst_product_affinity":A,"u_b3":float(u[ij[0]]),"u_s2":float(u[ij[1]]),
            "simple_pair_bayes_upper":float(.5*A),
            "simple_pair_bayes_lower":float(.5*(1-np.sqrt(max(0,1-A*A))))}


def main():
    ideal,raw0=validate_case(0.0)
    guarded_cases={}; raw_cases={}
    for j,(name,edges) in enumerate(EDGE_FAMILIES.items()):
        guarded_cases[name],raw_cases[name]=validate_case(E_GUARD,edges,10000*(j+1))
    guarded=guarded_cases["5_support"]; rawg=raw_cases["5_support"]
    passing=[(len(EDGE_FAMILIES[k])-1,k,v) for k,v in guarded_cases.items() if v["simultaneous_95_upper"]<.05]
    minimal=min(passing) if passing else None
    result={
      "status":"STD/DERIVED conditional multinomial readout; SAT/CANDIDATE as finite-core discriminator",
      "question":"Does support-stratified signed-coordinate binning beat binary capture at N=192 and |u|/R<=0.08?",
      "constants":{"N":N,"delta_over_R":DELTA,"s2_radius_over_b3_radius":float(S),"guarded_adjacent_bin_error":float(E_GUARD)},
      "dimensionless_bin_edges":["-inf",float(-S-DELTA),float(-S+DELTA),0.0,float(S-DELTA),float(S+DELTA),"inf"],
      "edge_rule":"union boundary, intersection boundary, center, reflected; fixed from S2 support and nuisance bound before outcomes",
      "ideal_six_bin_assignment":ideal,"guarded_minimal_assignment":guarded,
      "guarded_six_bin_assignment":guarded_cases["6_support_sign"],
      "nested_guarded_bin_families":guarded_cases,
      "minimal_passing_family":None if minimal is None else {"bins":minimal[0],"name":minimal[1],"simultaneous_95_upper":minimal[2]["simultaneous_95_upper"]},
      "ideal_six_bin_affinity":affinity_audit(0.0),"guarded_minimal_affinity":affinity_audit(E_GUARD,EDGE_FAMILIES["5_support"]),
      "binary_capture_best_audited_error":0.12883547386390615,
      "failure_condition":"Fails if signed-coordinate bins are outcome-tuned, offset exceeds 0.08R, adjacent-bin confusion exceeds the guard/model, R is circularly estimated, or carrier measures differ from declared uniform B3/S2."
    }
    with open("signed_coordinate_multibin_readout.json","w") as f: json.dump(result,f,indent=2)

    fig,ax=plt.subplots(2,2,figsize=(12.8,9.2),constrained_layout=True)
    z=np.linspace(-1.1,1.1,1000)
    ax[0,0].plot(z,.75*np.maximum(0,1-z*z),color="black",lw=2,label="B3 projected density")
    ax[0,0].plot(z,np.where(np.abs(z)<=S,1/(2*S),np.nan),color="#762a83",lw=2,label="S2 projected density")
    min_edges=EDGE_FAMILIES["5_support"]
    for e in min_edges[1:-1]: ax[0,0].axvline(e,color="#2166ac",ls="--",lw=1)
    ax[0,0].axvspan(-S+DELTA,S-DELTA,color="#d9f0d3",alpha=.35,label="S2 support intersection")
    ax[0,0].set(xlabel="signed resolver-normal coordinate z/R",ylabel="density × R",title="Minimal passing geometry-fixed five-bin readout")
    ax[0,0].legend(frameon=False,fontsize=8)

    x=np.arange(5); width=.38
    pb=probs("b3",0,E_GUARD,min_edges); ps=probs("s2",0,E_GUARD,min_edges)
    ax[0,1].bar(x-width/2,pb,width,color="black",label="B3, u=0")
    ax[0,1].bar(x+width/2,ps,width,color="#762a83",label="S2, u=0")
    ax[0,1].set(xticks=x,xticklabels=["outer−","shoulder−","inner","shoulder+","outer+"],ylabel="guarded bin probability",title="Central candidate fingerprints after assignment guard")
    ax[0,1].tick_params(axis="x",rotation=25); ax[0,1].legend(frameon=False,fontsize=8)

    uv,sb,ss=rawg; ib=np.argmin(np.abs(uv-guarded["worst_b3_u"])); is_=np.argmin(np.abs(uv-guarded["worst_s2_u"]))
    lo=min(sb[ib][200],ss[is_][200]); hi=max(sb[ib][-200],ss[is_][-200])
    bins=np.linspace(lo,hi,80)
    ax[1,0].hist(sb[ib],bins=bins,density=True,alpha=.6,color="black",label=f"B3 u={uv[ib]:+.3f}")
    ax[1,0].hist(ss[is_],bins=bins,density=True,alpha=.55,color="#762a83",label=f"S2 u={uv[is_]:+.3f}")
    ax[1,0].axvline(guarded["threshold"],color="#b2182b",ls="--",label="frozen threshold")
    ax[1,0].set(xlabel="profile log-likelihood score (B3−S2)",ylabel="validation density",title="Worst-cell score distributions; independent validation")
    ax[1,0].legend(frameon=False,fontsize=8)

    names=["Binary\ncapture","3-bin","4-bin","5-bin","6-bin","5-bin\n95% upper"]
    vals=[result["binary_capture_best_audited_error"]]+[guarded_cases[k]["validation_max_error"] for k in EDGE_FAMILIES]+[guarded_cases["5_support"]["simultaneous_95_upper"]]
    cols=["#777777","#d73027","#fc8d59","#2166ac","#762a83","#b2182b"]
    ax[1,1].bar(names,vals,color=cols); ax[1,1].axhline(.05,color="#1b7837",ls="--",label="5% ceiling")
    for i,v in enumerate(vals): ax[1,1].text(i,v+.003,f"{v:.3%}",ha="center",fontsize=9)
    ax[1,1].set(ylabel="worst composite error",title="Information retained per 192 specimens",ylim=(0,max(vals)*1.22)); ax[1,1].legend(frameon=False,fontsize=8)
    fig.suptitle("Class P diagnostic: support-stratified signed-coordinate readout",fontsize=15)
    fig.savefig("signed_coordinate_multibin_readout.png",dpi=180)
    fig.savefig("signed_coordinate_multibin_readout.svg")
    print(json.dumps(result,indent=2))


if __name__=="__main__": main()
