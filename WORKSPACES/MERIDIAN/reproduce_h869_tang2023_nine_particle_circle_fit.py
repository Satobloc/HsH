#!/usr/bin/env python3
"""Reproduce a geometric sensitivity check from Tang et al. (2023), Supplementary Table 1.

Source:
  Tang, Y. et al., Nature Communications 14, 2941 (2023)
  DOI: https://doi.org/10.1038/s41467-023-38787-w
  Supplementary Information, p. 6, nine-particle ring coordinates.

The coordinates are already-derived 3D particle positions reconstructed by
the authors from an x-z ellipse fit and a projection-angle relation. This
script is not raw-image reconstruction or independent 3D tomography.

Method:
  1. PCA/SVD best-fit plane through the nine points.
  2. Orthogonal projection into the plane.
  3. Nonlinear least-squares circle fit in plane coordinates.
  4. 20,000 sensitivity draws, perturbing each coordinate independently
     with its published standard uncertainty (diagonal-error assumption).

Limit: the source does not provide a full coordinate covariance matrix.
The Monte Carlo interval is therefore a sensitivity check, not a complete
uncertainty budget.
"""

from __future__ import annotations

import numpy as np
from scipy.optimize import least_squares

SOURCE_DOI = "10.1038/s41467-023-38787-w"
RNG_SEED = 20261116
N_DRAWS = 20_000

# Coordinates and one-standard-deviation uncertainties from Supplementary
# Table 1. Units are millimetres; columns are x, y, z.
XYZ_MM = np.array(
    [
        [-0.271, -0.209,  0.204],
        [-0.186,  0.261, -0.074],
        [-0.101, -0.269,  0.220],
        [-0.093,  0.270, -0.089],
        [-0.008,  0.254, -0.089],
        [ 0.154,  0.155, -0.051],
        [ 0.215,  0.027,  0.016],
        [-0.358,  0.146,  0.011],
        [ 0.216, -0.046,  0.058],
    ],
    dtype=float,
)

SIGMA_MM = np.array(
    [
        [0.003, 0.005, 0.002],
        [0.002, 0.004, 0.002],
        [0.003, 0.005, 0.002],
        [0.002, 0.004, 0.002],
        [0.002, 0.003, 0.002],
        [0.003, 0.004, 0.002],
        [0.002, 0.003, 0.002],
        [0.002, 0.005, 0.003],
        [0.002, 0.003, 0.002],
    ],
    dtype=float,
)


def fit_plane_circle(points_mm: np.ndarray) -> tuple[float, float, float]:
    """Return (radius_mm, radial_RMS_mm, plane_RMS_mm)."""
    centroid = points_mm.mean(axis=0)
    _, singular_values, vt = np.linalg.svd(
        points_mm - centroid, full_matrices=False
    )

    # The first two right-singular vectors span the best-fit plane.
    e1, e2 = vt[0], vt[1]
    normal = vt[2]
    centered = points_mm - centroid
    uv = np.column_stack((centered @ e1, centered @ e2))

    # Algebraic circle fit supplies a stable initial guess.
    design = np.column_stack((2.0 * uv[:, 0], 2.0 * uv[:, 1], np.ones(len(uv))))
    target = np.square(uv).sum(axis=1)
    solution, *_ = np.linalg.lstsq(design, target, rcond=None)
    center0 = solution[:2]
    radius0 = np.sqrt(max(0.0, solution[2] + center0 @ center0))

    def radial_residual(parameters: np.ndarray) -> np.ndarray:
        center = parameters[:2]
        radius = parameters[2]
        return np.linalg.norm(uv - center, axis=1) - radius

    fit = least_squares(radial_residual, np.r_[center0, radius0])
    radius_mm = float(fit.x[2])
    radial_rms_mm = float(np.sqrt(np.mean(radial_residual(fit.x) ** 2)))
    plane_distance_mm = centered @ normal
    plane_rms_mm = float(np.sqrt(np.mean(plane_distance_mm ** 2)))

    return radius_mm, radial_rms_mm, plane_rms_mm


def main() -> None:
    radius, radial_rms, plane_rms = fit_plane_circle(XYZ_MM)

    rng = np.random.default_rng(RNG_SEED)
    radii_um = np.empty(N_DRAWS)
    for i in range(N_DRAWS):
        perturbed = XYZ_MM + rng.normal(size=XYZ_MM.shape) * SIGMA_MM
        radii_um[i] = fit_plane_circle(perturbed)[0] * 1000.0

    q025, median, q975 = np.quantile(radii_um, [0.025, 0.5, 0.975])

    print(f"source_doi={SOURCE_DOI}")
    print(f"draws={N_DRAWS} seed={RNG_SEED}")
    print(f"radius_um={radius * 1000.0:.6f}")
    print(f"radial_rms_um={radial_rms * 1000.0:.6f}")
    print(f"plane_rms_um={plane_rms * 1000.0:.6f}")
    print(f"mc_mean_um={radii_um.mean():.6f}")
    print(f"mc_sd_um={radii_um.std(ddof=1):.6f}")
    print(f"mc_2.5pct_um={q025:.6f}")
    print(f"mc_median_um={median:.6f}")
    print(f"mc_97.5pct_um={q975:.6f}")


if __name__ == "__main__":
    main()
