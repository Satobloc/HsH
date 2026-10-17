#!/usr/bin/env python3
"""Sable: higher-moment gate for the finite-core/readout alias.

Orson OV100 showed that squared radius cannot separate a fixed Gaussian object
core from Gaussian readout blur.  This calculation asks whether measuring the
fourth radial moment (or even the complete convolved profile) repairs that
alias.  It does not: Gaussian convolution is a semigroup, so every observable
of the final profile depends on c^2+s_j^2, never on c and s_j separately.

A matched-second-moment non-Gaussian core is included as a negative control.
There the fourth moment differs, showing that the failed rescue is specific to
the shared Gaussian-kernel family rather than a generic impossibility.

Status: GEN/DERIVED identifiability mathematics for the explicit convolution
model only.  No particle ontology or actual-instrument claim.
"""

from __future__ import annotations

import json
import math

import numpy as np


R0 = 1.7484885900275715
A = 0.8
C_TRUE = 0.04
S_TRUE = np.array([0.02, 0.06])
C_ALT = 0.03
SEED = 20_261_014
MC_SAMPLES = 500_000


def shell_gaussian_moments(radius: np.ndarray, variance: np.ndarray):
    """E|X+Z|^2 and E|X+Z|^4 for |X|=radius, Z~N(0,q I_3)."""
    m2 = radius**2 + 3.0 * variance
    m4 = radius**4 + 10.0 * variance * radius**2 + 15.0 * variance**2
    return m2, m4


def sinc(x: np.ndarray) -> np.ndarray:
    """sin(x)/x with its continuous value at zero."""
    return np.sinc(x / np.pi)


