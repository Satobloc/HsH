#!/usr/bin/env python3
"""
Reproduce the NIST torsion-balance eight-point-mass comparator from the
published nominal geometry, and compare the literal derivative of Eq. (25)
with the restricted Eq. (27) series.

Source:
  S. Schlamminger et al., Metrologia 63 (2026) 025012
  DOI: 10.1088/1681-7575/ae570f
  Final NIST PDF: https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075
  Table 2, Table 6, Eqs. (23), (25), (27), Section 6.1, Table 10.

This is a source-bound model calculation using published nominal radii.
It is not a fit to raw torque data, an independent measurement, or an H(s)H
prediction. It does not resolve any unstated source convention.
"""
import json
import mpmath as mp

mp.mp.dps = 50

RT_MM = mp.mpf("120.0315")
RS_MM = mp.mpf("213.9642")
ETA = RT_MM / RS_MM
U_ETA_REL = mp.mpf("2.6e-6")  # Table 6, relative standard uncertainty
SECTION_61_GAMMA = mp.mpf("0.457946")
TABLE_10_POINT_GAMMA = mp.mpf("0.457999")
TABLE_10_FULL_NO_DISK_GAMMA = mp.mpf("0.485099")


def gamma_pair(delta, eta=ETA):
    """Dimensionless torque from all 16 source/test point-mass pairs."""
    total = mp.mpf("0")
    for j in range(4):
        for k in range(4):
            theta = delta + (k - j) * mp.pi / 2
            denominator = 1 + eta**2 - 2 * eta * mp.cos(theta)
            total += mp.sin(theta) / denominator**mp.mpf("1.5")
    return eta * total / 8


def associated_p1(degree, x):
    """Condon-Shortley P_degree^1(x)."""
    return -mp.sqrt(1 - x*x) * mp.diff(lambda z: mp.legendre(degree, z), x)


def gamma_eq25_literal(delta, eta=ETA, terms=40):
    """Literal derivative of Eq. (25), retaining every 2*ell degree."""
    return mp.fsum(
        eta**(2 * ell) *
        (associated_p1(2 * ell, mp.cos(delta)) -
         associated_p1(2 * ell, mp.sin(delta)))
        for ell in range(1, terms + 1)
    )


def gamma_eq27_restricted(delta, eta=ETA, terms=40):
    """Eq. (27) as printed: only degrees 4*ell."""
    return mp.fsum(
        eta**(4 * ell) *
        (associated_p1(4 * ell, mp.cos(delta)) -
         associated_p1(4 * ell, mp.sin(delta)))
        for ell in range(1, terms + 1)
    )


def main():
    # Fourfold symmetry reduces the search to [0, pi/4].
    grid_n = 10001
    grid = [mp.pi * i / (4 * (grid_n - 1)) for i in range(grid_n)]
    grid_values = [abs(gamma_pair(delta)) for delta in grid]
    grid_i = max(range(grid_n), key=lambda i: grid_values[i])
    grid_delta = grid[grid_i]

    # Refine the stationary point from the grid maximum.
    delta_star = mp.findroot(
        lambda d: mp.diff(lambda x: gamma_pair(x), d),
        grid_delta
    )
    gamma_star = abs(gamma_pair(delta_star))

    # Eq. (27) restricted series has its own maximum.
    delta_27 = mp.findroot(
        lambda d: mp.diff(lambda x: gamma_eq27_restricted(x), d),
        delta_star
    )
    gamma_27_star = abs(gamma_eq27_restricted(delta_27))
    gamma_27_at_full = abs(gamma_eq27_restricted(delta_star))

    # Full Eq. (25) derivative, all 2*ell degrees.
    gamma_25_at_full = abs(gamma_eq25_literal(delta_star))
    omitted_terms = abs(gamma_25_at_full - gamma_27_at_full)

    # First omitted term: ell=3, degree 6.
    degree6 = abs(ETA**6 * mp.mpf(63) / 32 * mp.sin(4 * delta_star))

    # Logarithmic sensitivity at the optimized point (envelope theorem).
    c_eta = (ETA / gamma_star) * mp.diff(
        lambda e: gamma_pair(delta_star, e), ETA
    )
    eta_uncertainty_ppm = c_eta * U_ETA_REL * mp.mpf(1e6)

    results = {
        "source": "NIST final PDF pub_id 961075; DOI 10.1088/1681-7575/ae570f",
        "published_Rt_mm": str(RT_MM),
        "published_Rs_mm": str(RS_MM),
        "eta": mp.nstr(ETA, 24),
        "grid_points_on_0_to_pi_over_4": grid_n,
        "grid_max_delta_deg": mp.nstr(mp.degrees(grid_delta), 18),
        "refined_pairwise_delta_max_deg": mp.nstr(mp.degrees(delta_star), 24),
        "pairwise_gamma_max_abs": mp.nstr(gamma_star, 24),
        "literal_eq25_gamma_at_pairwise_max_abs": mp.nstr(gamma_25_at_full, 24),
        "pairwise_vs_eq25_abs_difference": mp.nstr(abs(gamma_star - gamma_25_at_full), 8),
        "eq27_restricted_gamma_at_pairwise_max_abs": mp.nstr(gamma_27_at_full, 24),
        "eq27_restricted_own_max_delta_deg": mp.nstr(mp.degrees(delta_27), 24),
        "eq27_restricted_own_max_abs": mp.nstr(gamma_27_star, 24),
        "omitted_odd_index_terms_at_pairwise_max_abs": mp.nstr(omitted_terms, 24),
        "degree6_term_at_pairwise_max_abs": mp.nstr(degree6, 24),
        "c_eta": mp.nstr(c_eta, 24),
        "eta_only_relative_uncertainty_ppm": mp.nstr(eta_uncertainty_ppm, 18),
        "vs_section_6_1_point_mass_ppm": mp.nstr((gamma_star / SECTION_61_GAMMA - 1) * 1e6, 18),
        "vs_table_10_point_mass_ppm": mp.nstr((gamma_star / TABLE_10_POINT_GAMMA - 1) * 1e6, 18),
        "vs_table_10_full_no_disk_percent": mp.nstr((gamma_star / TABLE_10_FULL_NO_DISK_GAMMA - 1) * 100, 18),
        "interpretation": "Source-bound model calculation; not a fit, measurement, or H(s)H prediction."
    }
    print(json.dumps(results, indent=2))


if __name__ == "__main__":
    main()
