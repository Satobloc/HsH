#!/usr/bin/env python3
"""Endpoint-matched SO(4) transport-order discriminator for a finite core.

GEN/CANDIDATE.  All symbols are LOCAL to this solver.  The calculation tests
kinematics only; it does not derive a matter-to-normal torque law.
"""

from __future__ import annotations

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.linalg import expm
from scipy.special import betainc


OUT = Path(__file__).with_suffix("")


def plane_generator(i: int, j: int) -> np.ndarray:
    """Unit antisymmetric generator taking e_i toward e_j."""
    g = np.zeros((4, 4))
    g[i, j] = -1.0
    g[j, i] = 1.0
    return g


def minimal_rotation(u: np.ndarray, v: np.ndarray) -> np.ndarray:
    """Orientation-preserving minimal rotation mapping unit u exactly to v."""
    dot = float(np.clip(u @ v, -1.0, 1.0))
    theta = float(np.arccos(dot))
    if theta < 1e-14:
        return np.eye(4)
    s = float(np.sin(theta))
    k = (np.outer(v, u) - np.outer(u, v)) / s
    return np.eye(4) + np.sin(theta) * k + (1.0 - np.cos(theta)) * (k @ k)


def centered_overlap(half_width: float, support: np.ndarray, nu_edge: float) -> np.ndarray:
    """Centered compact-profile overlap for p(z) proportional to (1-z^2/a^2)^nu."""
    x = np.clip(half_width / support, 0.0, 1.0)
    return betainc(0.5, nu_edge + 1.0, x * x)


def support_along(frame: np.ndarray, radii: np.ndarray, q: np.ndarray) -> np.ndarray:
    covariance = frame @ np.diag(radii * radii) @ frame.T
    return np.sqrt(np.einsum("ni,ij,nj->n", q, covariance, q))


def residual_angle(relative: np.ndarray) -> float:
    """SO(3) stabilizer angle when relative fixes the first frame axis."""
    cosine = np.clip((np.trace(relative) - 2.0) / 2.0, -1.0, 1.0)
    return float(np.arccos(cosine))


def normalized_rows(x: np.ndarray) -> np.ndarray:
    return x / np.linalg.norm(x, axis=1, keepdims=True)


