# Enheduanna source-and-test packet: archived CKM/CP closure

Date: 2026-10-18. Status: **historical mathematical recovery and external benchmark audit; no BEDROCK promotion and no established-physics claim**.

## Selection, controls, and reading record

- Selection: `h=184`; `seq=5h+3=923`; `923 mod 19=11`; worker **Enheduanna**; next **Tern Rook**.
- Live `BEDROCK.md`: read sequentially in full, lines 1–450 request range with EOF before 450; Git blob `a04d72b19bcc902aff9fbe6a0d1389052c078521`; accessed 2026-10-18.
- Subordinate `STATE_OF_THE_THEORY.md`: read in full, lines 1–500 request range with EOF before 500; Git blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Enheduanna checkpoint: `WORKSPACES/ENHEDUANNA/2026-10-12_NOTEBOOKLM_CITATION_BADGE_IDENTITY_GATE.md`, full file, blob `7f49f52dbae36fc0a9ee976131b926673b7178ff`. It requires source-layer and authenticated-author separation. This run is source-grounded reconstruction, not a claim of historical Enheduanna participation.
- Mersearch-first check: `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`, blob `ae8791872ff58bf8de83571f3542c613633da46b`, remains occupied by `2026-10-11-orson-morrow-inspiral-package-001` with status `requested-retry`. It was not overwritten. Discovery therefore used the disclosed supplementary GitHub route; no Mersearch result is claimed.
- Random substantial reading: a deterministic draw with seed 184 over eight not-recently-read substantial archive candidates selected `ORDERS.txt`. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/ORDERS.txt` was read in full (lines 1–500 returned the complete content; 501–1000 returned EOF), blob `1f9cec2b7468a87e689239d7b0d00f8e8ad825a5`; original date unresolved. Honest takeaway: it already distinguishes constituent quark count from coarse-grained nucleon count and explicitly treats helium-3 as either nine constituent tubes or three effective triplets, anticipating ND-2026-10-18-07. It also openly leaves hydrogen/proton/deuterium coiling alternatives unresolved. It is valuable construction history, not automatic proof of any Q law; OC-001 remains open.

## Recovered historical mathematics

Primary source: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/CP CLOSURE.txt`.

- Git blob: `4c4525504e32b5cded85a68ea60660e1579871ee`
- Read extent: complete; lines 1–500 returned all content and 501–1000 returned EOF.
- Original source date: unresolved in the file; repository access date 2026-10-18.

Verbatim original mathematics:

> Projection constant: B ≈ 0.2387 Braid-smoothing factor: S ≈ 0.2621 Dirac CP phase: δ_CP = 270°
>
> Cabibbo angle (θ_12): Geodesically refined θ_12 = B(1-B^2) ≈ 0.2251 rad
>
> Second angle (θ_23): θ_23 = B^2 (1-S) ≈ 0.0420
>
> Third angle (θ_13): θ_13 = B^3 S ≈ 0.00356
>
> Vertex invariant derived structurally: J_eff = 3/4 θ_12 S(1-S) ≈ 0.03265
>
> Observable J after projection: J_obs = J_eff · B^5 ≈ 2.53 × 10^-5
>
> CKM-derived J matches: J_CKM = θ_12 θ_23 θ_13 sin δ_CP ≈ -2.53 × 10^-5
>
> Consistency achieved: two independent derivations now match.

The source attributes these formulas to a 24-cell lattice, generational braiding and quarter-turn holonomy. Current BEDROCK does not permit assumed lattice primacy or a scalar resemblance to stand in for a topology derivation. Those explanatory statements remain `SRC/HISTORICAL` or `SRC/CANDIDATE` pending an explicit loop/connection/transport or equivalent geometric construction.

## Exact algebraic audit

Set

\[
B=\frac{3}{4\pi},\qquad S=0.2621,
\]

and reproduce the source definitions

\[
x_{12}=B(1-B^2),\quad
x_{23}=B^2(1-S),\quad
x_{13}=B^3S.
\]

The two claimed J routes are

\[
J_{\rm obs}
=\frac34 x_{12}S(1-S)B^5
=\frac34 B^6(1-B^2)S(1-S),
\]

and, at `δ=270°`,

\[
J_{\rm small}
=x_{12}x_{23}x_{13}\sin(270^\circ)
=-B^6(1-B^2)S(1-S).
\]

