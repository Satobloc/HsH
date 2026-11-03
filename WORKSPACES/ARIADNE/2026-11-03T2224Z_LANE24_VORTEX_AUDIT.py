#!/usr/bin/env python3
"""Source-anchored nominal audit of published bathtub-vortex parameter sets.

No raw experimental files are ingested. This reproduces the PRL Rankine
small-k asymptote, the Nature hollow-core comparator, and nominal local-flow
geometry descriptors. It does not solve the full Bessel dispersion relation,
reproduce the six-wave resonance curves, or validate H(s)H.
"""
import itertools
import json
import math

PI = math.pi
EULER_GAMMA = 0.5772156649015329

# PRL Fig. 5: published asymptotic inputs and fixed wavenumbers.
PRL_FIG5 = {"a0_m": 1.30e-3, "Gamma_m2_s": 0.018, "k_m_inv": [50.0, 60.0, 70.0]}
# PRL Fig. 2 caption: separate parameter set; prose/caption sign convention unresolved.
PRL_FIG2 = {"a0_m": 1.47e-3, "Gamma_m2_s": 0.018, "vz_m_s": -0.63}
# Nature Fig. 3b: dispersion-fit set, checked a posteriori against PIV/PTV.
NATURE_FIG3B = {"a0_m": 1.90e-3, "Gamma_m2_s": 0.022, "vz_m_s": 0.57}
# Typical Nature Methods uncertainties; no covariance and not a formal CI.
NATURE_UNCERT = {"da0_m": 0.10e-3, "dGamma_m2_s": 0.005, "dvz_m_s": 0.05}


def omega_small_k(gamma, a0, k, rankine):
    c = 0.25 if rankine else 0.0
    return -(gamma / (4 * PI)) * k**2 * (math.log(2 / (k * a0)) - EULER_GAMMA + c)


def flow_geometry(a0, gamma, vz):
    vtheta = gamma / (2 * PI * a0)
    omega0 = gamma / (2 * PI * a0**2)
    q = abs(vz) / vtheta
    pitch = 2 * PI * a0 * q
    return {
        "Omega0_s_inv": omega0,
        "vtheta_at_a0_m_s": vtheta,
        "abs_vz_over_vtheta": q,
        "pitch_angle_deg": math.degrees(math.atan(q)),
        "pitch_per_revolution_mm": 1000 * pitch,
        "pitch_over_core_diameter": pitch / (2 * a0),
    }


rows = []
for k in PRL_FIG5["k_m_inv"]:
    a0, gamma = PRL_FIG5["a0_m"], PRL_FIG5["Gamma_m2_s"]
    wR = omega_small_k(gamma, a0, k, True)
    wH = omega_small_k(gamma, a0, k, False)
    fR, fH = abs(wR) / (2 * PI), abs(wH) / (2 * PI)
    fD_cond = abs(k * PRL_FIG2["vz_m_s"]) / (2 * PI)
    # Sensitivity only: vary a0 to the separate PRL Fig. 2 value, holding Gamma and k fixed.
    f147 = abs(omega_small_k(gamma, PRL_FIG2["a0_m"], k, True)) / (2 * PI)
    rows.append({
        "f_Rankine_if_a0_147mm_only_sensitivity_Hz": f147,
        "a0_147_vs_130mm_frequency_change_percent": 100 * (f147 / fR - 1),
        "k_m_inv": k,
        "ka0": k * a0,
        "wavelength_cm": 100 * 2 * PI / k,
        "f_Rankine_asymptote_Hz": fR,
        "f_hollow_asymptote_Hz": fH,
        "Rankine_increase_percent": 100 * (fR / fH - 1),
        "conditional_Doppler_scale_Hz_if_Fig2_vz_reused": fD_cond,
        "conditional_Doppler_over_intrinsic": fD_cond / fR,
    })

# Rectangular corner envelope around Nature's fit set using typical method
# uncertainties. This is not a confidence interval and assumes no covariance.
a0, gamma, vz = (NATURE_FIG3B[k] for k in ("a0_m", "Gamma_m2_s", "vz_m_s"))
da, dg, dv = (NATURE_UNCERT[k] for k in ("da0_m", "dGamma_m2_s", "dvz_m_s"))
angles = [
    flow_geometry(a, g, v)["pitch_angle_deg"]
    for a, g, v in itertools.product((a0-da, a0+da), (gamma-dg, gamma+dg), (vz-dv, vz+dv))
]

result = {
    "equations": {
        "PRL_Rankine": "omega=-Gamma*k^2/(4*pi)*(ln(2/(k*a0))-EulerGamma+1/4)",
        "Nature_hollow_core": "omega=-Gamma*k^2/(4*pi)*(ln(2/(k*a0))-EulerGamma)",
    },
    "inputs": {"PRL_Fig5": PRL_FIG5, "PRL_Fig2": PRL_FIG2, "Nature_Fig3b_fit": NATURE_FIG3B,
               "Nature_typical_uncertainties": NATURE_UNCERT},
    "PRL_Fig5_small_k_results": rows,
    "nominal_flow_geometry": {
        "PRL_Fig2_caption_set": flow_geometry(PRL_FIG2["a0_m"], PRL_FIG2["Gamma_m2_s"], PRL_FIG2["vz_m_s"]),
        "Nature_Fig3b_fit_set": flow_geometry(NATURE_FIG3B["a0_m"], NATURE_FIG3B["Gamma_m2_s"], NATURE_FIG3B["vz_m_s"]),
    },
    "Nature_pitch_sensitivity_envelope_deg": [min(angles), max(angles)],
    "limits": [
        "PRL Fig. 5 uses the full Rankine equation for resonance curves; this is only its printed small-k asymptote.",
        "PRL Fig. 5 does not restate vz; the Doppler scale is conditional on reusing the Fig. 2 caption value.",
        "PRL vz sign convention is unresolved; magnitude only is used for the pitch descriptor.",
        "Nature Fig. 3b Gamma and vz are dispersion-fit parameters checked a posteriori, not blind holdout predictions.",
        "Nature uncertainty envelope is a rectangular sensitivity bound, not a formal confidence interval; covariance is unavailable.",
        "PRL raw data are not public; Nature Figshare raw bytes/version metadata were not retrieved.",
        "No six-wave curve, full Bessel root, CODATA comparison, or H(s)H prediction is claimed.",
    ],
    "codata": "No CODATA evaluated or adjusted quantity used; Euler's constant is mathematical.",
}
assert [round(r["f_Rankine_asymptote_Hz"], 6) for r in rows] == [1.766389, 2.393968, 3.086261]
print(json.dumps(result, indent=2, sort_keys=True))
