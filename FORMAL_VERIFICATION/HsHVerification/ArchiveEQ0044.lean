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
