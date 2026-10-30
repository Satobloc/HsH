#!/usr/bin/env python3
"""Source-faithful GW170817 radius reconstruction from Raithel et al. (2018).

System/data:
- GW170817 binary-neutron-star inspiral, observed 2017-08-17.
- LIGO/Virgo PRX 9, 011001 (2019), Table II: source-frame chirp mass
  1.186 +/- 0.001 Msun; low-spin PhenomPNRT 90% HPD tilde-Lambda [70,720];
  low-spin q lower endpoint 0.73; high-spin q lower endpoint 0.53.
- Raithel, Ozel & Psaltis (2018), arXiv:1803.07687, Eqs. (9)-(12), Table 1.
  Eq. (10) is the q=1 quasi-Newtonian common-radius relation. Eq. (9) adds
  the second-order mass-ratio correction, with O((1-q)^3) omitted.

This is a conditional transform of published posterior summaries. It is not a
new posterior inference, raw-strain analysis, independent prediction, or H(s)H
worldtube-to-Love-number map. The 720 value is a 90% HPD upper endpoint, not a
Gaussian measurement. The q=0.73 result is only the second-order expansion
evaluated at the low-spin q boundary.

The earlier 11.2*(Mc/Msun)*(tildeLambda/800)^(1/6) km expression is retained
only as a legacy comparison. It is not Eq. (6) of Raithel et al.; Eq. (6) is the
Newtonian single-star tidal-deformability expression. The common-radius
calculation is in Eqs. (9)-(12).
"""
from decimal import Decimal, getcontext
import json
import platform

getcontext().prec = 60
D = Decimal
PI = D("3.14159265358979323846264338327950288419716939937510")
C_LIGHT = D("299792458")                    # m s^-1, exact
GM_SUN_NOMINAL = D("1.3271244e20")          # m^3 s^-2, IAU nominal solar GM
GM_SUN_OVER_C2_KM = GM_SUN_NOMINAL / (C_LIGHT*C_LIGHT) / D("1000")
TWO_ONE_FIFTH = ((D(2).ln())/D(5)).exp()
COEFF = (D(15) - PI*PI) / (D(3)*PI*PI)


def pow_real(x: Decimal, p: Decimal) -> Decimal:
    if x <= 0:
        raise ValueError("positive base required")
    return (p*x.ln()).exp()


def xi_of_R(R_km: Decimal, Mc_Msun: Decimal) -> Decimal:
    return TWO_ONE_FIFTH * GM_SUN_OVER_C2_KM * Mc_Msun / R_km


def lambda_equal_mass(R_km: Decimal, Mc_Msun: Decimal) -> Decimal:
    xi = xi_of_R(R_km, Mc_Msun)
    if not (D(0) < xi < D("0.5")):
        raise ValueError("outside physical branch 0 < xi < 1/2")
    return COEFF * pow_real(xi, D(-5)) * pow_real(D(1)-D(2)*xi, D("2.5"))


def delta0(R_km: Decimal, Mc_Msun: Decimal) -> Decimal:
    xi = xi_of_R(R_km, Mc_Msun)
    return (D(3)/D(104)) * pow_real(D(1)-D(2)*xi, D(-2)) * (
        D(-10) + D(94)*xi - D(83)*xi*xi
    )


def lambda_q_second_order(R_km: Decimal, Mc_Msun: Decimal, q: Decimal) -> Decimal:
    return lambda_equal_mass(R_km, Mc_Msun) * (
        D(1) + delta0(R_km, Mc_Msun)*(D(1)-q)**2
    )


def solve_radius(target_lambda: Decimal, Mc_Msun: Decimal, q: Decimal = D(1)) -> Decimal:
    lo, hi = D("8"), D("20")
    f_lo = lambda_q_second_order(lo, Mc_Msun, q) - target_lambda
    f_hi = lambda_q_second_order(hi, Mc_Msun, q) - target_lambda
    if not (f_lo < 0 and f_hi > 0):
        raise ValueError(f"root not bracketed: f(8)={f_lo}, f(20)={f_hi}")
    for _ in range(240):
        mid = (lo+hi)/2
        f_mid = lambda_q_second_order(mid, Mc_Msun, q) - target_lambda
        if f_mid < 0:
            lo = mid
        else:
            hi = mid
    return (lo+hi)/2