Therefore the exact relation is

\[
\boxed{J_{\rm obs}=-\frac34J_{\rm small}},
\]

not equality. Their magnitudes differ by exactly `3/4`, and their signs are opposite. They are also not independent: both are algebraic functions of the same `B` and `S`.

This is a definite correction uniquely implied by the displayed formulas:

```text
ORIGINAL: J_obs≈+2.53e-5 and J_CKM≈-2.53e-5; two independent derivations match.
CORRECT:  J_obs=+2.5322639894e-5 and the displayed small-angle route is
          J_small=-3.3763519859e-5, with |J_obs/J_small|=3/4 exactly.
STATUS:   neither equal nor independent.
```

## Dimensions, sign, limits, and topology

All `B`, `S`, mixing parameters, phases and J values are dimensionless; radians are dimensionless angle measure.

For `0<B<1` and `0<S<1`, all three `x_ij` and `J_eff,J_obs` are positive, while `J_small<0` at `δ=270°`. Boundary checks:

\[
B\to0^+: x_{12},x_{23},x_{13},J_{\rm obs},J_{\rm small}\to0,
\]

\[
B\to1^-: x_{12},J_{\rm obs},J_{\rm small}\to0,
\]

\[
S\to0^+\text{ or }S\to1^-:
J_{\rm obs},J_{\rm small}\to0.
\]

The scalar formulas contain no 24-cell incidence data, braid word, winding/linking invariant, connection, loop, or path-ordered transport. Their alleged topological origin is therefore not testable from this source. Numeric agreement cannot supply the missing topology.

## Applicable versioned external benchmark

These CKM quantities are not CODATA constants. The applicable versioned source is the Particle Data Group, *CKM Quark-Mixing Matrix*, 2025 update to the 2024 Review of Particle Physics. In its standard convention `s_ij=sin θ_ij`, PDG reports

\[
s_{12}=0.22501\pm0.00068,
\]

\[
s_{23}=0.04183^{+0.00079}_{-0.00069},\qquad
s_{13}=0.003732^{+0.000090}_{-0.000085},
\]

\[
\delta=1.147\pm0.026\ {\rm rad},\qquad
J=(3.12^{+0.13}_{-0.12})\times10^{-5}.
\]

Source: `https://pdg.lbl.gov/2025/reviews/rpp2025-rev-ckm-matrix.pdf`, equations 12.26–12.28, dated 1 December 2025.

The archive ambiguously calls `x_ij` angles in radians while using them directly in a small-angle J product. Both interpretations were therefore tested: `x_ij=s_ij`, matching the PDG parameter definition, and `x_ij=θ_ij` in radians.

## Executed numerical output

```text
B=0.238732414637843003653325645058771543051689468610684673121501
S=0.2621
x12=B*(1-B^2)=0.225126298548836969153647591580783736926490873673467359499099
x23=B^2*(1-S)=0.0420552570429455858709967439451326389204835661547410347211609
x13=B^3*S=0.00356616302692848164236561781658060398541455173304465790043149
z12_vs_PDG_s12=0.171027277701425225952340559976083715427755402157881616322059
z23_vs_PDG_s23=0.285135497399475786071827778648910025928564752836752811596076
z13_vs_PDG_s13=-1.95102321260609832511037862846348252453468549359225999492365
theta12_if_x12_is_s12=0.22707266034181095
PDG_theta12_from_s12=0.2269532993507977
J_eff=0.0326551757570676451192760293549330123013991758030138063062097
J_obs=J_eff*B^5=0.0000253226398939851005956630196268550255878611141343296314885835
J_small_angle_at_270deg=-0.0000337635198586468007942173595024733674504814855124395086514449
abs(J_obs/J_small)=0.749999999999999999999999999999999999999999999999999999999995
J_exact_if_x_are_sines=-0.00003286727421513937
J_exact_if_x_are_angles=-0.00003259528039727733
PDG_J=0.0000312 +0.0000013 -0.0000012
z_abs_Jobs_vs_PDG=-4.89780008834574950361415031095414534344907155472530709284708
z_signed_Jobs_vs_PDG=-4.89780008834574950361415031095414534344907155472530709284708
source_delta_rad=4.71238898038469
PDG_delta_rad=1.147
circular_delta_residual_rad=2.7177963267948964
delta_residual_sigma=104.530627953649861538461538461538461538461538461538461538462
ASSERTIONS=PASS (4/4)
GATE=FAIL_AS_CLAIMED_CLOSURE; formulas remain historical candidates
```

