#!/usr/bin/env python3
"""Local Fisher/SVD audit for two-orientation finite-core readout tomography.

All notation is local to the Ravel sandbox.  The projected core is represented
on u in [-1,1], stretched to z in [-rho_minus,rho_plus].  Legendre perturbations
probe morphology without assuming a particle label or historical constant.
"""
from __future__ import annotations

import json
import numpy as np
from numpy.polynomial.legendre import leggauss, legval
import matplotlib.pyplot as plt

RHO_P = 0.70
RHO_M = 1.30
SIGMA = 1.0e-4
NMODES = 6
NQ = 3200

u, wq = leggauss(NQ)
p0 = np.full_like(u, 0.5)

def zmap(rp: float, rm: float) -> np.ndarray:
    return np.where(u >= 0.0, rp*u, rm*u)

def kernel(h: float, z: np.ndarray, support: float) -> np.ndarray:
    a = np.sqrt(np.maximum(h-z, 0.0))
    b = np.sqrt(np.maximum(-h-z, 0.0))
    return (a-b)/np.sqrt(h+support)

def row(h: float, orient: int, rp: float, rm: float) -> np.ndarray:
    z = zmap(rp, rm)
    if orient == 1:
        kval = kernel(h, z, rp)
    else:
        kval = kernel(h, -z, rm)
    out = [np.dot(wq, p0*kval)]
    for ell in range(1, NMODES+1):
        coeff = np.zeros(ell+1); coeff[-1] = 1.0
        phi = 0.5*(2*ell+1)*legval(u, coeff)
        out.append(np.dot(wq, phi*kval))
    return np.asarray(out)

def jacobian(hs: np.ndarray, paired: bool = True) -> np.ndarray:
    rows = []
    orients = (1, -1) if paired else (1,)
    eps = 2.0e-6
    for h in hs:
        for orient in orients:
            base = row(float(h), orient, RHO_P, RHO_M)
            # Fractional support coordinates dln(rho+), dln(rho-).
            rp_hi = row(float(h), orient, RHO_P*(1+eps), RHO_M)[0]
            rp_lo = row(float(h), orient, RHO_P*(1-eps), RHO_M)[0]
            rm_hi = row(float(h), orient, RHO_P, RHO_M*(1+eps))[0]
            rm_lo = row(float(h), orient, RHO_P, RHO_M*(1-eps))[0]
            d_rp = (rp_hi-rp_lo)/(2*eps)
            d_rm = (rm_hi-rm_lo)/(2*eps)
            rows.append(np.r_[d_rp, d_rm, base[1:]])
    return np.asarray(rows)

def metrics(hs: np.ndarray, paired: bool = True, support_prior: float | None = 0.01):
    J = jacobian(hs, paired)/SIGMA
    if support_prior is not None:
        P = np.zeros((2, 2+NMODES))
        P[0,0] = P[1,1] = 1.0/support_prior
        A = np.vstack([J,P])
    else:
        A = J
    s = np.linalg.svd(A, compute_uv=False)
    fisher = A.T @ A
    cov = np.linalg.pinv(fisher, rcond=1e-14)
    return {
        "n_observations": int(J.shape[0]),
        "condition": float(s[0]/s[-1]),
        "singular_values": s.tolist(),
        "crlb_std": np.sqrt(np.diag(cov)).tolist(),
        "mode_snr_at_amplitude_0p01": (0.01/np.sqrt(np.diag(cov))[2:]).tolist(),
        "logdet_fisher": float(np.linalg.slogdet(fisher)[1]),
    }

def greedy_d_opt(candidates: np.ndarray, n: int, support_prior: float = 0.01):
    selected = []
    remaining = list(map(float, candidates))
    prior = np.zeros((2,2+NMODES)); prior[0,0]=prior[1,1]=1/support_prior
    F = prior.T@prior + 1e-12*np.eye(2+NMODES)
    for _ in range(n):
        best = None
        for h in remaining:
            Jh = jacobian(np.array([h]), True)/SIGMA
            val = np.linalg.slogdet(F + Jh.T@Jh)[1]
            if best is None or val > best[0]:
                best=(val,h,Jh)
        _,h,Jh=best
        selected.append(h); remaining.remove(h); F += Jh.T@Jh
    return np.array(sorted(selected))

def main():
    scale=max(RHO_P,RHO_M)
    ladders={
        "deep_tail_16": scale*np.geomspace(30,600,16),
        "mixed_log_16": scale*np.geomspace(0.08,30,16),
        "near_contact_16": scale*np.geomspace(0.04,2.5,16),
    }
    ladders["d_opt_16"]=greedy_d_opt(scale*np.geomspace(0.03,100,180),16)
    results={"fixture":{"rho_plus":RHO_P,"rho_minus":RHO_M,"sigma":SIGMA,
                        "modes":"Legendre P1..P6, local amplitudes",
                        "support_prior_fractional_std":0.01},
             "ladders":{}}
    for name,hs in ladders.items():
        results["ladders"][name]={
            "h_over_rho_max":(hs/scale).tolist(),
            "paired":metrics(hs,True,0.01),
            "plus_only":metrics(hs,False,0.01),
            "paired_no_support_prior":metrics(hs,True,None),
        }
    with open("support_aware_mode_conditioning.json","w") as f:
        json.dump(results,f,indent=2)
    fig, ax = plt.subplots(1,2,figsize=(10,4.2))
    names=list(results["ladders"])
    for name in names:
        sv=np.asarray(results["ladders"][name]["paired"]["singular_values"])
        ax[0].semilogy(range(1,len(sv)+1),sv/sv[0],"o-",label=name.replace("_"," "))
    ax[0].set(xlabel="singular direction",ylabel="normalized singular value",
              title="Whitened paired-readout spectrum")
    ax[0].grid(True,which="both",alpha=.25); ax[0].legend(fontsize=8)
    x=np.arange(1,NMODES+1)
    for name in ("deep_tail_16","mixed_log_16","d_opt_16"):
        sd=np.asarray(results["ladders"][name]["paired"]["crlb_std"])[2:]
        ax[1].semilogy(x,sd,"o-",label=name.replace("_"," "))
    ax[1].axhline(.01,color="k",ls="--",lw=1,label="1% mode amplitude")
    ax[1].set(xlabel="Legendre morphology mode",ylabel="CRLB standard deviation",
              title="Local recoverability at sigma=1e-4")
    ax[1].grid(True,which="both",alpha=.25); ax[1].legend(fontsize=8)
    fig.tight_layout()
    fig.savefig("support_aware_mode_conditioning.svg")
    fig.savefig("support_aware_mode_conditioning.png",dpi=180)
    for name,block in results["ladders"].items():
        p=block["paired"]
        print(name, "cond",f'{p["condition"]:.3e}',
              "mode SNR@1%", " ".join(f"{x:.2g}" for x in p["mode_snr_at_amplitude_0p01"]))
        if name=="d_opt_16":
            print("d-opt h/rmax", " ".join(f"{x:.4g}" for x in block["h_over_rho_max"]))

if __name__=="__main__":
    main()
