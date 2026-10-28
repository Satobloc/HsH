# Aster :36 — explicit worldtube model-ladder projection gate (Archive EQ0043)

**Continuity:** Aster is the selected historical continuity handle; this is current source-grounded assistant work, not authentication of a historical Aster thread. Next handle: **Ariadne**.

## Substantive architecture result

The requested hierarchy is now typed as successive extensions:

1. centerline;
2. centerline + swept-volume data;
3. swept-volume model + finite-radius data;
4. finite tube + material/frame data;
5. framed tube + contact data.

Each upper level has an explicit forgetful projection to the level below. The four refinement projections are non-injective whenever the added type has two distinct values over the same lower-level object. The composite contact-to-centerline projection is definitionally equal to the four-stage forgetful chain.

This establishes hidden flexibility in the **encoded architecture**: a lower-level object does not uniquely determine added volume, radius, frame or contact data merely because the upper model has been named. It does not establish that the universe supplies any of these fields, that every type is inhabited, or that the source-faithful physical maps have been recovered.

## Mersearch-first and historical source

Existing Mersearch result consulted first:

- `indexes/mersearch_requests/2026-10-07-ravel-material-director-frame-001/SEARCH_RESULTS.md`
- blob `e08892e7dcc43bcef0fde4b5f62640ba45d163f5`
- generated 2026-10-07
- coverage: 3,987 files / 6,597,201 records / 224 hits
- lexical retrieval signals only; no authority or completeness inference

Historical SAT-O source, fully fetched:

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT O1 4D.txt`
- blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`
- 3,521 characters
- intrinsic authorship/date unresolved

Verbatim source mathematics:

```tex
\gamma^\mu(\lambda) = \left( \lambda,
A_x \sin(k_x \lambda + \phi_x),
A_y \sin(k_y \lambda + \phi_y),
A_z \sin(k_z \lambda + \phi_z) \right)
```

```tex
v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}
```

```tex
S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu),
\qquad
L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
```

The same source types a filament as `\gamma : \mathbb R \to \mathbb R^{3,1}` and calls a worldtube the swept four-dimensional volume. Its displayed state/action does not define a radius, normal/material frame, contact surface, projection or compatibility law.

Later Nathan-direct source:

- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/[[[HSH REFORMULATION - INIT]]]/H(SAT)H - init/H(s)H 2026 STARTUP DOCS.txt`
- blob `68200d849152dcb0c4fc1814f8b1789d499ebca8`
- complete fetched length 75,885 characters
- relevant passage begins near character 18,076
- internal timestamp only `Today 4:09 AM`; exact message date unresolved

Nathan says the work had already treated the filament as having thickness and bending, while warning that cross-sectional geometry may be a misnomer. This supports a project-level finite-core commitment but does not itself supply the missing typed maps or constitutive laws.

## Exact Lean module

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0043

structure Extension (Base Extra : Type*) where
  base : Base
  extra : Extra

def forget {Base Extra : Type*} : Extension Base Extra → Base :=
  fun model => model.base

def addExtra {Base Extra : Type*} (extra₀ : Extra) : Base → Extension Base Extra :=
  fun base => ⟨base, extra₀⟩

theorem forget_addExtra
    {Base Extra : Type*} (extra₀ : Extra) (base : Base) :
    forget (addExtra extra₀ base) = base := by
  rfl

theorem forget_not_injective_of_distinct_extras
    {Base Extra : Type*} (base : Base) {extra₁ extra₂ : Extra}
    (hdifferent : extra₁ ≠ extra₂) :
    ¬ Function.Injective (@forget Base Extra) := by
  intro hinjective
  have hmodels :
      (Extension.mk base extra₁ : Extension Base Extra) =
        Extension.mk base extra₂ := by
    apply hinjective
    rfl
  exact hdifferent (congrArg Extension.extra hmodels)

abbrev SweptVolumeModel (Centerline Volume : Type*) :=
  Extension Centerline Volume

abbrev FiniteTubeModel (Centerline Volume Radius : Type*) :=
  Extension (SweptVolumeModel Centerline Volume) Radius

abbrev FramedTubeModel
    (Centerline Volume Radius Frame : Type*) :=
  Extension (FiniteTubeModel Centerline Volume Radius) Frame

abbrev ContactTubeModel
    (Centerline Volume Radius Frame Contact : Type*) :=
  Extension (FramedTubeModel Centerline Volume Radius Frame) Contact

def sweptToCenterline
    {Centerline Volume : Type*} :
    SweptVolumeModel Centerline Volume → Centerline :=
  forget

def finiteToSwept
    {Centerline Volume Radius : Type*} :
    FiniteTubeModel Centerline Volume Radius →
      SweptVolumeModel Centerline Volume :=
  forget

def framedToFinite
    {Centerline Volume Radius Frame : Type*} :
    FramedTubeModel Centerline Volume Radius Frame →
      FiniteTubeModel Centerline Volume Radius :=
  forget

def contactToFramed
    {Centerline Volume Radius Frame Contact : Type*} :
    ContactTubeModel Centerline Volume Radius Frame Contact →
      FramedTubeModel Centerline Volume Radius Frame :=
  forget

def contactToCenterline
    {Centerline Volume Radius Frame Contact : Type*} :
    ContactTubeModel Centerline Volume Radius Frame Contact → Centerline :=
  fun model => model.base.base.base.base

theorem projection_chain_commutes
    {Centerline Volume Radius Frame Contact : Type*}
    (model : ContactTubeModel Centerline Volume Radius Frame Contact) :
    contactToCenterline model =
      sweptToCenterline
        (finiteToSwept
          (framedToFinite
            (contactToFramed model))) := by
  rfl

theorem swept_projection_not_injective
    {Centerline Volume : Type*}
    (centerline : Centerline) {volume₁ volume₂ : Volume}
    (hdifferent : volume₁ ≠ volume₂) :
    ¬ Function.Injective
      (@sweptToCenterline Centerline Volume) := by
  exact forget_not_injective_of_distinct_extras centerline hdifferent

theorem finite_projection_not_injective
    {Centerline Volume Radius : Type*}
    (swept : SweptVolumeModel Centerline Volume)
    {radius₁ radius₂ : Radius}
    (hdifferent : radius₁ ≠ radius₂) :
    ¬ Function.Injective
      (@finiteToSwept Centerline Volume Radius) := by
  exact forget_not_injective_of_distinct_extras swept hdifferent

theorem framed_projection_not_injective
    {Centerline Volume Radius Frame : Type*}
    (tube : FiniteTubeModel Centerline Volume Radius)
    {frame₁ frame₂ : Frame}
    (hdifferent : frame₁ ≠ frame₂) :
    ¬ Function.Injective
      (@framedToFinite Centerline Volume Radius Frame) := by
  exact forget_not_injective_of_distinct_extras tube hdifferent

theorem contact_projection_not_injective
    {Centerline Volume Radius Frame Contact : Type*}
    (tube : FramedTubeModel Centerline Volume Radius Frame)
    {contact₁ contact₂ : Contact}
    (hdifferent : contact₁ ≠ contact₂) :
    ¬ Function.Injective
      (@contactToFramed Centerline Volume Radius Frame Contact) := by
  exact forget_not_injective_of_distinct_extras tube hdifferent

end HsHVerification.ArchiveEQ0043
```

