#!/usr/bin/env python3
"""Audit the GCS apex surface-regularity gate for the eight CME fits in
Mishra, Agarwal & Srivastava (2026), Tables 1-2.

This is a secondary, source-derived calculation on published GCS fit values.
It is not a re-fit of coronagraph images, a new observation, a global
self-intersection test, or a full 4-D worldtube reconstruction.

Sources:
  Mishra, Agarwal & Srivastava (2026), MNRAS, DOI 10.1093/mnras/stag1145:
    Table 1 (h_LE, alpha_GCS fit, adopted fractional alpha uncertainty)
    Table 2 (final-coronal kappa_GCS and reported uncertainty)
  Thernisien (2011), ApJS 194, 33, DOI 10.1088/0067-0049/194/2/33.
  PyThea geometrical_models.py, pinned blob
    6c9fb2cf9fbf71993cf428c874b17a43d8ce0803.

The reported uncertainty bands are marginal sensitivity scales, not a
joint confidence region. The paper does not provide the required parameter
covariance matrix. The rectangular envelope below is therefore descriptive,
not probabilistic.
"""
from __future__ import annotations

import json
import math
from typing import Any

SOURCE = {
    "mishra_agarwal_srivastava_2026": {
        "doi": "10.1093/mnras/stag1145",
        "tables": ["1", "2"],
        "measurement_basis": (
            "GCS reconstructions from multi-viewpoint coronagraph observations; "
            "the calculation uses published fitted parameters, not raw images."
        ),
    },
    "thernisien_2011": {
        "doi": "10.1088/0067-0049/194/2/33",
        "role": "Original GCS geometric construction.",
    },
    "pythea": {
        "repository": "AthKouloumvakos/PyThea",
        "file": "PyThea/geometrical_models.py",
        "blob_sha1": "6c9fb2cf9fbf71993cf428c874b17a43d8ce0803",
        "role": "Independent executable implementation of GCS skeleton and cross-section frame.",
    },
}

# h_LE and its adopted uncertainty are in solar radii.
# alpha_fraction is the approximate fractional uncertainty printed in Table 1.
# sigma_kappa is the final-coronal kappa uncertainty reported in Table 2.
EVENTS = [
    {"date": "2011-06-02", "class": "fast", "h_LE_Rsun": 13.5, "sigma_h_Rsun": 1.4,
     "alpha_GCS_deg": 20.0, "alpha_fraction": 0.30, "kappa_GCS": 0.23, "sigma_kappa": 0.03},
    {"date": "2012-07-12", "class": "fast", "h_LE_Rsun": 14.9, "sigma_h_Rsun": 1.5,
     "alpha_GCS_deg": 25.0, "alpha_fraction": 0.25, "kappa_GCS": 0.61, "sigma_kappa": 0.03},
    {"date": "2013-04-11", "class": "fast", "h_LE_Rsun": 16.3, "sigma_h_Rsun": 2.4,
     "alpha_GCS_deg": 35.0, "alpha_fraction": 0.30, "kappa_GCS": 0.40, "sigma_kappa": 0.07},
    {"date": "2013-09-29", "class": "fast", "h_LE_Rsun": 15.2, "sigma_h_Rsun": 1.5,
     "alpha_GCS_deg": 40.0, "alpha_fraction": 0.20, "kappa_GCS": 0.60, "sigma_kappa": 0.06},
    {"date": "2008-12-12", "class": "slow", "h_LE_Rsun": 15.1, "sigma_h_Rsun": 1.5,
     "alpha_GCS_deg": 20.0, "alpha_fraction": 0.20, "kappa_GCS": 0.23, "sigma_kappa": 0.01},
    {"date": "2010-04-03", "class": "slow", "h_LE_Rsun": 13.7, "sigma_h_Rsun": 0.7,
     "alpha_GCS_deg": 25.5, "alpha_fraction": 0.15, "kappa_GCS": 0.37, "sigma_kappa": 0.05},
    {"date": "2010-04-08", "class": "slow", "h_LE_Rsun": 13.8, "sigma_h_Rsun": 0.7,
     "alpha_GCS_deg": 50.0, "alpha_fraction": 0.20, "kappa_GCS": 0.28, "sigma_kappa": 0.04},
    {"date": "2011-09-13", "class": "slow", "h_LE_Rsun": 14.1, "sigma_h_Rsun": 0.7,
     "alpha_GCS_deg": 25.0, "alpha_fraction": 0.25, "kappa_GCS": 0.43, "sigma_kappa": 0.06},
]


def clamp(x: float, lo: float, hi: float) -> float:
    return min(max(x, lo), hi)


