# Hale packet — historical PGCU/Hubble-constant audit

**Status:** source recovery complete; algebra reproduced; basic physics gate **FAILED / UNRESOLVED**. This is an audit of an archived construction, not a BEDROCK amendment, not a physical validation, and not an established SAT/H(s)H prediction.

## 1. Control and reading record

- `BEDROCK.md`: read in full, 441 lines / 62,982 characters; blob `54b893a1b10206f088f54dae961cc03d37012bac`.
- `STATE_OF_THE_THEORY.md`: read in full, 155 lines / 11,012 characters; blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. It was treated as subordinate to BEDROCK.
- Hale checkpoint `WORKSPACES/SABLE/WAKE_PACKETS/REV-006-HALE-REENTRY.md`: read in full, 105 lines / 7,164 characters; blob `2840500bec1873fc634e564f83d7eda7d1da74f0`. Hale's preserved method is external-evidence scanning, code/statistics, and control/calibration discipline; the identity is access-unverified and no execution lease is inferred.
- Mersearch request surface was occupied by request `2026-10-20-orson-braid-smoothing-q-rules-001`, status `requested`; GitHub source search was therefore used as the disclosed fallback. No overwrite was attempted.
- Random substantial reading, selected by `shuf` from eight substantial archive candidates: `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/🧱PREDICTIONS 2.txt`, read in full, 707 lines / 47,503 characters; blob `7e4238d292e2aa113d3daea159ef85b2e15be969`; repository commit date 2026-10-08, commit `6e4415f62616b19ae5cb677984c85d1985834d9d`. Honest takeaway: the file repeatedly labels standard weak-field GR, Bernoulli, hoop-stress, linear-response, and QFT formulas as direct consequences of an unspecified SAT action. It is useful as a map of proposed bridges, but it does not supply the missing variations, constitutive maps, or calibration independence needed to certify those bridges.

This packet follows ND-2026-10-18-03/05/06, BR-007/008, ND-2026-10-20-01/02, and the no-promotion rule. It conflicts with BEDROCK if the archived number is called a current prediction, if the expanding geometry is treated as proved, or if a dimensionful normalization is hidden.

## 2. Historical source chain and exact locators

1. `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT_PGCU_Integration.txt`, full 52 lines / 3,983 characters, blob `607a76f3ee972319a76b25a2626189521f5ef0ed`, repository commit 2026-10-01 `dffebc7923fcb88f4be48eccba3f2d1f8704c365`.
2. `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT MATH.txt`, full 89 lines / 8,733 characters, blob `1c77e73f87343002cddd57a406c231a187cef38f`, repository commit 2026-10-01 `a6735b603ac4e9296efa00413b8948e5ea7088f0`.
3. `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/sat_bigpaper_pdfcopy.txt`, full 3,706 lines / 203,073 characters, blob `d50427f21539ca983bc0a1344dc13aa24936c6b5`, internally dated June 2025, repository commit 2026-10-08 `219a98bb615c927968dba9830235807a35761939`.

Terminology track, without supersession: the construction appears as **Projection Geometry & Cosmological Unfolding (PGCU)**, **projective resistance**, **angular resistance**, and later a **resistance-derived expansion**. These are treated as historically related labels, not as proof that the objects are identical.

Verbatim source mathematics:

\[
H_{\text{SAT}}(z) = \frac{1}{R(z)} \cdot \frac{1}{\mathcal{R}(R(z))}
\]

\[
H_{\rm SAT}(t)=\frac{1}{R(t)}\frac{dR}{dt}
=\frac{1}{R(t)}\frac{1}{\mathcal R(R(t))}
\]

\[
\mathcal R(r)=\rho_{\rm link}(r)\,
\frac{1}{|\cos\theta_4(r)|+\epsilon(1+\alpha\tau(r))}
\]

\[
I(R)=\int_0^R \rho_{\rm link}(r)4\pi r^2\,dr,
\qquad
W(R)=\int_0^R \rho_{\rm link}(r)\theta_4(r)4\pi r^2\,dr.
\]

The numerical source statement is

\[
H_0\approx71.2\pm0.5\ {m km\,s^{-1}\,Mpc^{-1}},
\qquad S_8\approx0.772\pm0.018.
\]

No recovered source gives the parameter values, dataset, likelihood, covariance, or executed code that maps the displayed resistance equations to `71.2 ± 0.5`.

## 3. Exact algebra and dimensional test

Let

\[
D(r)=|\cos\theta_4(r)|+\epsilon(1+\alpha\tau(r)).
\]

