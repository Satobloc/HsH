#!/usr/bin/env python3
"""Fermilab E989 measured-data Minkowski reference-orbit control.

Not a SAT prediction, not a finite-core worldtube validation, and not a
responsive-medium test. Uses published measured beam/field summary values.
No elastic modulus, filament tension, or spring constant is introduced.

Sources:
- Fermilab Muon g-2 Collaboration, arXiv:2606.17323 (2026), Tables X and XXVIII,
  magic-momentum/orbit parameters, and the electric-field correction equation.
- CODATA 2022: shielded proton gyromagnetic ratio in water at 25 C,
  42.57638543(17) MHz/T; muon mass 1.883531627(42)e-28 kg.
"""

import json
import math

# Exact SI definitions
c = 299_792_458.0
e = 1.602_176_634e-19

# CODATA 2022
m_mu = 1.883_531_627e-28
u_m_mu = 0.000_000_042e-28
gamma_p_sh = 42.576_385_43e6       # Hz/T
u_gamma_p_sh = 0.17                # Hz/T

# E989 reference orbit, nominal values from the 2026 final report
gamma = 29.3
p0_GeV_c = 3.094
R0_m = 7.112
n = 0.108
beta = math.sqrt(1.0 - 1.0 / gamma**2)
v = beta * c
p0_SI = p0_GeV_c * 1e9 * e / c

# Table XXVIII: muon-weighted NMR frequency, Hz; quoted table uncertainty, Hz
field_data = {
    "noRF": (61_790_920.0, 3.5),
    "xRF": (61_790_938.9, 3.5),
    "xyRF5": (61_790_910.9, 3.5),
    "xyRF6": (61_790_903.6, 3.5),
}

# Table X: electric-field correction Ce, ppb
ce_data = {
    "noRF": (382.1, 26.8),
    "xRF": (317.6, 25.5),
    "xyRF5": (329.5, 28.3),
    "xyRF6": (326.6, 25.2),
    "Run4_5_6_combined": (347.0, 27.0),
}


def field_result(f_hz, u_f_hz):
    B = f_hz / gamma_p_sh
    u_rel = math.hypot(u_f_hz / f_hz, u_gamma_p_sh / gamma_p_sh)
    F = e * v * B
    return {
        "f_p_Hz": f_hz,
        "u_f_p_Hz_table": u_f_hz,
        "B_T": B,
        "u_B_T_table_plus_CODATA": B * u_rel,
        "u_B_relative_ppb": u_rel * 1e9,
        "F_qvB_N": F,
        "u_F_field_only_N": F * u_rel,
    }


def spread_result(Ce_ppb, u_Ce_ppb):
    # Ce = 2 n beta^2/(1-n) <delta^2>
    Ce = Ce_ppb * 1e-9
    mean_delta2 = Ce * (1.0 - n) / (2.0 * n * beta**2)
    rms_delta = math.sqrt(mean_delta2)
    rel_u = 0.5 * u_Ce_ppb / Ce_ppb
    # Ce = 2 n (1-n) beta^2 <x_e^2>/R0^2
    rms_x = R0_m * rms_delta / (1.0 - n)
    return {
        "Ce_ppb": Ce_ppb,
        "u_Ce_ppb": u_Ce_ppb,
        "rms_fractional_momentum_offset": rms_delta,
        "u_rms_fractional_offset_Ce_only": rms_delta * rel_u,
        "rms_p_MeV_c": p0_GeV_c * rms_delta * 1000.0,
        "u_rms_p_MeV_c_Ce_only": p0_GeV_c * rms_delta * rel_u * 1000.0,
        "rms_effective_horizontal_offset_mm": rms_x * 1000.0,
        "u_rms_effective_horizontal_offset_mm_Ce_only": (
            rms_x * rel_u * 1000.0
        ),
    }


fields = {k: field_result(*v) for k, v in field_data.items()}
spreads = {k: spread_result(*v) for k, v in ce_data.items()}

# noRF reference-orbit Minkowski control
B = fields["noRF"]["B_T"]
F_lab = fields["noRF"]["F_qvB_N"]
F_pv_over_R = p0_SI * v / R0_m
B_from_pR = p0_SI / (e * R0_m)
R_from_pB = p0_SI / (e * B)

kappa_spatial = 1.0 / R0_m
kappa_w = beta**2 / R0_m                 # |d^2 x/dw^2|, w = c t
kappa_M = gamma**2 * beta**2 / R0_m      # Minkowski proper-time curvature
rho_M = 1.0 / kappa_M
a_lab = v**2 / R0_m
a_proper = gamma**2 * a_lab
muc2 = m_mu * c**2