def j_apex(s: float, k: float) -> float:
    """Normalized minimum GCS apex area factor: (X0 - R) / X0."""
    return (s - k) * (1.0 - k) / (s + k * k)


def gap_factor(s: float, k: float) -> float:
    """(X0 - R) / h_LE; multiply by h_LE to obtain solar radii."""
    return (1.0 - k) * (s - k) / ((1.0 + s) * (1.0 + k))


def apex_geometry(event: dict[str, Any]) -> dict[str, float]:
    h = float(event["h_LE_Rsun"])
    alpha = math.radians(float(event["alpha_GCS_deg"]))
    s = math.sin(alpha)
    k = float(event["kappa_GCS"])

    # PyThea's GCS parameter h_GCS / cos(alpha), expressed using h_LE.
    H_gcs = h * (1.0 - k) / (1.0 + s)
    rho_gcs = H_gcs * s  # generating-circle radius, not axis curvature radius

    X0 = H_gcs * (s + k * k) / (1.0 - k * k)
    OC1 = h / (1.0 + k)  # heliocentric apex cross-section-center radius
    R = k * OC1          # apex cross-section radius

    # Curvature radius of the GCS skeleton p(beta) at beta=pi/2,
    # obtained by differentiating the source-defined centerline.
    rho_axis = (
        H_gcs * (s + k * k) ** 2
        / ((1.0 - k * k) * (s + 2.0 * k * k))
    )

    gap = X0 - R
    J = gap / X0
    return {
        "H_GCS_Rsun": H_gcs,
        "rho_GCS_generating_circle_Rsun": rho_gcs,
        "X0_apex_transverse_offset_Rsun": X0,
        "OC1_apex_center_heliocentric_Rsun": OC1,
        "R_apex_cross_section_Rsun": R,
        "rho_axis_local_curvature_Rsun": rho_axis,
        "X0_minus_R_Rsun": gap,
        "J_apex_min_normalized": J,
        "J_naive_1_minus_kappa_not_GCS_surface_jacobian": 1.0 - k,
        "J_hypothetical_Frenet_tube_1_minus_R_over_rho_axis_not_GCS_gate": 1.0 - R / rho_axis,
        "sin_alpha_minus_kappa": s - k,
    }


def sensitivity_envelope(event: dict[str, Any]) -> dict[str, Any]:
    h = float(event["h_LE_Rsun"])
    dh = float(event["sigma_h_Rsun"])
    alpha = float(event["alpha_GCS_deg"])
    d_alpha = alpha * float(event["alpha_fraction"])
    k = float(event["kappa_GCS"])
    dk = float(event["sigma_kappa"])

    alpha_lo, alpha_hi = alpha - d_alpha, alpha + d_alpha
    k_lo, k_hi = k - dk, k + dk
    h_lo, h_hi = h - dh, h + dh
    s_lo = math.sin(math.radians(alpha_lo))
    s_hi = math.sin(math.radians(alpha_hi))

    # Exact extrema over the rectangular marginal band:
    # dJ/ds > 0 and dJ/dk changes sign at k=sqrt(s).
    k_star_j = clamp(math.sqrt(s_lo), k_lo, k_hi)
    J_lo = j_apex(s_lo, k_star_j)
    J_hi = max(j_apex(s_hi, k_lo), j_apex(s_hi, k_hi))

    # The dimensional gap factor is increasing in s. Its k-derivative
    # changes sign at k=-1+sqrt(2+2s), so the minimum is at the clamped
    # stationary point and the maximum at a k endpoint.
    k_star_gap = clamp(-1.0 + math.sqrt(2.0 + 2.0 * s_lo), k_lo, k_hi)
    g_lo = gap_factor(s_lo, k_star_gap)
    g_hi = max(gap_factor(s_hi, k_lo), gap_factor(s_hi, k_hi))
    gap_candidates = [h_lo * g_lo, h_hi * g_lo, h_lo * g_hi, h_hi * g_hi]

    return {
        "alpha_GCS_interval_deg": [alpha_lo, alpha_hi],
        "kappa_GCS_interval": [k_lo, k_hi],
        "h_LE_interval_Rsun": [h_lo, h_hi],
        "J_apex_interval_rectangular": [J_lo, J_hi],
        "X0_minus_R_interval_Rsun_rectangular": [
            min(gap_candidates), max(gap_candidates)
        ],
        "uncertainty_interpretation": (
            "Rectangular sensitivity envelope from reported marginal uncertainty "
            "scales; not a joint confidence region. Parameter covariance is not supplied."
        ),
    }


