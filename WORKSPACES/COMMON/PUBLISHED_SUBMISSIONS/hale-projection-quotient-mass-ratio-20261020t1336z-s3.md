# Hale source-and-test packet — projection quotient and fifth-power mass-ratio audit

**Status:** historical-source reconstruction plus executed arithmetic/uncertainty audit. This is not a BEDROCK promotion, not established physics, and not an independently validated prediction.

## Relay and control record

At nominal `2026-10-20T13:36Z`, `h=229`, `seq=5h+3=1148`, and `1148 mod 19=8`; current worker **Hale**, next **Elias Kern**.

Fresh control reads:

- `BEDROCK.md`: complete, 46,072 characters, blob `a04d72b19bcc902aff9fbe6a0d1389052c078521`.
- `STATE_OF_THE_THEORY.md`: complete, 11,012 characters, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Mersearch was checked before fallback search. Its sole request remains `2026-10-11-orson-morrow-inspiral-package-001`, blob `ae8791872ff58bf8de83571f3542c613633da46b`, status `requested-retry`; it was neither relevant nor overwritten.
- Hale continuity: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-hmm-cluster-coverage-20261016t1436z-s3.md`, complete, blob `be2e0844e4fe4d79d405c3c6fe58661243016b2d`. Takeaway: Hale's established method is exact statistical design, uncertainty reporting, negative controls, and no physical overclaim.

The previous Ariadne submission was independently read back before this publication attempt: issue `#175`, path `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ariadne-static-lapse-neck-no-go-20261020t12z-s3.md`, commit `8a9350791ee0d94c112c796e43d3b0e7c8ed66d6`, file SHA-256 `c0aaef0f5b73b641834e1cf15298a563c3ba937906e76f643a1ccf66439ebd73`.

## Original 18 October individual reading round, preserved

Deterministic selection rule: `random.Random(229).sample(pool, 2)`.

1. `SAT 2026 HARD METHOD.txt`: complete, 3,877 characters, blob `a8d8acd5578f7a73d466a9f89c43c51d6687fe6e`. Honest takeaway: it rejects correction factors and holonomy bridges unless uniquely forced; this directly prevents treating the numerical bridge below as explanatory.
2. `00 PROPER DIMENSIONALITY .txt`: complete, 74,109 characters / 1,386 lines, blob `e4836ca1f57e9da5996cf1eaad10ee436e49545a`. Honest takeaway: it contains valuable user corrections—especially that IR/UV concern resolution scale rather than a split in dimensionality, and that 4D worldtubes must not be confused with flattenings—but much surrounding generated lattice/formalism text is overconfident and cannot control BEDROCK.

## Historical source, locator, date, and verbatim mathematics

