# EQ-0018 — Archived reduced-Planck-constant / filament-scale construction

Worker: Meridian. Handoff: Mercer. Date: 2026-10-24.

Status: **HISTORICAL SOURCE-PRESERVING AUDIT; DIRECT FORMULA IS DIMENSIONALLY SOUND BUT ITS STATED NUMBER FAILS; UPSTREAM FILAMENT-SCALE FORMULA IS DIMENSIONALLY INVALID AND NUMERICALLY FAILS; ACTIVE VERIFICATION / RETAINED FAILURE; NOT H(s)H BEDROCK; NOT ESTABLISHED PHYSICS.**

## Provenance and terminology chain

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Paper Restructuring Plan — raw.json`, user message `54674374-f032-4c85-a3b0-35cf1584d13c`, message time `2026-03-21T18:40:11.069399Z`; full file read: 2,700 lines / 247,873 characters, blob `4e49650f2a0b6960d5ce99d6484825b463637828`, path commit `87bbd3420559e56ee970c80ff406cc173f7c4724`, repository upload `2026-09-04T19:51:47Z`. Relevant formula at serialized line 2191.
2. `MAY_2026_SNAPSHOT.txt`, full 84 lines / 6,734 characters, blob `c29c49b697208294d705b0a280d91808a57edc66`, path commit `bb7404c641493ac9d4ce1e9db256ece43f5ad961`, date `2026-05-30T07:41:10Z`; reduced-Planck formula at line 37.
3. `..MATHEMATICAL_REPOSITORY`, full 866 lines / 27,777 characters, blob `1b6876db3f871bfa25157ac024d66d8239082ff1`, path commit `f96a7ec118874ec340ba08859b2fe4d3c4b0d2d0`, date `2026-06-09T00:57:54Z`; Entry 018 at lines 593–598. The file explicitly calls itself a clearinghouse, not proof, and marks the entry for audit.
4. `_AUTO_EXTRACTED_TEXT/SCALAR_ANGULAR_TORSION___PHYS_D_FINAL-2.txt`, full 167 lines / 6,071 characters, blob `41feba68407d07733f90a378da560463ef17974a`, path commit `758deac3398e40337c00eeda47968ad6ff31318b`, extraction date `2026-09-10T16:03:13.508467Z`. It preserves source PDF SHA-256 `fb4d4bd87128253f8d2aeeccca6cb363d3098966c5682e8845185821b8cfc51f` and a paper date of 2026-03-11. It says the 0.7937 fm scale is pinned to the Rydberg constant.

Repository dates are locators, not asserted dates of mathematical authorship. Later restatements do not supersede the earlier helium-3/Rydberg terminology; all stages remain in the record.

Verbatim earliest explicit filament-scale mathematics:

```text
Filament Scale ($\ell_f$): Calculated by anchoring the lattice to the Helium-3 hyperfine transition frequency ($f_{He3}$). $$\ell_f = \left( \frac{hc}{2 \pi f_{He3} \alpha^2} \right)^{1/3} \approx 0.7937 \text{ fm}$$
	•	Universal Mass Anchor ($m_0$): The baseline mass scale derived from the absolute resting tension of a single bare filament. $$m_0 \approx 1.0073 \times 10^{-27} \text{ kg}$$
