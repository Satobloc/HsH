# Mira packet — typed extra-structure observability gate

**Submission ID:** `mira-extra-structure-observability-20261027t04z-s3-001`  
**Worker lens:** Mira — source typing, provenance, chronology, and point-of-use citation audit  
**Status:** `LEAN_VERIFIED / SOURCE-CRITICAL / EMPIRICAL_TEST_NOT_RUN / FACTORY_INTAKE_PENDING`

## Result

The archived SAT-O source describes a finite worldtube, but its displayed state and action contain only a centerline `γ` and tangent `v`. Thickness, twist/framing, and contact surfaces are therefore **not mathematically forced by the displayed equations**. They become nonredundant only when a declared measurement channel can distinguish two extra-structure states at fixed centerline.

This is an architecture gate, not a physics result:

- If every typed readout factors through the centerline/base state, the extra structure is observationally invisible.
- One fixed-base, one-channel difference blocks every base-only factorization.
- Conversely, if all extra states are pointwise invisible and a reference extra state is declared, a base-only predictor exists.

Lean checks this encoded statement only. It does not prove the historical-source translation, the existence of a physical thickness effect, or SAT/H(s)H empirical validity.

## Historical source record

**Repository/path:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT O1 4D.txt`  
**Git blob:** `7577aa1ee5a6c3850ce3b226c75377de6367aedc`  
**Repository snapshot commit:** `7568462eb5d1059be9a10fe66d2cd3b296c1831f`  
**Snapshot timestamp:** 2026-10-26T16:12:19Z  
**Source-internal authorship/date:** unresolved; the snapshot timestamp is not asserted as authorship date.  
**Classification:** historical/generative SAT-O source, not BEDROCK and not independently validated.

Verbatim source:

> A smooth, one-dimensional object `γ : ℝ → ℝ^{3,1}` parameterized by an affine parameter `λ`.

> The 4D volume swept out by the vibrating filament, representing its real, physical presence in spacetime.

```tex
\gamma^\mu(\lambda) =
( \lambda,
  A_x \sin(k_x \lambda + \phi_x),
  A_y \sin(k_y \lambda + \phi_y),
  A_z \sin(k_z \lambda + \phi_z) )
```

```tex
S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu)
```

```tex
L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
```

**Source-critical finding:** the prose claims a finite four-volume, but the displayed formal state is a one-dimensional map and the action depends on the curve and its tangent. No radius/cross-section field, normal frame, twist variable, contact surface, projection map, or coarse-graining operator is supplied. This is an under-specification finding, not a correction of the historical text.

**Separate proposal, not source correction:** represent a candidate finite object as `(base, extra)`, where `base` contains the centerline state and `extra` explicitly contains any radius/cross-section, framing/twist, or contact data. A later geometric model must state projection and composition maps and their hypotheses.

## Lean 4 / Mathlib formalization

**Repository:** `Satobloc/HsH`  
**Draft PR:** https://github.com/Satobloc/HsH/pull/388  
**Head commit:** `aabc957398d61a6bf33def408cb78831d04f3b93`  
**Module:** `FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0036.lean`

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0036

abbrev Readout (Channel : Type*) (Observable : Channel → Type*) :=
  (i : Channel) → Observable i

def FactorsThroughBase
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable) : Prop :=
  ∃ basePredict : Base → Readout Channel Observable,
    ∀ b e i, predict (b, e) i = basePredict b i

def ExtraInvisible
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable) : Prop :=
  ∀ b e₁ e₂ i, predict (b, e₁) i = predict (b, e₂) i

theorem factorization_makes_extra_invisible
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable)
    (hfactor : FactorsThroughBase predict) :
    ExtraInvisible predict := by
  rcases hfactor with ⟨basePredict, hbase⟩
  intro b e₁ e₂ i
  calc
    predict (b, e₁) i = basePredict b i := hbase b e₁ i
    _ = predict (b, e₂) i := (hbase b e₂ i).symm

theorem channel_witness_blocks_factorization
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable)
    {b : Base} {e₁ e₂ : Extra} {i : Channel}
    (hchange : predict (b, e₁) i ≠ predict (b, e₂) i) :
    ¬ FactorsThroughBase predict := by
  intro hfactor
  exact hchange
    (factorization_makes_extra_invisible predict hfactor b e₁ e₂ i)

theorem invisibility_implies_factorization
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable)
    (e₀ : Extra) (hinvisible : ExtraInvisible predict) :
    FactorsThroughBase predict := by
  refine ⟨fun b => predict (b, e₀), ?_⟩
  intro b e i
  exact hinvisible b e e₀ i

theorem factorization_iff_invisible
    {Base Extra Channel : Type*} {Observable : Channel → Type*}
    (predict : Base × Extra → Readout Channel Observable)
    (e₀ : Extra) :
    FactorsThroughBase predict ↔ ExtraInvisible predict := by
  constructor
  · exact factorization_makes_extra_invisible predict
  · exact invisibility_implies_factorization predict e₀

#print axioms factorization_makes_extra_invisible
#print axioms channel_witness_blocks_factorization
#print axioms invisibility_implies_factorization
#print axioms factorization_iff_invisible

end HsHVerification.ArchiveEQ0036
```

## Actual CI receipt

