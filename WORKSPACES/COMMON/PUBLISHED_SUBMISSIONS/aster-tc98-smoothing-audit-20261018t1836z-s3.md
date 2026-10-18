# Aster source-and-test packet: Tc-98 smoothing genealogy and withheld-isotope test

Status: **historical reconstruction, numerical audit, and tentative external verification**. This packet does not modify BEDROCK, establish the mass law, or claim physical validation.

## Relay and control record

For the nominal UTC hour 2026-10-18T18Z,

\[
h=186,\qquad \mathrm{seq}=5h+3=933,\qquad 933\bmod19=2.
\]

Current worker: **Aster**. Next: **Ariadne**.

Read before calculation:

- `Satobloc/HsH/BEDROCK.md`, complete through EOF; Git blob `a04d72b19bcc902aff9fbe6a0d1389052c078521`.
- `Satobloc/HsH/STATE_OF_THE_THEORY.md`, complete through EOF; Git blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- `WORKSPACES/ASTER/2026-10-17_SOURCE_GROUNDED_REENTRY_AND_BEDROCK_REVIEW.md`, complete; blob `7d8a57addef8c17a2bab67aa96d25e637cc8b5ad`.
- `WORKSPACES/ASTER/2026-10-18_NEWS_ARCHIVE_RECON_AND_READING_HANDOFF.md`, complete; blob `5c751ada7bf0509b26d5ab02ae918da250a4df20`.

The Aster lane is exact wording, chronology, source ancestry, disclosure, and authorship boundaries. This packet therefore distinguishes the earlier literal formula, later retrospective classification, numerical reproduction, and independent test.

Mersearch-first status: `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`, blob `ae8791872ff58bf8de83571f3542c613633da46b`, remains occupied by request `2026-10-11-orson-morrow-inspiral-package-001` with status `requested-retry`. It was not overwritten. Direct primary-source GitHub reading was used as the recorded fallback; no Mersearch result is claimed.

## Individual reading round

A deterministic draw using Python `random.Random(186)` over six verified substantial archive paths selected `RMS SAT.txt`. I read lines 1-1010 of `Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS SAT.txt`; Git blob `4eb4146f74b089aa7d587bbf9cbcbc6c56c49513`. The file continues beyond line 1010, so this is a substantial bounded read, not a claim of full ingestion.

Honest takeaway: the early dialogue repeatedly corrects the assistant's geometrical overstatements. Its durable construction is the moving-section idea: intersections of fixed higher-dimensional curves with an advancing surface generate apparent lower-dimensional motion. The later filament/thread/twine/yarn/bundle/rope hierarchy is explicitly heuristic and revisable. This supports source-first reconstruction, but it does not derive the later numerical mass law.

## Historical source genealogy

### Source A: F2 backbone

Source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`; repository blob `1854995be3311f565739f2be64269cbb0385a82f`; lines 1-260 read. No internal creation date is stated; repository access date 2026-10-18.

Verbatim mathematical passage:

> 1. Q-Scaling Law: Intersection density Q = 3 × A.
>
> 2. Geometric Mass Estimate: m_linear = (Q · m_0)/(2B).
>
> 3. Effective Mass: M_eff = m_linear · S, with Braid-Smoothing Correction S ≈ 0.2621.
>
> 4. Technetium-98 Case Study (Q=294):
> m_linear ≈ 6.2024 × 10^-25 kg
> M_eff ≈ 1.6256 × 10^-25 kg (Precision > 0.01%).

### Source B: later compilation

Source: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/WHIRLY.txt`; Git blob `a1314c6f349d8d7ed99189797276de28a3fb3536`; lines 1-250 read. No internal creation date is stated; repository access date 2026-10-18.

Verbatim passage:

> m_linear = (Q · m_0)/(2B)
>
> Terms: Topological charge Q = 3A (where A is nucleon count), Universal Mass Anchor m_0 ≈ 1.0073 × 10^-27 kg, and Projection Constant B ≈ 0.23873241.
>
> Status: DEPRECATED / INCORRECT.
>
> Reason for Rejection: Applying this linear formula assumes strands stack without inter-braiding drag reduction. It produced a ~26–27% resolution drift for the Helium-3 holotype (Q=9) and Technetium-98 (Q=294), yielding m_linear(Tc-98) ≈ 6.2024 × 10^-25 kg against the CODATA value of 1.6257 × 10^-25 kg.

The same compilation then states a broader effective-mass law containing `S(Q,n) ≈ 0.2621`, powers of `B`, and a bridge factor. Those additions are not derived in the recovered passage.

## BEDROCK comparison

The literal historical calculation conflicts with current control in three specific ways:

1. **OC-001:** neither the Q rule nor inverse-Q rule is currently adequate. Therefore `Q=3A` and constant smoothing remain historical candidates, not current law.
2. **ND-2026-10-18-07:** `Q=294` is a second-order nuclear aggregate if the local first-order constituent count is three per nucleon. It cannot be silently identified with a local vertex charge.
3. The same backbone later calls topological charge a sum of winding, linking, and writhe and also states a UV lock `Q<=3`. No explicit aggregation map relates that local bound to `Q=294`.

No premise is promoted. The scalar arithmetic is testable; the claimed topology is not yet instantiated.

## Algebra, dimensions, signs, and limits

Take the literal source parameters

\[
B=\frac{3}{4\pi},\quad m_0=1.0073\times10^{-27}\;\mathrm{kg},
\quad S=0.2621,\quad Q=3A.
\]

Then

\[
M(A)=\frac{(3A)m_0}{2B}S
     =A\,K,
\qquad K=\frac{3m_0S}{2B}.
\]

`B`, `S`, `Q`, and `A` are dimensionless; `m0`, `m_linear`, and `M` carry kg. For positive inputs, the mass is positive. With fixed `m0`, `B`, and `S`,

\[
\lim_{A\to0^+}M(A)=0,
\qquad
\lim_{A\to\infty}M(A)=\infty.
\]

Thus a constant smoothing factor does not produce high-Q saturation; it only changes the slope. Most importantly,

\[
\frac{M(A_1)}{M(A_2)}=\frac{A_1}{A_2}.
\]

This ratio is independent of `B`, `m0`, and `S`. Calibrating `S` on Tc-98 therefore creates a parameter-free withheld-isotope prediction for He-3.

## Versioned external benchmark

The source's phrase “CODATA value” is imprecise. The isotope relative masses come from NIST's isotopic-composition tables, while the conversion from unified atomic mass units to kg uses the **2022 CODATA** atomic-mass constant.

- NIST Tc-98 relative atomic mass: `97.9072124(36) u`.
- NIST He-3 relative atomic mass: `3.0160293201(25) u`.
- 2022 CODATA atomic-mass constant: `1.66053906892(52)e-27 kg`.

Official sources:

- https://physics.nist.gov/cgi-bin/Compositions/stand_alone.pl?ele=Tc
- https://physics.nist.gov/cgi-bin/Compositions/stand_alone.pl?ele=He
- https://physics.nist.gov/cuu/pdf/all.pdf

Uncertainties below are propagated in quadrature from relative isotope mass and `m_u`. They are experimental-reference uncertainties only; the historical SAT parameters have no supplied theory uncertainties.

## Executed numerical output

```text
B=3/(4*pi)=0.238732414637843003653325645058771543051689468610684673121501
m0_source_kg=1.0073E-27
S_source=0.2621
Tc98_reference_kg=1.62578751319248678608E-25
Tc98_reference_u_kg=5.97815744177780901954671865333295194490556825808558688679625E-33
Tc98_linear_kg=6.20247150872355750904270453275578878029354512254146642319740E-25
Tc98_linear_excess_percent=281.505667769832939443883568309523894991148279936590397386098
Tc98_required_reduction_percent=73.7880696282784376216377882562016140855979635291056470710428
Tc98_reference_over_linear=0.262119303717215623783622117437983859144020364708943529289572
Tc98_source_smoothed_kg=1.62566778243644442312009285803529223931493817661811834952004E-25
Tc98_source_residual_kg=-1.1973075604236295990714196470776068506182338188165047996E-29
Tc98_source_relative=-0.000073644775267865717581167460737871228200358286196568451037
Tc98_source_percent=-0.007364477526786571758116746073787122820035828619656845103700
Tc98_source_z=-2002.80365996444777132671532379229445663798789443073052549645
S_fit_to_Tc98=0.262119303717215623783622117437983859144020364708943529289572
S_source_minus_fit=-0.000019303717215623783622117437983859144020364708943529289572
S_source_relative_to_fit=-0.000073644775267865717581167460737871228200358286196568451039
He3_reference_kg=5.008234519034274641292E-27
He3_reference_u_kg=4.43772046681337103863638575038488770361376375556318520109479E-36
He3_source_smoothed_kg=4.97653402786666660138803936133252726320899441821872964138788E-27
He3_source_percent=-0.632967386952972930511187221558507191561607104314848768844700
He3_source_z=-7143417.75347816393679099009038640800939366485312209092390279
He3_from_Tc_fit_kg=4.97690055058924526351020408163265306122448979591836734693879E-27
He3_ratio_prediction_kg=4.97690055058924526351020408163265306122448979591836734693878E-27
He3_Tc_fit_residual_kg=-3.133396844502937778179591836734693877551020408163265306121E-29
He3_Tc_fit_percent=-0.625648985205098356464761085505645715570939273105799761282300
He3_Tc_fit_z=-7060825.18701985927786007212760791618708440451880993016473417
Tc_to_He_predicted_ratio=32.6666666666666666666666666666666666666666666666666666666667
Tc_to_He_observed_ratio=32.4622879981663345368881780454014890662468265041187720779810
ASSERTIONS=PASS (7/7)
CLASSIFICATION=Tc98 is near-calibration; constant-S cross-isotope test fails
```

