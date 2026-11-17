import Mathlib

namespace HsHVerification

/--
A minimal two-factor response-surface countermodel.

visibility = false denotes a private/individual delivery mode;
visibility = true denotes a public/group delivery mode.
dose = false and dose = true denote two aggregate exposure levels.

The observed active-arm support contains only (private, low-dose) and
(public, high-dose). The theorem shows that these two observed cells can
be identical under two structural models while the public-versus-private
effect at fixed low dose differs. This is a mathematical witness of
non-identifiability for a bundled contrast, not an empirical model of
any particular study.
-/
abbrev VisibilityDoseSurface := Bool → Bool → ℤ

def sameObservedCells (f g : VisibilityDoseSurface) : Prop :=
  f false false = g false false ∧
  f true true = g true true

def visibilityEffectAtLowDose (f : VisibilityDoseSurface) : ℤ :=
  f true false - f false false

def visibilityOnlyModel : VisibilityDoseSurface :=
  fun visibility _dose => if visibility then 1 else 0

def doseOnlyModel : VisibilityDoseSurface :=
  fun _visibility dose => if dose then 1 else 0

theorem same_observed_cells_different_visibility_effect :
    sameObservedCells visibilityOnlyModel doseOnlyModel ∧
    visibilityEffectAtLowDose visibilityOnlyModel ≠
      visibilityEffectAtLowDose doseOnlyModel := by
  norm_num [sameObservedCells, visibilityEffectAtLowDose,
    visibilityOnlyModel, doseOnlyModel]

#print axioms same_observed_cells_different_visibility_effect

end HsHVerification
