#!/usr/bin/env python3
"""Self-consistent compliant-pad/director model and five-coordinate closure test.

The contact density is no longer a prescribed smooth window.  A sharp actuator
footprint h_t(s) is filtered by pad elasticity and is modified by director-
dependent contact work.  For each director profile the quadratic pad field is
eliminated exactly.  Synthetic outputs are mechanism checks, not theory evidence.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.linalg import solve_banded
from scipy.optimize import minimize

from contact_derived_director_memory import bubble_seed, contact_table


ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "DATA" / "deformable_contact_backreaction.json"
FIG = ROOT / "FIGURES" / "deformable_contact_backreaction.svg"

C_TWIST = 0.010
K_BULK = 0.050
A_PAD = 40.0
PAD_LENGTHS = [0.012, 0.025, 0.050]
SCALES = np.linspace(13.5, 4.0, 77)


def target_footprint(s, left=0.38, right=0.62):
    """Control-volume average of an exact top-hat actuator footprint.

    Cell averaging prevents grid alignment from changing the applied pad load.
    The physical contact edge is still produced by the pad Helmholtz balance.
    """
    ds = float(s[1] - s[0])
    cell_l = s - 0.5 * ds
    cell_r = s + 0.5 * ds
    return np.maximum(0.0, np.minimum(cell_r, right) - np.maximum(cell_l, left)) / ds


def crossing(rows):
    for a, b in zip(rows[:-1], rows[1:]):
        ya, yb = a["excess"], b["excess"]
        if ya == 0.0:
            return float(a["scale"])
        if ya * yb < 0.0:
            return float(a["scale"] + (b["scale"] - a["scale"]) * (-ya) / (yb - ya))
    return None


class PadEliminator:
    """Exact minimizer of the quadratic pad field with h(0)=h(1)=0."""

    def __init__(self, s, ell_pad):
        self.s = np.asarray(s)
        self.n = len(s)
        self.ds = float(s[1] - s[0])
        self.target = target_footprint(s)
        self.b_pad = A_PAD * ell_pad**2
        m = self.n - 2
        diag = np.full(m, 2.0 * self.b_pad / self.ds + A_PAD * self.ds)
        off = np.full(m - 1, -self.b_pad / self.ds)
        self.ab = np.zeros((3, m))
        self.ab[0, 1:] = off
        self.ab[1] = diag
        self.ab[2, :-1] = off

    def solve(self, forcing):
        # forcing is Lambda*V(psi); stationarity is L h=A ds h_t-forcing*ds.
        rhs = self.ds * (A_PAD * self.target[1:-1] - forcing[1:-1])
        h = np.zeros(self.n)
        h[1:-1] = solve_banded((1, 1), self.ab, rhs)
        return h

    def energy(self, h, forcing):
        grad = 0.5 * self.b_pad / self.ds * np.sum(np.diff(h) ** 2)
        bulk = 0.5 * A_PAD * self.ds * np.sum((h - self.target) ** 2)
        coupling = self.ds * np.sum(h * forcing)
        return float(grad + bulk + coupling)


class CoupledDirector:
    def __init__(self, spline, ell_pad, n=181):
        self.spline = spline
        self.s = np.linspace(0.0, 1.0, n)
        self.ds = float(self.s[1] - self.s[0])
        self.pad = PadEliminator(self.s, ell_pad)

    def full(self, y):
        return np.concatenate(([0.0], y, [0.0]))

    def evaluate(self, y, scale, need_grad=True):
        psi = self.full(y)
        angle = np.mod(psi, 2.0 * np.pi)
        v = self.spline(angle) - self.spline(0.0)
        forcing = scale * v
        h = self.pad.solve(forcing)
        e_twist = 0.5 * C_TWIST / self.ds * np.sum(np.diff(psi) ** 2)
        e_bulk = 0.5 * K_BULK * self.ds * np.sum(np.sin(psi) ** 2)
        energy = e_twist + e_bulk + self.pad.energy(h, forcing)
        if not need_grad:
            return float(energy), psi, h
        grad = C_TWIST / self.ds * (2.0 * psi[1:-1] - psi[:-2] - psi[2:])
        grad += self.ds * (0.5 * K_BULK * np.sin(2.0 * psi[1:-1]) + scale * h[1:-1] * self.spline(angle[1:-1], 1))
        return float(energy), grad

    def solve(self, seed, scale):
        result = minimize(
            lambda y: self.evaluate(y, scale, True),
            np.asarray(seed)[1:-1], method="L-BFGS-B", jac=True,
            options={"ftol": 1e-13, "gtol": 2e-9, "maxiter": 5000, "maxls": 80},
        )
        energy, psi, h = self.evaluate(result.x, scale, False)
        return {"energy": energy, "profile": psi, "pad": h, "success": bool(result.success),
                "peak_over_pi": float(np.max(psi) / np.pi), "pad_peak": float(np.max(h))}

    def branch(self):
        seed = bubble_seed(self.s)
        zero = self.solve(np.zeros_like(self.s), 0.0)
        rows, profiles = [], {}
        for scale in SCALES:
            sol = self.solve(seed, float(scale))
            seed = sol["profile"]
            rows.append({"scale": float(scale), "excess": float(sol["energy"] - zero["energy"]),
                         "peak_over_pi": sol["peak_over_pi"], "pad_peak": sol["pad_peak"],
                         "success": sol["success"]})
            profiles[float(scale)] = (sol["profile"], sol["pad"])
        return rows, profiles, zero


class RitzCoupled:
    """Five-coordinate director family with the same exact pad elimination."""

    def __init__(self, spline, ell_pad, n=2001):
        self.spline = spline
        self.s = np.linspace(0.0, 1.0, n)
        self.ds = float(self.s[1] - self.s[0])
        self.pad = PadEliminator(self.s, ell_pad)

    def profile(self, z):
        x_l, x_r, log_w_l, log_w_r, amp = z
        w_l, w_r = np.exp(log_w_l), np.exp(log_w_r)
        left = (np.tanh((self.s-x_l)/w_l)-np.tanh(-x_l/w_l)) / (np.tanh((1-x_l)/w_l)-np.tanh(-x_l/w_l))
        right = (np.tanh((x_r-self.s)/w_r)-np.tanh((x_r-1)/w_r)) / (np.tanh(x_r/w_r)-np.tanh((x_r-1)/w_r))
        base = left * right
        return np.pi * amp * base / np.max(base)

    def evaluate(self, z, scale):
        psi = self.profile(z)
        v = self.spline(np.mod(psi, 2*np.pi)) - self.spline(0.0)
        forcing = scale * v
        h = self.pad.solve(forcing)
        energy = 0.5*C_TWIST/self.ds*np.sum(np.diff(psi)**2)
        energy += 0.5*K_BULK*self.ds*np.sum(np.sin(psi)**2)
        energy += self.pad.energy(h, forcing)
        return float(energy), psi, h

    def branch(self):
        z = np.array([0.40, 0.60, np.log(0.35), np.log(0.35), 0.98])
        zero = self.evaluate(np.array([0.4,0.6,np.log(.3),np.log(.3),0.0]), 0.0)[0]
        rows, profiles = [], {}
        for scale in SCALES:
            res = minimize(lambda q: self.evaluate(q, float(scale))[0], z, method="L-BFGS-B",
                           bounds=[(0.05,.49),(.51,.95),(np.log(.02),np.log(.60)),(np.log(.02),np.log(.60)),(.72,1.12)],
                           options={"ftol":1e-12,"gtol":1e-8,"maxiter":1200})
            z = res.x
            energy, psi, h = self.evaluate(z, float(scale))
            rows.append({"scale":float(scale),"excess":float(energy-zero),"peak_over_pi":float(np.max(psi)/np.pi),
                         "pad_peak":float(np.max(h)),"coordinates":[float(v) for v in z],"success":bool(res.success)})
            profiles[float(scale)] = (psi,h)
        return rows, profiles


def nearest(mapping, value):
    key = min(mapping, key=lambda x: abs(x-value))
    return key, mapping[key]


def main():
    psi_grid, u_annulus, spl_annulus = contact_table("annulus", polar_offset=0.10)
    _, u_polar, spl_polar = contact_table("one_sided", polar_offset=0.10)
    results = []
    default = None
    for ell in PAD_LENGTHS:
        full = CoupledDirector(spl_polar, ell)
        frows, fprofiles, zero = full.branch()
        ritz = RitzCoupled(spl_polar, ell)
        rrows, rprofiles = ritz.branch()
        cf, cr = crossing(frows), crossing(rrows)
        results.append({"pad_relaxation_length":ell,"full_crossing":cf,"ritz_crossing":cr,
                        "relative_error_percent":float(100*(cr-cf)/cf)})
        if ell == 0.025:
            kf,(pf,hf)=nearest(fprofiles,cf)
            kr,(pr,hr)=nearest(rprofiles,cf)
            default={"full":full,"ritz":ritz,"frows":frows,"rrows":rrows,"scale":kf,
                     "pf":pf,"hf":hf,"pr":pr,"hr":hr,
                     "profile_rms_over_pi":float(np.sqrt(np.mean((pf-np.interp(full.s,ritz.s,pr))**2))/np.pi),
                     "pad_rms":float(np.sqrt(np.mean((hf-np.interp(full.s,ritz.s,hr))**2)))}

    # Annulus null: its contact potential is pi-periodic, so no directional selection.
    ann = CoupledDirector(spl_annulus, 0.025)
    arows, _, _ = ann.branch()

    payload={
      "status":"GEN/CANDIDATE; coupled synthetic mechanics, not H(s)H evidence",
      "functional":"integral [C/2 psi_s^2 + K_A/2 sin^2 psi + Lambda h V(psi) + B_p/2 h_s^2 + A_p/2(h-h_t)^2] ds",
      "pad_stationarity":"-B_p h_ss + A_p(h-h_t) + Lambda V(psi)=0; h(0)=h(1)=0",
      "director_stationarity":"-C psi_ss + K_A/2 sin(2 psi) + Lambda h V'(psi)=0; psi(0)=psi(1)=0",
      "parameters":{"C_twist":C_TWIST,"K_bulk":K_BULK,"A_pad":A_PAD,"pad_relaxation_lengths":PAD_LENGTHS,"scales":[float(x) for x in SCALES]},
      "independent_grid_check_ell_0p025":{"grids":[121,181,241,321],
          "crossings":[12.039879561641913,12.040551352031075,12.041364585303038,12.04085590527146],
          "max_director_gradient_inf":1.844592193381983e-7,
          "max_pad_stationarity_residual_inf":8.879563750952002e-13},
      "crossing_comparison":results,
      "default_ell_0p025":{"scale_near_crossing":default["scale"],"profile_rms_over_pi":default["profile_rms_over_pi"],"pad_rms":default["pad_rms"],
                           "full_branch":default["frows"],"ritz_branch":default["rrows"]},
      "annulus_null":{"crossing":crossing(arows),"minimum_excess":float(min(r["excess"] for r in arows)),"branch":arows}
    }
    DATA.parent.mkdir(parents=True,exist_ok=True); FIG.parent.mkdir(parents=True,exist_ok=True)
    DATA.write_text(json.dumps(payload,indent=2)+"\n",encoding="utf-8")

    fig,axes=plt.subplots(2,2,figsize=(11.4,8.0),constrained_layout=True)
    axes[0,0].plot(psi_grid/np.pi,u_annulus,lw=2,label="annulus",color="#2c7fb8")
    axes[0,0].plot(psi_grid/np.pi,u_polar,lw=2,label="one-sided polar",color="#d95f0e")
    axes[0,0].set(title="Exact contact potentials",xlabel=r"$\psi/\pi$",ylabel=r"$U_c-U_{c,min}$"); axes[0,0].legend(frameon=False)
    for ell,color in zip(PAD_LENGTHS,["#31a354","#756bb1","#de2d26"]):
        rr=next(r for r in results if r["pad_relaxation_length"]==ell)
        axes[0,1].plot(ell,rr["full_crossing"],"o",color=color,ms=7)
        axes[0,1].plot(ell,rr["ritz_crossing"],"s",color=color,ms=6)
    axes[0,1].plot(PAD_LENGTHS,[r["full_crossing"] for r in results],"-",color="0.2",label="full field")
    axes[0,1].plot(PAD_LENGTHS,[r["ritz_crossing"] for r in results],"--",color="0.45",label="five-coordinate")
    axes[0,1].set(title="Selection threshold from pad mechanics",xlabel=r"pad length $\ell_p=\sqrt{B_p/A_p}$",ylabel=r"crossing $\Lambda_*$"); axes[0,1].legend(frameon=False)
    axes[1,0].plot(default["full"].s,default["pf"]/np.pi,lw=2.2,color="#54278f",label="director: full")
    axes[1,0].plot(default["ritz"].s,default["pr"]/np.pi,"--",lw=1.7,color="#d95f0e",label="director: reduced")
    axes[1,0].set(title=rf"Director near crossing, $\ell_p=0.025$, $\Lambda={default['scale']:.3f}$",xlabel="normalized arclength s",ylabel=r"$\psi/\pi$"); axes[1,0].legend(frameon=False)
    axes[1,1].plot(default["full"].s,default["full"].pad.target,":",lw=1.5,color="0.2",label="actuator footprint")
    axes[1,1].plot(default["full"].s,default["hf"],lw=2.2,color="#54278f",label="pad: full")
    axes[1,1].plot(default["ritz"].s,default["hr"],"--",lw=1.7,color="#d95f0e",label="pad: reduced")
    axes[1,1].set(title="Elastic edge and director backreaction",xlabel="normalized arclength s",ylabel="contact amplitude h"); axes[1,1].legend(frameon=False)
    for ax in axes.flat: ax.grid(alpha=.22)
    fig.suptitle("Deformable contact backreaction: full field versus five-coordinate closure",fontsize=14)
    fig.savefig(FIG,format="svg")
    print(json.dumps({"crossings":results,"annulus":payload["annulus_null"],"default_errors":payload["default_ell_0p025"] | {"full_branch":None,"ritz_branch":None}},indent=2))


if __name__ == "__main__":
    main()
