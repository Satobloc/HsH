#!/usr/bin/env python3
"""Damped SO(4) frame-memory toy model for the Ravel sandbox.

Two instantaneous torsional kicks act in noncommuting 0-1 and 0-2 planes.
Between kicks, an overdamped elastic frame relaxes geodesically toward its
reference orientation.  The exact relaxation map is

    F(t) = exp(exp(-t/tau_r) Log(F(0))).

AB and BA outputs are endpoint-normal matched before comparing the surviving
transverse frame holonomy and an anisotropic finite-core support readout.
"""

import json
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
from scipy.linalg import expm, logm


HERE = Path(__file__).resolve().parent


def generator(i: int, j: int) -> np.ndarray:
    g = np.zeros((4, 4))
    g[i, j] = -1.0
    g[j, i] = 1.0
    return g


J01 = generator(0, 1)
J02 = generator(0, 2)
E0 = np.array([1.0, 0.0, 0.0, 0.0])


def relax(F: np.ndarray, mu: float) -> np.ndarray:
    """Exact geodesic elastic relaxation for mu = Delta/tau_r."""
    L = np.real_if_close(logm(F)).real
    L = 0.5 * (L - L.T)
    return expm(np.exp(-mu) * L)


def minimal_rotation(a: np.ndarray, b: np.ndarray) -> np.ndarray:
    """Shortest SO(n) rotation taking unit a to unit b."""
    a = a / np.linalg.norm(a)
    b = b / np.linalg.norm(b)
    c = float(np.clip(a @ b, -1.0, 1.0))
    if c > 1.0 - 1e-14:
        return np.eye(len(a))
    v = b - c * a
    s = np.linalg.norm(v)
    u = v / s
    K = np.outer(u, a) - np.outer(a, u)
    return np.eye(len(a)) + s * K + (1.0 - c) * (K @ K)


def fibonacci_s3(n: int = 2048) -> np.ndarray:
    """Deterministic quasi-uniform directions on S^3."""
    k = np.arange(n) + 0.5
    z = 1.0 - 2.0 * k / n
    phi = 2.0 * np.pi * k / ((1.0 + np.sqrt(5.0)) / 2.0)
    psi = 2.0 * np.pi * k / np.sqrt(2.0)
    r1 = np.sqrt((1.0 + z) / 2.0)
    r2 = np.sqrt((1.0 - z) / 2.0)
    return np.column_stack((r1 * np.cos(phi), r1 * np.sin(phi),
                            r2 * np.cos(psi), r2 * np.sin(psi)))


DIRS = fibonacci_s3()
D_ANISO = np.diag(np.square([1.00, 0.79, 0.61, 0.47]))
D_ISO = np.eye(4)


def support(F: np.ndarray, D: np.ndarray) -> np.ndarray:
    C = F @ D @ F.T
    return np.sqrt(np.einsum("ni,ij,nj->n", DIRS, C, DIRS))


def frames(eps: float, mu: float) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
    A = expm(eps * J01)
    B = expm(eps * J02)
    # First kick relaxes for Delta before the second kick arrives.
    F_ab = B @ relax(A, mu)
    F_ba = A @ relax(B, mu)
    n_ab = F_ab @ E0
    n_ba = F_ba @ E0
    C = minimal_rotation(n_ba, n_ab)
    F_ba_c = C @ F_ba
    R = F_ba_c @ F_ab.T
    L = np.real_if_close(logm(R)).real
    L = 0.5 * (L - L.T)
    angle = np.linalg.norm(L, ord="fro") / np.sqrt(2.0)
    return F_ab, F_ba_c, R


def trial(eps: float, mu: float, D: np.ndarray = D_ANISO) -> dict:
    F_ab, F_ba_c, R = frames(eps, mu)
    n_ab = F_ab @ E0
    n_ba_c = F_ba_c @ E0
    L = np.real_if_close(logm(R)).real
    L = 0.5 * (L - L.T)
    angle = np.linalg.norm(L, ord="fro") / np.sqrt(2.0)
    F_ab_0, F_ba_0, R0 = frames(eps, 40.0)
    M = R @ R0.T
    LM = np.real_if_close(logm(M)).real
    LM = 0.5 * (LM - LM.T)
    memory_angle = np.linalg.norm(LM, ord="fro") / np.sqrt(2.0)
    h_ab = support(F_ab, D)
    h_ba = support(F_ba_c, D)
    h_ab_0 = support(F_ab_0, D)
    h_ba_0 = support(F_ba_0, D)
    contrast = (h_ab - h_ba) - (h_ab_0 - h_ba_0)
    rms = float(np.sqrt(np.mean((h_ab - h_ba) ** 2)))
    return {
        "normal_mismatch_after": float(np.linalg.norm(n_ab - n_ba_c)),
        "residual_angle": float(angle),
        "memory_excess_angle": float(memory_angle),
        "support_rms": float(np.sqrt(np.mean(contrast ** 2))),
        "support_max": float(np.max(np.abs(contrast))),
    }


