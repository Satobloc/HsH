"""Blind positive-spectrum inversion from pole locations plus pole residues.

The fixture, seeds, repeat count, carrier multipliers, grids, intervals, and
roughness evidence path are unchanged from the location-only frequency run.
Residues are independent unit-forcing readouts, not extra constitutive terms.
"""

import json
import os
from concurrent.futures import ProcessPoolExecutor, as_completed

import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import nnls
from sklearn.covariance import LedoitWolf

from repeated_covariance_spectrum_selection import TRUE, pole_cov, sample_repeats
from spectral_lambda_path_ensemble import (
    CONFIGS, LAMBDAS, Q_FIXED, REPEATS, SEEDS, W_SCALE,
    cluster_summary, d2_matrix, quantiles,
)
from spectral_joint_radius_frequency import NU, roots_joint

SIGMA = 3e-4
RHO_A = .75
ETA_RI = .35


def true_residues(a, z_blocks, p=TRUE):
    out = []
    for z in z_blocks:
        den1 = 1-1j*z*p["t1"]
        den2 = 1-1j*z*p["t2"]
        fp = (2*z + 1j*a**p["q"]*(p["A1"]/den1+p["A2"]/den2)
              + 1j*z*a**p["q"]*(p["A1"]*1j*p["t1"]/den1**2
                                  + p["A2"]*1j*p["t2"]/den2**2))
        out.append(-1/fp)
    return out


def augmented_design(a, z, residue, tau):
    den = 1-1j*z[:,None]*tau[None,:]
    # Reality closure from D(z)=0 after eliminating unknown real bare omega^2.
    b0 = (z*z).imag
    A0 = (1j*z[:,None]*a[:,None]**Q_FIXED/den).imag
    # Unit-forcing pole residue: -R^-1-2z = i a^q int dmu/(1-iz tau)^2.
    y = -1/residue-2*z
    Ar = 1j*a[:,None]**Q_FIXED/den**2
    b = np.r_[b0, -y.real, -y.imag]
    A = np.vstack([A0, Ar.real, Ar.imag])
    return b, A


def estimate_real_cov(X):
    sd = X.std(axis=0,ddof=1)
    sd = np.maximum(sd, np.max(sd)*1e-12)
    Z = (X-X.mean(axis=0))/sd
    lw = LedoitWolf(assume_centered=True).fit(Z)
    return np.diag(sd)@lw.covariance_@np.diag(sd), float(lw.shrinkage_)


def augmented_stats(a, zreps, rreps, tau):
    zm = zreps.mean(axis=0); rm = rreps.mean(axis=0)
    b,A = augmented_design(a,zm,rm,tau)
    pilot = W_SCALE*nnls(A*W_SCALE,-b,maxiter=10*len(tau))[0]
    rr=[]
    for z,r in zip(zreps,rreps):
        bi,Ai=augmented_design(a,z,r,tau)
        rr.append(bi+Ai@pilot)
    C,sh=estimate_real_cov(np.asarray(rr))
    return b,A,C/REPEATS,sh