def main() -> None:
    # A and B rotate the time-normal axis into two different transverse axes.
    # Their commutator is a transverse-plane rotation that fixes that axis.
    gen_a = plane_generator(0, 1)
    gen_b = plane_generator(0, 2)
    commutator = gen_a @ gen_b - gen_b @ gen_a

    # Fixed laboratory resolving directions: shared across both ordered histories.
    raw_q = np.array(
        [
            [1.00, 0.42, 0.11, 0.08],
            [0.91, -0.37, 0.28, 0.04],
            [0.78, 0.18, -0.49, 0.31],
            [0.69, 0.51, 0.33, -0.21],
            [0.58, -0.19, 0.61, 0.29],
            [0.47, 0.55, -0.22, 0.48],
            [0.36, -0.44, -0.51, 0.53],
            [0.25, 0.63, 0.46, -0.44],
        ]
    )
    q_bank = normalized_rows(raw_q)

    slab_half_width = 0.022
    nu_edge = 0.65
    anisotropic_radii = np.array([0.060, 0.082, 0.047, 0.069])
    isotropic_radii = np.array([0.060, 0.066, 0.066, 0.066])
    eps_grid = np.geomspace(0.006, 0.32, 32)

    records = []
    for eps in eps_grid:
        # Column frames; leftmost matrix acts last on a vector.
        frame_ab = expm(eps * gen_b) @ expm(eps * gen_a)
        frame_ba_raw = expm(eps * gen_a) @ expm(eps * gen_b)

        normal_ab = frame_ab[:, 0]
        normal_ba_raw = frame_ba_raw[:, 0]
        closing = minimal_rotation(normal_ba_raw, normal_ab)
        frame_ba = closing @ frame_ba_raw
        normal_ba = frame_ba[:, 0]

        relative = frame_ab.T @ frame_ba
        hol_angle = residual_angle(relative)

        a_ab = support_along(frame_ab, anisotropic_radii, q_bank)
        a_ba = support_along(frame_ba, anisotropic_radii, q_bank)
        s_ab = centered_overlap(slab_half_width, a_ab, nu_edge)
        s_ba = centered_overlap(slab_half_width, a_ba, nu_edge)

        ai_ab = support_along(frame_ab, isotropic_radii, q_bank)
        ai_ba = support_along(frame_ba, isotropic_radii, q_bank)
        si_ab = centered_overlap(slab_half_width, ai_ab, nu_edge)
        si_ba = centered_overlap(slab_half_width, ai_ba, nu_edge)

        # A one-normal state can only ask about the common endpoint normal.
        q_normal = normal_ab[None, :]
        n_ab = centered_overlap(
            slab_half_width,
            support_along(frame_ab, anisotropic_radii, q_normal),
            nu_edge,
        )[0]
        n_ba = centered_overlap(
            slab_half_width,
            support_along(frame_ba, anisotropic_radii, q_normal),
            nu_edge,
        )[0]

        records.append(
            {
                "epsilon": float(eps),
                "preclosure_normal_separation": float(np.linalg.norm(normal_ab - normal_ba_raw)),
                "postclosure_normal_separation": float(np.linalg.norm(normal_ab - normal_ba)),
                "stabilizer_holonomy_angle": hol_angle,
                "anisotropic_channel_rms": float(np.sqrt(np.mean((s_ab - s_ba) ** 2))),
                "anisotropic_channel_max": float(np.max(np.abs(s_ab - s_ba))),
                "isotropic_channel_rms": float(np.sqrt(np.mean((si_ab - si_ba) ** 2))),
                "single_normal_difference": float(abs(n_ab - n_ba)),
                "signed_channel_difference": (s_ab - s_ba).tolist(),
            }
        )

    eps = np.array([x["epsilon"] for x in records])
    hol = np.array([x["stabilizer_holonomy_angle"] for x in records])
    anis = np.array([x["anisotropic_channel_rms"] for x in records])
    iso = np.array([x["isotropic_channel_rms"] for x in records])
    normal_only = np.array([x["single_normal_difference"] for x in records])
    postclose = np.array([x["postclosure_normal_separation"] for x in records])

    fit = eps <= 0.09
    slope_h, intercept_h = np.polyfit(np.log(eps[fit]), np.log(hol[fit]), 1)
    slope_s, intercept_s = np.polyfit(np.log(eps[fit]), np.log(anis[fit]), 1)
    comm_norm = float(np.linalg.norm(commutator, ord="fro"))

    probe_index = int(np.argmin(abs(eps - 0.12)))
    probe_eps = eps[probe_index]
    probe_ab = expm(probe_eps * gen_b) @ expm(probe_eps * gen_a)
    probe_ba_0 = expm(probe_eps * gen_a) @ expm(probe_eps * gen_b)
    probe_ba = minimal_rotation(probe_ba_0[:, 0], probe_ab[:, 0]) @ probe_ba_0
    probe_relative = probe_ab.T @ probe_ba
    inferred_generator = (probe_relative - probe_relative.T) / (2.0 * probe_eps**2)
    commutator_alignment = float(
        np.sum(inferred_generator * commutator)
        / (np.linalg.norm(inferred_generator) * np.linalg.norm(commutator))
    )

    result = {
        "status": "GEN/CANDIDATE",
        "symbol_namespace": "LOCAL:so4_commutator_finite_core",
        "assumptions": {
            "generators": "J01 and J02",
            "commutator_frobenius_norm": comm_norm,
            "slab_half_width": slab_half_width,
            "profile_edge_parameter_nu_perp": nu_edge,
            "anisotropic_material_radii": anisotropic_radii.tolist(),
            "isotropic_control_radii": isotropic_radii.tolist(),
            "readout_channels": len(q_bank),
        },
        "scaling": {
            "small_epsilon_max": 0.09,
            "stabilizer_holonomy_power": float(slope_h),
            "stabilizer_holonomy_coefficient": float(np.exp(intercept_h)),
            "anisotropic_signal_power": float(slope_s),
            "anisotropic_signal_coefficient": float(np.exp(intercept_s)),
        },
        "controls": {
            "max_postclosure_normal_separation": float(postclose.max()),
            "max_isotropic_channel_rms": float(iso.max()),
            "max_single_normal_difference": float(normal_only.max()),
            "probe_epsilon": float(probe_eps),
            "residual_generator_commutator_alignment": commutator_alignment,
        },
        "representative": records[probe_index],
        "series": records,
    }

    Path(f"{OUT}.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")

    fig, ax = plt.subplots(1, 2, figsize=(12.6, 4.7), constrained_layout=True)
    ax[0].loglog(eps, hol, "o-", label="residual transverse-frame angle")
    ax[0].loglog(eps, np.exp(intercept_h) * eps**slope_h, "--", label=fr"fit $\propto\epsilon^{{{slope_h:.3f}}}$")
    ax[0].set(xlabel=r"pulse amplitude $\epsilon$", ylabel="endpoint-matched residual (rad)", title="Ordered transport leaves stabilizer holonomy")
    ax[0].legend()
    ax[0].grid(alpha=0.25, which="both")

    floor = 1e-18
    ax[1].loglog(eps, anis, "o-", label="anisotropic finite core")
    ax[1].loglog(eps, np.maximum(iso, floor), "s--", label="transversely isotropic control")
    ax[1].loglog(eps, np.maximum(normal_only, floor), "^:", label="single-normal endpoint readout")
    ax[1].loglog(eps, np.exp(intercept_s) * eps**slope_s, "--", color="black", alpha=0.7, label=fr"fit $\propto\epsilon^{{{slope_s:.3f}}}$")
    ax[1].set(xlabel=r"pulse amplitude $\epsilon$", ylabel="RMS overlap difference", title="History is visible only with transverse structure")
    ax[1].legend()
    ax[1].grid(alpha=0.25, which="both")

    fig.savefig(f"{OUT}.svg")
    fig.savefig(f"{OUT}.png", dpi=180)
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