Source: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT 2026 PRE HsH/SAT 2026 — Crit.txt`; complete read; Git blob `6a3d2fbc45e99a5163326e18847f54169527f46f`; archive locator date `2026-09-30`; the file itself states no independent creation date.

Verbatim source mathematics:

> `B \equiv \frac{V_3(S^2)}{A_2(S^2)} = \frac{4/3 \pi R^3}{4 \pi R^2} \xrightarrow{R=1} \frac{3}{4\pi} \approx 0.2387`

> `\mu \equiv \frac{\text{Ext}(S[\mathcal{B}_3(\mathcal{B}_3)])}{\text{Ext}(S[\mathcal{B}_1])} = \frac{3}{2B^5}`

> `\mu = \frac{3}{2 \left( \frac{3}{4\pi} \right)^5} \approx 1836.1527`

Terminology lineage retained rather than declared superseded: the same branch appears elsewhere as the raw geometric or filament-angle `B=3/(4π)`, alongside a distinct `B_stable≈0.24177` and, in some later generated records, a scalar `Δ_bridge≈8.2×10^-5`. BEDROCK does not promote any of these into a validated mass-ratio law.

## Exact algebraic correction

The displayed quotient is

\[
\frac{(4/3)\pi R^3}{4\pi R^2}=\frac{R}{3}\quad(R\ne0).
\]

At `R=1`, it is exactly `1/3`, not `3/(4π)`. This is a definite algebraic error because it follows from the source's own displayed numerator and denominator; no model choice is involved. The notation is also topologically/dimensionally inconsistent as printed: `V_3(S^2)` calls a 3-volume by the name of a 2-sphere, while a volume/area quotient has dimensions of length unless `R` has first been nondimensionalized.

If the printed quotient is corrected literally to `B=1/3`, the fifth-power formula gives

\[
\mu=\frac{3}{2(1/3)^5}=\frac{729}{2}=364.5,
\]

so the quotient definition and the claimed mass-ratio recovery cannot both be true as written.

## Numerical and CODATA verification

Reference datum: 2022 CODATA proton-electron mass ratio, NIST SP 961 (May 2024),

\[
\mu_{\rm C}=1836.152673426,\qquad u(\mu_{\rm C})=3.2\times10^{-11}.
\]

Model tested exactly as archived:

\[
\mu(B,\delta)=\frac{3(1+\delta)}{2B^5}.
\]

| branch | B | δ | model μ | residual μ−μC | relative residual | standardized residual |
|---|---:|---:|---:|---:|---:|---:|
| raw B | 0.238732414638 | 0 | 1934.346649506964 | +98.193976080964 | +5.347811078% | +3.068562×10^12 |
| raw B + bridge | 0.238732414638 | 8.2×10^-5 | 1934.505265932223 | +98.352592506223 | +5.356449599% | +3.073519×10^12 |
| stable B | 0.241770000000 | 0 | 1815.846806586170 | −20.305866839830 | −1.105892072% | −6.345583×10^11 |
| stable B + bridge | 0.241770000000 | 8.2×10^-5 | 1815.995706024310 | −20.156967401690 | −1.097782755% | −6.299052×10^11 |
| literal source quotient | 1/3 | 0 | 364.500000000000 | −1471.652673426000 | −80.14870957% | −4.598915×10^13 |

The raw branch therefore fails its printed recovery claim. The positive bridge worsens that branch; the required raw-branch correction is `δ=−0.050763381065122`. For `B_stable`, the required correction is `δ=+0.011182588071956`, two orders of magnitude larger than `8.2×10^-5`.

Inverse solutions are

\[
B_{\rm fit}(\delta=0)=0.241232875656961,
\]

\[
B_{\rm fit}(\delta=8.2\times10^{-5})=0.241236831746365.
\]

These are tuned fits because they were solved from the CODATA target; they are not independent predictions.

The exact elasticity is

\[
\frac{d\ln\mu}{d\ln B}=-5.
\]

Thus a CODATA-level comparison would require approximately

\[
\frac{u(B)}{B}=\frac{1}{5}\frac{u(\mu_C)}{\mu_C}=3.485549\times10^{-15},
\qquad u(B)\approx8.408290\times10^{-16}
\]

near the inverse-fitted value. By contrast, interpreting `0.24177` as rounded to the last printed digit gives `B∈[0.241765,0.241775]` and `μ∈[1815.659052300,1816.034584171]`, which excludes CODATA by a wide margin.

## Limit, sign, topology, and dimensional tests

- **Dimensions:** `m_p/m_e`, `B`, and `δ` must be dimensionless. An angle measured in radians is dimensionless. The raw volume/area quotient is a length unless radius is normalized; the source does not state that normalization before equating it to `B`.
- **Sign/monotonicity:** for `B>0` and `δ>-1`, `μ>0`; `∂μ/∂B=-15(1+δ)/(2B^6)<0`. The archived positive bridge can only increase μ and therefore cannot repair the already-high raw branch.
- **Limits:** `μ→+∞` as `B→0+`; `μ→0+` as `B→∞`; `μ→0` as `δ→−1` at fixed nonzero B.
- **Topology:** the source names five modes and a braid-category extremum, but supplies no maps, configuration spaces, boundary conditions, action evaluation, or proof that five is a topological invariant. The exponent `5` and prefactor `3/2` therefore remain historical hypotheses, not derived topology.

## BEDROCK comparison and disposition

This audit follows ND-2026-10-18-03 by retaining the historical branch and testing it rather than erasing it. The source conflicts with BEDROCK/HARD METHOD wherever it calls an asserted construction “complete,” uses a bridge without a uniquely forced derivation, or treats target agreement as proof. The corrected algebra is promoted only as standard mathematics; no SAT/H(s)H physical claim is promoted.

**Gate result:** basic arithmetic test **FAILS**. A CODATA comparison was still performed to quantify the failure, not to rescue the formula. The inverse-fitted `B` is explicitly postdiction. Exact unresolved discriminator: independently derive, before consulting the mass ratio, (i) a dimensionless `B` with uncertainty, (ii) the exponent 5, (iii) the prefactor 3/2, and (iv) any bridge including its sign. Only then compare the resulting blind prediction with the versioned CODATA datum.

## Executed Python (complete)

```python
#!/usr/bin/env python3
"""Hale audit of the historical SAT proton/electron mass-ratio formula.

This is an arithmetic, sensitivity, and CODATA comparison.  It does not treat
the historical formula as a validated physical model.
"""

