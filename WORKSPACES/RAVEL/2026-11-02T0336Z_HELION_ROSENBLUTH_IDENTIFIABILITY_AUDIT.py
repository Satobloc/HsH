#!/usr/bin/env python3
"""Reproduce a diagonal Rosenbluth audit of JLab Hall A E04-018 Table I.

Read-only: no network access and no repository writes. Inputs are transcribed
from Camsonne et al., PRL 119, 162501 (2017), Table I; Table II is used only
as an internal central-value/uncertainty comparison, not as independent data.

The paper's dimensionless magnetic coefficient is reconstructed in the
charge-normalized spin-1/2 convention as
    mu_scatt = (mu_helion / mu_N) * (m_helion / m_p) / Z.
The accepted manuscript does not spell out the unit conversion in the prose;
this convention is inferred from the standard Sachs/Rosenbluth normalization
and checked by reproducing Table II central values. It remains a source-
convention reconstruction, not a quoted independent measurement.

The weighted fits use only diagonal Table I total marginal errors. They are
not a full covariance or normalization analysis. E' is reconstructed from
elastic two-body kinematics using the CODATA helion mass; Q2_eff is the
published Coulomb-corrected value rounded in Table I.
"""
from __future__ import annotations

import json
import math
from collections import defaultdict

SOURCE = {
    "scattering": "Camsonne et al., PRL 119, 162501 (2017), DOI 10.1103/PhysRevLett.119.162501, arXiv:1610.07456v1, Tables I-II",
    "constants": "NIST/CODATA 2022 recommended values",
    "fit_scope": "diagonal weighted least squares on published Table I marginal total errors; no covariance matrix",
}

# CODATA 2022 inputs. Energies in MeV, Q2_eff in fm^-2.
M_HELION_MEV = 2808.39161112
M_PROTON_MEV = 938.27208943
M_HELION_OVER_MP = 2.993152671552
MU_HELION_OVER_MU_N = -2.1276253498  # bare-nucleus recommended value
MU_HELION_OVER_MU_N_SIGMA = 0.0000000017
M_HELION_OVER_MP_SIGMA = 0.000000000070
ALPHA = 7.2973525643e-3
HBARC_MEV_FM = 197.3269804
Z = 2

MASS_SCALE = M_HELION_OVER_MP / Z
MU_SCATTERING = MU_HELION_OVER_MU_N * MASS_SCALE
MU_SCATTERING_SIGMA = abs(MU_SCATTERING) * math.sqrt(
    (MU_HELION_OVER_MU_N_SIGMA / abs(MU_HELION_OVER_MU_N)) ** 2
    + (M_HELION_OVER_MP_SIGMA / M_HELION_OVER_MP) ** 2
)

# Table I: E [GeV], theta [deg], Q2_eff [fm^-2], dσ/dΩ [cm^2/sr],
# total quoted marginal error [cm^2/sr]. These are measured data, not fixtures.
TABLE_I = [
    (3.304, 17.52, 24.7, 2.29e-35, 0.12e-35),
    (0.7391, 97.78, 24.7, 2.80e-37, 0.20e-37),
    (3.304, 19.50, 30.2, 5.16e-36, 0.29e-36),
    (0.7391, 118.99, 30.2, 3.95e-38, 0.38e-38),
    (0.6876, 139.99, 30.2, 1.51e-38, 0.19e-38),
    (3.304, 20.83, 34.1, 1.57e-36, 0.10e-36),
    (0.8157, 113.01, 34.1, 1.43e-38, 0.13e-38),
    (0.7394, 139.91, 34.1, 6.41e-39, 0.59e-39),
    (3.304, 22.82, 40.2, 3.03e-37, 0.21e-37),
    (0.8177, 139.53, 40.2, 1.24e-39, 0.16e-39),
    (3.304, 24.28, 45.0, 7.56e-38, 0.75e-38),
    (0.9330, 119.94, 45.0, 6.84e-40, 1.10e-40),
    (0.8726, 140.66, 45.0, 3.24e-40, 0.51e-40),
    (3.304, 25.47, 49.0, 2.13e-38, 0.35e-38),
    (3.304, 27.24, 55.1, 2.77e-39, 0.39e-39),
    (0.9893, 140.31, 55.1, 3.27e-41, 0.13e-41),
    (3.304, 28.86, 60.8, 2.14e-40, 0.72e-40),
    (1.052, 140.51, 60.8, 1.13e-41, 0.80e-41),
]

