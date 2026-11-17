#!/usr/bin/env python3
"""Source-grounded sensitivity decomposition for Tang et al. (2023).

Imports the exact existing nine-particle circle-fit implementation and
coordinates. Adds a finite-difference Jacobian, diagonal-error delta-method
variance attribution, leave-one-particle-out influence check, and step-size
stability audit. It does not reconstruct raw images or add covariance that
the source does not provide.
"""
from __future__ import annotations

import json
import platform

import numpy as np
import scipy

from reproduce_h869_tang2023_nine_particle_circle_fit import (
    XYZ_MM,
    SIGMA_MM,
    RNG_SEED,
    N_DRAWS,
    SOURCE_DOI,
    fit_plane_circle,
)

UPSTREAM_SCRIPT_BLOB_SHA1 = "8ef3f7bc1b4d5155baef841d07127e6a88040753"


def radius_jacobian(points_mm: np.ndarray, step_mm: float) -> np.ndarray:
    """Central finite-difference Jacobian dR/dX; units mm/mm."""
    flat = points_mm.reshape(-1)
    jac = np.empty_like(flat)
    for j in range(flat.size):
        plus = flat.copy()
        minus = flat.copy()
        plus[j] += step_mm
        minus[j] -= step_mm
        jac[j] = (
            fit_plane_circle(plus.reshape(points_mm.shape))[0]
            - fit_plane_circle(minus.reshape(points_mm.shape))[0]
        ) / (2.0 * step_mm)
    return jac.reshape(points_mm.shape)


def main() -> None:
    radius_mm, radial_rms_mm, plane_rms_mm = fit_plane_circle(XYZ_MM)

    steps_mm = [1e-4, 1e-5, 1e-6, 1e-7]
    step_results = []
    jac = None
    for step in steps_mm:
        jac_step = radius_jacobian(XYZ_MM, step)
        linear_sd_um = float(np.sqrt(np.sum((jac_step * SIGMA_MM) ** 2)) * 1000.0)
        step_results.append({"step_mm": step, "linearized_sd_um": linear_sd_um})
        if step == 1e-5:
            jac = jac_step

    assert jac is not None
    coordinate_variance_mm2 = (jac * SIGMA_MM) ** 2
    particle_variance_mm2 = coordinate_variance_mm2.sum(axis=1)
    total_variance_mm2 = float(particle_variance_mm2.sum())
    particle_share = particle_variance_mm2 / total_variance_mm2
    particle_sd_um = np.sqrt(particle_variance_mm2) * 1000.0

    # Reproduce the original source script's diagonal independent-Gaussian
    # Monte Carlo with the exact same seed and draw count.
    rng = np.random.default_rng(RNG_SEED)
    mc_radii_um = np.empty(N_DRAWS)
    for i in range(N_DRAWS):
        perturbed = XYZ_MM + rng.normal(size=XYZ_MM.shape) * SIGMA_MM
        mc_radii_um[i] = fit_plane_circle(perturbed)[0] * 1000.0

    # Conditional leave-one-particle-out influence diagnostic.
    loo_um = []
    for omitted in range(len(XYZ_MM)):
        keep = np.arange(len(XYZ_MM)) != omitted
        loo_um.append(float(fit_plane_circle(XYZ_MM[keep])[0] * 1000.0))

    linear_sd_um = float(np.sqrt(total_variance_mm2) * 1000.0)
    mc_sd_um = float(mc_radii_um.std(ddof=1))
    mc_q = np.quantile(mc_radii_um, [0.025, 0.5, 0.975])

    result = {
        "source": {
            "article": "Tang et al., Nature Communications 14, 2941 (2023)",
            "doi": SOURCE_DOI,
            "input_script": "reproduce_h869_tang2023_nine_particle_circle_fit.py",
            "input_script_blob_sha1": UPSTREAM_SCRIPT_BLOB_SHA1,
            "source_data_locator": "Supplementary Information p. 6, Supplementary Table 1; nine-particle ring coordinates and per-coordinate 1-sigma uncertainties",
            "physical_system": "superfluid helium-4 vortex ring with trapped deuterium tracer particles",
            "input_units": "mm",
            "coordinate_rows": int(len(XYZ_MM)),
            "coordinate_model": "author-derived 3D positions from x-z ellipse/projection relation",
            "uncertainty_model": "independent diagonal Gaussian coordinate errors; full covariance unavailable",
        },
        "runtime": {
            "python": platform.python_version(),
            "numpy": np.__version__,
            "scipy": scipy.__version__,
            "draws": N_DRAWS,
            "seed": RNG_SEED,
        },
        "baseline": {
            "radius_um": radius_mm * 1000.0,
            "radial_rms_um": radial_rms_mm * 1000.0,
            "plane_rms_um": plane_rms_mm * 1000.0,
        },
        "finite_difference_step_stability": step_results,
        "jacobian_dR_dXYZ_mm_per_mm": jac.tolist(),
        "linearized_diagonal_error": {
            "sd_um": linear_sd_um,
            "relative_sd_percent_of_radius": linear_sd_um / (radius_mm * 1000.0) * 100.0,
            "particle_variance_shares_percent": (particle_share * 100.0).tolist(),
            "particle_sd_contribution_um": particle_sd_um.tolist(),
            "coordinate_variance_contributions_um2": (coordinate_variance_mm2 * 1_000_000.0).tolist(),
            "coordinate_variance_shares_percent": (coordinate_variance_mm2 / total_variance_mm2 * 100.0).tolist(),
        },
        "monte_carlo_diagonal_error": {
            "sd_um": mc_sd_um,
            "q025_um": float(mc_q[0]),
            "median_um": float(mc_q[1]),
            "q975_um": float(mc_q[2]),
            "linearized_vs_mc_sd_difference_percent": (mc_sd_um - linear_sd_um) / mc_sd_um * 100.0,
        },
        "leave_one_particle_out": {
            "radius_um_by_omitted_row_1_to_9": loo_um,
            "min_um": min(loo_um),
            "max_um": max(loo_um),
            "range_um": max(loo_um) - min(loo_um),
        },
        "interpretation_limits": [
            "This is sensitivity of the fitted ring radius to the already-derived 3D coordinates.",
            "It is not raw-image reconstruction, independent 3D tomography, or a measurement of vortex-core cross-section.",
            "The linearized and Monte Carlo uncertainties share the same diagonal independent-error assumption.",
            "No full coordinate covariance or image-to-3D reconstruction uncertainty is included.",
            "No H(s)H physical parameter or prediction is inferred.",
        ],
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
