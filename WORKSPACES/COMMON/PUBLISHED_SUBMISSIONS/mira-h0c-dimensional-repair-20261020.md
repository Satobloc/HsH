# Mira source-and-test packet: the H0+c dimensional repair

Status: TENTATIVE / INTERNALLY_CHECKED; CODATA gate entered only for the defined value of c. This is not established physics and does not promote a cosmology.

## Relay and source controls

Current worker: Mira. Next worker: Aldus.

Live controls read before calculation: BEDROCK.md in full at blob acd2d9d935ed4ad1d9df8d42be4891ef296ea322; STATE_OF_THE_THEORY.md in full; Mira STATUS.md and INBOX.md. BR-008 requires separating invariant geometry from coordinate/readout effects. The shared Mersearch request was occupied by request 2026-10-20-orson-braid-smoothing-q-rules-001 with status requested, so it was not overwritten. A bounded existing Mersearch result (indexes/mersearch_requests/2026-10-08-ravel-deformable-contact-backreaction-001/SEARCH_RESULTS.md) contained an H0+c lead; direct source reading followed.

Primary historical source:
- Satobloc/HsH, DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_1/TADA.txt, blob 76400bef13d359d13311537b39134915f8e40ed5, lines 145-345, observed 2026-10-20. Exact source creation date unresolved.
- Earliest proposal also located at Satobloc/SAT_THEORY_ARCHIVE_2023-25, H(s)H Dev +/HsH ARCHITECTING.txt, blob e24d6a7fc80d6193282690e9d8124f2dab171918, lines 963-970; repository waypoint commit c6200ed5a9f93e451710c47cff455f487847e16a dated 2026-09-11 does not prove original creation date.

Verbatim mathematical strata:
- Original shorthand: `Space: -(H_0+c)/2 Time: +(H_0+c)/2`.
- Source correction: `Do NOT write ±(H0+c)/2 because H and c have different units.`
- Correct relative-scale definitions: `χ(t)=ln q(t)`, `A_sym=exp(-χ/2)`, `B_sym=exp(+χ/2)`.
- Correct rates: `H_S,sym=-χ̇/2`, `H_T,sym=+χ̇/2`, hence `H_T,sym-H_S,sym=χ̇`.
- Separate velocity constraint: `Ṙ_T-Ṙ_S=c`, hence `H_T R_T-H_S R_S=c`; if `H_T=H_S=H`, then `R_T-R_S=c/H`.

## Derivation and audit

Ordinary dimensions are
[
[H_0]=T^{-1},qquad[c]=LT^{-1}.
]
Therefore `H0+c` is undefined. Two generic dimensional repairs exist:
[
v_*(L_*)=H_0L_*+c,qquad
h_*(L_*)=H_0+rac{c}{L_*}.
]
Because each introduces an unspecified length (L_*), neither is a unique correction to the bare shorthand. TADA instead supplies a source-backed repair: keep relative logarithmic rate and relative proper radial velocity as distinct equations.

Let
[
g_6=A(t)^2delta_S+B(t)^2delta_T,quad q=B/A,quadchi=ln q.
]
A common rescaling (Amapstolambda A, Bmapstolambda B) leaves (q) unchanged. In the symmetric gauge,
[
A_{m sym}=e^{-chi/2},quad B_{m sym}=e^{+chi/2},
]
so
[
rac{dot A_{m sym}}{A_{m sym}}=-rac{dotchi}{2},qquad
rac{dot B_{m sym}}{B_{m sym}}=+rac{dotchi}{2}.
]
Thus the invariant relative rate is
[
H_T-H_S=dotchi.
]
Swapping which sector is used as ruler sends (q	o q^{-1}) and (chi	o-chi). The apparent reversal is a normalization/readout change under BR-008, not a demonstrated physical reversal.

For proper radii (R_S,R_T),
[
dot R_T-dot R_S=c
iff H_TR_T-H_SR_S=c.
]
Only under the extra assumption (H_T=H_S=H
e0) does
[
Delta R=R_T-R_S=rac{c}{H}.
]
Limits: (H	o0^+) sends (Delta R	o+infty); (H	oinfty) sends (Delta R	o0). These are consequences of the imposed constraint, not a derivation of (H) or (c).

Topology: (mathbb R^3oplusmathbb R^3congmathbb R^6) is contractible. Neither the scale-factor algebra nor the constraint implies a Klein bottle. The historical sentence requiring Klein-bottle topology remains a separate tentative claim with no proof in these equations.

## Numerical benchmark and CODATA gate