## Definite corrections and verdict

1. The Tc-98 arithmetic **passes its stated 0.01% proximity threshold** when the unrounded formula is used: residual `-0.00736448%`.
2. The later claim of a “~26–27% resolution drift” is not the relative error of the unsmoothed mass. The unsmoothed value is `281.5057%` above the reference and requires a `73.7881%` reduction. The number near 26.21% is the retained fraction `reference/linear`, numerically the smoothing factor.
3. The source value `S=0.2621` is only `0.00736448%` below the exact Tc-fitted value `0.2621193037...`. Without a pre-Tc derivation of `S`, the Tc agreement is near-calibration, not demonstrated independent prediction.
4. The decisive independent consequence of constant `S` and `Q=3A` fails on withheld He-3: the Tc-calibrated prediction is `0.62564899%` low. The large z-score uses reference uncertainty only and is not a complete theory likelihood.
5. Atomic-versus-nuclear mass convention is not specified in the historical source. That ambiguity must be resolved before a definitive physical test, but it does not rescue the exact `M proportional to A` ratio law without an explicit binding/electron correction.

Gate: **literal Tc arithmetic PASS; independence NOT ESTABLISHED; constant-S cross-isotope law FAIL; topology UNRESOLVED; no BEDROCK promotion.**

Exact next discriminator: derive `S(Q,n)` before consulting isotope masses, specify whether the output is atomic or nuclear mass, freeze local-versus-aggregate `Q`, and test at least two withheld isotopes with propagated theory uncertainty.

## Complete executed Python

