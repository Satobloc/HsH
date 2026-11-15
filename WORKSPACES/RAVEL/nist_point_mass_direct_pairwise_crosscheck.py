#!/usr/bin/env python3
"""Independent standard-library cross-check of the NIST BIPM point-mass model.

Source inputs: Schlamminger et al., Metrologia 63 (2026) 025012, Table 2 and
Section 6.1, Eqs. (23)-(27), plus Table 6 uncertainty for eta.
This computes a dimensionless Newtonian point-mass model factor, not a new
measurement and not the full finite-cylinder model.
"""
from __future__ import annotations

import math

# Published mean copper source/test geometry, converted from mm to m.
R_T_M = 120.0315e-3
R_S_M = 213.9642e-3
M_T_KG = 1.150156
M_S_APPARENT_KG = 11.19168
U_ETA_REL = 2.6e-6
ETA = R_T_M / R_S_M


def gamma_pairwise(phi: float, eta: float = ETA) -> float:
    """Eq. (26)-normalized torque from all 4 x 4 Newtonian point pairs."""
    total = 0.0
    for i in range(4):
        for j in range(4):
            theta = phi + (j - i) * math.pi / 2.0
            d = 1.0 + eta * eta - 2.0 * eta * math.cos(theta)
            total += eta * math.sin(theta) / (d ** 1.5)
    return total / 8.0


def gamma_pairwise_derivative(phi: float, eta: float = ETA) -> float:
    """Analytic derivative d Gamma / d phi for the direct pair sum."""
    total = 0.0
    for i in range(4):
        for j in range(4):
            theta = phi + (j - i) * math.pi / 2.0
            c = math.cos(theta)
            s = math.sin(theta)
            d = 1.0 + eta * eta - 2.0 * eta * c
            total += c / (d ** 1.5) - 3.0 * eta * s * s / (d ** 2.5)
    return eta * total / 8.0


def legendre(n: int, x: float) -> float:
    """Standard Legendre P_n by the three-term recurrence."""
    if n == 0:
        return 1.0
    if n == 1:
        return x
    p0, p1 = 1.0, x
    for k in range(1, n):
        p2 = ((2.0 * k + 1.0) * x * p1 - k * p0) / (k + 1.0)
        p0, p1 = p1, p2
    return p1


def legendre_derivative(n: int, x: float) -> float:
    if n == 0:
        return 0.0
    return n * (x * legendre(n, x) - legendre(n - 1, x)) / (x * x - 1.0)


def associated_p1(n: int, x: float) -> float:
    """Condon-Shortley P_n^1(x) = -sqrt(1-x^2) P'_n(x)."""
    return -math.sqrt(max(0.0, 1.0 - x * x)) * legendre_derivative(n, x)


def gamma_full_even_legendre(phi: float, eta: float = ETA,
                             max_k: int = 80) -> float:
    """Derivative of all even-degree terms in Eq. (25), degree 2k, k>=1."""
    total = 0.0
    c, s = math.cos(phi), math.sin(phi)
    for k in range(1, max_k + 1):
        n = 2 * k
        total += eta ** n * (associated_p1(n, c) - associated_p1(n, s))
    return -total


def gamma_eq27_restricted(phi: float, eta: float = ETA,
                          max_l: int = 40) -> float:
    """The printed Eq. (27) degree-4l restriction, evaluated as written."""
    total = 0.0
    c, s = math.cos(phi), math.sin(phi)
    for ell in range(1, max_l + 1):
        n = 4 * ell
        total += eta ** n * (associated_p1(n, c) - associated_p1(n, s))
    return -total


def bisect_root(f, lo: float, hi: float, tol: float = 1e-15) -> float:
    flo, fhi = f(lo), f(hi)
    if flo == 0.0:
        return lo
    if fhi == 0.0:
        return hi
    if flo * fhi > 0.0:
        raise ValueError("root is not bracketed")
    while hi - lo > tol:
        mid = (lo + hi) / 2.0
        fm = f(mid)
        if flo * fm > 0.0:
            lo, flo = mid, fm
        else:
            hi, fhi = mid, fm
    return (lo + hi) / 2.0


