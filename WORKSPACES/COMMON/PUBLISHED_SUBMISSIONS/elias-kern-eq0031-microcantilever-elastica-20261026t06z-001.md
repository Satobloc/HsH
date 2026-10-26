# EQ-0031 — historical fourth-order equation / Si3N4 microcantilever audit

**Worker handoff:** Elias Kern → Nadir Voss  
**Status:** `SRC/HISTORICAL-CANDIDATE`; spatial fourth-order beam limit passes dimension/algebra tests, but the real three-width dataset rejects a single common modulus at the quoted uncertainties. No BEDROCK or established-physics promotion.

## Historical source and correction

Verbatim historical equation:

```text
κ H_i^(4) + 2 λ_s (r² − R²) H_i + k(H_i − G_i) = 0
```

Locator: `SAT_THEORY_ARCHIVE_2023-25/MAY_2026_SNAPSHOT.txt`, section “Dynamics, Stability, and Discretization / Fundamental Equation of Motion”, blob `c29c49b697208294d705b0a280d91808a57edc66`, 84 lines / 6,734 chars. The same equation is indexed as ENTRY 024 in `..MATHEMATICAL_REPOSITORY`, blob `1b6876db3f871bfa25157ac024d66d8239082ff1`.

The uniquely justified notation repair is to make the vector norm explicit:

`κ H_i^(4) + 2 λ_s (||H||² − R²)H_i + k(H_i − G_i) = 0`.

The original is correct only if `r²` was defined to mean `||H||²`; otherwise it is ambiguous. It follows from

`E[H]=∫[κ/2 ||H''||² + λ_s/2 (||H||²−R²)² + k/2 ||H−G||²] dλ`.

The generalized Euler–Lagrange equation supplies the positive fourth-derivative term and the coefficient `2λ_s`. In the spatial, uncoupled local limit `λ_s=k=0`, the interior equation is `κH''''=0`, conditionally matching the static Euler–Bernoulli beam equation with `κ↔EI`. The earlier temporal-IVP interpretation remains failed: a fourth time derivative needs extra initial data and does not acquire ordinary oscillator stability from this spatial map.

Dimensional check for the spatial limit: `[EI]=M L³ T⁻²`, `[y'''']=L⁻³`, hence `[EI y'''']=M T⁻²`, force per length. Boundary conditions remain essential; the interior equation alone does not determine a cantilever.

## Real-system test

Primary comparator: Munguía-Cervantes et al. (2017), *Si3N4 Young’s modulus measurement from microcantilever beams using a calibrated stylus profiler*, Superficies y Vacío 30(1). The paper reports three cantilevers with `L=500 μm`, `t=2 μm`, widths `b=50,100,200 μm`, and fitted moduli `219.4±0.6`, `230.1±3.4`, and `222±11 GPa`. It uses the Euler–Bernoulli tip-deflection relation `δ=FL³/(3EI)`.

For rectangular cross-section `I=bt³/12`, so `k_tip=3EI/L³=Ebt³/(4L³)`. Geometry was treated as exact because the paper supplies no dimensional uncertainty; the displayed uncertainty propagation therefore includes only the quoted modulus uncertainties.

The inverse-variance common-modulus fit gives `Ē=219.729704961335±0.590019541566 GPa`, `χ²=9.647585700364` for 2 degrees of freedom, `p=0.008036248974`. Thus the three quoted measurements are inconsistent with one common modulus at about the 99.2% level. This does not reject fourth-order bending; it rejects the ideal single-material/geometry-only specialization at the quoted uncertainty budget. The paper itself notes possible beam twist with increasing width.

Tip deflections below are reconstructions using the already fitted moduli, not independent predictions. The independent test is the width-invariance of the recovered modulus.

## Executed Python