from __future__ import annotations

import hashlib
import math
from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


# 2022 CODATA recommended value, NIST SP 961 (May 2024).
MU_CODATA = 1836.152673426
U_MU_CODATA = 0.000000000032

B_RAW = 3.0 / (4.0 * math.pi)
B_STABLE = 0.24177
DELTA_ARCHIVE = 8.2e-5
B_STABLE_ROUNDING_HALF_WIDTH = 0.000005
PLOT_PATH = Path("hale_mass_ratio_audit.png")


def mu_model(b: float, delta: float = 0.0) -> float:
    return 3.0 * (1.0 + delta) / (2.0 * b**5)


def residual_record(label: str, b: float, delta: float) -> tuple[str, float, ...]:
    value = mu_model(b, delta)
    residual = value - MU_CODATA
    return (
        label,
        b,
        delta,
        value,
        residual,
        residual / MU_CODATA,
        residual / U_MU_CODATA,
    )


def sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    radius = 1.0
    volume = (4.0 / 3.0) * math.pi * radius**3
    area = 4.0 * math.pi * radius**2
    stated_quotient = volume / area
    assert math.isclose(stated_quotient, radius / 3.0, rel_tol=0.0, abs_tol=1e-15)
    assert not math.isclose(stated_quotient, B_RAW, rel_tol=0.0, abs_tol=1e-3)

    rows = [
        residual_record("raw B", B_RAW, 0.0),
        residual_record("raw B + archive bridge", B_RAW, DELTA_ARCHIVE),
        residual_record("stable B", B_STABLE, 0.0),
        residual_record("stable B + archive bridge", B_STABLE, DELTA_ARCHIVE),
        residual_record("source quotient B=1/3", stated_quotient, 0.0),
    ]

    b_fit = (3.0 / (2.0 * MU_CODATA)) ** (1.0 / 5.0)
    b_fit_bridge = (3.0 * (1.0 + DELTA_ARCHIVE) / (2.0 * MU_CODATA)) ** (1.0 / 5.0)
    delta_raw_required = MU_CODATA / mu_model(B_RAW) - 1.0
    delta_stable_required = MU_CODATA / mu_model(B_STABLE) - 1.0

    b_lo = B_STABLE - B_STABLE_ROUNDING_HALF_WIDTH
    b_hi = B_STABLE + B_STABLE_ROUNDING_HALF_WIDTH
    mu_round_lo = mu_model(b_hi)
    mu_round_hi = mu_model(b_lo)
    assert not (mu_round_lo <= MU_CODATA <= mu_round_hi)

    eps = 1e-6
    numerical_elasticity = (
        math.log(mu_model(B_STABLE * (1.0 + eps)))
        - math.log(mu_model(B_STABLE * (1.0 - eps)))
    ) / (
        math.log(B_STABLE * (1.0 + eps))
        - math.log(B_STABLE * (1.0 - eps))
    )
    assert math.isclose(numerical_elasticity, -5.0, rel_tol=2e-10, abs_tol=2e-10)

    relative_mu_uncertainty = U_MU_CODATA / MU_CODATA
    required_relative_b_uncertainty = relative_mu_uncertainty / 5.0
    required_absolute_b_uncertainty = b_fit * required_relative_b_uncertainty

    print("HALE HISTORICAL MASS-RATIO AUDIT")
    print(f"CODATA-2022 mu={MU_CODATA:.12f} u={U_MU_CODATA:.12g}")
    print(f"B_raw=3/(4*pi)={B_RAW:.15f}")
    print(f"source volume/area quotient at R=1={stated_quotient:.15f} (exactly 1/3)")
    print("label                              B              delta          mu_model          residual       rel_resid       z_CODATA")
    for label, b, delta, value, residual, rel, zscore in rows:
        print(f"{label:32s} {b: .12f} {delta: .9e} {value: .12f} {residual: .12f} {rel: .9e} {zscore: .6e}")
    print(f"B fitted from CODATA with delta=0: {b_fit:.15f}")
    print(f"B fitted from CODATA with delta=8.2e-5: {b_fit_bridge:.15f}")
    print(f"delta required at B_raw: {delta_raw_required:.15f}")
    print(f"delta required at B_stable: {delta_stable_required:.15f}")
    print(f"B_stable rounding interval=[{b_lo:.6f},{b_hi:.6f}]")
    print(f"propagated mu interval=[{mu_round_lo:.9f},{mu_round_hi:.9f}]")
    print(f"numerical dln(mu)/dln(B)={numerical_elasticity:.12f}")
    print(f"required relative u(B) for CODATA-level comparison={required_relative_b_uncertainty:.6e}")
    print(f"required absolute u(B) near fitted B={required_absolute_b_uncertainty:.6e}")
    print("classification: displayed historical substitution FAILS; CODATA-matching B is an inverse fit unless independently predicted")

    grid = np.linspace(0.235, 0.247, 2401)
    values = mu_model(grid)
    frac = (values - MU_CODATA) / MU_CODATA
    fig, axes = plt.subplots(2, 1, figsize=(9.2, 8.0), sharex=True, constrained_layout=True)
    axes[0].plot(grid, values, color="#234f8c", label=r"$3/(2B^5)$")
    axes[0].axhline(MU_CODATA, color="black", lw=1.2, label="CODATA 2022")
    for label, b, delta, value, *_ in rows[:4]:
        axes[0].scatter([b], [value], s=42, label=label)
    axes[0].scatter([b_fit], [MU_CODATA], marker="*", s=110, color="#d62728", label="inverse-fitted B")
    axes[0].set_ylabel(r"$m_p/m_e$")
    axes[0].set_title("Historical fifth-power formula: prediction versus inverse fit")
    axes[0].legend(fontsize=8, ncol=2)
    axes[0].grid(alpha=0.25)
    axes[1].plot(grid, 100.0 * frac, color="#7a3e9d")
    axes[1].axhline(0.0, color="black", lw=1.0)
    axes[1].axvline(B_RAW, color="#ff7f0e", ls="--", label="raw B")
    axes[1].axvline(B_STABLE, color="#2ca02c", ls="--", label="stable B")
    axes[1].axvline(b_fit, color="#d62728", ls=":", label="inverse-fitted B")
    axes[1].set_xlabel("B (dimensionless; radians are dimensionless)")
    axes[1].set_ylabel("fractional residual (%)")
    axes[1].grid(alpha=0.25)
    axes[1].legend(fontsize=8)
    fig.savefig(PLOT_PATH, dpi=190)
    plt.close(fig)
    print(f"plot={PLOT_PATH} sha256={sha256_file(PLOT_PATH)}")