def golden_max(f, lo: float = 0.0, hi: float = math.pi / 4.0,
               tol: float = 1e-14) -> tuple[float, float]:
    """Golden-section maximum over one symmetry-reduced quarter period."""
    gr = (math.sqrt(5.0) - 1.0) / 2.0
    c = hi - gr * (hi - lo)
    d = lo + gr * (hi - lo)
    fc, fd = f(c), f(d)
    while hi - lo > tol:
        if fc < fd:
            lo, c, fc = c, d, fd
            d = lo + gr * (hi - lo)
            fd = f(d)
        else:
            hi, d, fd = d, c, fc
            c = hi - gr * (hi - lo)
            fc = f(c)
    x = (lo + hi) / 2.0
    return x, f(x)


def main() -> None:
    # The derivative has one sign change in [0, pi/4] for these measured inputs.
    phi_max = bisect_root(gamma_pairwise_derivative, 0.0, math.pi / 8.0)
    gamma_max = gamma_pairwise(phi_max)
    gamma_full_series = gamma_full_even_legendre(phi_max)
    phi_eq27, gamma_eq27_max = golden_max(gamma_eq27_restricted)
    gamma_eq27_at_full_angle = gamma_eq27_restricted(phi_max)
    omitted = gamma_max - gamma_eq27_at_full_angle
    p6_contribution = (63.0 / 32.0) * ETA**6 * math.sin(4.0 * phi_max)

    print(f"R_T_m={R_T_M:.10f}")
    print(f"R_S_m={R_S_M:.10f}")
    print(f"m_T_kg={M_T_KG:.6f}  m_S_apparent_kg={M_S_APPARENT_KG:.5f}")
    print(f"eta={ETA:.15f}")
    print(f"phi_max_pairwise_deg={math.degrees(phi_max):.12f}")
    print(f"Gamma_max_pairwise={gamma_max:.15f}")
    print(f"dGamma_dphi_at_max={gamma_pairwise_derivative(phi_max):.6e}")
    print(f"Gamma_full_even_legendre_at_pairwise_max={gamma_full_series:.15f}")
    print(f"phi_max_printed_Eq27_deg={math.degrees(phi_eq27):.12f}")
    print(f"Gamma_max_printed_Eq27={gamma_eq27_max:.15f}")
    print(f"Gamma_printed_Eq27_at_pairwise_max={gamma_eq27_at_full_angle:.15f}")
    print(f"omitted_4k_plus_2_terms_at_pairwise_max={omitted:.15f}")
    print(f"degree_6_contribution_at_pairwise_max={p6_contribution:.15f}")
    print(f"omitted_fraction_of_full={omitted/gamma_max:.9%}")

    # Published comparators are source-reported model outputs, not measurements.
    published_eq27_analytic = 0.457946
    published_table10_point_mass = 0.457999
    finite_masses_no_disk = 0.485099
    print(f"vs_eq27_analytic_pct={(gamma_max/published_eq27_analytic-1.0)*100.0:.9f}")
    print(f"vs_table10_point_mass_pct={(gamma_max/published_table10_point_mass-1.0)*100.0:.9f}")
    print(f"vs_table10_actual_masses_no_disk_pct={(gamma_max/finite_masses_no_disk-1.0)*100.0:.9f}")

    # Central finite-difference sensitivity of the optimized factor to eta.
    rel_step = 1e-6
    def max_at_eta(eta_value: float) -> float:
        phi = bisect_root(lambda p: gamma_pairwise_derivative(p, eta_value),
                          0.0, math.pi / 8.0)
        return gamma_pairwise(phi, eta_value)
    gp = max_at_eta(ETA * (1.0 + rel_step))
    gm = max_at_eta(ETA * (1.0 - rel_step))
    c_eta = (math.log(gp)-math.log(gm)) / (
        math.log(ETA*(1.0+rel_step))-math.log(ETA*(1.0-rel_step))
    )
    u_gamma_rel = c_eta * U_ETA_REL
    print(f"c_eta={c_eta:.9f}")
    print(f"u_Gamma_over_Gamma_eta_only_ppm={u_gamma_rel*1e6:.6f}")
    print(f"u_Gamma_eta_only={gamma_max*u_gamma_rel:.12e}")


if __name__ == "__main__":
    main()