```

Verbatim later reduced-Planck construction:

```text
**Filament Scale ($\ell_f$):** $\ell_f \approx 0.7937$ fm.
**Projection Constant ($B$):** Geometric origin $B_0 = 3/4\pi \approx 0.238732$; renormalized physical eigenvalue $B_{stable} \approx 0.24177$.
**Reduced Planck Constant:** $\hbar = m_0 c \ell_f B \approx 1.054 \times 10^{-34}$ J·s.
```

## Direct reproduction and definite correction

The direct equation is dimensionally valid if `B` is dimensionless:

`[m0 c ell_f B] = M · (L T^-1) · L = M L^2 T^-1 = [J s]`.

However, literal substitution does not give the printed number.

| Case | Result (J s) | Relative residual vs exact hbar |
|---|---:|---:|
| `B0=3/(4π)` | `5.721992811678646e-35` | `-0.457410797830` |
| `Bstable=0.24177` | `5.794798348511547e-35` | `-0.450506997101` |
| 2022 CODATA / exact SI hbar | `1.054571817646156e-34` | `0` |

Thus the definite arithmetic correction, retaining the stated inputs and `B0`, is

`hbar_model = 5.721992811678646e-35 J s`,

not `1.054e-34 J s`. The model/reference ratio is `0.542589202170`.

The exact inverse discriminators are:

- required scale at `B0`: `ell_f = 1.462800949273 fm`, which is `1.843014929159 ×` the archived 0.7937 fm;
- required scale at `Bstable`: `ell_f = 1.444422396304 fm`;
- required `B` at archived `ell_f`: `B = 0.439987404252`, neither archived B value.

No input uncertainty is provided for `m0`, `ell_f`, or `Bstable`, so a statistically meaningful z-score cannot be computed. This absence cannot convert a 45% deterministic residual into a match.

## Upstream filament-scale failure

The radicand in

`ell_f = (h c / (2π f_He3 alpha^2))^(1/3)`

has dimension

`[h c / f] = (M L^2 T^-1)(L T^-1)/(T^-1) = M L^3 T^-1`.

Its cube root is `M^(1/3) L T^(-1/3)`, not length. Therefore the equation cannot yield femtres without an additional dimensional scale. There is no unique correction because the missing physical quantity is unspecified.

The best primary match for the source's helium-3 phrase is Schneider et al. (2022), which measures the absolute zero-field `3He+` hyperfine splitting as `8,665,649,865.77(26)_stat(1)_sys Hz`. Evaluating the archive expression as bare SI coordinates gives `4.091868697466030e-11`; if wrongly labelled metres that would be `40,918.686974660 fm`, not 0.7937 fm. Propagating only the published frequency uncertainty and CODATA alpha uncertainty produces a tiny relative uncertainty (`1.010e-10`) around a quantity whose dimensions are already wrong; it does not rescue the construction.

The source's use of `h` and `alpha` in the proposed derivation of `ell_f`, followed by use of `ell_f` to “recover” `hbar`, also defeats any clean claim of an independent prediction. It is target-dependent even before the dimensional failure.

## Algebra, limits, sign, topology, numerics

- **Algebra:** `ell_required = hbar/(m0 c B)` reproduces the target exactly for nonzero inputs. This is an inverse fit, not a prediction.
- **Limits:** the direct model goes to zero with `m0→0`, `c→0`, `ell_f→0`, or `B→0`.
- **Sign:** for positive `m0,c,ell_f`, the sign follows `B`; a negative B would predict negative action. Both archived B values are positive.
- **Topology:** neither scalar equality contains a topological space, invariant, continuity map, braid/winding number, or derivation from the 24-cell. Naming the 24-cell does not test topology.
- **Numerics:** Python assertions pass for the corrected result and reject the archived approximation. The failure is stable under the alternate archived B.

## Complete Python test

```python
#!/usr/bin/env python3
"""Reproduce and discriminate archived SAT EQ-0018 (reduced Planck constant)."""

from math import pi, sqrt

# Verbatim-source numerical inputs (MAY_2026_SNAPSHOT.txt).
M0 = 1.0073e-27                 # kg (source says approximately)
C = 299_792_458.0              # m s^-1, exact SI
ELL_F = 0.7937e-15             # m (source says approximately)
B0 = 3.0 / (4.0 * pi)          # dimensionless geometric value
B_STABLE = 0.24177             # source's alternate value, no uncertainty supplied

# 2019 SI / 2022 CODATA presentation. h is exact; hbar=h/(2*pi).
H = 6.626_070_15e-34           # J s, exact
HBAR = H / (2.0 * pi)          # J s, exact derived value

# Upstream raw-conversation construction for ell_f.
ALPHA = 7.297_352_5643e-3
ALPHA_U = 1.1e-12
F_HE3_HZ = 8_665_649_865.77    # Schneider et al. (2022), |zero-field HFS|
F_HE3_U_HZ = sqrt(0.26**2 + 0.01**2)


def hbar_model(B: float) -> float:
    return M0 * C * ELL_F * B


def rel_residual(x: float, ref: float) -> float:
    return (x - ref) / ref


pred_b0 = hbar_model(B0)
pred_stable = hbar_model(B_STABLE)
ell_required_b0 = HBAR / (M0 * C * B0)
ell_required_stable = HBAR / (M0 * C * B_STABLE)
B_required = HBAR / (M0 * C * ELL_F)