def s(x: Decimal) -> str:
    return str(x.quantize(D("0.000000001")))


# Published GW170817 inputs (source-frame values).
MC = D("1.186")
MC_LOW, MC_HIGH = D("1.185"), D("1.187")
LAMBDA_LOW, LAMBDA_UPPER = D("70"), D("720")
Q_LOW, Q_HIGH = D("0.73"), D("1.00")
Q_HIGH_SPIN_LOW = D("0.53")
RAITHEL_Q_MIN = D("0.70")  # paper's q expansion discussed for 0.7 <= q <= 1

R_Q1 = solve_radius(LAMBDA_UPPER, MC, D(1))
R_Q073 = solve_radius(LAMBDA_UPPER, MC, Q_LOW)
R_Q1_MC_SENS = [
    solve_radius(LAMBDA_UPPER, MC_LOW, D(1)),
    solve_radius(LAMBDA_UPPER, MC_HIGH, D(1)),
]
R_Q073_MC_SENS = [
    solve_radius(LAMBDA_UPPER, MC_LOW, Q_LOW),
    solve_radius(LAMBDA_UPPER, MC_HIGH, Q_LOW),
]
XI_MAIN = xi_of_R(R_Q1, MC)
DELTA_MAIN = delta0(R_Q1, MC)
Q_CORR = DELTA_MAIN*(D(1)-Q_LOW)**2

LOW_SPIN_WAVEFORM_UPPERS = {
    "PhenomPNRT": D("720"),
    "TaylorF2": D("830"),
    "SEOBNRT": D("690"),
    "PhenomDNRT": D("730"),
}
WAVEFORM_RADIUS = {
    name: {
        "q1_km": solve_radius(lam, MC, D(1)),
        "q0p73_second_order_km": solve_radius(lam, MC, Q_LOW),
    }
    for name, lam in LOW_SPIN_WAVEFORM_UPPERS.items()
}

# Reproduce Raithel et al. (2018) Table 1 at Mc=1.188 Msun, q=1.
TABLE1_MC = D("1.188")
TABLE1_PUBLISHED = {
    D("10"): D("143.4"),
    D("11"): D("268.0"),
    D("12"): D("465.8"),
    D("13"): D("764.6"),
}
TABLE1_REPRODUCED = {
    str(R): lambda_equal_mass(R, TABLE1_MC)
    for R in TABLE1_PUBLISHED
}
TABLE1_REL_ERR = {
    str(R): abs(TABLE1_REPRODUCED[str(R)]-TABLE1_PUBLISHED[R])/TABLE1_PUBLISHED[R]
    for R in TABLE1_PUBLISHED
}
Q_CORR_TABLE_R13_Q07 = (
    lambda_q_second_order(D("13"), TABLE1_MC, D("0.7")) /
    lambda_equal_mass(D("13"), TABLE1_MC) - D(1)
)

# Legacy sixth-root fit from the earlier PR body, retained only for comparison.
LEGACY_RADIUS = D("11.2")*MC*pow_real(LAMBDA_UPPER/D("800"), D(1)/D(6))
LEGACY_EFFECTIVE_COEFF = R_Q1/(MC*pow_real(LAMBDA_UPPER/D("800"), D(1)/D(6)))
LEGACY_MINUS_EQ10 = LEGACY_RADIUS-R_Q1

# Executable checks.
assert Q_LOW >= RAITHEL_Q_MIN
assert Q_HIGH_SPIN_LOW < RAITHEL_Q_MIN
assert max(TABLE1_REL_ERR.values()) < D("0.002")
assert abs(Q_CORR_TABLE_R13_Q07-D("0.014")) < D("0.001")
assert D("12.84") < R_Q1 < D("12.86")
assert D("12.81") < R_Q073 < D("12.84")
assert D("0.19") < LEGACY_MINUS_EQ10 < D("0.22")

