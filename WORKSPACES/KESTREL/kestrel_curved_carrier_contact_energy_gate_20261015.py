#!/usr/bin/env python3
"""Curved two-carrier finite-core contact-energy gate.

GEN/DERIVED sandbox mathematics, not an H(s)H force law or physical claim.
Extends Kestrel commit 2aea78c3... . Lengths use a reference unit L.

The candidate energy penalizes overlap of equal outer 3-ball envelopes along
matched center-history parameter s. It is deliberately separate from winding
or linking data. If rho is center separation and R the outer radius, the exact
3-ball lens volume is

    V(rho)=pi (4R+rho)(2R-rho)^2/12,  0 <= rho < 2R,
           0,                               rho >= 2R.

For c_A=(k_A s^2/2,0,0,s), c_B=(k_B s^2/2,D,0,s),

    rho(s)^2 = D^2 + q^2 s^4,  q=(k_B-k_A)/2,
    E(D)=lambda integral_{-T}^{T} V(rho(s)) ds.

lambda has units energy/L^4, so E has energy units.
"""

from __future__ import annotations

import math
import numpy as np
from numpy.polynomial.legendre import leggauss


def lens_volume(rho: np.ndarray | float, radius: float) -> np.ndarray:
    """Intersection volume of equal 3-balls, vectorized."""
    x = np.asarray(rho, dtype=float)
    p = np.maximum(2.0 * radius - x, 0.0)
    return math.pi * (4.0 * radius + x) * p * p / 12.0


def contact_half_length(D: float, radius: float, q: float, T: float) -> float:
    """Half-length on which rho(s)<2R; the endpoint contributes zero."""
    if D >= 2.0 * radius:
        return 0.0
    if q == 0.0:
        return T
    root = ((4.0 * radius * radius - D * D) / (q * q)) ** 0.25
    return min(T, root)


def energy_force(D: float, radius: float, kA: float, kB: float, T: float,
                 lam: float = 1.0, order: int = 256) -> tuple[float, float]:
    """Return candidate energy E and repulsive force magnitude -dE/dD."""
    q = 0.5 * (kB - kA)
    h = contact_half_length(D, radius, q, T)
    if h == 0.0:
        return 0.0, 0.0
    z, w = leggauss(order)
    s = h * z
    rho = np.sqrt(D * D + q * q * s**4)
    E = lam * h * float(np.dot(w, lens_volume(rho, radius)))
    # -dV/drho = pi(4R^2-rho^2)/4 inside contact; drho/dD=D/rho.
    integrand = (math.pi / 4.0) * (4.0 * radius**2 - rho**2) * D / rho
    F = lam * h * float(np.dot(w, integrand))
    return E, F


def asymptotic_energy(p: float, radius: float, D: float, q: float,
                      lam: float = 1.0) -> float:
    """Near first contact for q!=0 and contact half-length below T.

    rho = D + alpha s^4 + O(s^8), alpha=q^2/(2D), while
    V = (pi R/2)(2R-rho)^2 + O((2R-rho)^3).
    Integration over |s|<(p/alpha)^(1/4) yields
      E ~ (32 pi R/45) lam alpha^(-1/4) p^(9/4).
    """
    alpha = q * q / (2.0 * D)
    return (32.0 * math.pi * radius / 45.0) * lam * alpha**(-0.25) * p**2.25


def finite_difference_force(D: float, radius: float, kA: float, kB: float,
                            T: float, step: float = 1e-6) -> float:
    ep = energy_force(D + step, radius, kA, kB, T)[0]
    em = energy_force(D - step, radius, kA, kB, T)[0]
    return -(ep - em) / (2.0 * step)


def main() -> None:
    R, T = 1.2, 1.0
    kA, kB = 0.05, -0.06
    q = 0.5 * (kB - kA)
    Dcrit = 2.0 * R

    print(f"R={R:.12f} T={T:.12f} kA={kA:.12f} kB={kB:.12f}")
    print(f"q={q:.12f} Dcrit={Dcrit:.12f}")
    for D in (2.30, 2.40, 2.55):
        E, F = energy_force(D, R, kA, kB, T)
        print(f"D={D:.2f} gap={max(D-Dcrit,0):.12f} "
              f"E/lambda={E:.12f} F/lambda={F:.12f}")
    assert energy_force(2.40, R, kA, kB, T) == (0.0, 0.0)
    assert energy_force(2.55, R, kA, kB, T) == (0.0, 0.0)

    # Independent derivative check well inside contact.
    E23, F23 = energy_force(2.30, R, kA, kB, T)
    Ffd = finite_difference_force(2.30, R, kA, kB, T)
    rel = abs(F23 - Ffd) / F23
    print(f"force finite-difference={Ffd:.12f} relative_error={rel:.3e}")
    assert rel < 2e-9

    # Curvature localizes incipient contact and changes E~p^2 to E~p^(9/4).
    ps = np.array([3e-6, 1e-5, 3e-5, 1e-4])
    energies = np.array([energy_force(Dcrit-p, R, kA, kB, T)[0] for p in ps])
    approximations = np.array([
        asymptotic_energy(p, R, Dcrit-p, q) for p in ps
    ])
    slopes = np.diff(np.log(energies)) / np.diff(np.log(ps))
    print("near-contact p,E,E_asym,E/E_asym")
    for p, E, Ea in zip(ps, energies, approximations):
        print(f"{p:.1e} {E:.12e} {Ea:.12e} {E/Ea:.9f}")
    print("local log-slopes:", " ".join(f"{x:.9f}" for x in slopes))
    assert max(abs(slopes - 2.25)) < 0.002
    assert max(abs(energies / approximations - 1.0)) < 2e-4

    # Negative control: parallel carriers (q=0) have exact full-length energy
    # 2T*V(D), hence the ordinary quadratic onset exponent 2.
    par = np.array([energy_force(Dcrit-p, R, 0.0, 0.0, T)[0] for p in ps])
    par_slopes = np.diff(np.log(par)) / np.diff(np.log(ps))
    print("parallel local log-slopes:", " ".join(f"{x:.9f}" for x in par_slopes))
    assert max(abs(par_slopes - 2.0)) < 2e-5

    # Uniform similarity x->scale*x preserves Dcrit/R=2. With lambda fixed,
    # lens volume contributes scale^3 and ds contributes scale, so E->scale^4 E.
    scale = 3.7
    Es, Fs = energy_force(2.30*scale, R*scale, kA/scale, kB/scale,
                          T*scale)
    print(f"similarity E_ratio={Es/E23:.12f} expected={scale**4:.12f} "
          f"F_ratio={Fs/F23:.12f} expected={scale**3:.12f}")
    assert abs(Es/E23 - scale**4) < 2e-10
    assert abs(Fs/F23 - scale**3) < 2e-10
    print("PASS")


if __name__ == "__main__":
    main()