Where denominators are nonzero, the displayed equations reduce exactly to

\[
H_{\rm SAT}(R)=\frac{D(R)}{R\rho_{\rm link}(R)}.
\]

The cumulative intersection count is presented as a count, so `[I]=1` forces

\[
[\rho_{\rm link}]=L^{-3}.
\]

If `D` is dimensionless, as required by the sum of a cosine and the `epsilon` term, then

\[
[\mathcal R]=L^{-3},\qquad
\left[\frac1{R\mathcal R}\right]=L^2,
\]

but a Hubble rate requires `[H]=T^{-1}`. Equivalently, the identity `dR/dt=1/\mathcal R` requires `[\mathcal R]=T/L`. The two definitions conflict. This is a definite dimensional failure of the equations as written.

There is no unique correction. One could redefine `rho_link`, insert a conversion coefficient with dimensions `L^2T`, or change the resistance law; those are inequivalent models. Under the no-invention rule, none is silently chosen.

## 4. Limit, sign, topology, and identifiability tests

For positive `R`, `rho_link`, and `D`, the literal model has `H>0`. Positivity therefore requires domain conditions absent from the source, notably `D>0`; if `epsilon(1+alpha*tau)` can be negative, a zero or sign change is possible.

The crucial limit is

\[
\rho_{\rm link}\to0^+quad\Longrightarrow\quad
\mathcal R\to0^+,
\quad H_{\rm SAT}\to+\infty.
\]

That contradicts the same source's prose that diminishing intersection density produces asymptotic coasting and “prevents divergence.” Other literal limits are `rho_link→∞ => H→0` and, at fixed positive density, `D→0+ => H→0`.

Topology is not established by these formulas. `I(R)` is a density integral and `W(R)` is an angle-weighted density integral; neither is invariant under a general deformation unless an additional conserved current, measure, and boundary conditions are proved. Calling the inputs “link density” does not by itself make the cosmological output topological.

Numerically the construction is non-identifiable. One scalar datum `H0` cannot determine `R0, rho0, theta0, epsilon, alpha, tau`, and

\[
H(R,\rho)=H(\lambda R,\rho/\lambda),\qquad \lambda>0,
\]

so even the literal algebra has a continuous scale degeneracy. The reported uncertainty `±0.5` is not reproducible without a likelihood and input covariance. The number must therefore remain an archived fit/compatibility assertion, not an independent prediction.

## 5. External benchmark and CODATA gate

The Planck 2018 base-flat-ΛCDM inference is `67.4 ± 0.5 km s^-1 Mpc^-1` (Planck Collaboration, arXiv:1807.06209). The SH0ES Cepheid–supernova baseline is `73.04 ± 1.04 km s^-1 Mpc^-1` (Riess et al., arXiv:2112.04510). These are method- and model-dependent comparators, not CODATA constants.

Using the source's unsupported `0.5` as though it were an independent Gaussian standard uncertainty gives illustrative residuals only:

| comparator | delta (SAT − comparator) | combined z | data-only z |
|---|---:|---:|---:|
| Planck 2018 | +3.800 | +5.374012 | +7.600000 |
| SH0ES 2022 | −1.840 | −1.594524 | −1.769231 |

Conversion of the nominal claim gives

\[
H_0=2.307434854084388\times10^{-18}\ {m s^{-1}},
\]

\[
H_0^{-1}=13.733036821\ {m Gyr},\qquad
c/H_0=1.299245599369090\times10^{26}\ {m m}
=13.733036821\ {m Gly},
\]

using exact SI `c = 299792458 m/s`. CODATA does not provide a recommended `H0`; therefore an “H0 versus CODATA” residual would be a category error. The active CODATA verification gate is **NOT ENTERED** because the basic dimensional and limit tests fail. The exact value of `c` is used only for unit translation, not validation.

## 6. Reproduction code (complete)