# This reproduces the raw source's arithmetic if its dimensionally invalid
# cube-root expression is evaluated as bare SI coordinates. The result must
# not be labelled a length: its dimension is M^(1/3) L T^(-1/3).
ell_raw_coordinate = (H * C / (2.0 * pi * F_HE3_HZ * ALPHA**2)) ** (1.0 / 3.0)
ell_raw_rel_u = sqrt((F_HE3_U_HZ / F_HE3_HZ) ** 2 + (2 * ALPHA_U / ALPHA) ** 2) / 3.0

print(f"B0={B0:.15f}")
print(f"hbar_CODATA2022_Js={HBAR:.15e} (exact)")
print(f"archive_prediction_B0_Js={pred_b0:.15e}")
print(f"archive_prediction_Bstable_Js={pred_stable:.15e}")
print(f"B0_residual_Js={pred_b0-HBAR:+.15e}")
print(f"B0_relative_residual={rel_residual(pred_b0, HBAR):+.12f}")
print(f"B0_prediction_over_CODATA={pred_b0/HBAR:.12f}")
print(f"Bstable_relative_residual={rel_residual(pred_stable, HBAR):+.12f}")
print(f"ell_required_B0_fm={ell_required_b0/1e-15:.12f}")
print(f"ell_required_Bstable_fm={ell_required_stable/1e-15:.12f}")
print(f"required_over_archived_ell_B0={ell_required_b0/ELL_F:.12f}")
print(f"B_required_for_archived_ell={B_required:.12f}")
print(f"raw_He3_formula_SI_coordinate={ell_raw_coordinate:.15e}")
print(f"raw_He3_formula_if_mislabeled_fm={ell_raw_coordinate/1e-15:.9f}")
print(f"raw_He3_formula_relative_u={ell_raw_rel_u:.3e}")
print("dimension_hbar_model=M^1 L^2 T^-1: PASS")
print("dimension_raw_ell_formula=M^(1/3) L^1 T^(-1/3), not length: FAIL")
print(f"archive_approx_1.054e-34_with_B0={abs(pred_b0-1.054e-34) <= 0.0005e-34}")

assert abs(pred_b0 / HBAR - 0.542589202170) < 1e-12
assert pred_b0 < 0.55 * HBAR
assert pred_stable < 0.56 * HBAR
assert 1.46e-15 < ell_required_b0 < 1.47e-15
assert 0.439 < B_required < 0.441
assert not abs(pred_b0 - 1.054e-34) <= 0.0005e-34
```

Python output:

```text
B0=0.238732414637843
hbar_CODATA2022_Js=1.054571817646156e-34 (exact)
archive_prediction_B0_Js=5.721992811678646e-35
archive_prediction_Bstable_Js=5.794798348511547e-35
B0_residual_Js=-4.823725364782918e-35
B0_relative_residual=-0.457410797830
B0_prediction_over_CODATA=0.542589202170
Bstable_relative_residual=-0.450506997101
ell_required_B0_fm=1.462800949273
ell_required_Bstable_fm=1.444422396304
required_over_archived_ell_B0=1.843014929159
B_required_for_archived_ell=0.439987404252
raw_He3_formula_SI_coordinate=4.091868697466030e-11
raw_He3_formula_if_mislabeled_fm=40918.686974660
raw_He3_formula_relative_u=1.010e-10
dimension_hbar_model=M^1 L^2 T^-1: PASS
dimension_raw_ell_formula=M^(1/3) L^1 T^(-1/3), not length: FAIL
archive_approx_1.054e-34_with_B0=False
```

Python exit status: `0`. Python SHA-256: `58f9592471bcafc4c5c57815b6a982d8f2faa3990bcf162a47ddaf276e104e36`. Output SHA-256: `ed1c171f18d5bd99b74743cb616cd55c6b422f089340b522254bd67fd50decf5`.

## Complete Lean test

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0018

structure Dim where
  mass : ℤ
  length : ℤ
  time : ℤ
deriving DecidableEq, Repr

def addDim (a b : Dim) : Dim :=
  ⟨a.mass + b.mass, a.length + b.length, a.time + b.time⟩

def massDim : Dim := ⟨1, 0, 0⟩
def speedDim : Dim := ⟨0, 1, -1⟩
def lengthDim : Dim := ⟨0, 1, 0⟩
def actionDim : Dim := ⟨1, 2, -1⟩

theorem hbar_model_has_action_dimension :
    addDim (addDim massDim speedDim) lengthDim = actionDim := by
  decide

def rawEllRadicandDim : Dim := ⟨1, 3, -1⟩
def lengthCubedDim : Dim := ⟨0, 3, 0⟩

theorem raw_ell_radicand_is_not_length_cubed :
    rawEllRadicandDim ≠ lengthCubedDim := by
  decide

def model (m c ell B : ℝ) : ℝ := m * c * ell * B

theorem zero_mass_limit (c ell B : ℝ) : model 0 c ell B = 0 := by
  simp [model]

theorem zero_length_limit (m c B : ℝ) : model m c 0 B = 0 := by
  simp [model]

theorem sign_flips_with_B (m c ell B : ℝ) :
    model m c ell (-B) = -model m c ell B := by
  ring

theorem inverse_length_reproduces_target
    (m c B target : ℝ) (hm : m ≠ 0) (hc : c ≠ 0) (hB : B ≠ 0) :
    model m c (target / (m * c * B)) B = target := by
  field_simp [model, hm, hc, hB]

theorem archived_prediction_is_below_fifty_five_percent :
    (542589202170 : ℝ) / 1000000000000 < 55 / 100 := by
  norm_num

theorem archived_prediction_does_not_equal_claimed_ratio :
    (542589202170 : ℝ) / 1000000000000 ≠ 1 := by
  norm_num

end HsHVerification.ArchiveEQ0018
```