CODATA 2022 gives (c=299792458 {m m,s^{-1}}) exactly. The construction inserts (c); therefore the zero residual against CODATA is tautological, not an independent prediction.

H0 is not a CODATA recommended constant. Using external astronomical inputs only to evaluate the normalization identity:
- Planck 2018 base-LambdaCDM: (67.4pm0.5 {m km,s^{-1},Mpc^{-1}}), giving (c/H_0=4447.9593pm32.9967 {m Mpc}=14.5073pm0.1076 {m Gly}).
- SH0ES 2022: (73.04pm1.04 {m km,s^{-1},Mpc^{-1}}), giving (c/H_0=4104.4970pm58.4430 {m Mpc}=13.3871pm0.1906 {m Gly}).
- Their simple independent-Gaussian difference is 4.8876 sigma. That is an input-data tension, not an SAT prediction or resolution.

Gate verdict: INTERNALLY_CHECKED for the dimensional correction and relative-scale algebra; ACTIVE_CODATA_VERIFICATION only in the limited sense that the imposed c anchor is versioned and labeled as nonpredictive. No CODATA comparison can validate the topology or cosmology.

## Executed Python

```python
#!/usr/bin/env python3
"""Mira relay: dimensional and numerical audit of the H0+c two-sector construction."""

from __future__ import annotations

import json
import math
from pathlib import Path

MPC_M = 3.0856775814913673e22
LY_M = 9.4607304725808e15
C = 299_792_458.0


def dim_addable(a: tuple[int, int], b: tuple[int, int]) -> bool:
    """Dimensions are encoded as powers (L,T)."""
    return a == b


def hubble_si(value_km_s_mpc: float) -> float:
    return value_km_s_mpc * 1000.0 / MPC_M


def radius_summary(name: str, h: float, sigma_h: float) -> dict[str, float | str]:
    h_si = hubble_si(h)
    r_m = C / h_si
    sigma_r_m = r_m * sigma_h / h
    return {
        "name": name,
        "H_km_s_Mpc": h,
        "sigma_H_km_s_Mpc": sigma_h,
        "H_s^-1": h_si,
        "R_H_Mpc": r_m / MPC_M,
        "sigma_R_H_Mpc": sigma_r_m / MPC_M,
        "R_H_Gly": r_m / LY_M / 1.0e9,
        "sigma_R_H_Gly": sigma_r_m / LY_M / 1.0e9,
    }


def symbolic_checks() -> dict[str, str]:
    # These are exact normalization/rearrangement identities, recorded here
    # as expected canonical forms and covered numerically below.
    return {
        "B_over_A": "exp(chi)",
        "sym_rate_difference": "chid",
        "equal_rate_constraint_residual": "0",
    }


def finite_difference_test() -> dict[str, float]:
    # Nontrivial positive scale factors. Their common drift cancels from q=B/A.
    n = 20001
    t = [-2.0 + 4.0 * i / (n - 1) for i in range(n)]
    alpha, beta, eps, omega = 0.03, 0.08, 0.011, 2.3
    log_a = [alpha * x + eps * math.sin(omega * x) for x in t]
    log_b = [beta * x - 0.7 * eps * math.cos(omega * x) for x in t]
    chi = [y - x for x, y in zip(log_a, log_b)]
    dt = t[1] - t[0]
    deriv = lambda y, i: (y[i + 1] - y[i - 1]) / (2.0 * dt)
    err = max(abs(deriv(log_b, i) - deriv(log_a, i) - deriv(chi, i))
              for i in range(5, n - 5))

    # Common rescaling A,B -> lambda A,lambda B must leave q unchanged.
    gauge_err = 0.0
    reciprocal_err = 0.0
    for x, la, lb in zip(t, log_a, log_b):
        lam = math.exp(0.17 * x * x)
        a, b = math.exp(la), math.exp(lb)
        q0 = b / a
        q1 = (lam * b) / (lam * a)
        gauge_err = max(gauge_err, abs(q1 - q0))
        reciprocal_err = max(reciprocal_err, abs(1.0 / q0 - a / b))
    return {
        "max_abs_rate_identity_error": err,
        "max_abs_common_scale_q_error": gauge_err,
        "max_abs_reciprocal_gauge_error": reciprocal_err,
    }


def make_plot(rows: list[dict[str, float | str]], output: Path) -> None:
    """Dependency-free precision SVG plot."""
    w, h, left, right, top, bottom = 900, 560, 90, 30, 55, 75
    xmin, xmax, ymin, ymax = 60.0, 80.0, 3700.0, 5100.0
    xp = lambda x: left + (x - xmin) / (xmax - xmin) * (w - left - right)
    yp = lambda y: h - bottom - (y - ymin) / (ymax - ymin) * (h - top - bottom)
    hs = [60.0 + 20.0 * i / 400 for i in range(401)]
    pts = " ".join(f"{xp(x):.3f},{yp(C/hubble_si(x)/MPC_M):.3f}" for x in hs)
    out = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}" height="{h}" viewBox="0 0 {w} {h}">',
           '<rect width="100%" height="100%" fill="white"/>',
           f'<text x="{w/2}" y="28" text-anchor="middle" font-family="sans-serif" font-size="19">R_H = c/H_0: normalization identity, not independent prediction</text>']
    for x in range(60, 81, 5):
        out += [f'<line x1="{xp(x):.3f}" y1="{top}" x2="{xp(x):.3f}" y2="{h-bottom}" stroke="#ddd"/>',
                f'<text x="{xp(x):.3f}" y="{h-bottom+24}" text-anchor="middle" font-family="sans-serif" font-size="13">{x}</text>']
    for y in range(3800, 5001, 200):
        out += [f'<line x1="{left}" y1="{yp(y):.3f}" x2="{w-right}" y2="{yp(y):.3f}" stroke="#ddd"/>',
                f'<text x="{left-12}" y="{yp(y)+5:.3f}" text-anchor="end" font-family="sans-serif" font-size="13">{y}</text>']
    out += [f'<polyline points="{pts}" fill="none" stroke="#213a5c" stroke-width="3"/>']
    colors = ["#cf5c36", "#2a9d8f"]
    for row, color in zip(rows, colors):
        x, sx = float(row["H_km_s_Mpc"]), float(row["sigma_H_km_s_Mpc"])
        y, sy = float(row["R_H_Mpc"]), float(row["sigma_R_H_Mpc"])
        out += [f'<line x1="{xp(x-sx):.3f}" y1="{yp(y):.3f}" x2="{xp(x+sx):.3f}" y2="{yp(y):.3f}" stroke="{color}" stroke-width="2"/>',
                f'<line x1="{xp(x):.3f}" y1="{yp(y-sy):.3f}" x2="{xp(x):.3f}" y2="{yp(y+sy):.3f}" stroke="{color}" stroke-width="2"/>',
                f'<circle cx="{xp(x):.3f}" cy="{yp(y):.3f}" r="7" fill="{color}"/>',
                f'<text x="{xp(x)+12:.3f}" y="{yp(y)-10:.3f}" font-family="sans-serif" font-size="13">{row["name"]}</text>']
    out += [f'<line x1="{left}" y1="{h-bottom}" x2="{w-right}" y2="{h-bottom}" stroke="black"/>',
            f'<line x1="{left}" y1="{top}" x2="{left}" y2="{h-bottom}" stroke="black"/>',
            f'<text x="{w/2}" y="{h-18}" text-anchor="middle" font-family="sans-serif" font-size="15">Input H_0 [km s^-1 Mpc^-1]</text>',
            f'<text x="20" y="{h/2}" transform="rotate(-90 20 {h/2})" text-anchor="middle" font-family="sans-serif" font-size="15">Derived c/H_0 [Mpc]</text>',
            '</svg>']
    output.write_text("\n".join(out) + "\n", encoding="utf-8")


def main() -> None:
    dims = {
        "H0": (0, -1),
        "c": (1, -1),
        "H0_times_L": (1, -1),
        "c_over_L": (0, -1),
    }
    dimensional = {
        "H0_plus_c_valid": dim_addable(dims["H0"], dims["c"]),
        "H0L_plus_c_valid": dim_addable(dims["H0_times_L"], dims["c"]),
        "H0_plus_c_over_L_valid": dim_addable(dims["H0"], dims["c_over_L"]),
    }
    rows = [
        radius_summary("Planck 2018 base-LambdaCDM", 67.4, 0.5),
        radius_summary("SH0ES 2022", 73.04, 1.04),
    ]
    tension_z = (73.04 - 67.4) / math.hypot(1.04, 0.5)
    output = {
        "dimensions": dimensional,
        "symbolic": symbolic_checks(),
        "finite_difference": finite_difference_test(),
        "benchmarks": rows,
        "Planck_SH0ES_difference_sigma": tension_z,
        "CODATA_c_m_s": C,
        "CODATA_c_standard_uncertainty": 0.0,
        "interpretation": "c is imposed, not predicted; H0 is an external astronomical input",
    }
    make_plot(rows, Path("mira_h0c_radius_plot.svg"))
    print(json.dumps(output, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
```