def main() -> None:
    # An explicit redistribution along Orson's null direction.  Both
    # instruments retain q_j=c^2+s_j^2 exactly.
    q_true = C_TRUE**2 + S_TRUE**2
    s_alt_sq = q_true - C_ALT**2
    assert np.all(s_alt_sq > 0.0)
    s_alt = np.sqrt(s_alt_sq)
    q_alt = C_ALT**2 + s_alt**2

    eta = np.logspace(2.0, 12.0, 30)
    radius = R0 * (A * eta) ** (-0.25)

    moment_differences = []
    jacobian_rows = []
    for j in range(2):
        m2_true, m4_true = shell_gaussian_moments(radius, q_true[j])
        m2_alt, m4_alt = shell_gaussian_moments(radius, q_alt[j])
        moment_differences.extend((m2_true - m2_alt).tolist())
        moment_differences.extend((m4_true - m4_alt).tolist())

        # Every statistic F of the final Gaussian-convolved profile has
        # gradient F'(q_j) times one of these two rows.  M2 and M4 suffice to
        # expose the rank; adding more profile statistics only rescales rows.
        selector = np.array([1.0, float(j == 0), float(j == 1)])
        for r in radius:
            jacobian_rows.append(3.0 * selector)
            jacobian_rows.append((10.0 * r**2 + 30.0 * q_true[j]) * selector)
    jacobian = np.asarray(jacobian_rows)
    singular_values = np.linalg.svd(jacobian, compute_uv=False)
    null = np.array([1.0, -1.0, -1.0])

    # Full-profile certificate in Fourier space.  A thin-shell source has
    # phi_X(k)=sinc(kR); the two Gaussian kernels multiply to exp(-q k^2/2).
    k = np.linspace(0.0, 100.0, 2001)
    profile_max_difference = 0.0
    for j in range(2):
        for r in (radius[0], radius[len(radius) // 2], radius[-1]):
            phi_true = (
                sinc(k * r)
                * np.exp(-0.5 * C_TRUE**2 * k**2)
                * np.exp(-0.5 * S_TRUE[j] ** 2 * k**2)
            )
            phi_alt = (
                sinc(k * r)
                * np.exp(-0.5 * C_ALT**2 * k**2)
                * np.exp(-0.5 * s_alt[j] ** 2 * k**2)
            )
            profile_max_difference = max(
                profile_max_difference, float(np.max(np.abs(phi_true - phi_alt)))
            )

    # Negative control: replace the Gaussian object core N(0,c^2 I_3) by an
    # isotropic shell of radius sqrt(3)c.  It has the same added M2=3c^2, but
    # its kernel M4 is lower by exactly 6c^4 after the same Gaussian readout.
    shell_core_radius = math.sqrt(3.0) * C_TRUE
    q0 = q_true[0]
    gaussian_kernel_m2 = 3.0 * q0
    gaussian_kernel_m4 = 15.0 * q0**2
    shell_kernel_m2 = shell_core_radius**2 + 3.0 * S_TRUE[0] ** 2
    shell_kernel_m4 = (
        shell_core_radius**4
        + 10.0 * shell_core_radius**2 * S_TRUE[0] ** 2
        + 15.0 * S_TRUE[0] ** 4
    )
    exact_m4_difference = shell_kernel_m4 - gaussian_kernel_m4

    # Actually executed seeded check of the non-Gaussian discriminator.
    rng = np.random.default_rng(SEED)
    gaussian = rng.normal(0.0, math.sqrt(q0), size=(MC_SAMPLES, 3))
    directions = rng.normal(size=(MC_SAMPLES, 3))
    directions /= np.linalg.norm(directions, axis=1)[:, None]
    shell_plus_readout = (
        shell_core_radius * directions
        + rng.normal(0.0, S_TRUE[0], size=(MC_SAMPLES, 3))
    )
    g_r4 = np.sum(gaussian**2, axis=1) ** 2
    s_r4 = np.sum(shell_plus_readout**2, axis=1) ** 2
    mc_difference = float(np.mean(s_r4) - np.mean(g_r4))
    mc_se = float(
        math.sqrt(np.var(s_r4, ddof=1) / MC_SAMPLES + np.var(g_r4, ddof=1) / MC_SAMPLES)
    )
    mc_z_from_exact = (mc_difference - exact_m4_difference) / mc_se

    # Exact controls and limiting cases.
    assert np.max(np.abs(q_true - q_alt)) < 1e-18
    assert np.max(np.abs(moment_differences)) < 1e-13
    assert np.linalg.matrix_rank(jacobian) == 2
    assert np.linalg.norm(jacobian @ null) < 1e-12
    assert profile_max_difference < 5e-16
    assert abs(shell_kernel_m2 - gaussian_kernel_m2) < 1e-18
    assert abs(exact_m4_difference + 6.0 * C_TRUE**4) < 1e-18
    assert abs(mc_z_from_exact) < 4.0

    payload = {
        "status": (
            "GEN/DERIVED identifiability mathematics for the explicit convolution "
            "model only; no particle ontology or actual-instrument claim"
        ),
        "fixture": {
            "true_core_width": C_TRUE,
            "true_readout_widths": S_TRUE.tolist(),
            "alternative_core_width": C_ALT,
            "alternative_readout_widths": s_alt.tolist(),
            "total_variances_q": q_true.tolist(),
            "eta_range": [float(eta[0]), float(eta[-1])],
        },
        "gaussian_semigroup_alias": {
            "identity": "G_c * G_s = G_sqrt(c^2+s^2)",
            "maximum_M2_or_M4_difference": float(np.max(np.abs(moment_differences))),
            "full_profile_characteristic_function_max_difference": profile_max_difference,
            "jacobian_shape": list(jacobian.shape),
            "jacobian_rank": int(np.linalg.matrix_rank(jacobian)),
            "parameter_count": 3,
            "singular_values": singular_values.tolist(),
            "null_vector_parameters_c2_s0sq_s1sq": null.tolist(),
            "null_residual": float(np.linalg.norm(jacobian @ null)),
        },
        "non_gaussian_negative_control": {
            "core_family": "isotropic fixed-radius shell matched to Gaussian core M2",
            "kernel_M2_difference": shell_kernel_m2 - gaussian_kernel_m2,
            "exact_kernel_M4_difference": exact_m4_difference,
            "formula": "M4_shell_minus_Gaussian=-6*c^4",
            "mc_samples_per_family": MC_SAMPLES,
            "seed": SEED,
            "mc_M4_difference": mc_difference,
            "mc_standard_error": mc_se,
            "mc_z_from_exact": mc_z_from_exact,
        },
        "limiting_case": "as c -> 0, the non-Gaussian M4 discriminator vanishes as c^4",
        "conclusion": (
            "No moment and no statistic of one final profile can separate two "
            "unconstrained Gaussian convolution widths.  Identification requires "
            "external calibration, a non-convolutional observable, or a justified "
            "difference in kernel family; fourth moments help only in the last case."
        ),
    }
    print(json.dumps(payload, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
