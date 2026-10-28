# Calder :36 — admissible-refinement projection gate (Archive EQ0044)

**Continuity:** Calder supplies the historical adversarial empirical/statistical QA and null-design lens. This is current source-grounded assistant work, not historical-instance authentication or cross-thread delivery. Next: **Hale**.

## Result

`ArchiveEQ0043` used unconstrained `(base, extra)` pairs. This run makes the hidden premise explicit as `(base, extra, Compatible base extra)`. Lean proves: empty fiber implies non-surjectivity; fiberwise uniqueness implies injectivity; exactly one admissible lift per base implies bijectivity; two distinct admissible lifts imply non-injectivity; and any base-factored readout is blind within one fiber.

Thus naming thickness/frame/twist/contact does not make it forced. A source-selected compatibility predicate and existence/uniqueness result are required. Hidden flexibility requires two admissible source-faithful lifts, not merely two values of an unconstrained type.

## Mersearch-first source custody

- Mersearch `indexes/mersearch_requests/2026-10-07-ravel-material-director-frame-001/SEARCH_RESULTS.md`, blob `e08892e7dcc43bcef0fde4b5f62640ba45d163f5`, generated `2026-10-07T10:55:04.607455+00:00`, coverage 3,987 files / 6,597,201 records / 224 lexical hits; not authority or completeness.
- Historical SAT-O snapshot `Satobloc/SAT_THEORY_ARCHIVE_2023-25@7568462eb5d1059be9a10fe66d2cd3b296c1831f`, `SATOBLOC MISC/SAT O1 4D.txt`, blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`, complete 3,521-character read.
- Archive index metadata: created `6/9/2025 6:44:50 PM`, modified `10/26/2025 7:12:34 PM`; timestamps do not prove authorship.

Verbatim historical mathematics:

```tex
\gamma^\mu(\lambda) = \left( \lambda, A_x \sin(k_x \lambda + \phi_x), A_y \sin(k_y \lambda + \phi_y), A_z \sin(k_z \lambda + \phi_z) \right)
```
```tex
v^\mu(\lambda) = \frac{d \gamma^\mu}{d \lambda}
```
```tex
S[\gamma] = \int d\lambda \, L(\gamma^\mu, v^\mu),
\qquad L = \frac{1}{2} m v^\mu v_\mu - V_{\text{tension}}(\gamma)
```

The source types `\gamma : \mathbb R \to \mathbb R^{3,1}` and calls a worldtube the swept 4D volume, but gives no radius domain, tubular-neighborhood condition, frame bundle, contact boundary, projection, or compatibility predicate. Lean `Compatible` is assistant verification architecture, not recovered SAT-O math.

## Exact Lean

```lean
import Mathlib

/-!
# ArchiveEQ0044 — admissible-refinement projection gate

Historical source:
`Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT O1 4D.txt`,
blob `7577aa1ee5a6c3850ce3b226c75377de6367aedc`.

That source defines a one-dimensional filament map and calls its swept
four-dimensional volume a worldtube, but does not give the compatibility laws
needed to decide which volume, radius, frame, or contact data are admissible
over a lower-level object.

This module is an assistant reconstruction of the verification architecture,
not a source equation. It refines ArchiveEQ0043 by making admissibility
explicit. Theorems classify the forgetful projection under stated logical
hypotheses only; they do not show that a physical lift exists or that any
compatibility predicate is source-faithful.
-/

namespace HsHVerification.ArchiveEQ0044

structure CompatibleExtension
    (Base Extra : Type*) (Compatible : Base → Extra → Prop) where
  base : Base
  extra : Extra
  compatible : Compatible base extra

def compatibleForget
    {Base Extra : Type*} {Compatible : Base → Extra → Prop} :
    CompatibleExtension Base Extra Compatible → Base :=
  fun model => model.base

theorem compatible_forget_not_injective_of_two_admissible
    {Base Extra : Type*} {Compatible : Base → Extra → Prop}
    (base : Base) {extra₁ extra₂ : Extra}
    (hadmissible₁ : Compatible base extra₁)
    (hadmissible₂ : Compatible base extra₂)
    (hdifferent : extra₁ ≠ extra₂) :
    ¬ Function.Injective
      (@compatibleForget Base Extra Compatible) := by
  intro hinjective
  have hmodels :
      (CompatibleExtension.mk base extra₁ hadmissible₁ :
        CompatibleExtension Base Extra Compatible) =
      CompatibleExtension.mk base extra₂ hadmissible₂ := by
    apply hinjective
    rfl
  exact hdifferent (congrArg CompatibleExtension.extra hmodels)

theorem compatible_forget_injective_of_fiber_unique
    {Base Extra : Type*} {Compatible : Base → Extra → Prop}
    (hunique :
      ∀ (base : Base) (extra₁ extra₂ : Extra),
        Compatible base extra₁ →
        Compatible base extra₂ →
        extra₁ = extra₂) :
    Function.Injective
      (@compatibleForget Base Extra Compatible) := by
  intro model₁ model₂ hbase
  cases model₁ with
  | mk base₁ extra₁ hadmissible₁ =>
    cases model₂ with
    | mk base₂ extra₂ hadmissible₂ =>
      dsimp [compatibleForget] at hbase
      subst base₂
      have hextra : extra₁ = extra₂ :=
        hunique base₁ extra₁ extra₂ hadmissible₁ hadmissible₂
      subst extra₂
      rfl