def classify(j_interval: list[float]) -> str:
    lo, hi = j_interval
    if lo > 0.0:
        return "ROBUST_APEX_IMMERSION_PASS_WITHIN_REPORTED_MARGINAL_BANDS"
    if hi < 0.0:
        return "ROBUST_APEX_IMMERSION_FAIL_WITHIN_REPORTED_MARGINAL_BANDS"
    return "INDETERMINATE_WITHIN_REPORTED_MARGINAL_BANDS"


def main() -> None:
    rows = []
    for event in EVENTS:
        geo = apex_geometry(event)
        envelope = sensitivity_envelope(event)
        status = classify(envelope["J_apex_interval_rectangular"])
        rows.append({
            "date": event["date"],
            "class": event["class"],
            "h_LE_Rsun": event["h_LE_Rsun"],
            "sigma_h_Rsun": event["sigma_h_Rsun"],
            "alpha_GCS_fit_deg": event["alpha_GCS_deg"],
            "alpha_fractional_uncertainty": event["alpha_fraction"],
            "alpha_GCS_interval_deg": envelope["alpha_GCS_interval_deg"],
            "kappa_GCS_fit": event["kappa_GCS"],
            "sigma_kappa_GCS": event["sigma_kappa"],
            "kappa_GCS_interval": envelope["kappa_GCS_interval"],
            "sin_alpha_minus_kappa": geo["sin_alpha_minus_kappa"],
            "X0_apex_transverse_offset_Rsun": geo["X0_apex_transverse_offset_Rsun"],
            "OC1_apex_center_heliocentric_Rsun": geo["OC1_apex_center_heliocentric_Rsun"],
            "R_apex_cross_section_Rsun": geo["R_apex_cross_section_Rsun"],
            "rho_axis_local_curvature_Rsun": geo["rho_axis_local_curvature_Rsun"],
            "X0_minus_R_Rsun": geo["X0_minus_R_Rsun"],
            "J_apex_min_normalized": geo["J_apex_min_normalized"],
            "J_naive_1_minus_kappa_not_GCS_surface_jacobian": geo["J_naive_1_minus_kappa_not_GCS_surface_jacobian"],
            "J_hypothetical_Frenet_tube_not_GCS_gate": geo["J_hypothetical_Frenet_tube_1_minus_R_over_rho_axis_not_GCS_gate"],
            "J_apex_interval_rectangular": envelope["J_apex_interval_rectangular"],
            "X0_minus_R_interval_Rsun_rectangular": envelope["X0_minus_R_interval_Rsun_rectangular"],
            "central_apex_status": "PASS" if geo["J_apex_min_normalized"] > 0 else "FAIL",
            "marginal_band_status": status,
        })

    result = {
        "source": SOURCE,
        "method": {
            "surface_parameterization": (
                "P(beta,u)=p(beta)+r(beta)*(cos(u), sin(u)*cos(beta), sin(u)*sin(beta))"
            ),
            "apex_area_factor": "R_apex * (X0_apex + R_apex*sin(u))",
            "local_immersion_condition": "X0_apex > R_apex",
            "equivalent_parameter_condition": "kappa_GCS < sin(alpha_GCS)",
            "normalized_apex_margin": "(X0_apex-R_apex)/X0_apex",
            "local_axis_curvature_radius": (
                "H_GCS*(sin(alpha_GCS)+kappa_GCS^2)^2 / "
                "((1-kappa_GCS^2)*(sin(alpha_GCS)+2*kappa_GCS^2))"
            ),
            "scope_limit": (
                "A local apex immersion test only; not a global embedding, self-intersection, "
                "physical-instability, standard Frenet-tube, or worldtube test."
            ),
            "uncertainty_interpretation": (
                "Rectangular sensitivity envelope from reported marginal uncertainty scales; "
                "not a joint confidence region. Parameter covariance is not supplied."
            ),
        },
        "counts": {
            "events": len(rows),
            "central_pass": sum(r["central_apex_status"] == "PASS" for r in rows),
            "central_fail": sum(r["central_apex_status"] == "FAIL" for r in rows),
            "robust_pass_within_reported_marginal_bands": sum(
                r["marginal_band_status"].startswith("ROBUST_APEX_IMMERSION_PASS") for r in rows
            ),
            "robust_fail_within_reported_marginal_bands": sum(
                r["marginal_band_status"].startswith("ROBUST_APEX_IMMERSION_FAIL") for r in rows
            ),
            "indeterminate_within_reported_marginal_bands": sum(
                r["marginal_band_status"].startswith("INDETERMINATE") for r in rows
            ),
        },
        "events": rows,
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
