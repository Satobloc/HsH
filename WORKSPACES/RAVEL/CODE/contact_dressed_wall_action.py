#!/usr/bin/env python3
"""Contact-dressed two-wall reduction versus the full director field.

This imports the exact contact potential and field functional from the preceding
checkpoint.  The reduction is a five-coordinate Ritz family, not an inserted
wall tension.  Synthetic outputs are mechanism checks, not H(s)H evidence.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.optimize import minimize

from contact_derived_director_memory import (
    DirectorProblem,
    bubble_seed,
    contact_table,
    contact_window,
)


ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "DATA" / "contact_dressed_wall_action.json"
FIG = ROOT / "FIGURES" / "contact_dressed_wall_action.svg"

C_TWIST = 0.010
K_BULK = 0.050
SCALES = np.linspace(16.0, 8.0, 65)
EDGES = [0.012, 0.018, 0.030, 0.050]


def crossing(rows):
    for a, b in zip(rows[:-1], rows[1:]):
        ya, yb = a["excess"], b["excess"]
        if ya == 0.0:
            return float(a["scale"])
        if ya * yb < 0.0:
            return float(a["scale"] + (b["scale"] - a["scale"]) * (-ya) / (yb - ya))
    return None


def full_branch(spline, edge, n=201):
    s = np.linspace(0.0, 1.0, n)
    seed = bubble_seed(s)
    rows = []
    profiles = {}
    for scale in SCALES:
        problem = DirectorProblem(n, spline, float(scale), C_TWIST, K_BULK)
        problem.g = contact_window(problem.s, edge=edge)
        domain = problem.solve(seed)
        zero = problem.solve(np.zeros(n))
        seed = domain["profile"]
        rows.append({
            "scale": float(scale),
            "excess": float(domain["energy"] - zero["energy"]),
            "peak_over_pi": domain["peak_over_pi"],
            "hessian_min": domain["hessian_min"],
        })
        profiles[float(scale)] = domain["profile"]
    return s, rows, profiles


class RitzWalls:
    """Boundary-exact kink/antikink family with movable widths and amplitude."""

    def __init__(self, spline, edge, n=3001):
        self.spline = spline
        self.s = np.linspace(0.0, 1.0, n)
        self.ds = self.s[1] - self.s[0]
        self.g = contact_window(self.s, edge=edge)
        self.weights = np.ones(n)
        self.weights[[0, -1]] = 0.5

    def profile(self, z):
        x_l, x_r, log_w_l, log_w_r, amp = z
        w_l, w_r = np.exp(log_w_l), np.exp(log_w_r)
        left = (
            np.tanh((self.s - x_l) / w_l) - np.tanh(-x_l / w_l)
        ) / (
            np.tanh((1.0 - x_l) / w_l) - np.tanh(-x_l / w_l)
        )
        right = (
            np.tanh((x_r - self.s) / w_r) - np.tanh((x_r - 1.0) / w_r)
        ) / (
            np.tanh(x_r / w_r) - np.tanh((x_r - 1.0) / w_r)
        )
        base = left * right
        return np.pi * amp * base / np.max(base)

    def components(self, z, scale):
        psi = self.profile(z)
        gradient = 0.5 * C_TWIST / self.ds * np.sum(np.diff(psi) ** 2)
        bulk = self.ds * np.sum(self.weights * 0.5 * K_BULK * np.sin(psi) ** 2)
        contact = self.ds * np.sum(
            self.weights * scale * self.g * self.spline(np.mod(psi, 2.0 * np.pi))
        )
        return float(gradient), float(bulk), float(contact)

    def energy(self, z, scale):
        return float(sum(self.components(z, scale)))

    def zero_energy(self, scale):
        return float(
            self.ds * np.sum(self.weights * scale * self.g * self.spline(0.0))
        )

    def branch(self):
        z = np.array([0.40, 0.60, np.log(0.40), np.log(0.40), 0.98])
        rows = []
        profiles = {}
        for scale in SCALES:
            result = minimize(
                lambda q: self.energy(q, float(scale)),
                z,
                method="L-BFGS-B",
                bounds=[
                    (0.05, 0.49),
                    (0.51, 0.95),
                    (np.log(0.02), np.log(0.60)),
                    (np.log(0.02), np.log(0.60)),
                    (0.75, 1.10),
                ],
                options={"ftol": 1e-12, "gtol": 1e-8, "maxiter": 1200},
            )
            z = result.x
            grad, bulk, contact = self.components(z, float(scale))
            rows.append({
                "scale": float(scale),
                "excess": float(result.fun - self.zero_energy(float(scale))),
                "gradient": grad,
                "bulk": bulk,
                "contact": contact,
                "peak_over_pi": float(np.max(self.profile(z)) / np.pi),
                "coordinates": [float(v) for v in z],
                "success": bool(result.success),
            })
            profiles[float(scale)] = self.profile(z)
        return rows, profiles


def nearest_scale(value):
    return float(SCALES[np.argmin(np.abs(SCALES - value))])


def main():
    psi, u_annulus, spl_annulus = contact_table("annulus", polar_offset=0.10)
    _, u_polar, spl_polar = contact_table("one_sided", polar_offset=0.10)

    s_quad = np.linspace(0.0, 1.0, 10001)
    effective_width = float(np.trapezoid(contact_window(s_quad), s_quad))
    delta_u = float(spl_polar(0.0) - spl_polar(np.pi))
    bare_pair = float(4.0 * np.sqrt(C_TWIST * K_BULK))
    naive_crossing = float(bare_pair / (effective_width * delta_u))

    comparisons = []
    default_art = None
    for edge in EDGES:
        full_s, full_rows, full_profiles = full_branch(spl_polar, edge)
        ritz = RitzWalls(spl_polar, edge)
        ritz_rows, ritz_profiles = ritz.branch()
        c_full, c_ritz = crossing(full_rows), crossing(ritz_rows)
        error_pct = 100.0 * (c_ritz - c_full) / c_full
        comparisons.append({
            "contact_edge_width": edge,
            "full_crossing": c_full,
            "ritz_crossing": c_ritz,
            "relative_error_percent": float(error_pct),
            "naive_wall_only_crossing": naive_crossing,
        })
        if edge == 0.018:
            q = nearest_scale(c_full)
            full_profile = full_profiles[q]
            ritz_profile = np.interp(full_s, ritz.s, ritz_profiles[q])
            profile_rms = float(np.sqrt(np.mean((full_profile - ritz_profile) ** 2)) / np.pi)
            default_art = {
                "full_s": full_s,
                "full_rows": full_rows,
                "ritz_s": ritz.s,
                "ritz_rows": ritz_rows,
                "scale": q,
                "full_profile": full_profile,
                "ritz_profile_on_full_grid": ritz_profile,
                "profile_rms_over_pi": profile_rms,
            }

    # Annular compulsory null at the default edge width.
    _, ann_full_rows, _ = full_branch(spl_annulus, 0.018)
    ann_ritz = RitzWalls(spl_annulus, 0.018)
    ann_ritz_rows, _ = ann_ritz.branch()

    payload = {
        "status": "GEN/CANDIDATE; contact-dressed Ritz reduction, not H(s)H evidence",
        "energy": "integral [C/2 psi_s^2 + K_A/2 sin^2 psi + Lambda g(s) U_contact(psi)] ds",
        "ritz_family": "boundary-exact normalized product of left/right tanh walls; five collective coordinates",
        "parameters": {
            "C_twist": C_TWIST,
            "K_bulk": K_BULK,
            "scales": [float(v) for v in SCALES],
            "contact_edge_widths": EDGES,
        },
        "naive_wall_only": {
            "bare_wall_pair_cost": bare_pair,
            "effective_contact_width": effective_width,
            "U0_minus_Upi": delta_u,
            "crossing": naive_crossing,
        },
        "edge_width_comparison": comparisons,
        "annulus_null": {
            "full_crossing": crossing(ann_full_rows),
            "ritz_crossing": crossing(ann_ritz_rows),
            "minimum_full_excess": float(min(r["excess"] for r in ann_full_rows)),
            "minimum_ritz_excess": float(min(r["excess"] for r in ann_ritz_rows)),
        },
        "default_edge_0p018": {
            "comparison_scale": default_art["scale"],
            "profile_rms_over_pi": default_art["profile_rms_over_pi"],
            "full_branch": default_art["full_rows"],
            "ritz_branch": default_art["ritz_rows"],
        },
    }
    DATA.parent.mkdir(parents=True, exist_ok=True)
    FIG.parent.mkdir(parents=True, exist_ok=True)
    DATA.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")

    fig, axes = plt.subplots(2, 2, figsize=(11.4, 8.0), constrained_layout=True)
    axes[0, 0].plot(psi / np.pi, u_annulus, lw=2.0, color="#2c7fb8", label="annulus")
    axes[0, 0].plot(psi / np.pi, u_polar, lw=2.0, color="#d95f0e", label="one-sided polar")
    axes[0, 0].set(title="Computed contact potentials", xlabel=r"$\psi/\pi$", ylabel=r"$U_c-U_{c,min}$")
    axes[0, 0].legend(frameon=False)

    frows, rrows = default_art["full_rows"], default_art["ritz_rows"]
    axes[0, 1].plot([r["scale"] for r in frows], [r["excess"] for r in frows], "o-", ms=3, lw=1.7, label="full field", color="#54278f")
    axes[0, 1].plot([r["scale"] for r in rrows], [r["excess"] for r in rrows], "s--", ms=3, lw=1.5, label="contact-dressed Ritz", color="#d95f0e")
    axes[0, 1].axhline(0.0, color="k", lw=1.0)
    axes[0, 1].axvline(naive_crossing, color="0.4", ls=":", label="bare-wall estimate")
    axes[0, 1].set(title="Domain selection, edge width 0.018", xlabel=r"contact scale $\Lambda$", ylabel=r"$E_{domain}-E_0$")
    axes[0, 1].legend(frameon=False)

    edge = np.array([r["contact_edge_width"] for r in comparisons])
    full_c = np.array([r["full_crossing"] for r in comparisons])
    ritz_c = np.array([r["ritz_crossing"] for r in comparisons])
    axes[1, 0].plot(edge, full_c, "o-", lw=2.0, color="#54278f", label="full field")
    axes[1, 0].plot(edge, ritz_c, "s--", lw=1.7, color="#d95f0e", label="contact-dressed Ritz")
    axes[1, 0].axhline(naive_crossing, color="0.4", ls=":", label="bare-wall estimate")
    axes[1, 0].set(title="Crossing versus contact-edge width", xlabel="edge width", ylabel=r"crossing $\Lambda_*$")
    axes[1, 0].legend(frameon=False)

    axes[1, 1].plot(default_art["full_s"], default_art["full_profile"] / np.pi, lw=2.1, color="#54278f", label="full field")
    axes[1, 1].plot(default_art["full_s"], default_art["ritz_profile_on_full_grid"] / np.pi, "--", lw=1.8, color="#d95f0e", label="Ritz profile")
    axes[1, 1].plot(default_art["full_s"], contact_window(default_art["full_s"]), ":", lw=1.4, color="0.25", label="contact window")
    axes[1, 1].set(title=rf"Profiles near crossing, $\Lambda={default_art['scale']:.3f}$", xlabel="normalized arclength s", ylabel=r"$\psi/\pi$")
    axes[1, 1].legend(frameon=False)
    for ax in axes.flat:
        ax.grid(alpha=0.22)
    fig.suptitle("Contact-dressed wall action: reduced prediction versus full field", fontsize=14)
    fig.savefig(FIG, format="svg")

    print(json.dumps({
        "naive_crossing": naive_crossing,
        "comparisons": comparisons,
        "annulus_null": payload["annulus_null"],
        "profile_rms_over_pi": default_art["profile_rms_over_pi"],
    }, indent=2))


if __name__ == "__main__":
    main()