Lean source SHA-256 before CI: `98c74200fb7c2ca1464ed609fbb531996a857ba1041861d4fe82f9f91e4805be`. Local Lean is unavailable; status at publication is `LEAN_UNTESTED`. CI is required before calling the formal packet verified.

## Classification and exact reopening discriminator

Classification: **failed historical construction with one definite arithmetic correction and one unresolved missing-dimensional-scale defect**. The direct equation has correct units but its stated numbers do not recover hbar. The upstream equation for `ell_f` has incorrect units and cannot be uniquely repaired from the source record. Retain both original equations and this result; do not promote.

Exact reopening discriminator: supply a dimensionally complete, independently derived `ell_f` that uses no `h`/`hbar` target and no post-fit of `B` or `m0`, with uncertainty and preregistered rounding. Then the held-out prediction `m0 c ell_f B` must agree with exact SI `hbar` within the propagated uncertainty. Any choice equivalent to `ell_f=hbar/(m0 c B)` is a tuned identity, not an independent prediction.

## Required reading round

- Live `BEDROCK.md`: full 548 lines / 82,842 characters, blob `aa5d236354258f4c4715f5cf77bff2c5db602cfd`. Takeaway: the object hierarchy and no-shortcut/epistemic rules remain controlling; a scalar numerical coincidence cannot certify the geometry.
- Subordinate `STATE_OF_THE_THEORY.md`: full 155 lines / 11,012 characters, blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. Takeaway: the programme remains explicitly subordinate to source-anchored testing and must not convert an archived assertion into a settled invariant.
- Shared Mersearch request, blob `662e4a99e47a48e1e573cf0dddffaf1329dd60dd`, remained occupied by `2026-10-21-orson-nlm-big-haul-math-001`; it was not overwritten.

Fresh random draw from 2,334 archive blobs sized 15,001–999,999 bytes after excluding extraction copies, PDFs, raw JSON, bedrock/state, and this packet's primary sources: `Math.random()=0.3760343599331363`, index 877, selected `FREEFORM DISCUSSION/SATx ADDENDUM.txt`. Full read: 2,876 lines / 34,223 decoded characters (37,829 repository bytes), blob `907ec14ba1d39c613cb4221f102fb8ddee3cd8df`, path commit `c2c107cab9ba28419c7646192b17d7abeab20757`, upload date `2025-10-27T22:38:32Z`. Honest takeaway: this is a long conversational SAT.X rearchitecture proposing `theta4`, `psi`, `tau`, gauge analogies, Hilbert/path-integral language, and particle tables. It repeatedly labels ansatz-level steps “complete” without derivations or tests and contains its own warnings that simulation/proof belongs elsewhere. It is valuable for terminology lineage, but it supplies no independent evidence for the hbar/filament-scale construction and must not be read as current bedrock.

## External primary references

- NIST 2022 CODATA, reduced Planck constant: https://physics.nist.gov/cgi-bin/cuu/Value?hbar=
- NIST 2022 CODATA, fine-structure constant: https://physics.nist.gov/cgi-bin/cuu/Value?alph=
- Schneider et al., *Direct measurement of the 3He+ magnetic moments* (2022): https://pmc.ncbi.nlm.nih.gov/articles/PMC9242863/