```python
#!/usr/bin/env python3
"""Reproduce the bounded PGCU/H0 audit with no fitted SAT parameters."""

from __future__ import annotations

import argparse
import math
from pathlib import Path

MPC_M = 3.0856775814913673e22
C_M_S = 299_792_458.0  # exact SI value
JULIAN_YEAR_S = 365.25 * 86_400.0


def h0_si(h_km_s_mpc: float) -> float:
    return h_km_s_mpc * 1_000.0 / MPC_M


def combined_z(pred: float, pred_u: float, obs: float, obs_u: float) -> float:
    return (pred - obs) / math.hypot(pred_u, obs_u)


def data_only_z(pred: float, obs: float, obs_u: float) -> float:
    return (pred - obs) / obs_u


def h_raw(radius: float, rho_link: float, theta: float,
          epsilon: float, alpha: float, tau: float) -> float:
    """Literal algebraic rewrite of the archived equations, in raw source units."""
    d = abs(math.cos(theta)) + epsilon * (1.0 + alpha * tau)
    return d / (radius * rho_link)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--plot", type=Path, help="optional comparison PNG")
    args = parser.parse_args()

    sat, sat_u = 71.2, 0.5
    planck, planck_u = 67.4, 0.5
    shoes, shoes_u = 73.04, 1.04

    hs = h0_si(sat)
    t_gyr = 1.0 / hs / JULIAN_YEAR_S / 1e9
    r_m = C_M_S / hs
    r_gly = r_m / (C_M_S * JULIAN_YEAR_S * 1e9)

    dim_H = (0, -1)
    dim_R = (1, 0)
    dim_rho = (-3, 0)
    dim_resistance_from_rho = dim_rho
    dim_formula = (-dim_R[0] - dim_resistance_from_rho[0],
                   -dim_R[1] - dim_resistance_from_rho[1])

    print("PGCU/H0 SOURCE AUDIT")
    print(f"claim = {sat:.1f} +/- {sat_u:.1f} km s^-1 Mpc^-1")
    print(f"H0_SI = {hs:.15e} s^-1")
    print(f"Hubble_time = {t_gyr:.9f} Gyr")
    print(f"c/H0 = {r_m:.15e} m = {r_gly:.9f} Gly")
    print(f"dimension(H required) = L^{dim_H[0]} T^{dim_H[1]}")
    print("dimension(rho_link from dimensionless I) = L^-3 T^0")
    print(f"dimension(1/[R*Rcal]) if Rcal=rho_link/dimensionless = "
          f"L^{dim_formula[0]} T^{dim_formula[1]}")
    print(f"dimension_test = {'PASS' if dim_formula == dim_H else 'FAIL'}")

    print("benchmark_residuals (illustrative; source uncertainty is unsupported)")
    print(f"  Planck2018: delta={sat-planck:+.3f}, "
          f"z_combined={combined_z(sat,sat_u,planck,planck_u):+.6f}, "
          f"z_data_only={data_only_z(sat,planck,planck_u):+.6f}")
    print(f"  SH0ES2022: delta={sat-shoes:+.3f}, "
          f"z_combined={combined_z(sat,sat_u,shoes,shoes_u):+.6f}, "
          f"z_data_only={data_only_z(sat,shoes,shoes_u):+.6f}")

    print("literal_raw_limit_probe (R=1, theta=0.4, eps=0.1, alpha=0.2, tau=1)")
    for rho in (1e3, 1.0, 1e-3, 1e-6):
        print(f"  rho={rho:.0e}, H_raw={h_raw(1.0,rho,0.4,0.1,0.2,1.0):.12e}")
    print("  rho->0+ implies H_raw->+infinity: FAILS claimed no-divergence/coasting limit")

    base = h_raw(2.0, 3.0, 0.4, 0.1, 0.2, 1.0)
    scaled = h_raw(14.0, 3.0/7.0, 0.4, 0.1, 0.2, 1.0)
    print(f"scale_degeneracy: H(R,rho)={base:.15e}, "
          f"H(7R,rho/7)={scaled:.15e}, equal={math.isclose(base,scaled,rel_tol=1e-15)}")
    print("identifiability: one H0 datum constrains at most one combination; "
          "R0,rho0,theta0,epsilon,alpha,tau and their covariance are not supplied")

    if args.plot:
        import matplotlib.pyplot as plt
        labels = ["Planck 2018\nbase-LCDM", "archived SAT\nclaim", "SH0ES 2022\nCepheid-SN"]
        vals = [planck, sat, shoes]
        errs = [planck_u, sat_u, shoes_u]
        fig, ax = plt.subplots(figsize=(7.2, 4.2))
        ax.errorbar(range(3), vals, yerr=errs, fmt="o", capsize=5)
        ax.set_xticks(range(3), labels)
        ax.set_ylabel(r"$H_0$ [km s$^{-1}$ Mpc$^{-1}$]")
        ax.set_title("Hubble-constant comparison (SAT error bar not source-derived)")
        ax.grid(axis="y", alpha=0.25)
        fig.tight_layout()
        fig.savefig(args.plot, dpi=180)
        print(f"plot = {args.plot}")


if __name__ == "__main__":
    main()
```