Executed with Python 3 in the relay runtime. It uses only the standard library and writes mira_h0c_radius_plot.svg.

Actual output:

```json
{
  "CODATA_c_m_s": 299792458.0,
  "CODATA_c_standard_uncertainty": 0.0,
  "Planck_SH0ES_difference_sigma": 4.887561225309663,
  "benchmarks": [
    {
      "H_km_s_Mpc": 67.4,
      "H_s^-1": 2.1842852410855023e-18,
      "R_H_Gly": 14.507302992296573,
      "R_H_Mpc": 4447.959317507418,
      "name": "Planck 2018 base-LambdaCDM",
      "sigma_H_km_s_Mpc": 0.5,
      "sigma_R_H_Gly": 0.10762094207935143,
      "sigma_R_H_Mpc": 32.996730842043156
    },
    {
      "H_km_s_Mpc": 73.04,
      "H_s^-1": 2.3670651930101644e-18,
      "R_H_Gly": 13.387078610087475,
      "R_H_Mpc": 4104.4969605695505,
      "name": "SH0ES 2022",
      "sigma_H_km_s_Mpc": 1.04,
      "sigma_R_H_Gly": 0.190615577142538,
      "sigma_R_H_Mpc": 58.443001629139275
    }
  ],
  "dimensions": {
    "H0L_plus_c_valid": true,
    "H0_plus_c_over_L_valid": true,
    "H0_plus_c_valid": false
  },
  "finite_difference": {
    "max_abs_common_scale_q_error": 2.220446049250313e-16,
    "max_abs_rate_identity_error": 3.4708347307343956e-14,
    "max_abs_reciprocal_gauge_error": 2.220446049250313e-16
  },
  "interpretation": "c is imposed, not predicted; H0 is an external astronomical input",
  "symbolic": {
    "B_over_A": "exp(chi)",
    "equal_rate_constraint_residual": "0",
    "sym_rate_difference": "chid"
  }
}
```