**Workflow run:** https://github.com/Satobloc/HsH/actions/runs/40452002899  
**Job:** `verify`, ID `122016653604`  
**PR merge commit tested:** `dd69745eb4599f3dddb762c38c1b97ec1804bea0`  
**Head containing module:** `aabc957398d61a6bf33def408cb78831d04f3b93`  
**Lean:** 4.34.0, commit `293d5d0c0c3f3dded4688b3ccd6a33939ac5102b`  
**Mathlib:** `5ed2965256430c3649e86755f9576b54eca72435`

Exact relevant log:

```text
Built HsHVerification.ArchiveEQ0036
'factorization_makes_extra_invisible' does not depend on any axioms
'channel_witness_blocks_factorization' does not depend on any axioms
'invisibility_implies_factorization' does not depend on any axioms
'factorization_iff_invisible' does not depend on any axioms
Build completed successfully (8953 jobs).
```

**Compilation conclusion:** `LEAN_VERIFIED`.  
**Declared axioms:** none for all four theorems.  
**Important correction trail:** the immediately preceding successful build used whole-function equality and reported `Quot.sound` for the converse through function extensionality. The final channelwise definition above removes that avoidable dependency; the earlier result is retained in CI history rather than silently erased.

## Typed empirical workflow

The three candidate systems are not one observable type.

| System | Measured/inferred object | Published value | Proper forward-map endpoint | Falsification use |
|---|---|---:|---|---|
| Gravity Probe B | north-south and west-east gyro drift components | `-6601.8 ± 18.3 mas yr⁻¹`; `-37.2 ± 7.2 mas yr⁻¹` | joint drift vector with experimental covariance | frozen prediction outside declared joint confidence region |
| Galactic-center star S2 | fitted Schwarzschild-precession scale from astrometry/spectroscopy | `f_SP = 1.10 ± 0.19` | preferably raw astrometry + radial velocities with nuisance model; published `f_SP` is a derived fit summary | preregistered posterior-predictive miss after calibration parameters are frozen |
| EHT M87* | calibrated VLBI visibility data; ring diameter is pipeline/model-derived | `42 ± 3 μas` | complex visibilities/closure quantities through declared calibration, imaging, and emission model | visibility-domain or declared posterior failure; ring resemblance alone is insufficient |

Primary comparators:

- Everitt et al., *Gravity Probe B: Final Results of a Space Experiment to Test General Relativity*, PRL 106, 221101 (2011): https://doi.org/10.1103/PhysRevLett.106.221101
- GRAVITY Collaboration, *Detection of the Schwarzschild precession in the orbit of the star S2 near the Galactic centre massive black hole*, A&A 636, L5 (2020): https://doi.org/10.1051/0004-6361/202037813
- Event Horizon Telescope Collaboration, *First M87 Event Horizon Telescope Results. III. Data Processing and Calibration* (2019): https://arxiv.org/abs/1906.11240
- Event Horizon Telescope Collaboration, *First M87 Event Horizon Telescope Results. IV. Imaging the Central Supermassive Black Hole* (2019): https://arxiv.org/abs/1906.11241
- Event Horizon Telescope Collaboration, *First M87 Event Horizon Telescope Results. VI. The Shadow and Mass of the Central Black Hole* (2019): https://arxiv.org/abs/1906.11243

A valid cross-system model may share a core parameter `θ`, but it needs separate typed maps and nuisance blocks:

```text
θ, η_GP  ↦ gyro drift vector
θ, η_S2  ↦ astrometry and spectroscopy ↦ precession fit
θ, η_EHT ↦ sky brightness ↦ VLBI visibilities ↦ calibrated/inferred ring quantities
```

Calibration/holdout discipline:

1. Freeze the shared parameter and declared priors after a named calibration channel.
2. Freeze channel-specific nuisance treatment from independent calibration information.
3. Predict a holdout channel through its own measurement operator and likelihood.
4. Declare failure before viewing holdout residuals.
5. Do not retune thickness/twist/contact separately per channel; that would hide non-identifiability.

**No H(s)H physical calculation was run.** The archived source supplies no cross-system forward maps, units, nuisance model, or prediction separating base from extra structure. Using the published values without those maps would create a data-free physical fixture, which is not authorized.

## Exact discriminator

To show that thickness, twist, or contact is physically nonredundant, supply:

```text
a fixed base state b,
two admissible extra states e₁ ≠ e₂,
a named real measurement channel i,
and a preregistered forward map with
predict(b,e₁)(i) ≠ predict(b,e₂)(i)
after all shared and nuisance parameters are frozen.
```

Absent that witness—or absent a proof that it must exist—the added structure is optional representational detail for the tested channel, not an established physical degree of freedom.

## Mersearch and provenance boundary

All four live Mersearch lanes were already occupied at the bounded check, so no new Mersearch run or coverage claim was made. Direct repository retrieval was used only as the allowed fallback, with exact path/blob/snapshot identity above.

## Next-worker cursor — Aldus

Construct the geometric preconditions behind the proposed `Extra` type without treating analogy as proof:

1. model a finite-radius neighborhood of a centerline using an explicit normal bundle or framing;
2. state when a projection back to the centerline exists and is unique (including reach/self-intersection conditions);
3. type twist and contact surfaces separately;
4. show which compositions survive coarse-graining;
5. preserve the source/proposal distinction and attach any theorem to the exact historical anchor.

No BEDROCK promotion, independent empirical validation, Factory arrival, or cross-thread delivery is claimed.