def fit_power(x: np.ndarray, y: np.ndarray) -> tuple[float, float]:
    p, q = np.polyfit(np.log(x), np.log(y), 1)
    return float(np.exp(q)), float(p)


def main() -> None:
    eps_grid = np.geomspace(0.012, 0.22, 14)
    mu_grid = np.linspace(0.0, 5.0, 26)
    eps0 = 0.12

    rows = []
    for mu in mu_grid:
        a = trial(eps0, mu)
        iso = trial(eps0, mu, D_ISO)
        rows.append({"mu": float(mu), "retention": float(np.exp(-mu)),
                     **a, "isotropic_support_rms": iso["support_rms"]})

    # Small-epsilon exponent at each of three retention values.
    scalings = {}
    for mu in [0.0, 1.0, 3.0]:
        ang = np.array([trial(e, mu)["memory_excess_angle"] for e in eps_grid])
        sig = np.array([trial(e, mu)["support_rms"] for e in eps_grid])
        ca, pa = fit_power(eps_grid, ang)
        cs, ps = fit_power(eps_grid, sig)
        scalings[str(mu)] = {"angle_prefactor": ca, "angle_power": pa,
                             "signal_prefactor": cs, "signal_power": ps}

    # Fit memory dependence away from numerical floor.
    mus = np.array([r["mu"] for r in rows])
    angles = np.array([r["memory_excess_angle"] for r in rows])
    signals = np.array([r["support_rms"] for r in rows])
    mask = (mus >= 0.4) & (mus <= 4.0)
    slope_a, intercept_a = np.polyfit(mus[mask], np.log(angles[mask]), 1)
    slope_s, intercept_s = np.polyfit(mus[mask], np.log(signals[mask]), 1)

    out = {
        "model": "instantaneous noncommuting kicks with exact overdamped geodesic relaxation",
        "equation": "dF/dt = -(1/tau_r) Log(F) F between kicks",
        "eps_reference": eps0,
        "rows": rows,
        "epsilon_scalings": scalings,
        "memory_fit_mu_0p4_to_4": {
            "angle_prefactor": float(np.exp(intercept_a)),
            "angle_decay_exponent": float(-slope_a),
            "signal_prefactor": float(np.exp(intercept_s)),
            "signal_decay_exponent": float(-slope_s),
        },
        "representative": {
            "mu_0": trial(eps0, 0.0),
            "mu_1": trial(eps0, 1.0),
            "mu_3": trial(eps0, 3.0),
            "mu_5": trial(eps0, 5.0),
        },
    }
    (HERE / "damped_so4_frame_memory.json").write_text(json.dumps(out, indent=2) + "\n")

    fig, ax = plt.subplots(1, 2, figsize=(10.2, 4.1))
    ax[0].semilogy(mus, angles, "o-", label="transverse holonomy")
    ax[0].semilogy(mus, signals, "s-", label="anisotropic support RMS")
    ax[0].set_xlabel(r"memory separation $\mu=\Delta/\tau_r$")
    ax[0].set_ylabel("endpoint-matched residue")
    ax[0].grid(alpha=0.25)
    ax[0].legend(frameon=False)

    for mu in [0.0, 1.0, 3.0]:
        yy = np.array([trial(e, mu)["memory_excess_angle"] for e in eps_grid])
        ax[1].loglog(eps_grid, yy, "o-", label=fr"$\mu={mu:g}$")
    ax[1].set_xlabel(r"kick angle $\varepsilon$")
    ax[1].set_ylabel("transverse holonomy angle")
    ax[1].grid(alpha=0.25, which="both")
    ax[1].legend(frameon=False)
    fig.suptitle("Damped SO(4) order memory after endpoint matching")
    fig.tight_layout()
    fig.savefig(HERE / "damped_so4_frame_memory.svg")
    fig.savefig(HERE / "damped_so4_frame_memory.png", dpi=170)
    print(json.dumps(out["memory_fit_mu_0p4_to_4"], indent=2))
    print(json.dumps(out["epsilon_scalings"], indent=2))
    print(json.dumps(out["representative"], indent=2))


if __name__ == "__main__":
    main()