The committed module also contains seven explicit `#print axioms` commands.

## Actual compiler receipt

- existing draft PR: #388
- branch: `codex/eq0015-elias-20261024`
- module creation commit: `c4763106f0ceb5e1776c2c77171a973346f43235`
- final head/import commit: `62894bf31d0f9ed4d2aef0f50a2dde72e7b2f04d`
- workflow run: `40645621923`
- job: `122674079852`
- Lean 4.34.0; Lake 5.0.0
- Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`
- `Built HsHVerification.ArchiveEQ0043 (6.2s)`
- `Build completed successfully (8961 jobs).`
- all seven target theorems: `does not depend on any axioms`
- automated test, lint, nanoda and axiom-audit steps were skipped; the axiom result is from explicit `#print axioms`
- no compiler failure in this quantum

## Forced/optional/test matrix

| Transition | What the encoding adds | What is proved | What remains physically missing |
|---|---|---|---|
| centerline → swept volume | `Volume` datum | distinct volumes may project to one centerline | source-selected sweep/image law and dimensional/topological conditions |
| swept volume → finite tube | `Radius` datum | distinct radii may project to one swept model | radius domain, positivity, reach/tubular-neighborhood and self-intersection conditions |
| finite tube → framed tube | `Frame` datum | distinct frames may project to one finite tube | normal bundle/material director, gauge quotient and orientation-sensitive observable |
| framed tube → contact tube | `Contact` datum | distinct contact states may project to one framed tube | typed contact set, constitutive response, exclusion/penetration law and measured readout |

For each level, a physical distinction requires an observable channel that does not factor through the lower projection. No source-selected end-to-end forward map currently connects these added types to GP-B, S2 or EHT likelihoods. No physical calculation, fit, residual or independent prediction was attempted. Empirical status is **BLOCKED**, not falsified or validated.

## Receipt reconciliation and handoff

- Prior Ariadne issue #763 is now publication-verified at commit `9227b2c6b69c6820d236c232efb2844d742692c8`, with matching SHA-256 `7d25cba81ab421895c955927ee78235ed96ab34b47a0130891a26735c0a93a1d`.
- The expected immediate Mercer-to-Aster canonical handoff/receipt was not found at the bounded check. This is a documentation gap or in-flight state, not evidence of worker failure or nonresponse.

**Ariadne cursor:** source-audit whether each ladder edge appears in original Nathan messages, generated synthesis, or later reconstruction. For any claimed physical inclusion, require the actual projection map and compatibility law; distinguish “swept trace,” positive-measure volume, finite tubular neighborhood, framed material tube and contact-bearing boundary. Preserve any source that uses one name for multiple non-equivalent objects.

Status: **LEAN-COMPILED CONDITIONAL ARCHITECTURE / SOURCE TRANSLATION PARTIAL / EMPIRICALLY BLOCKED**. No BEDROCK promotion, scheduler/task/phase change, access/license/signet/chat mutation, sixth recurrence or cross-thread delivery claim.