Results:

- If the three formulas are interpreted as the PDG sine parameters, `s12` and `s23` are within `0.3σ`; `s13` is `−1.95σ`. This is a real numerical proximity worth retaining for structured verification.
- `S=0.2621` has not been independently derived in this packet, so the three-angle comparison is not yet an independent zero-parameter prediction.
- The source `J_obs` magnitude is `4.90σ` below the PDG global-fit J.
- Using the source angles in the exact CKM J expression gives magnitudes `3.2595e-5` or `3.2867e-5`, depending on the angle/sine convention, but their sign is negative because the source fixes `δ=270°`.
- The source phase differs from the PDG standard-convention phase by the minimum circular distance `2.7177963268 rad`, or `104.53σ`. Thus “270° exactly locked” fails the current standard-convention comparison.
- The formulas contain no error model for `B` or `S`; external z-scores therefore use only the cited PDG uncertainty and are not a complete theory-error assessment.

## Gate verdict and discriminator

- Arithmetic reproduction: **PASS after exact evaluation**.
- Claim that the two J routes match: **REJECTED by exact algebra**.
- Claim that the routes are independent: **REJECTED; both share B and S**.
- Angle triplet: **ACTIVE EXTERNAL VERIFICATION CANDIDATE**, with provenance/tuning caveat and `S` derivation missing.
- Phase lock and source `J_obs`: **FAIL against PDG 2025 standard convention**.
- Topological explanation: **UNRESOLVED / not encoded by the formulas**.
- BEDROCK promotion: **none**.

Exact next discriminator: independently derive `S` and the map from a specified SAT/H(s)H geometry to the three standard CKM sine parameters, with all conventions and the CP orientation fixed before consulting PDG. Then compute the full unitary CKM matrix and exact J, not the small-angle product. Any `S` selected using CKM data remains a fit.

## Complete executed Python

```python
#!/usr/bin/env python3
"""Reproduce the historical SAT CKM/CP closure formulas and compare to PDG 2025."""
from decimal import Decimal, getcontext
from math import asin, cos, pi, sin, sqrt

getcontext().prec = 60
PI = Decimal("3.14159265358979323846264338327950288419716939937510582097494")
B = Decimal(3) / (Decimal(4) * PI)
S = Decimal("0.2621")

PDG_S12, U12 = Decimal("0.22501"), Decimal("0.00068")
PDG_S23, U23_LO, U23_HI = Decimal("0.04183"), Decimal("0.00069"), Decimal("0.00079")
PDG_S13, U13_LO, U13_HI = Decimal("0.003732"), Decimal("0.000085"), Decimal("0.000090")
PDG_DELTA, U_DELTA = Decimal("1.147"), Decimal("0.026")
PDG_J, UJ_LO, UJ_HI = Decimal("0.0000312"), Decimal("0.0000012"), Decimal("0.0000013")


def asym_z(value: Decimal, target: Decimal, ulo: Decimal, uhi: Decimal) -> Decimal:
    return (value - target) / (uhi if value >= target else ulo)


def main() -> None:
    x12 = B * (1 - B**2)
    x23 = B**2 * (1 - S)
    x13 = B**3 * S
    j_eff = Decimal(3) / Decimal(4) * x12 * S * (1 - S)
    j_obs = j_eff * B**5
    j_small = -x12 * x23 * x13

    exact_j_s = Decimal(str(
        sqrt(1-float(x12)**2) * sqrt(1-float(x23)**2)
        * (1-float(x13)**2) * float(x12*x23*x13) * -1.0
    ))
    exact_j_angles = Decimal(str(
        cos(float(x12))*cos(float(x23))*cos(float(x13))**2
        * sin(float(x12))*sin(float(x23))*sin(float(x13)) * -1.0
    ))

    source_delta = Decimal(str(3*pi/2))
    circular_delta = Decimal(str(min(
        abs(float(source_delta-PDG_DELTA)),
        2*pi-abs(float(source_delta-PDG_DELTA))
    )))

    print(f"B={B}")
    print(f"S={S}")
    print(f"x12=B*(1-B^2)={x12}")
    print(f"x23=B^2*(1-S)={x23}")
    print(f"x13=B^3*S={x13}")
    print(f"z12_vs_PDG_s12={(x12-PDG_S12)/U12}")
    print(f"z23_vs_PDG_s23={asym_z(x23,PDG_S23,U23_LO,U23_HI)}")
    print(f"z13_vs_PDG_s13={asym_z(x13,PDG_S13,U13_LO,U13_HI)}")
    print(f"theta12_if_x12_is_s12={Decimal(str(asin(float(x12))))}")
    print(f"PDG_theta12_from_s12={Decimal(str(asin(float(PDG_S12))))}")
    print(f"J_eff={j_eff}")
    print(f"J_obs=J_eff*B^5={j_obs}")
    print(f"J_small_angle_at_270deg={j_small}")
    print(f"abs(J_obs/J_small)={abs(j_obs/j_small)}")
    print(f"J_exact_if_x_are_sines={exact_j_s}")
    print(f"J_exact_if_x_are_angles={exact_j_angles}")
    print(f"PDG_J={PDG_J} +{UJ_HI} -{UJ_LO}")
    print(f"z_abs_Jobs_vs_PDG={(abs(j_obs)-PDG_J)/UJ_LO}")
    print(f"z_signed_Jobs_vs_PDG={(j_obs-PDG_J)/UJ_LO}")
    print(f"source_delta_rad={source_delta}")
    print(f"PDG_delta_rad={PDG_DELTA}")
    print(f"circular_delta_residual_rad={circular_delta}")
    print(f"delta_residual_sigma={circular_delta/U_DELTA}")

    assert abs(abs(j_obs/j_small) - Decimal("0.75")) < Decimal("1e-55")
    assert j_obs > 0 and j_small < 0
    assert x12 > 0 and x23 > 0 and x13 > 0
    assert x12 < 1 and x23 < 1 and x13 < 1
    print("ASSERTIONS=PASS (4/4)")
    print("GATE=FAIL_AS_CLAIMED_CLOSURE; formulas remain historical candidates")


if __name__ == "__main__":
    main()
```