# Table II: |F_C|, sigma(|F_C|), |F_M|, sigma(|F_M|).
TABLE_II = {
    24.7: (2.65e-3, 0.06e-3, 6.03e-4, 0.91e-4),
    30.2: (1.58e-3, 0.05e-3, 4.21e-4, 0.75e-4),
    34.1: (9.73e-4, 0.34e-4, 3.07e-4, 0.35e-4),
    40.2: (5.32e-4, 0.21e-4, 1.24e-4, 0.27e-4),
    45.0: (3.02e-4, 0.16e-4, 6.37e-5, 1.83e-5),
    49.0: (1.81e-4, 0.15e-4, None, None),
    55.1: (6.97e-5, 0.72e-5, 3.34e-5, 1.00e-5),
    60.8: (1.00e-5, 2.10e-5, 2.34e-5, 0.90e-5),
}


def row_to_reduced(row: tuple[float, float, float, float, float], mu: float) -> dict:
    e_gev, theta_deg, q2_eff, sigma, dsigma = row
    e = e_gev * 1000.0
    theta = math.radians(theta_deg)
    s = math.sin(theta / 2.0)
    c = math.cos(theta / 2.0)
    e_prime = e / (1.0 + 2.0 * e / M_HELION_MEV * s * s)
    tau = q2_eff * HBARC_MEV_FM**2 / (4.0 * M_HELION_MEV**2)
    epsilon = 1.0 / (1.0 + 2.0 * (1.0 + tau) * math.tan(theta / 2.0) ** 2)
    sigma_ns_natural = (Z * ALPHA) ** 2 * e_prime * c * c / (4.0 * e**3 * s**4)
    sigma_ns_cm2 = sigma_ns_natural * HBARC_MEV_FM**2 * 1e-26
    reduced = sigma / sigma_ns_cm2 * (1.0 + tau)
    d_reduced = dsigma / sigma_ns_cm2 * (1.0 + tau)
    x = mu**2 * tau / epsilon
    return {
        "E_GeV": e_gev,
        "theta_deg": theta_deg,
        "Q2eff_fm-2": q2_eff,
        "sigma_cm2_sr": sigma,
        "dsigma_cm2_sr": dsigma,
        "Eprime_reconstructed_MeV": e_prime,
        "tau": tau,
        "epsilon": epsilon,
        "x_mu2tau_over_epsilon": x,
        "sigma_NS_cm2_sr": sigma_ns_cm2,
        "reduced_sigma": reduced,
        "d_reduced_sigma_diagonal": d_reduced,
        "relative_cross_section_error": dsigma / sigma,
    }


def fit_group(group: list[dict]) -> dict:
    n = len(group)
    s = sum(1.0 / r["d_reduced_sigma_diagonal"]**2 for r in group)
    sx = sum(r["x_mu2tau_over_epsilon"] / r["d_reduced_sigma_diagonal"]**2 for r in group)
    sxx = sum(r["x_mu2tau_over_epsilon"]**2 / r["d_reduced_sigma_diagonal"]**2 for r in group)
    sy = sum(r["reduced_sigma"] / r["d_reduced_sigma_diagonal"]**2 for r in group)
    sxy = sum(r["x_mu2tau_over_epsilon"] * r["reduced_sigma"] / r["d_reduced_sigma_diagonal"]**2 for r in group)
    determinant = s * sxx - sx * sx
    rank = 2 if n >= 2 and determinant > 0.0 else 1
    dof = n - rank
    out = {
        "n_angles": n,
        "rank": rank,
        "residual_dof": dof,
        "x_values": [r["x_mu2tau_over_epsilon"] for r in group],
        "relative_error_range": [
            min(r["relative_cross_section_error"] for r in group),
            max(r["relative_cross_section_error"] for r in group),
        ],
    }
    if rank < 2:
        out.update({"condition_number_column_normalized": None, "chi2": None})
        return out

    fc_sq = (sxx * sy - sx * sxy) / determinant
    fm_sq = (s * sxy - sx * sy) / determinant
    cov_fc_sq = sxx / determinant
    cov_fm_sq = s / determinant
    cov_cross = -sx / determinant
    fc = math.sqrt(fc_sq) if fc_sq > 0.0 else None
    fm = math.sqrt(fm_sq) if fm_sq > 0.0 else None
    fc_sigma = math.sqrt(cov_fc_sq) / (2.0 * fc) if fc else None
    fm_sigma = math.sqrt(cov_fm_sq) / (2.0 * fm) if fm else None
    correlation = cov_cross / math.sqrt(cov_fc_sq * cov_fm_sq)
    chi2 = sum(
        ((r["reduced_sigma"] - fc_sq - fm_sq * r["x_mu2tau_over_epsilon"])
         / r["d_reduced_sigma_diagonal"]) ** 2
        for r in group
    )
    rho = sx / math.sqrt(s * sxx)
    condition = math.sqrt((1.0 + abs(rho)) / (1.0 - abs(rho)))
    out.update({
        "condition_number_column_normalized": condition,
        "chi2_diagonal": chi2,
        "FC_abs_fit": fc,
        "FC_sigma_diagonal_delta_method": fc_sigma,
        "FM_abs_fit": fm,
        "FM_sigma_diagonal_delta_method": fm_sigma,
        "corr_FC2_FM2_diagonal": correlation,
    })
    return out