```python
from math import exp

L = 500e-6
t = 2e-6
widths_um = [50.0, 100.0, 200.0]
E_GPa = [219.4, 230.1, 222.0]
uE_GPa = [0.6, 3.4, 11.0]
forces_uN = [18.35, 25.57]

w = [1.0 / u**2 for u in uE_GPa]
Ebar = sum(wi * Ei for wi, Ei in zip(w, E_GPa)) / sum(w)
uEbar = sum(w) ** -0.5
chi2 = sum(((Ei - Ebar) / ui) ** 2 for Ei, ui in zip(E_GPa, uE_GPa))
p_df2 = exp(-chi2 / 2.0)

print(f"weighted mean = {Ebar:.12f} GPa")
print(f"u(mean) = {uEbar:.12f} GPa")
print(f"chi2(df=2) = {chi2:.12f}")
print(f"p = {p_df2:.12f}")

for b_um, E, uE in zip(widths_um, E_GPa, uE_GPa):
    b = b_um * 1e-6
    I = b * t**3 / 12.0
    EI = E * 1e9 * I
    uEI = uE * 1e9 * I
    ktip = 3.0 * EI / L**3
    uktip = 3.0 * uEI / L**3
    print(f"b={b_um:.0f} um: I={I:.15e} m^4, EI={EI:.12e} +/- {uEI:.12e} N m^2")
    print(f"  k_tip={ktip:.8f} +/- {uktip:.8f} N/m")
    for F_uN in forces_uN:
        F = F_uN * 1e-6
        delta = F / ktip
        udelta = delta * uE / E
        print(f"  F={F_uN:.2f} uN -> delta={delta*1e6:.8f} +/- {udelta*1e6:.8f} um")
```

Captured output:

```text
weighted mean = 219.729704961335 GPa
u(mean) = 0.590019541566 GPa
chi2(df=2) = 9.647585700364
p = 0.008036248974
b=50 um: I=3.333333333333333e-23 m^4, EI=7.313333333333e-12 +/- 2.000000000000e-14 N m^2
  k_tip=0.17552000 +/- 0.00048000 N/m
  F=18.35 uN -> delta=104.54649043 +/- 0.28590654 um
  F=25.57 uN -> delta=145.68140383 +/- 0.39839946 um
b=100 um: I=6.666666666666665e-23 m^4, EI=1.534000000000e-11 +/- 2.266666666667e-13 N m^2
  k_tip=0.36816000 +/- 0.00544000 N/m
  F=18.35 uN -> delta=49.84245980 +/- 0.73648137 um
  F=25.57 uN -> delta=69.45349848 +/- 1.02625769 um
b=200 um: I=1.333333333333333e-22 m^4, EI=2.960000000000e-11 +/- 1.466666666667e-12 N m^2
  k_tip=0.71040000 +/- 0.03520000 N/m
  F=18.35 uN -> delta=25.83051802 +/- 1.27989053 um
  F=25.57 uN -> delta=35.99380631 +/- 1.78347689 um
```

## Lean 4 / Mathlib source

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0031

structure Dim where
  length : Int
  mass : Int
  time : Int
  deriving DecidableEq, Repr

def mulDim (a b : Dim) : Dim :=
  ⟨a.length + b.length, a.mass + b.mass, a.time + b.time⟩

def flexuralRigidityDim : Dim := ⟨3, 1, -2⟩
def fourthSpatialDerivativeDim : Dim := ⟨-3, 0, 0⟩
def distributedLoadDim : Dim := ⟨0, 1, -2⟩

theorem bending_term_dimension :
    mulDim flexuralRigidityDim fourthSpatialDerivativeDim = distributedLoadDim := by
  rfl

def secondMoment (b t : ℝ) : ℝ := b * t ^ 3 / 12
def tipStiffness (E b t L : ℝ) : ℝ := E * b * t ^ 3 / (4 * L ^ 3)

theorem secondMoment_width_scaling (b t c : ℝ) :
    secondMoment (c * b) t = c * secondMoment b t := by
  unfold secondMoment
  ring

theorem tipStiffness_width_scaling (E b t L c : ℝ) :
    tipStiffness E (c * b) t L = c * tipStiffness E b t L := by
  unfold tipStiffness
  ring

theorem tipStiffness_zero_width (E t L : ℝ) :
    tipStiffness E 0 t L = 0 := by
  unfold tipStiffness
  ring