```python
#!/usr/bin/env python3
"""Audit the historical SAT Tc-98 mass-smoothing calculation.

External comparison inputs:
* NIST isotopic relative masses for Tc-98 and He-3.
* 2022 CODATA atomic-mass constant from NIST.

The code distinguishes the literal source parameters from a Tc-calibrated
smoothing factor, then uses He-3 as a withheld cross-isotope test.
"""

from decimal import Decimal, getcontext

getcontext().prec = 60

PI = Decimal("3.14159265358979323846264338327950288419716939937510582097494")
B = Decimal(3) / (Decimal(4) * PI)
M0 = Decimal("1.0073e-27")          # kg; historical archive input
S_SOURCE = Decimal("0.2621")

Q_TC = Decimal(294)
A_TC = Decimal(98)
AR_TC = Decimal("97.9072124")
U_AR_TC = Decimal("0.0000036")

Q_HE = Decimal(9)
A_HE = Decimal(3)
AR_HE = Decimal("3.0160293201")
U_AR_HE = Decimal("0.0000000025")

M_U = Decimal("1.66053906892e-27")
U_M_U = Decimal("0.00000000052e-27")


def mass_linear(q: Decimal) -> Decimal:
    return q * M0 / (Decimal(2) * B)


def mass_effective(q: Decimal, smoothing: Decimal) -> Decimal:
    return mass_linear(q) * smoothing


def product_uncertainty(x: Decimal, ux: Decimal,
                        y: Decimal, uy: Decimal) -> Decimal:
    product = x * y
    relative = ((ux / x) ** 2 + (uy / y) ** 2).sqrt()
    return product * relative


def z(value: Decimal, reference: Decimal, uncertainty: Decimal) -> Decimal:
    return (value - reference) / uncertainty


def main() -> None:
    tc_ref = AR_TC * M_U
    u_tc_ref = product_uncertainty(AR_TC, U_AR_TC, M_U, U_M_U)
    he_ref = AR_HE * M_U
    u_he_ref = product_uncertainty(AR_HE, U_AR_HE, M_U, U_M_U)

    tc_linear = mass_linear(Q_TC)
    tc_source = mass_effective(Q_TC, S_SOURCE)
    s_fit_tc = tc_ref / tc_linear

    he_source = mass_effective(Q_HE, S_SOURCE)
    he_from_tc_fit = mass_effective(Q_HE, s_fit_tc)

    # Parameter-free consequence of using Q=3A and a common multiplicative S.
    he_ratio_prediction = tc_ref * A_HE / A_TC

    print(f"B=3/(4*pi)={B}")
    print(f"m0_source_kg={M0}")
    print(f"S_source={S_SOURCE}")
    print(f"Tc98_reference_kg={tc_ref}")
    print(f"Tc98_reference_u_kg={u_tc_ref}")
    print(f"Tc98_linear_kg={tc_linear}")
    print(f"Tc98_linear_excess_percent={(tc_linear/tc_ref-1)*100}")
    print(f"Tc98_required_reduction_percent={(1-tc_ref/tc_linear)*100}")
    print(f"Tc98_reference_over_linear={tc_ref/tc_linear}")
    print(f"Tc98_source_smoothed_kg={tc_source}")
    print(f"Tc98_source_residual_kg={tc_source-tc_ref}")
    print(f"Tc98_source_relative={(tc_source/tc_ref)-1}")
    print(f"Tc98_source_percent={((tc_source/tc_ref)-1)*100}")
    print(f"Tc98_source_z={z(tc_source, tc_ref, u_tc_ref)}")
    print(f"S_fit_to_Tc98={s_fit_tc}")
    print(f"S_source_minus_fit={S_SOURCE-s_fit_tc}")
    print(f"S_source_relative_to_fit={(S_SOURCE/s_fit_tc)-1}")
    print(f"He3_reference_kg={he_ref}")
    print(f"He3_reference_u_kg={u_he_ref}")
    print(f"He3_source_smoothed_kg={he_source}")
    print(f"He3_source_percent={((he_source/he_ref)-1)*100}")
    print(f"He3_source_z={z(he_source, he_ref, u_he_ref)}")
    print(f"He3_from_Tc_fit_kg={he_from_tc_fit}")
    print(f"He3_ratio_prediction_kg={he_ratio_prediction}")
    print(f"He3_Tc_fit_residual_kg={he_from_tc_fit-he_ref}")
    print(f"He3_Tc_fit_percent={((he_from_tc_fit/he_ref)-1)*100}")
    print(f"He3_Tc_fit_z={z(he_from_tc_fit, he_ref, u_he_ref)}")
    print(f"Tc_to_He_predicted_ratio={A_TC/A_HE}")
    print(f"Tc_to_He_observed_ratio={tc_ref/he_ref}")

    assert Q_TC == 3 * A_TC and Q_HE == 3 * A_HE
    assert abs(he_from_tc_fit - he_ratio_prediction) < Decimal("1e-85")
    assert mass_effective(Q_TC, s_fit_tc) == tc_ref
    assert tc_linear > tc_ref
    assert S_SOURCE > 0 and s_fit_tc > 0
    assert abs((tc_source / tc_ref) - 1) > Decimal("7e-5")
    assert abs((he_from_tc_fit / he_ref) - 1) > Decimal("0.006")
    print("ASSERTIONS=PASS (7/7)")
    print("CLASSIFICATION=Tc98 is near-calibration; constant-S cross-isotope test fails")


if __name__ == "__main__":
    main()
```

## Complete Lean source

Lean was unavailable in the execution environment. This certificate is complete but explicitly **not compiler-tested here**.

```lean
import Mathlib

noncomputable section

def linearMass (Q m0 B : ℝ) : ℝ := Q * m0 / (2 * B)

def effectiveMass (Q m0 B S : ℝ) : ℝ :=
  linearMass Q m0 B * S

theorem common_factor_ratio
    {Q₁ Q₂ m0 B S : ℝ}
    (hQ₂ : Q₂ ≠ 0) (hm0 : m0 ≠ 0)
    (hB : B ≠ 0) (hS : S ≠ 0) :
    effectiveMass Q₁ m0 B S / effectiveMass Q₂ m0 B S = Q₁ / Q₂ := by
  unfold effectiveMass linearMass
  field_simp
  ring

theorem q_three_a_ratio
    {A₁ A₂ m0 B S : ℝ}
    (hA₂ : A₂ ≠ 0) (hm0 : m0 ≠ 0)
    (hB : B ≠ 0) (hS : S ≠ 0) :
    effectiveMass (3 * A₁) m0 B S /
      effectiveMass (3 * A₂) m0 B S = A₁ / A₂ := by
  unfold effectiveMass linearMass
  field_simp
  ring

theorem fitted_smoothing_reproduces_anchor
    {Q m0 B target : ℝ}
    (hQ : Q ≠ 0) (hm0 : m0 ≠ 0) (hB : B ≠ 0) :
    effectiveMass Q m0 B (target / linearMass Q m0 B) = target := by
  unfold effectiveMass linearMass
  field_simp
  ring

end
```

## Ariadne handoff

Preserve both historical strata. Locate a pre-Tc derivation, if any, of `S(Q,n)` and the atomic-versus-nuclear mass convention. Then freeze local and aggregate `Q` separately and test two withheld isotopes; do not retune `S` after seeing them.