out = {
    "system": "GW170817 binary neutron-star inspiral, observed 2017-08-17",
    "method": "Raithel-Ozel-Psaltis 2018 quasi-Newtonian common-radius Eq. (10), with Eq. (9) second-order q correction",
    "inputs": {
        "source_frame_chirp_mass_Msun": s(MC),
        "source_frame_chirp_mass_sensitivity_Msun": [s(MC_LOW), s(MC_HIGH)],
        "low_spin_PhenomPNRT_tildeLambda_90pct_HPD": [s(LAMBDA_LOW), s(LAMBDA_UPPER)],
        "low_spin_q_interval": [s(Q_LOW), s(Q_HIGH)],
        "high_spin_q_lower_endpoint": s(Q_HIGH_SPIN_LOW),
        "Raithel_q_expansion_range": [s(RAITHEL_Q_MIN), "1.000000000"],
        "GM_sun_over_c2_km": s(GM_SUN_OVER_C2_KM),
    },
    "Eq10_inversion": {
        "q1_radius_upper_km": s(R_Q1),
        "q1_Mc_sensitivity_km": [s(R_Q1_MC_SENS[0]), s(R_Q1_MC_SENS[1])],
        "q0p73_second_order_radius_km": s(R_Q073),
        "q0p73_Mc_sensitivity_km": [s(R_Q073_MC_SENS[0]), s(R_Q073_MC_SENS[1])],
        "xi_at_q1_root": s(XI_MAIN),
        "delta0_at_q1_root": s(DELTA_MAIN),
        "second_order_tildeLambda_correction_at_q0p73": s(Q_CORR),
        "q0p73_radius_shift_km": s(R_Q073-R_Q1),
    },
    "low_spin_waveform_family_upper_endpoint_radius_km": {
        name: {
            "tildeLambda_upper": s(LOW_SPIN_WAVEFORM_UPPERS[name]),
            "q1": s(v["q1_km"]),
            "q0p73_second_order": s(v["q0p73_second_order_km"]),
        } for name, v in WAVEFORM_RADIUS.items()
    },
    "Raithel_Table1_reproduction_at_Mc_1p188": {
        str(R): {
            "published_tildeLambda": s(TABLE1_PUBLISHED[R]),
            "reproduced_tildeLambda": s(TABLE1_REPRODUCED[str(R)]),
            "relative_error": s(TABLE1_REL_ERR[str(R)]),
        } for R in TABLE1_PUBLISHED
    },
    "q_mass_ratio_check": {
        "R13_q07_second_order_correction": s(Q_CORR_TABLE_R13_Q07),
        "published_Table1_R13_q07_correction_approx": "0.014",
    },
    "legacy_unverified_sixth_root_fit_comparison": {
        "legacy_11p2_radius_km": s(LEGACY_RADIUS),
        "Eq10_q1_radius_km": s(R_Q1),
        "legacy_minus_Eq10_km": s(LEGACY_MINUS_EQ10),
        "effective_Eq10_coefficient_at_this_point": s(LEGACY_EFFECTIVE_COEFF),
        "status": "not found as Eq. (6); retained only as an unverified approximation",
    },
    "limitations": [
        "The 720 value is a 90% HPD upper endpoint, not a Gaussian measurement with a symmetric sigma.",
        "Eq. (10) is a quasi-Newtonian common-radius relation under the paper's equal-mass/equal-radius approximation.",
        "The q=0.73 result uses only the Eq. (9) second-order term; O((1-q)^3) is omitted.",
        "The high-spin q interval extends below the paper's q approximately 0.7-1.0 expansion range; no high-spin radius conversion is made.",
        "The calculation transforms published posterior summaries; it is not a new posterior inference, raw-strain analysis, or independent prediction.",
        "The paper's 6.5% accuracy statement concerns the Yagi-Yunes compactness relation; it is not asserted here as a calibrated 2% radius uncertainty.",
        "No H(s)H worldtube-to-Love-number mapping has been supplied or tested.",
    ],
    "table1_max_relative_error": s(max(TABLE1_REL_ERR.values())),
    "assertions_passed": 9,
    "python": platform.python_version(),
}
print(json.dumps(out, indent=2, sort_keys=True))