def analyze(mu: float) -> dict:
    groups = defaultdict(list)
    for row in TABLE_I:
        reduced = row_to_reduced(row, mu)
        groups[reduced["Q2eff_fm-2"]].append(reduced)
    result = {}
    for q2 in sorted(groups):
        fit = fit_group(groups[q2])
        t2 = TABLE_II[q2]
        fit["FC_abs_TableII"] = t2[0]
        fit["FC_sigma_TableII"] = t2[1]
        fit["FM_abs_TableII"] = t2[2]
        fit["FM_sigma_TableII"] = t2[3]
        if fit.get("FC_abs_fit") is not None:
            fit["FC_relative_central_difference_vs_TableII"] = (fit["FC_abs_fit"] - t2[0]) / t2[0]
        if fit.get("FM_abs_fit") is not None and t2[2] is not None:
            fit["FM_relative_central_difference_vs_TableII"] = (fit["FM_abs_fit"] - t2[2]) / t2[2]
        if fit.get("FM_sigma_diagonal_delta_method") is not None and t2[3] is not None:
            fit["FM_TableII_sigma_over_diagonal_sigma"] = t2[3] / fit["FM_sigma_diagonal_delta_method"]
        result[str(q2)] = fit
    return result


def main() -> None:
    corrected = analyze(MU_SCATTERING)
    naive = analyze(MU_HELION_OVER_MU_N)
    out = {
        "source": SOURCE,
        "constants": {
            "M_helion_MeV": M_HELION_MEV,
            "m_proton_MeV": M_PROTON_MEV,
            "m_helion_over_m_proton": M_HELION_OVER_MP,
            "m_helion_over_Z_m_proton": MASS_SCALE,
            "mu_helion_over_muN_bare": MU_HELION_OVER_MU_N,
            "mu_helion_over_muN_sigma": MU_HELION_OVER_MU_N_SIGMA,
            "mu_paper_dimensionless_reconstructed": MU_SCATTERING,
            "mu_paper_sigma_from_constants": MU_SCATTERING_SIGMA,
            "alpha": ALPHA,
            "hbarc_MeV_fm": HBARC_MEV_FM,
        },
        "data_count": len(TABLE_I),
        "corrected_normalization_fits": corrected,
        "naive_insert_muN_directly_fits": naive,
        "interpretation": {
            "q2_24_7": "JLab-only fit omits the interpolated 160-degree MIT/Bates point used in the paper's final Table II extraction.",
            "q2_49_0": "One forward-angle point: rank 1, no independent two-form-factor separation; Table II has no FM extraction.",
            "q2_55_1": "Diagonal WLS reproduces the central magnitudes but its FM sigma is about 6.9 times smaller than Table II; full covariance/normalization or original fit details are needed.",
            "two_angle_bins": "Exactly two points for two squared-form-factor parameters give zero residual degrees of freedom.",
            "sign": "One-photon Rosenbluth data determine magnitudes/squares, not independent signs.",
        },
    }
    # Reproducibility guards: actual published data coverage and key source checks.
    assert out["data_count"] == 18
    assert corrected["49.0"]["rank"] == 1
    assert corrected["49.0"]["FM_abs_TableII"] is None
    for q in ("30.2", "34.1", "40.2", "45.0", "55.1", "60.8"):
        assert abs(corrected[q]["FC_relative_central_difference_vs_TableII"]) < 0.03
        assert abs(corrected[q]["FM_relative_central_difference_vs_TableII"]) < 0.03
    assert 6.5 < corrected["55.1"]["FM_TableII_sigma_over_diagonal_sigma"] < 7.5
    assert corrected["60.8"]["FC_sigma_diagonal_delta_method"] > corrected["60.8"]["FC_abs_fit"]
    print(json.dumps(out, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
