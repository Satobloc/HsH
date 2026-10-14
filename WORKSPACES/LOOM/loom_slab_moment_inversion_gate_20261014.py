#!/usr/bin/env python3
"""Loom: exact phase-moment repair of finite-slab provenance compression.

GEN/DERIVED sandbox mathematics extending
RUNS/2026-10-14T0800Z_S0_4D_RING_PROJECTION_VS_INTERSECTION.md.
It concerns a declared ring/slab representation, not a particle or coupling
claim and not an exact finite-core worldtube-section volume.

For a 4D ring whose signed distance to a hyperplane is A*sin(phi), define the
finite-slab accessibility mask

    h(phi)=1{|A sin(phi)-d| <= a},   A>0, a>=0.

In the unsaturated interior regime -1<l=(d-a)/A<u=(d+a)/A<1, retain

    f  = (1/2pi) integral h dphi
       = [asin(u)-asin(l)]/pi,
    m1 = (1/2pi) integral h sin(phi) dphi
       = [sqrt(1-l^2)-sqrt(1-u^2)]/pi.

The scalar fraction f alone leaves a one-parameter continuum of (d,a) pairs.
But set delta=pi*f/2 and

    mu = asin[pi*m1/(2 sin(delta))].

Then the pair (f,m1) exactly recovers

    d/A = sin(mu) cos(delta),
    a/A = cos(mu) sin(delta).

Thus one signed first harmonic repairs the offset/width information loss when
the phase origin is calibrated.  If a threshold saturates (u>=1 or l<=-1),
clipping erases the excess and even (f,m1) cannot recover d and a separately.
"""

from __future__ import annotations

import json
import math

import numpy as np


def analytic_moments(A: float, d: float, a: float) -> tuple[float, float]:
    if A <= 0.0 or a < 0.0:
        raise ValueError("require A>0 and a>=0")
    lower = max(-1.0, min(1.0, (d - a) / A))
    upper = max(-1.0, min(1.0, (d + a) / A))
    if lower >= upper:
        return 0.0, 0.0
    fraction = (math.asin(upper) - math.asin(lower)) / math.pi
    first = (
        math.sqrt(max(0.0, 1.0 - lower * lower))
        - math.sqrt(max(0.0, 1.0 - upper * upper))
    ) / math.pi
    return fraction, first


def invert_unsaturated(A: float, fraction: float, first: float) -> tuple[float, float]:
    if A <= 0.0 or not 0.0 < fraction < 1.0:
        raise ValueError("require A>0 and 0<f<1")
    delta = math.pi * fraction / 2.0
    argument = math.pi * first / (2.0 * math.sin(delta))
    if abs(argument) >= 1.0:
        raise ValueError("moments are outside the unsaturated inverse domain")
    mu = math.asin(argument)
    d = A * math.sin(mu) * math.cos(delta)
    a = A * math.cos(mu) * math.sin(delta)
    lower, upper = (d - a) / A, (d + a) / A
    if not -1.0 < lower < upper < 1.0:
        raise ValueError("inverse lands on a saturated threshold")
    return d, a


def sample_moments(A: float, d: float, a: float, count: int) -> tuple[float, float]:
    # Midpoint phases avoid endpoint ambiguity and give deterministic O(1/N) error.
    phase = 2.0 * math.pi * (np.arange(count) + 0.5) / count
    sine = np.sin(phase)
    mask = np.abs(A * sine - d) <= a
    return float(mask.mean()), float((mask * sine).mean())


def matched_fraction_pair(A: float, fraction: float, d: float) -> tuple[float, float]:
    """Construct the unique unsaturated a at chosen d and fixed fraction."""
    delta = math.pi * fraction / 2.0
    mu = math.asin(d / (A * math.cos(delta)))
    a = A * math.cos(mu) * math.sin(delta)
    return d, a


def numerical_jacobian(A: float, d: float, a: float, step=1e-7) -> np.ndarray:
    center_d_plus = np.array(analytic_moments(A, d + step, a))
    center_d_minus = np.array(analytic_moments(A, d - step, a))
    center_a_plus = np.array(analytic_moments(A, d, a + step))
    center_a_minus = np.array(analytic_moments(A, d, a - step))
    return np.column_stack(
        (
            (center_d_plus - center_d_minus) / (2.0 * step),
            (center_a_plus - center_a_minus) / (2.0 * step),
        )
    )


def propagated_uncertainty(jacobian: np.ndarray, sigma: float) -> tuple[float, float]:
    inverse = np.linalg.inv(jacobian)
    covariance = sigma * sigma * inverse @ inverse.T
    return float(math.sqrt(covariance[0, 0])), float(math.sqrt(covariance[1, 1]))