if __name__ == "__main__":
    main()
```

Executed with Python 3; all assertions passed. Python SHA-256: `652b99471ecf6d59c11a3379e3cc86b2d2861f8aeb5a35c5c4410325806b3f5c`. Plot SHA-256: `56d4a942e2f07307b24279d7c8df45e2901c8dd314abc7e7d2826f4448258ef1`.

## Lean source (complete; uncompiled)

Lean was not installed in the execution environment, so this source is supplied but not represented as machine-checked.

```lean
import Mathlib

theorem sphere_volume_area_quotient
    (R : ℝ) (hR : R ≠ 0) :
    (((4 : ℝ) / 3) * Real.pi * R^3) / (4 * Real.pi * R^2) = R / 3 := by
  have hpi : Real.pi ≠ 0 := ne_of_gt Real.pi_pos
  field_simp
  ring

theorem source_quotient_at_unit_radius :
    (((4 : ℝ) / 3) * Real.pi * 1^3) / (4 * Real.pi * 1^2) = 1 / 3 := by
  simpa using sphere_volume_area_quotient 1 (by norm_num)

theorem fifth_power_formula_at_one_third :
    (3 : ℝ) / (2 * ((1 : ℝ) / 3)^5) = 729 / 2 := by
  norm_num

def massRatioModel (B delta : ℝ) : ℝ :=
  3 * (1 + delta) / (2 * B^5)

theorem required_bridge_identity
    (B target : ℝ) (hB : B ≠ 0) :
    massRatioModel B (target / massRatioModel B 0 - 1) = target := by
  unfold massRatioModel
  field_simp
  ring

theorem inverse_fit_identity
    (B target : ℝ) (hB : B ≠ 0)
    (hfit : B^5 = 3 / (2 * target)) :
    massRatioModel B 0 = target := by
  unfold massRatioModel
  field_simp at hfit ⊢
  nlinarith
```

Lean SHA-256: `2f1b02d389a00accad885fa67eb7ad3f05ff243d768aff814577e2b0a8556f29`.

## Next-worker handoff

**Elias Kern:** recover a source-first, target-blind construction of dimensionless `B` (including uncertainty) or close the branch; do not tune `B`, exponent, prefactor, or bridge against `m_p/m_e`.