theorem quartic_constraint_gradient_coefficient (lambda r2 R2 H : ℝ) :
    lambda * 2 * (r2 - R2) * H = 2 * lambda * (r2 - R2) * H := by
  ring

theorem measured_moduli_one_sigma_intervals_disjoint :
    (2194 / 10 : ℚ) + 6 / 10 < (2301 / 10 : ℚ) - 34 / 10 := by
  norm_num

end HsHVerification.ArchiveEQ0031
```

Formal carrier: draft PR #388, branch `codex/eq0015-elias-20261024`, source commit `78d30416c056e1bdc655ab34c581fcc8125e2c04`, workflow run `40281048891`. Status at submission: CI pending; no `LEAN_VERIFIED` claim until the run succeeds.

## Reading and provenance audit

- Full live `BEDROCK.md`: blob `4cabda482c48c217614b868a2138409275df9bf7`, 563 lines / 86,946 chars.
- Full subordinate `STATE_OF_THE_THEORY.md`: blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, 155 lines / 11,012 chars.
- Full equation clearinghouse `..MATHEMATICAL_REPOSITORY`: blob `1b6876db3f871bfa25157ac024d66d8239082ff1`.
- Full historical `MAY_2026_SNAPSHOT.txt`: blob `c29c49b697208294d705b0a280d91808a57edc66`, 84 lines / 6,734 chars.
- Full `% BIG PAPER (nolat).txt`: blob `29cfa060a6fb83faef5920a470ba650b89e780a1`, 217 lines / 9,317 chars; source PDF SHA-256 `5f1bc1638ced8553ac16bd077d70ec2209f88771cbee021fa528a68ace9f84b1`.
- Prior fourth-order audit `tern-fourth-order-stability-audit-20261018t20z-s3.md`: blob `2a466cb89d5edd18e4e18cc21eea4b0d1952403a`, 467 lines / 19,497 chars. This run does not duplicate its time-versus-space audit; it supplies the requested real-system spatial test.
- Random reading population: 100 GitHub results for `Euler-Lagrange bending stiffness` across SAT and HsH; cryptographic draw `secrets.randbelow(100) → 27`. Selected `_AUTO_EXTRACTED_TEXT/UNIT CELL.txt`, blob `db7a50df675ee5db0f097ff3ce7ff33fa3ca3d1e`, fetched lines 1–1951 in four requested ranges; source PDF SHA-256 `28f85d6310875367496abe145dd9576a45cf4f368b19c8487b1b7670aa387e62`, source date 2026-02-28. Honest takeaway: this is an early, sprawling family of toy unit-cell Lagrangians; it later self-corrects FCC coordination to 12 and BCC to 8 and notes that sphere rotation is topologically irrelevant without internal structure. Its lattice/unit-cell proposals remain historical, hard-guarded, and noncontrolling.

## CODATA gate, disposition, and discriminator

The active reference remains the 2022 CODATA recommended values. No CODATA residual is evaluable: this equation contains free stiffness, constraint, and coupling parameters and independently predicts no fundamental constant. Units, uncertainty, and fit ledger: predicted CODATA observable `none`; residual `undefined`; tuned CODATA input `none`. Inserting a constant would be tuning, not prediction.

**PASS:** spatial dimensional ledger, variational sign/coefficient, width scaling, zero-width limit, executed real-data arithmetic.

**CORRECTED:** replace ambiguous `r²` by `||H||²` only when the historical symbol denotes the squared vector norm. Preserve the original text alongside the correction.

**FAIL for ideal common-modulus specialization:** `χ²(2)=9.6476`, `p=0.00804`; the 50- and 100-μm one-sigma modulus intervals are disjoint.

**UNRESOLVED:** boundary-condition map from the historical `H_i` object to a physical beam/worldtube, geometric tolerances, twist, residual stress, shear/Timoshenko effects, finite-core lift, and any independent CODATA observable.

Exact discriminator: preregister geometry and boundary conditions with measured dimensional uncertainties, predict deflections for held-out forces and at least one held-out width without refitting `E`, and require normalized residuals compatible with that uncertainty model. A reconstruction from already fitted `E` does not count.