def main() -> None:
    radius = 1.0
    theta = 0.246
    A = radius * math.sin(theta)

    # Loom's centered fixture and an exact f-only degenerate alternative.
    centered = (0.0, 0.1)
    target_fraction, centered_m1 = analytic_moments(A, *centered)
    alternative = matched_fraction_pair(A, target_fraction, d=0.15)
    alternative_fraction, alternative_m1 = analytic_moments(A, *alternative)

    # The signed first moment restores both parameter pairs exactly.
    recovered_centered = invert_unsaturated(A, target_fraction, centered_m1)
    recovered_alternative = invert_unsaturated(A, alternative_fraction, alternative_m1)

    # Deterministic phase-grid validation and a thin-slab limiting case.
    sample_count = 2_000_003
    sampled_centered = sample_moments(A, *centered, sample_count)
    sampled_alternative = sample_moments(A, *alternative, sample_count)
    thin = (0.12, 1.0e-5)
    thin_fraction, thin_m1 = analytic_moments(A, *thin)
    thin_conditional_mean = thin_m1 / thin_fraction

    # Saturation negative control: identical clipped bounds, distinct (d,a).
    saturated_1 = (0.20, 0.10)
    saturated_2 = (0.25, 0.15)
    saturated_moments_1 = analytic_moments(A, *saturated_1)
    saturated_moments_2 = analytic_moments(A, *saturated_2)

    # Local conditioning and uncertainty for sigma_f=sigma_m1=1e-4.
    sigma_moment = 1.0e-4
    j_centered = numerical_jacobian(A, *centered)
    j_alternative = numerical_jacobian(A, *alternative)
    s_centered = np.linalg.svd(j_centered, compute_uv=False)
    s_alternative = np.linalg.svd(j_alternative, compute_uv=False)
    uncertainty_centered = propagated_uncertainty(j_centered, sigma_moment)
    uncertainty_alternative = propagated_uncertainty(j_alternative, sigma_moment)

    out = {
        "geometry": {"R": radius, "theta": theta, "A": A},
        "f_only_degeneracy": {
            "target_fraction": target_fraction,
            "centered_d_a": centered,
            "alternative_d_a": alternative,
            "fraction_difference": alternative_fraction - target_fraction,
            "first_moment_centered": centered_m1,
            "first_moment_alternative": alternative_m1,
        },
        "exact_inverse": {
            "recovered_centered_d_a": recovered_centered,
            "recovered_alternative_d_a": recovered_alternative,
            "max_abs_parameter_error": max(
                np.max(np.abs(np.array(recovered_centered) - np.array(centered))),
                np.max(np.abs(np.array(recovered_alternative) - np.array(alternative))),
            ),
        },
        "phase_grid_validation": {
            "samples": sample_count,
            "centered_max_abs_error": float(
                np.max(np.abs(np.array(sampled_centered) - np.array((target_fraction, centered_m1))))
            ),
            "alternative_max_abs_error": float(
                np.max(np.abs(np.array(sampled_alternative) - np.array((alternative_fraction, alternative_m1))))
            ),
        },
        "thin_slab_limit": {
            "d_a": thin,
            "conditional_mean_sin_phi": thin_conditional_mean,
            "target_d_over_A": thin[0] / A,
            "absolute_error": abs(thin_conditional_mean - thin[0] / A),
        },
        "saturation_negative_control": {
            "pair_1_d_a": saturated_1,
            "pair_2_d_a": saturated_2,
            "moments_1": saturated_moments_1,
            "moments_2": saturated_moments_2,
            "max_abs_difference": float(
                np.max(np.abs(np.array(saturated_moments_1) - np.array(saturated_moments_2)))
            ),
        },
        "conditioning_for_sigma_1e-4": {
            "centered_condition_number": float(s_centered[0] / s_centered[-1]),
            "centered_sigma_d_a": uncertainty_centered,
            "alternative_condition_number": float(s_alternative[0] / s_alternative[-1]),
            "alternative_sigma_d_a": uncertainty_alternative,
        },
        "status": "GEN/DERIVED ring/slab accessibility mathematics; calibrated phase required",
    }

    assert abs(alternative_fraction - target_fraction) < 3e-16
    assert abs(alternative_m1 - centered_m1) > 0.17
    assert out["exact_inverse"]["max_abs_parameter_error"] < 2e-16
    assert out["phase_grid_validation"]["centered_max_abs_error"] < 7e-7
    assert out["phase_grid_validation"]["alternative_max_abs_error"] < 7e-7
    assert out["thin_slab_limit"]["absolute_error"] < 2e-9
    assert out["saturation_negative_control"]["max_abs_difference"] < 2e-16

    print(json.dumps(out, indent=2, sort_keys=True))
    print("PASS: f-only continuum exposed; signed m1 repairs interior; saturation remains nonidentifiable")


if __name__ == "__main__":
    main()
