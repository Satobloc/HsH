import Mathlib

/-!
# Independent-unit holdout factorization

A single acquisition/realization may produce many measurement channels
(frames, angles, pixels, frequencies, or derived summaries). A calibration/
holdout split is unit-consistent only when the channel-level fold assignment
is induced by the declared acquisition-unit map.

This module proves the exact factorization condition. It does not establish
that the declared units are genuinely independent, authenticate acquisition
metadata, estimate covariance, or validate a physical model. Those remain
source- and data-dependent empirical obligations.
-/

namespace HsHVerification.CalderUnitLineageHoldout

/-- A channel-level fold assignment is constant on every fiber of the
declared acquisition-unit map. -/
def UnitConsistent {Channel AcquisitionUnit Fold : Type*}
    (unitOf : Channel → AcquisitionUnit)
    (foldOf : Channel → Fold) : Prop :=
  ∀ c₁ c₂, unitOf c₁ = unitOf c₂ → foldOf c₁ = foldOf c₂

/-- A channel-level split is induced by a unit-level split exactly when it
is constant across all channels sharing the same declared acquisition unit.
Surjectivity means AcquisitionUnit contains only units represented in the
observed channel set. -/
theorem unitFold_factorization_iff_unitConsistency
    {Channel AcquisitionUnit Fold : Type*}
    (unitOf : Channel → AcquisitionUnit)
    (foldOf : Channel → Fold)
    (hSurj : Function.Surjective unitOf) :
    (∃ unitFold : AcquisitionUnit → Fold,
      ∀ c, foldOf c = unitFold (unitOf c)) ↔
    UnitConsistent unitOf foldOf := by
  constructor
  · rintro ⟨unitFold, hFactor⟩ c₁ c₂ hSame
    calc
      foldOf c₁ = unitFold (unitOf c₁) := hFactor c₁
      _ = unitFold (unitOf c₂) := by rw [hSame]
      _ = foldOf c₂ := (hFactor c₂).symm
  · intro hConsistent
    classical
    refine ⟨fun u => foldOf (Classical.choose (hSurj u)), ?_⟩
    intro c
    apply hConsistent c (Classical.choose (hSurj (unitOf c)))
    exact (Classical.choose_spec (hSurj (unitOf c))).symm

/-- Failure of unit consistency has an explicit leakage witness: two
channels from the same declared unit receive different folds. -/
theorem fold_conflict_witness
    {Channel AcquisitionUnit Fold : Type*}
    (unitOf : Channel → AcquisitionUnit)
    (foldOf : Channel → Fold)
    (hNot : ¬ UnitConsistent unitOf foldOf) :
    ∃ c₁ c₂, unitOf c₁ = unitOf c₂ ∧ foldOf c₁ ≠ foldOf c₂ := by
  dsimp [UnitConsistent] at hNot
  push Not at hNot
  exact hNot

/-- When every declared acquisition unit is represented by a channel, the
unit-level fold map inducing a channel split is unique. -/
theorem unitFold_unique
    {Channel AcquisitionUnit Fold : Type*}
    (unitOf : Channel → AcquisitionUnit)
    (foldOf : Channel → Fold)
    (hSurj : Function.Surjective unitOf)
    (f g : AcquisitionUnit → Fold)
    (hf : ∀ c, foldOf c = f (unitOf c))
    (hg : ∀ c, foldOf c = g (unitOf c)) :
    f = g := by
  funext u
  obtain ⟨c, hc⟩ := hSurj u
  calc
    f u = f (unitOf c) := (congrArg f hc).symm
    _ = foldOf c := (hf c).symm
    _ = g (unitOf c) := hg c
    _ = g u := congrArg g hc

#print axioms unitFold_factorization_iff_unitConsistency
#print axioms fold_conflict_witness
#print axioms unitFold_unique

end HsHVerification.CalderUnitLineageHoldout