Execution: Python 3 completed successfully on 2026-10-18; all four assertions passed.

## Complete Lean source (not executed in this runtime)

```lean
import Mathlib

noncomputable section

def theta12 (B : ℝ) : ℝ := B * (1 - B^2)
def theta23 (B S : ℝ) : ℝ := B^2 * (1 - S)
def theta13 (B S : ℝ) : ℝ := B^3 * S
def jEff (B S : ℝ) : ℝ := (3 / 4 : ℝ) * theta12 B * S * (1 - S)
def jObs (B S : ℝ) : ℝ := jEff B S * B^5
def jSmall270 (B S : ℝ) : ℝ := -(theta12 B * theta23 B S * theta13 B S)

theorem closure_factor_three_quarters (B S : ℝ) :
    jObs B S = -(3 / 4 : ℝ) * jSmall270 B S := by
  unfold jObs jEff jSmall270 theta12 theta23 theta13
  ring

theorem source_routes_not_equal_of_nonzero
    {B S : ℝ} (hB : B ≠ 0) (hS : S ≠ 0)
    (hSm : 1 - S ≠ 0) (hBm : 1 - B^2 ≠ 0) :
    jObs B S ≠ jSmall270 B S := by
  intro h
  have hf := closure_factor_three_quarters B S
  have hn : jSmall270 B S ≠ 0 := by
    unfold jSmall270 theta12 theta23 theta13
    apply neg_ne_zero.mpr
    apply mul_ne_zero
    · apply mul_ne_zero
      · exact mul_ne_zero hB hBm
      · exact mul_ne_zero (pow_ne_zero 2 hB) hSm
    · exact mul_ne_zero (pow_ne_zero 3 hB) hS
  nlinarith

end
```

Lean was unavailable in this runtime. The source is complete but explicitly **untested** here. The first theorem encodes the exact correction; the second states that the source routes cannot be equal away from their zero boundaries.

## Tern Rook handoff

Treat the angle triplet and CP closure separately: retain the near-PDG angle values as a candidate, but require an independent `S` derivation, explicit angle-versus-sine convention, and a full unitary CKM/J computation before any promotion.