theorem compatible_forget_not_surjective_of_empty_fiber
    {Base Extra : Type*} {Compatible : Base → Extra → Prop}
    (base : Base)
    (hempty : ∀ extra : Extra, ¬ Compatible base extra) :
    ¬ Function.Surjective
      (@compatibleForget Base Extra Compatible) := by
  intro hsurjective
  rcases hsurjective base with
    ⟨⟨base', extra, hadmissible⟩, hbase⟩
  dsimp [compatibleForget] at hbase
  subst base'
  exact hempty extra hadmissible

theorem compatible_forget_bijective_of_unique_admissible
    {Base Extra : Type*} {Compatible : Base → Extra → Prop}
    (hexistsUnique : ∀ base : Base, ∃! extra : Extra, Compatible base extra) :
    Function.Bijective
      (@compatibleForget Base Extra Compatible) := by
  constructor
  · apply compatible_forget_injective_of_fiber_unique
    intro base extra₁ extra₂ hadmissible₁ hadmissible₂
    exact (hexistsUnique base).unique hadmissible₁ hadmissible₂
  · intro base
    rcases hexistsUnique base with ⟨extra, hadmissible, _⟩
    exact ⟨⟨base, extra, hadmissible⟩, rfl⟩

theorem observable_factors_through_base_is_blind_to_same_base
    {Base Extra Observable : Type*}
    {Compatible : Base → Extra → Prop}
    (readout : Base → Observable)
    (model₁ model₂ : CompatibleExtension Base Extra Compatible)
    (hsameBase :
      compatibleForget model₁ = compatibleForget model₂) :
    readout (compatibleForget model₁) =
      readout (compatibleForget model₂) := by
  exact congrArg readout hsameBase

theorem changed_readout_requires_changed_base
    {Base Extra Observable : Type*}
    {Compatible : Base → Extra → Prop}
    (readout : Base → Observable)
    (model₁ model₂ : CompatibleExtension Base Extra Compatible)
    (hchanged :
      readout (compatibleForget model₁) ≠
        readout (compatibleForget model₂)) :
    compatibleForget model₁ ≠ compatibleForget model₂ := by
  intro hsameBase
  exact hchanged
    (observable_factors_through_base_is_blind_to_same_base
      readout model₁ model₂ hsameBase)

#print axioms compatible_forget_not_injective_of_two_admissible
#print axioms compatible_forget_injective_of_fiber_unique
#print axioms compatible_forget_not_surjective_of_empty_fiber
#print axioms compatible_forget_bijective_of_unique_admissible
#print axioms observable_factors_through_base_is_blind_to_same_base
#print axioms changed_readout_requires_changed_base

end HsHVerification.ArchiveEQ0044
```

## Compiler receipt

- existing draft PR `#388`, branch `codex/eq0015-elias-20261024`
- module commit `79b01bfe19475948f4ec498954d6954aacc0dfcc`; final head `490527a2761224d282b259f8eec507f10c99ba3e`; module blob `a0893e4331d480327738bbb5198bca6b6a4aed9b`
- workflow run `40651118741`
- first job `122691647664`: Elan download reset by peer; compilation skipped (retained infrastructure failure)
- retry job `122694558962`: Lean 4.34.0, Lake 5.0.0, Mathlib `5ed2965256430c3649e86755f9576b54eca72435`
- `Built HsHVerification.ArchiveEQ0044 (7.3s)`; `Build completed successfully (8962 jobs).`
- all six explicit `#print axioms` targets report `does not depend on any axioms`
- automated test/lint/nanoda/action axiom-audit steps skipped; axiom result comes from explicit commands

## Adversarial empirical matrix

| Question | Real system / calibration | Required non-factored holdout | Comparator / threshold | Verdict |
|---|---|---|---|---|
| Does a centerline force finite-core data? | S2 around Sgr A*, GRAVITY 2020 A&A 636 L5 Table E.1: `M=4.261±0.012` million nominal solar masses, `R0=8246.7±9.3 pc`, `a=125.058±0.041 mas`, `e=0.884649±0.000066` | independent thickness-sensitive observable plus source-selected forward map | GR/Kerr point-orbit likelihood; threshold unavailable until covariance/map/observable exist | **BLOCKED**; base calibration only |
| Does a trajectory force frame/twist? | same S2 astrometric/spectroscopic base | independent orientation-sensitive likelihood | standard orbital/tetrad conventions; no threshold yet | **BLOCKED**; base-factored readout is blind within fiber |
| Does geometry force contact? | no measured contact-bearing SAT/H(s)H system selected | measured contact/exclusion response with units/uncertainty | continuum/contact comparator not selected | **BLOCKED** |

S2 is a previously source-verified project comparator, not a new calculation here. No physical residual, fit, uncertainty propagation or independent prediction was executed. Lean checks the encoded map logic only, not source translation or physical premises.

## Handoff

Predecessor issue `#856` is now publication-verified at destination `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aster-worldtube-model-ladder-20261028t06z-s3-001.md`, commit `0d91abcbb83e3035177c551808ebe5c3ef1db330`, matching checksum `e08dd77404d0c1962d8a83c15408bb9c8bd573fab2543b53f058dc0be9280c2a`.

**Hale cursor:** recover an actual source law before instantiating `Compatible`. For every ladder edge classify the fiber as empty / unique / multiple / unresolved, then identify an independent readout that would fail to factor through the lower projection. Do not infer existence or uniqueness from terminology or a Lean type.

Status: **LEAN-COMPILED CONDITIONAL ARCHITECTURE / SOURCE COMPATIBILITY LAW MISSING / EMPIRICALLY BLOCKED**. No BEDROCK, task/schedule/phase, access/license/signet/chat, recurrence, physical-equivalence or delivery mutation.