# Force-form cross-checks. These inherit the rounded p0 and R0 inputs.
kappa_w_force = F_lab / (gamma * muc2)
kappa_M_force = gamma * F_lab / muc2

result = {
    "classification": {
        "system": "Fermilab E989 positive-muon storage ring",
        "frame": "Minkowski reference-orbit control, w = c t",
        "not_claimed": [
            "SAT prediction",
            "native HsH ++++ curvature",
            "finite-core worldtube validation",
            "responsive-medium validation",
            "elastic modulus, filament tension, or spring constant",
        ],
        "fit_status": "no fit; no independent prediction",
        "data_status": "published summary values, not raw shot-level events",
    },
    "inputs": {
        "gamma_magic_nominal": gamma,
        "beta_derived": beta,
        "p0_GeV_c_nominal": p0_GeV_c,
        "R0_m_nominal": R0_m,
        "field_index_n_approx": n,
        "muon_mass_kg_CODATA2022": m_mu,
        "muon_mass_u_kg_CODATA2022": u_m_mu,
        "gamma_p_shielded_Hz_T": gamma_p_sh,
        "u_gamma_p_shielded_Hz_T": u_gamma_p_sh,
    },
    "measured_field_datasets": fields,
    "Ce_inferred_beam_offsets": spreads,
    "noRF_reference_orbit": {
        "B_from_p0_R0_T": B_from_pR,
        "R_from_p0_B_m": R_from_pB,
        "R_reference_m": R0_m,
        "R_residual_mm": (R_from_pB - R0_m) * 1000.0,
        "R_residual_ppm": (R_from_pB - R0_m) / R0_m * 1e6,
        "F_from_qvB_N": F_lab,
        "F_from_pv_over_R_N": F_pv_over_R,
        "F_residual_ppm": (F_lab - F_pv_over_R) / F_lab * 1e6,
        "cyclotron_frequency_Hz": v / R0_m / (2.0 * math.pi),
        "spatial_path_curvature_m_inv": kappa_spatial,
        "w_ct_coordinate_curvature_m_inv": kappa_w,
        "Minkowski_proper_worldline_curvature_m_inv": kappa_M,
        "Minkowski_proper_curvature_radius_mm": rho_M * 1000.0,
        "curvature_ratio_gamma_squared": gamma**2,
        "lab_acceleration_m_s2": a_lab,
        "proper_acceleration_m_s2": a_proper,
        "kappa_w_from_force_m_inv": kappa_w_force,
        "kappa_M_from_force_m_inv": kappa_M_force,
        "proper_force_N": gamma * F_lab,
        "u_F_field_only_N": fields["noRF"]["u_F_field_only_N"],
    },
    "RF_comparison": {
        "sigma_p_xRF_over_noRF": (
            spreads["xRF"]["rms_p_MeV_c"] / spreads["noRF"]["rms_p_MeV_c"]
        ),
        "sigma_p_reduction_percent": (
            1.0 - spreads["xRF"]["rms_p_MeV_c"]
            / spreads["noRF"]["rms_p_MeV_c"]
        ) * 100.0,
        "Ce_reduction_percent": (
            1.0 - ce_data["xRF"][0] / ce_data["noRF"][0]
        ) * 100.0,
        "field_change_xRF_vs_noRF_ppm": (
            fields["xRF"]["B_T"] / fields["noRF"]["B_T"] - 1.0
        ) * 1e6,
    },
    "uncertainty_limits": {
        "report_text_field_uncertainty_ppb_range": [48.0, 51.0],
        "table_noRF_frequency_uncertainty_implied_ppb": (
            fields["noRF"]["u_B_relative_ppb"]
        ),
        "field_uncertainty_note": (
            "Table XXVIII's 3.5 Hz on 61.790920 MHz implies about 56.8 ppb; "
            "report prose states 48-51 ppb. Not reconciled; table-derived "
            "value retained conservatively."
        ),
        "Ce_uncertainty_note": (
            "Only quoted Ce uncertainty propagated; n uncertainty and full "
            "covariance not supplied."
        ),
        "orbit_uncertainty_note": (
            "p0, R0 and gamma are nominal/reference values; no full "
            "covariance propagated."
        ),
        "interpretation_note": (
            "RMS momentum offset is inferred from the published Ce formula, "
            "not a raw momentum standard deviation. Effective horizontal "
            "offset is likewise model-derived."
        ),
    },
}

print(json.dumps(result, indent=2, sort_keys=True))
