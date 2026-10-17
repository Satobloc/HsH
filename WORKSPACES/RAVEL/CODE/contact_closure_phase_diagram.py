#!/usr/bin/env python3
"""Map when a compliant contact field is static, one-mode, or distributed.

All notation is LOCAL:RAVEL-CCPD.  The calculation is a synthetic mechanics
fixture, not SAT/H(s)H evidence.  It derives generalized Hessian modes from the
same director/contact energy used in the preceding Ravel checkpoints.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.interpolate import CubicSpline
from scipy.linalg import eigh, solve_banded
from scipy.optimize import minimize


C_DIR = 0.010
K_DIR = 0.050
A_PAD = 40.0
LOAD = 13.5
GRID_N = 121
ELL_VALUES = np.array([0.012, 0.018, 0.025, 0.035, 0.050, 0.075, 0.100])
VISCOSITY_RATIOS = np.unique(np.concatenate((
    np.geomspace(0.2, 1000.0, 41),
    np.linspace(15.0, 40.0, 101),  # resolve the narrow first/second pad-mode crossings
)))
NMODES = 18
CONTACT_THRESHOLD = 0.5
PAIR_TOL = 0.01
STRICT_GAP = 10.0


def contact_spline(window: str, polar_offset: float = 0.10,
                   npsi: int = 2048, nphi: int = 4096):
    phi = np.linspace(-np.pi, np.pi, nphi, endpoint=False)
    psi = np.linspace(0.0, 2*np.pi, npsi+1)
    ff, pp = phi[None, :], psi[:, None]
    compression = np.maximum(
        0.22 + 0.14*np.cos(2*ff) - 0.18*np.cos(2*(ff-pp))
        + polar_offset*np.cos(ff-pp), 0.0)
    weight = np.ones_like(phi) if window == "annulus" else (np.cos(phi) >= 0.0)
    energy = 0.5*np.sum(weight[None, :]*compression**2, axis=1)*(2*np.pi/nphi)
    energy[-1] = energy[0]
    energy -= np.min(energy)
    return CubicSpline(psi, energy, bc_type="periodic")


def target_footprint(s, left=0.38, right=0.62):
    ds = float(s[1]-s[0])
    return np.maximum(0.0, np.minimum(s+ds/2, right)-np.maximum(s-ds/2, left))/ds


def bubble_seed(s, left=0.34, right=0.66, width=0.035):
    return 0.5*np.pi*(np.tanh((s-left)/width)-np.tanh((s-right)/width))


class ContactField:
    def __init__(self, spline: CubicSpline, ell: float, n: int = GRID_N):
        self.spline, self.ell, self.n = spline, ell, n
        self.m = n-2
        self.s = np.linspace(0, 1, n)
        self.ds = float(self.s[1]-self.s[0])
        self.target = target_footprint(self.s)
        self.bpad = A_PAD*ell**2
        d = np.full(self.m, 2*self.bpad/self.ds + A_PAD*self.ds)
        o = np.full(self.m-1, -self.bpad/self.ds)
        self.hhh = np.diag(d)+np.diag(o,1)+np.diag(o,-1)
        self.ab = np.zeros((3,self.m)); self.ab[0,1:]=o; self.ab[1]=d; self.ab[2,:-1]=o

    def full(self, y):
        return np.concatenate(([0.0], y, [0.0]))

    def pad(self, psi):
        ang = np.mod(psi,2*np.pi)
        v = self.spline(ang)-self.spline(0.0)
        rhs = self.ds*(A_PAD*self.target[1:-1]-LOAD*v[1:-1])
        h = np.zeros(self.n)
        h[1:-1] = solve_banded((1,1),self.ab,rhs)
        return h

    def energy_grad(self,y):
        psi = self.full(y); ang=np.mod(psi,2*np.pi); h=self.pad(psi)
        v=self.spline(ang)-self.spline(0.0)
        e=0.5*C_DIR/self.ds*np.sum(np.diff(psi)**2)
        e+=0.5*K_DIR*self.ds*np.sum(np.sin(psi)**2)
        e+=0.5*self.bpad/self.ds*np.sum(np.diff(h)**2)
        e+=0.5*A_PAD*self.ds*np.sum((h-self.target)**2)
        e+=LOAD*self.ds*np.sum(h*v)
        g=C_DIR/self.ds*(2*psi[1:-1]-psi[:-2]-psi[2:])
        g+=self.ds*(0.5*K_DIR*np.sin(2*psi[1:-1])
                    +LOAD*h[1:-1]*self.spline(ang[1:-1],1))
        return float(e),g

    def equilibrium(self, seed):
        res=minimize(lambda y:self.energy_grad(y),seed[1:-1],jac=True,method="L-BFGS-B",
                     options={"ftol":1e-13,"gtol":2e-10,"maxiter":7000,"maxls":100})
        psi=self.full(res.x); h=self.pad(psi); _,g=self.energy_grad(res.x)
        return psi,h,res,float(np.max(np.abs(g)))

    def blocks(self,psi,h):
        ang=np.mod(psi[1:-1],2*np.pi)
        d=2*C_DIR/self.ds+self.ds*(K_DIR*np.cos(2*psi[1:-1])
                                   +LOAD*h[1:-1]*self.spline(ang,2))
        o=np.full(self.m-1,-C_DIR/self.ds)
        hpp=np.diag(d)+np.diag(o,1)+np.diag(o,-1)
        hph=np.diag(self.ds*LOAD*self.spline(ang,1))
        return hpp,hph,self.hhh.copy()


def phase_row(model: ContactField, psi, h, ratio: float):
    hpp,hph,hhh=model.blocks(psi,h)
    schur=hpp-hph@np.linalg.solve(hhh,hph.T)
    eval_s,evec_s=eigh(schur,model.ds*np.eye(model.m),subset_by_index=(0,3))
    phi=evec_s[:,0]
    induced=-np.linalg.solve(hhh,hph.T@phi)
    chi=induced/np.sqrt(model.ds*np.dot(induced,induced))
    a=float(phi@hpp@phi); b=float(chi@hhh@chi); c=float(phi@hph@chi)
    h2=np.array([[a,c],[c,b]])
    m2=np.diag([1.0,ratio])
    ep,up=eigh(h2,m2)
    ppair=[]
    for j in range(2):
        den=up[0,j]**2+ratio*up[1,j]**2
        ppair.append(float(ratio*up[1,j]**2/den))
    pair_contact_index=int(np.argmax(ppair))
    pair_contact_rate=float(ep[pair_contact_index])

    full=np.block([[hpp,hph],[hph.T,hhh]])
    mass=model.ds*np.diag(np.concatenate((np.ones(model.m),ratio*np.ones(model.m))))
    ef,uf=eigh(full,mass,subset_by_index=(0,NMODES-1))
    participation=[]
    for j in range(NMODES):
        pn=model.ds*np.dot(uf[:model.m,j],uf[:model.m,j])
        hn=ratio*model.ds*np.dot(uf[model.m:,j],uf[model.m:,j])
        participation.append(float(hn/(pn+hn)))
    contact=[i for i,p in enumerate(participation) if p>=CONTACT_THRESHOLD]
    cutoff=float(eval_s[2])
    low_contact=[i for i in contact if ef[i]<cutoff]
    if contact:
        nearest=min(contact,key=lambda i:abs(ef[i]-pair_contact_rate))
        err=float(abs(ef[nearest]-pair_contact_rate)/ef[nearest])
    else:
        nearest=None; err=None
    gap=float(ef[contact[1]]/ef[contact[0]]) if len(contact)>=2 else None
    if len(low_contact)==0:
        regime=0  # static/slaved at low frequency
    elif len(low_contact)==1 and err is not None and err<PAIR_TOL:
        regime=1  # candidate single slow contact mode
    else:
        regime=2  # distributed slow contact spectrum
    strict_one_mode=bool(regime==1 and gap is not None and gap>=STRICT_GAP)
    return {
        "ratio":float(ratio),"regime":regime,"cutoff_third_schur_rate":cutoff,
        "contact_modes_below_cutoff":len(low_contact),"contact_indices":contact,
        "full_rates":ef.tolist(),"contact_participation":participation,
        "pair_rates":ep.tolist(),"pair_participation":ppair,
        "pair_contact_rate":pair_contact_rate,"pair_contact_match_error":err,
        "first_two_contact_rate_gap":gap,"strict_one_mode_gate":strict_one_mode,
        "a":a,"b":b,"c":c,"b_over_a":float(b/a)
    }


def main():
    polar=contact_spline("one_sided")
    annulus=contact_spline("annulus")
    seed=bubble_seed(np.linspace(0,1,GRID_N))
    all_rows=[]; equilibria=[]; annulus_null=[]
    for ell in ELL_VALUES:
        model=ContactField(polar,float(ell))
        psi,h,res,grad=model.equilibrium(seed)
        seed=psi
        rows=[phase_row(model,psi,h,float(q)) for q in VISCOSITY_RATIOS]
        all_rows.append(rows)
        equilibria.append({"ell":float(ell),"success":bool(res.success),"gradient_inf":grad,
                           "peak_over_pi":float(np.max(psi)/np.pi),"pad_peak":float(np.max(h))})
        # Compulsory annular linear-coupling null at its symmetric zero-director state.
        am=ContactField(annulus,float(ell)); az=np.zeros(GRID_N); ah=am.pad(az)
        ahpp,ahph,ahhh=am.blocks(az,ah)
        annulus_null.append({
            "ell":float(ell),"max_abs_cross_block":float(np.max(np.abs(ahph))),
            "frobenius_normalized_cross_block":float(np.linalg.norm(ahph)/(np.linalg.norm(ahpp)*np.linalg.norm(ahhh))**0.5)
        })

    regime=np.array([[r["regime"] for r in rows] for rows in all_rows])
    count=np.array([[r["contact_modes_below_cutoff"] for r in rows] for rows in all_rows])
    error=np.array([[np.nan if r["pair_contact_match_error"] is None else r["pair_contact_match_error"] for r in rows] for rows in all_rows])
    strict=np.array([[r["strict_one_mode_gate"] for r in rows] for rows in all_rows])
    transitions=[]
    for i,ell in enumerate(ELL_VALUES):
        one=VISCOSITY_RATIOS[regime[i]==1]
        dist=VISCOSITY_RATIOS[regime[i]==2]
        transitions.append({"ell":float(ell),
                            "candidate_single_ratio_range":None if not len(one) else [float(one.min()),float(one.max())],
                            "distributed_onset_ratio":None if not len(dist) else float(dist.min()),
                            "strict_gate_ever_passes":bool(np.any(strict[i]))})

    # Exact discrete uncoupled pad spectrum and a targeted grid check around
    # the narrow transition.  The spectrum is part of the chosen field law,
    # not a fit to the coupled result.
    pad_spectrum=[]
    ds=1/(GRID_N-1)
    for ell in ELL_VALUES:
        lam=[]
        for j in (1,2,3):
            lam.append(float(A_PAD + 4*A_PAD*ell**2/ds**2*np.sin(j*np.pi/(2*(GRID_N-1)))**2))
        pad_spectrum.append({"ell":float(ell),"first_three_rates_eta1":lam,
                             "second_to_first_ratio":lam[1]/lam[0]})

    refinement=[]
    q_ref=np.arange(19.5,22.51,0.25)
    for nref in (81,121,161):
        for ell in (0.012,0.025):
            rm=ContactField(polar,ell,n=nref)
            rp,rh,rres,rgrad=rm.equilibrium(bubble_seed(rm.s))
            rr=[phase_row(rm,rp,rh,float(q)) for q in q_ref]
            one=q_ref[np.array([x["regime"] for x in rr])==1]
            dist=q_ref[np.array([x["regime"] for x in rr])==2]
            refinement.append({"grid_n":nref,"ell":ell,"gradient_inf":rgrad,
                               "candidate_single_ratio_range":None if not len(one) else [float(one.min()),float(one.max())],
                               "distributed_onset_ratio":None if not len(dist) else float(dist.min()),
                               "strict_gate_ever_passes":bool(any(x["strict_one_mode_gate"] for x in rr))})

    payload={
      "status":"GEN/CANDIDATE synthetic mechanics; not SAT/H(s)H evidence",
      "namespace":"LOCAL:RAVEL-CCPD",
      "classification":"0=static/slaved below third director rate; 1=one contact mode below cutoff and pair error<1%; 2=distributed/failing",
      "strict_gate":"candidate single regime plus >=10 spectral gap to next contact-dominated mode",
      "parameters":{"C_dir":C_DIR,"K_dir":K_DIR,"A_pad":A_PAD,"load":LOAD,"grid_n":GRID_N,
                    "ell_values":ELL_VALUES.tolist(),"viscosity_ratios":VISCOSITY_RATIOS.tolist(),
                    "contact_threshold":CONTACT_THRESHOLD,"pair_tolerance":PAIR_TOL,"strict_gap":STRICT_GAP},
      "equilibria":equilibria,"annulus_linear_null":annulus_null,"transitions":transitions,
      "uncoupled_pad_spectrum":pad_spectrum,"transition_grid_refinement":refinement,
      "architecture_comparison":{
        "second_order_pad":"eta_h h_tau = Bp h_ss - Ap(h-ht) - coupling; r_n=(Ap+Bp(n pi/L)^2)/eta_h",
        "second_order_gap_bound":"r2/r1=(1+4q)/(1+q)<4 for q=Bp pi^2/(Ap L^2); a decade gap is impossible from this operator alone",
        "fourth_order_candidate":"eta_h h_tau = -Dp h_ssss + Bp h_ss - Ap(h-ht) - coupling",
        "pure_fourth_order_decade_condition":"for Bp=0 and L=1, (Ap+16 Dp pi^4)/(Ap+Dp pi^4)>=10 iff Dp pi^4/Ap>=1.5",
        "threshold_Dp_over_Ap":float(1.5/np.pi**4),
        "threshold_fourth_order_length":float((1.5/np.pi**4)**0.25),
        "rates_at_threshold_normalized_by_Ap":[2.5,25.0,122.5],
        "warning":"This is a derived competing architecture, not permission to add bending without a contact-surface constitutive basis."
      },
      "rows":all_rows
    }
    root=Path(__file__).resolve().parent
    (root/"contact_closure_phase_diagram.json").write_text(json.dumps(payload,indent=2)+"\n")

    fig,ax=plt.subplots(2,2,figsize=(11.8,8.2),constrained_layout=True)
    x=np.log10(VISCOSITY_RATIOS)
    im=ax[0,0].imshow(regime,origin="lower",aspect="auto",extent=[x.min(),x.max(),0,len(ELL_VALUES)-1],
                      cmap=plt.matplotlib.colors.ListedColormap(["#d9f0d3","#fdae6b","#de2d26"]),vmin=-.5,vmax=2.5)
    ax[0,0].set_yticks(range(len(ELL_VALUES)),[f"{e:g}" for e in ELL_VALUES])
    ax[0,0].set(title="Closure regime",xlabel=r"$\log_{10}(\eta_h/\eta_\psi)$",ylabel=r"pad length $\ell_p$")
    cb=fig.colorbar(im,ax=ax[0,0],ticks=[0,1,2]); cb.ax.set_yticklabels(["static","one-mode","distributed"])
    im2=ax[0,1].imshow(count,origin="lower",aspect="auto",extent=[x.min(),x.max(),0,len(ELL_VALUES)-1],cmap="viridis")
    ax[0,1].set_yticks(range(len(ELL_VALUES)),[f"{e:g}" for e in ELL_VALUES])
    ax[0,1].set(title="Contact modes below 3rd director rate",xlabel=r"$\log_{10}(\eta_h/\eta_\psi)$",ylabel=r"$\ell_p$")
    fig.colorbar(im2,ax=ax[0,1])
    for i,ell in enumerate(ELL_VALUES):
        ax[1,0].semilogx(VISCOSITY_RATIOS,error[i],lw=1.6,label=f"{ell:g}")
    ax[1,0].axhline(PAIR_TOL,color="k",ls="--",lw=1,label="1% gate")
    ax[1,0].set(title="Nearest contact-branch rate error",xlabel=r"$\eta_h/\eta_\psi$",ylabel="relative error")
    ax[1,0].set_ylim(1e-7,2); ax[1,0].set_yscale("log"); ax[1,0].legend(title=r"$\ell_p$",ncol=2,frameon=False,fontsize=8)
    ax[1,1].semilogx([q for q in VISCOSITY_RATIOS],
                     [r["contact_participation"][0] for r in all_rows[2]],lw=2.2,color="#54278f",label="slowest full mode")
    ax[1,1].semilogx([q for q in VISCOSITY_RATIOS],
                     [max(r["pair_participation"]) for r in all_rows[2]],lw=2.0,color="#d95f0e",label="most contact-like pair mode")
    ax[1,1].axhline(CONTACT_THRESHOLD,color="k",ls="--",lw=1)
    ax[1,1].set(title=r"Mode identity at $\ell_p=0.025$",xlabel=r"$\eta_h/\eta_\psi$",ylabel="contact participation")
    ax[1,1].legend(frameon=False)
    for a in ax.flat:a.grid(alpha=.18)
    fig.suptitle("Compliant-contact closure phase diagram: static, scalar, or distributed",fontsize=14)
    fig.savefig(root/"contact_closure_phase_diagram.svg",format="svg")
    print(json.dumps({"transitions":transitions,"equilibria":equilibria,"annulus_null":annulus_null,
                      "pad_spectrum":pad_spectrum,"transition_grid_refinement":refinement,
                      "regime_counts":{"static":int(np.sum(regime==0)),"single":int(np.sum(regime==1)),"distributed":int(np.sum(regime==2))}},indent=2))


if __name__=="__main__":
    main()
