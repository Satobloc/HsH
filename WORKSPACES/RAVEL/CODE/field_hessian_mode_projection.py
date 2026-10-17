#!/usr/bin/env python3
"""Project the compliant-contact field Hessian onto its induced two-mode pair.

This is a synthetic mechanics check for the Ravel sandbox.  It derives the
two-coordinate coefficients from the discretized director/pad functional;
none of a, b, or c is selected by hand.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.interpolate import CubicSpline
from scipy.linalg import eigh, solve_banded
from scipy.optimize import minimize


C_TWIST = 0.010
K_BULK = 0.050
A_PAD = 40.0
ELL_PAD = 0.025
SCALE = 12.0
GRIDS = (101, 141, 181, 241)
VISCOSITY_RATIOS = (1.0, 5.0, 20.0, 100.0)


def contact_table(window: str, polar_offset: float = 0.10,
                  npsi: int = 2048, nphi: int = 4096):
    phi = np.linspace(-np.pi, np.pi, nphi, endpoint=False)
    psi = np.linspace(0.0, 2.0 * np.pi, npsi + 1)
    dphi = 2.0 * np.pi / nphi
    ff, pp = phi[None, :], psi[:, None]
    compression = np.maximum(
        0.22 + 0.14 * np.cos(2.0 * ff) - 0.18 * np.cos(2.0 * (ff - pp))
        + polar_offset * np.cos(ff - pp), 0.0)
    weight = np.ones_like(phi) if window == "annulus" else (np.cos(phi) >= 0.0)
    energy = 0.5 * np.sum(weight[None, :] * compression**2, axis=1) * dphi
    energy[-1] = energy[0]
    energy -= np.min(energy)
    return CubicSpline(psi, energy, bc_type="periodic")


def target_footprint(s, left=0.38, right=0.62):
    ds = float(s[1] - s[0])
    cell_l, cell_r = s - 0.5 * ds, s + 0.5 * ds
    return np.maximum(0.0, np.minimum(cell_r, right) - np.maximum(cell_l, left)) / ds


def bubble_seed(s, left=0.34, right=0.66, width=0.035):
    return 0.5 * np.pi * (np.tanh((s-left)/width) - np.tanh((s-right)/width))


class Model:
    def __init__(self, n: int, spline: CubicSpline):
        self.n = n
        self.m = n - 2
        self.s = np.linspace(0.0, 1.0, n)
        self.ds = float(self.s[1] - self.s[0])
        self.spline = spline
        self.target = target_footprint(self.s)
        self.b_pad = A_PAD * ELL_PAD**2
        diag = np.full(self.m, 2.0*self.b_pad/self.ds + A_PAD*self.ds)
        off = np.full(self.m-1, -self.b_pad/self.ds)
        self.hhh = np.diag(diag) + np.diag(off, 1) + np.diag(off, -1)
        self.ab = np.zeros((3, self.m))
        self.ab[0, 1:] = off
        self.ab[1] = diag
        self.ab[2, :-1] = off

    def full(self, y):
        return np.concatenate(([0.0], y, [0.0]))

    def pad(self, psi):
        angle = np.mod(psi, 2*np.pi)
        v = self.spline(angle) - self.spline(0.0)
        rhs = self.ds * (A_PAD*self.target[1:-1] - SCALE*v[1:-1])
        h = np.zeros(self.n)
        h[1:-1] = solve_banded((1, 1), self.ab, rhs)
        return h

    def energy_grad(self, y):
        psi = self.full(y)
        angle = np.mod(psi, 2*np.pi)
        v = self.spline(angle) - self.spline(0.0)
        h = self.pad(psi)
        e = 0.5*C_TWIST/self.ds*np.sum(np.diff(psi)**2)
        e += 0.5*K_BULK*self.ds*np.sum(np.sin(psi)**2)
        e += 0.5*self.b_pad/self.ds*np.sum(np.diff(h)**2)
        e += 0.5*A_PAD*self.ds*np.sum((h-self.target)**2)
        e += SCALE*self.ds*np.sum(h*v)
        g = C_TWIST/self.ds*(2*psi[1:-1]-psi[:-2]-psi[2:])
        g += self.ds*(0.5*K_BULK*np.sin(2*psi[1:-1])
                      + SCALE*h[1:-1]*self.spline(angle[1:-1], 1))
        return float(e), g

    def equilibrium(self):
        seed = bubble_seed(self.s)[1:-1]
        res = minimize(lambda y: self.energy_grad(y), seed, jac=True,
                       method="L-BFGS-B",
                       options={"ftol": 1e-13, "gtol": 2e-10,
                                "maxiter": 7000, "maxls": 100})
        psi = self.full(res.x)
        h = self.pad(psi)
        _, grad = self.energy_grad(res.x)
        return psi, h, res, float(np.max(np.abs(grad)))

    def hessian_blocks(self, psi, h):
        angle = np.mod(psi[1:-1], 2*np.pi)
        diag = 2*C_TWIST/self.ds + self.ds*(
            K_BULK*np.cos(2*psi[1:-1])
            + SCALE*h[1:-1]*self.spline(angle, 2))
        off = np.full(self.m-1, -C_TWIST/self.ds)
        hpp = np.diag(diag) + np.diag(off, 1) + np.diag(off, -1)
        hph = np.diag(self.ds*SCALE*self.spline(angle, 1))
        return hpp, hph, self.hhh.copy()


def analyze(n: int, spline: CubicSpline):
    model = Model(n, spline)
    psi, h, opt, grad_inf = model.equilibrium()
    hpp, hph, hhh = model.hessian_blocks(psi, h)
    # Continuum L2 rates: generalized Hessian H u = lambda (ds I) u.
    schur = hpp - hph @ np.linalg.solve(hhh, hph.T)
    eval_s, evec_s = eigh(schur, model.ds*np.eye(model.m), subset_by_index=(0, 3))
    phi = evec_s[:, 0]
    # eigh normalizes phi^T(ds I)phi=1.  The induced pad shape is then normalized
    # in the same L2 metric so its scalar coefficient is independently legible.
    induced = -np.linalg.solve(hhh, hph.T @ phi)
    induced_norm = np.sqrt(model.ds*np.dot(induced, induced))
    chi = induced/induced_norm
    a = float(phi @ hpp @ phi)
    b = float(chi @ hhh @ chi)
    c = float(phi @ hph @ chi)
    h2 = np.array([[a, c], [c, b]])
    eval_2 = np.linalg.eigvalsh(h2)
    full = np.block([[hpp, hph], [hph.T, hhh]])
    eval_f, evec_f = eigh(full, model.ds*np.eye(2*model.m), subset_by_index=(0, 5))
    # L2 overlap of the normalized two-mode soft vector with the full soft mode.
    q2 = np.linalg.eigh(h2)[1][:, 0]
    approx = np.concatenate((q2[0]*phi, q2[1]*chi))
    approx /= np.sqrt(model.ds*np.dot(approx, approx))
    overlap = abs(model.ds*np.dot(approx, evec_f[:, 0]))
    viscosity_sweep = []
    for ratio in VISCOSITY_RATIOS:
        pair_rates = eigh(h2, np.diag([1.0, ratio]), eigvals_only=True)
        mass = model.ds*np.diag(np.concatenate((np.ones(model.m), ratio*np.ones(model.m))))
        coupled_rates = eigh(full, mass, subset_by_index=(0, 3), eigvals_only=True)
        viscosity_sweep.append({
            "eta_h_over_eta_psi": ratio,
            "two_mode_rates": pair_rates.tolist(),
            "full_four_slowest_rates": coupled_rates.tolist(),
        })
    return {
        "n": n, "ds": model.ds, "success": bool(opt.success),
        "gradient_inf": grad_inf, "psi_peak_over_pi": float(np.max(psi)/np.pi),
        "pad_peak": float(np.max(h)), "a": a, "b": b, "c": c,
        "coupling_ratio_c2_over_ab": float(c*c/(a*b)),
        "two_mode_rates": eval_2.tolist(),
        "full_rates": eval_f.tolist(),
        "schur_rates": eval_s.tolist(),
        "slow_rate_relative_error": float((eval_2[0]-eval_f[0])/eval_f[0]),
        "soft_mode_overlap": float(overlap),
        "bare_contact_to_director_rate_ratio_b_over_a": float(b/a),
        "viscosity_sweep": viscosity_sweep,
        "s": model.s.tolist(), "psi": psi.tolist(), "h": h.tolist(),
        "phi": np.concatenate(([0.0], phi, [0.0])).tolist(),
        "chi": np.concatenate(([0.0], chi, [0.0])).tolist(),
    }


def main():
    spline = contact_table("one_sided")
    rows = [analyze(n, spline) for n in GRIDS]
    source_k = 2*np.pi/10
    source_omega = 2.0
    source_v = 1.0
    string_repair = {
        "source_k": source_k, "source_omega": source_omega,
        "resolver_speed": source_v,
        "resolver_frequency_abs_omega_minus_kv": abs(source_omega-source_k*source_v),
        "resolver_period": 2*np.pi/abs(source_omega-source_k*source_v),
        "tension_only_T_over_mu_needed": (source_omega/source_k)**2,
        "bending_only_B_over_mu_needed": source_omega**2/source_k**4,
        "mixed_constraint": "T/mu + (B/mu) k^2 = (omega/k)^2; one sample cannot identify both",
    }
    compact_rows = [{k: v for k, v in r.items() if k not in {"s","psi","h","phi","chi"}} for r in rows]
    payload = {
        "status": "GEN/CANDIDATE synthetic mechanics; not SAT/H(s)H evidence",
        "functional": "integral [C/2 psi_s^2 + K/2 sin^2 psi + Lambda h V(psi) + Bp/2 h_s^2 + Ap/2(h-ht)^2] ds",
        "parameters": {"C": C_TWIST, "K": K_BULK, "Ap": A_PAD,
                       "ell_p": ELL_PAD, "Bp": A_PAD*ELL_PAD**2,
                       "Lambda": SCALE, "grids": list(GRIDS),
                       "eta_h_over_eta_psi_sweep": list(VISCOSITY_RATIOS)},
        "projection": "phi is the softest eigenmode of Hpp-Hph Hhh^-1 Hhp; chi is its normalized induced pad response",
        "grid_results": compact_rows,
        "source_sketch_repair": string_repair,
        "default_fields": rows[-2],
    }
    root = Path(__file__).resolve().parent
    (root/"field_hessian_mode_projection.json").write_text(json.dumps(payload, indent=2)+"\n")

    r = rows[-2]
    s = np.array(r["s"])
    fig, ax = plt.subplots(2, 2, figsize=(11.4, 7.8), constrained_layout=True)
    ax[0,0].plot(s, np.array(r["psi"])/np.pi, lw=2.2, color="#54278f")
    ax[0,0].set(title="Retained director equilibrium", xlabel="intrinsic coordinate s", ylabel=r"$\psi/\pi$")
    ax[0,1].plot(s, r["h"], lw=2.2, color="#238b45")
    ax[0,1].set(title="Self-consistent contact amplitude", xlabel="intrinsic coordinate s", ylabel="h")
    ax[1,0].plot(s, r["phi"], lw=2.1, label="director soft mode", color="#d95f0e")
    ax[1,0].plot(s, r["chi"], lw=2.1, label="induced pad mode", color="#2c7fb8")
    ax[1,0].set(title="Hessian-derived minimal pair", xlabel="intrinsic coordinate s", ylabel="L2-normalized mode")
    ax[1,0].legend(frameon=False)
    ratios = np.array([x["eta_h_over_eta_psi"] for x in r["viscosity_sweep"]])
    full_sweep = np.array([x["full_four_slowest_rates"] for x in r["viscosity_sweep"]])
    pair_sweep = np.array([x["two_mode_rates"] for x in r["viscosity_sweep"]])
    for j in range(4):
        ax[1,1].semilogx(ratios, full_sweep[:,j], "o-", lw=1.3, ms=4,
                         color=plt.cm.Purples(.45+.12*j), label="full field" if j == 0 else None)
    for j in range(2):
        ax[1,1].semilogx(ratios, pair_sweep[:,j], "s--", lw=2, ms=5,
                         color=("#d95f0e", "#31a354")[j], label=f"pair mode {j+1}")
    ax[1,1].axvline(r["bare_contact_to_director_rate_ratio_b_over_a"], color="0.25", ls=":", lw=1.3,
                    label=r"$b/a$")
    ax[1,1].set(title="Slow-contact failure of one-pad-mode closure", xlabel=r"viscosity ratio $\eta_h/\eta_\psi$", ylabel="relaxation rate")
    ax[1,1].legend(frameon=False)
    for a0 in ax.flat: a0.grid(alpha=.22)
    fig.suptitle("Compliant-contact field Hessian: full spectrum and induced two-mode closure", fontsize=14)
    fig.savefig(root/"field_hessian_mode_projection.svg", format="svg")
    print(json.dumps({"grid_results": compact_rows, "source_sketch_repair": string_repair}, indent=2))


if __name__ == "__main__":
    main()