def fit_positive_augmented(stats, train_radius, lam, tau):
    n=(len(stats[0][0])//3); idx=np.r_[train_radius,n+train_radius,2*n+train_radius]
    As=[]; ys=[]
    for b,A,C,_ in stats:
        L=np.linalg.cholesky(C[np.ix_(idx,idx)]+np.eye(len(idx))*1e-18)
        As.append(np.linalg.solve(L,A[idx]*W_SCALE))
        ys.append(-np.linalg.solve(L,b[idx]))
    Aw=np.vstack(As); yw=np.concatenate(ys)
    if lam>0:
        h=float(np.log(tau[1]/tau[0])); d2=d2_matrix(len(tau))
        Aw=np.vstack([Aw,np.sqrt(lam/h**3)*d2])
        yw=np.r_[yw,np.zeros(len(tau)-2)]
    return W_SCALE*nnls(Aw,yw,maxiter=10*len(tau))[0]


def conditional_nll_augmented(stats,w,train_radius,test_radius):
    total=0.; n=len(stats[0][0])//3
    tr=np.r_[train_radius,n+train_radius,2*n+train_radius]
    te=np.r_[test_radius,n+test_radius,2*n+test_radius]
    for b,A,C,_ in stats:
        g=b+A@w
        CTT=C[np.ix_(tr,tr)]+np.eye(len(tr))*1e-18
        Css=C[np.ix_(te,te)]+np.eye(len(te))*1e-18
        CsT=C[np.ix_(te,tr)]
        sol=np.linalg.solve(CTT,CsT.T)
        mu=CsT@np.linalg.solve(CTT,g[tr])
        S=Css-CsT@sol+np.eye(len(te))*1e-18
        e=g[te]-mu
        total+=float(e@np.linalg.solve(S,e)+np.linalg.slogdet(S)[1]
                     +len(te)*np.log(2*np.pi))
    return total


def run_config(a,zreps_blocks,rreps_blocks,label,bins,interval):
    tau=np.geomspace(interval[0],interval[1],bins)
    stats=[augmented_stats(a,zr,rr,tau) for zr,rr in zip(zreps_blocks,rreps_blocks)]
    interior=np.arange(1,len(a)-1); folds=[interior[k::3] for k in range(3)]
    scores=np.zeros(len(LAMBDAS)); allr=np.arange(len(a))
    for test in folds:
        train=np.setdiff1d(allr,test)
        for j,lam in enumerate(LAMBDAS):
            w=fit_positive_augmented(stats,train,lam,tau)
            scores[j]+=conditional_nll_augmented(stats,w,train,test)
    rel=np.exp(-.5*(scores-scores.min())); alpha=rel/rel.sum()
    full=np.array([fit_positive_augmented(stats,allr,lam,tau) for lam in LAMBDAS])
    avg=alpha@full; clusters,endpoint=cluster_summary(tau,avg)
    return {"interval_label":label,"bins":bins,"interval":list(interval),
            "h":float(np.log(tau[1]/tau[0])),"lambda_weights":alpha.tolist(),
            "lambda_cv_nll":scores.tolist(),"effective_lambdas":float(1/np.sum(alpha*alpha)),
            "clusters":clusters,"endpoint_mass":endpoint,
            "pilot_cov_shrinkage":[s[3] for s in stats],
            "tau":tau.tolist(),"spectrum":(avg/avg.sum()).tolist()}


def run_seed(seed):
    rng=np.random.default_rng(seed); a=np.logspace(-1,np.log10(3),41)
    z0=np.split(roots_joint(a,NU),len(NU)); r0=true_residues(a,z0)
    zreps=[]; rreps=[]
    for z,r in zip(z0,r0):
        zreps.append(sample_repeats(z,pole_cov(z,sigma=SIGMA,rho=RHO_A,eta=ETA_RI),REPEATS,rng))
        rreps.append(sample_repeats(r,pole_cov(r,sigma=SIGMA,rho=RHO_A,eta=ETA_RI),REPEATS,rng))
    return {"seed":seed,"configs":[run_config(a,zreps,rreps,*cfg) for cfg in CONFIGS]}


def summarize(rows):
    out=[]
    for label,bins,interval in CONFIGS:
        rr=[next(c for c in s["configs"] if c["interval_label"]==label and c["bins"]==bins) for s in rows]
        out.append({"interval_label":label,"bins":bins,"interval":list(interval),"h":rr[0]["h"],
          "fast_centroid":quantiles([r["clusters"][0]["centroid"] for r in rr]),
          "slow_centroid":quantiles([r["clusters"][1]["centroid"] for r in rr]),
          "fast_mass":quantiles([r["clusters"][0]["mass"] for r in rr]),
          "slow_mass":quantiles([r["clusters"][1]["mass"] for r in rr]),
          "fast_width":quantiles([r["clusters"][0]["log_width"] for r in rr]),
          "slow_width":quantiles([r["clusters"][1]["log_width"] for r in rr]),
          "endpoint_mass":quantiles([r["endpoint_mass"] for r in rr]),
          "effective_lambdas":quantiles([r["effective_lambdas"] for r in rr]),
          "median_spectrum":np.median([r["spectrum"] for r in rr],axis=0).tolist(),"tau":rr[0]["tau"]})
    return out


def make_plot(summary,baseline):
    fig,ax=plt.subplots(2,2,figsize=(12.5,9),constrained_layout=True)
    colors={25:"#2166ac",49:"#7b3294",97:"#d73027"}
    for r in [x for x in summary if x["interval_label"]=="wide"]:
        ax[0,0].plot(r["tau"],r["median_spectrum"],"o-",ms=2.5,color=colors[r["bins"]],label=f"joint {r['bins']} bins")
    ax[0,0].set_xscale("log");ax[0,0].legend(frameon=False)
    ax[0,0].set(xlabel="relaxation time τ",ylabel="median normalized weight",title="Location–residue spectra (wide interval)")
    for source,rows,marker in (("location only",baseline,"o"),("+ residue",summary,"s")):
        rr=[x for x in rows if x["interval_label"]=="wide"]; x=[r["h"] for r in rr]
        ax[0,1].plot(x,[r["fast_width"]["q975"] for r in rr],marker=marker,label=f"{source}: fast U95")
        ax[0,1].plot(x,[r["fast_width"]["median"] for r in rr],marker=marker,ls="--",label=f"{source}: fast median")
        ax[1,0].plot(x,[r["endpoint_mass"]["q975"] for r in rr],marker=marker,label=source)
        ax[1,1].plot(x,[r["effective_lambdas"]["median"] for r in rr],marker=marker,label=source)
    for a0 in (ax[0,1],ax[1,0],ax[1,1]):a0.invert_xaxis();a0.legend(fontsize=8,frameon=False)
    ax[0,1].set(xlabel="log-grid spacing h",ylabel="fast-sector log-width",title="Width contraction test")
    ax[1,0].set(xlabel="log-grid spacing h",ylabel="endpoint mass U95",title="Boundary leakage")
    ax[1,1].set(xlabel="log-grid spacing h",ylabel="effective λ count",title="Roughness-path uncertainty")
    fig.suptitle("Class P diagnostic: pole location + residue",fontsize=15)
    fig.savefig("spectral_joint_location_residue.png",dpi=180);fig.savefig("spectral_joint_location_residue.svg")


def main():
    rows=[]
    with ProcessPoolExecutor(max_workers=min(6,os.cpu_count() or 1)) as pool:
        futs={pool.submit(run_seed,s):s for s in SEEDS}
        for i,f in enumerate(as_completed(futs),1):rows.append(f.result());print(f"completed {i}/{len(SEEDS)}",flush=True)
    rows.sort(key=lambda x:x["seed"]); summary=summarize(rows)
    baseline=json.load(open("spectral_joint_radius_frequency_summary.json"))["summary_blind"]
    payload={"status":"GEN/CANDIDATE","observable":"unit-forcing complex pole residue",
      "residue_identity":"-1/R-2z = i a^q integral[dmu/(1-i z tau)^2]",
      "repeats":REPEATS,"seeds":SEEDS,"frequency_multipliers":NU.tolist(),
      "location_and_residue_relative_noise":SIGMA,"configs":CONFIGS,"lambda_grid":LAMBDAS.tolist(),
      "summary_blind":summary,"location_only_baseline":baseline,"seed_results":rows,
      "posthoc_truth_reveal":{"tau_1":float(TRUE["t1"]),"tau_2":float(TRUE["t2"]),"mass_split":[.6,.4]}}
    json.dump(payload,open("spectral_joint_location_residue.json","w"),indent=2)
    compact={k:v for k,v in payload.items() if k!="seed_results"}
    json.dump(compact,open("spectral_joint_location_residue_summary.json","w"),indent=2)
    make_plot(summary,baseline)
    print(json.dumps(summary,indent=2))


if __name__=="__main__":main()