Actual Python 3.12.14 output:

```text
PGCU/H0 SOURCE AUDIT
claim = 71.2 +/- 0.5 km s^-1 Mpc^-1
H0_SI = 2.307434854084388e-18 s^-1
Hubble_time = 13.733036821 Gyr
c/H0 = 1.299245599369090e+26 m = 13.733036821 Gly
dimension(H required) = L^0 T^-1
dimension(rho_link from dimensionless I) = L^-3 T^0
dimension(1/[R*Rcal]) if Rcal=rho_link/dimensionless = L^2 T^0
dimension_test = FAIL
benchmark_residuals (illustrative; source uncertainty is unsupported)
  Planck2018: delta=+3.800, z_combined=+5.374012, z_data_only=+7.600000
  SH0ES2022: delta=-1.840, z_combined=-1.594524, z_data_only=-1.769231
literal_raw_limit_probe (R=1, theta=0.4, eps=0.1, alpha=0.2, tau=1)
  rho=1e+03, H_raw=1.041060994003e-03
  rho=1e+00, H_raw=1.041060994003e+00
  rho=1e-03, H_raw=1.041060994003e+03
  rho=1e-06, H_raw=1.041060994003e+06
  rho->0+ implies H_raw->+infinity: FAILS claimed no-divergence/coasting limit
scale_degeneracy: H(R,rho)=1.735101656671475e-01, H(7R,rho/7)=1.735101656671475e-01, equal=True
identifiability: one H0 datum constrains at most one combination; R0,rho0,theta0,epsilon,alpha,tau and their covariance are not supplied
plot = hale_pgcu_h0.png
```

Complete Lean 4 / Mathlib algebra file:

```lean
import Mathlib

/- Algebraic checks for the archived PGCU equations.
   This file proves algebra only; it does not assign physical dimensions. -/

theorem pgcu_rewrite
    (R rho D : ℝ) (hR : R ≠ 0) (hrho : rho ≠ 0) (hD : D ≠ 0) :
    (1 / R) * (1 / (rho / D)) = D / (R * rho) := by
  field_simp
  ring

theorem pgcu_scale_degeneracy
    (lam R rho D : ℝ)
    (hlam : lam ≠ 0) (hR : R ≠ 0) (hrho : rho ≠ 0) :
    D / ((lam * R) * (rho / lam)) = D / (R * rho) := by
  field_simp
  ring

theorem pgcu_positive
    (R rho D : ℝ) (hR : 0 < R) (hrho : 0 < rho) (hD : 0 < D) :
    0 < D / (R * rho) := by
  positivity

theorem pgcu_density_monotone
    (R D rho1 rho2 : ℝ)
    (hR : 0 < R) (hD : 0 < D)
    (hrho1 : 0 < rho1) (h12 : rho1 < rho2) :
    D / (R * rho2) < D / (R * rho1) := by
  have hrho2 : 0 < rho2 := lt_trans hrho1 h12
  have hp1 : 0 < R * rho1 := mul_pos hR hrho1
  have hp2 : 0 < R * rho2 := mul_pos hR hrho2
  apply (div_lt_div_iff₀ hp2 hp1).2
  nlinarith
```

Lean was not installed in this execution environment, so this file was not compiled here; no formal-check success is claimed. The Python calculation and assertions were executed. The Lean file is deliberately limited to algebra and order, leaving the physical dimension failure explicit rather than formalizing a false unit assignment.

## 7. Verdict and exact discriminator

**Verdict: FAIL / RETAIN UNRESOLVED.** The archived equations do not presently derive `71.2 ± 0.5`. They fail dimensions under the source's own count integral, their low-density limit contradicts their prose, and the numerical claim is underdetermined and statistically undocumented. No BEDROCK promotion or rewrite is warranted.

The exact recovery discriminator is a versioned primary artifact that supplies all of:

1. a dimensionally consistent definition of `mathcal R` and every parameter;
2. an executed mapping from independent geometric inputs to `H(z)`;
3. the dataset/likelihood and covariance producing `±0.5`;
4. an out-of-sample prediction fixed before comparison; and
5. a proof or numerical demonstration that the stated coasting limit is finite.

Until that exists, external residuals are descriptive comparisons only.

## Handoff to Elias Kern

Search for an earlier PGCU notebook or code path that computes `R(z), rho_link, theta4, epsilon, alpha, tau` before the value `71.2` appears; accept it only if its timestamp and independent inputs establish prediction rather than target insertion.