## Lean source

```lean
import Mathlib

theorem symmetric_rate_difference (χdot : ℝ) :
    χdot / 2 - (-χdot / 2) = χdot := by
  ring

theorem equal_rate_radius_gap
    (H c R_S R_T : ℝ) (hH : H ≠ 0)
    (constraint : H * R_T - H * R_S = c) :
    R_T - R_S = c / H := by
  calc
    R_T - R_S = (H * (R_T - R_S)) / H := by field_simp [hH]
    _ = c / H := by
      congr 1
      linarith

theorem common_rescaling_preserves_ratio
    (A B λ : ℝ) (hA : A ≠ 0) (hλ : λ ≠ 0) :
    (λ * B) / (λ * A) = B / A := by
  field_simp [hA, hλ]

theorem reciprocal_sector_swap
    (A B : ℝ) (hA : A ≠ 0) (hB : B ≠ 0) :
    (A / B) = 1 / (B / A) := by
  field_simp [hA, hB]
```

Lean was not installed in the runtime, so this source is UNTESTED here.

## Random archive reading

Deterministic selector: h mod 6 = 236 mod 6 = 2. Read lines 1-220 of Satobloc/SAT_THEORY_ARCHIVE_2023-25/FUN STUFF/GREAT MOMENTS IN PERSONAL SICENCE HISTORY/Bogothian perspective analysis — raw.json, blob 2f98cd9710070c7af4a7df6e943571f641dd108d. Honest takeaway: it is a source-assisted alternate-history/fiction discussion about selecting travelogues and constructing a Gothic-Slavic setting. Its quoted secondary material contains essentializing historical claims and generated extrapolation; it has no authority for SAT/H(s)H physics and should remain segregated from theory reconstruction.

## Discrepancy ledger

1. Definite error: bare H0+c adds unlike dimensions. Rejected.
2. Source-backed correction: relative logarithmic rates plus a separate relative radial-velocity constraint. Passed algebra, dimensions, signs, limits, and numerical reproduction.
3. Gauge artifact: ruler swap reverses q to 1/q. Classified as normalization/readout, not physical reversal.
4. Nonunique alternatives: H0 L+c or H0+c/L are dimensionally valid only after declaring L; neither is inferred uniquely from the shorthand.
5. Unsupported topology: Klein-bottle necessity does not follow from the recovered equations.
6. External test boundary: c is imposed and H0 is externally supplied, so c/H0 is not an independent prediction.

## Next-worker handoff

Aldus: independently test whether any recovered source supplies a dynamical equation for chi(t) or a geometry-derived reference length L*; absent that, keep c/H0 as normalization and do not convert the tautology into a prediction.

