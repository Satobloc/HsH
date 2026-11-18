import Mathlib

/-!
Three-model comparison architecture, assistant-authored 2026-11-18.

This module encodes only the logical separation of (1) standard-vs-core
framework comparison and (2) core-vs-added-feature comparison. Outcomes are
abstract pass/fail/unscorable labels. These witnesses are not physical data,
a statistical decision rule, or evidence that any SAT/H(s)H feature is needed.
-/

namespace HsHVerification.ThreeModelContrast

inductive Outcome where
  | pass
  | fail
  | unscorable
deriving DecidableEq, Repr

/-- A binary outcome contrast is unavailable if either outcome is unscorable. -/
def contrast (left right : Outcome) : Option Bool :=
  match left, right with
  | .pass, .pass => some false
  | .fail, .fail => some false
  | .pass, .fail => some true
  | .fail, .pass => some true
  | _, _ => none

/-- A feature-specific contrast can exist without a core-framework contrast:
    the core and standard model both pass, while the feature-augmented model
    fails. This prevents feature results from being attributed to the core. -/
theorem feature_contrast_without_framework_contrast :
    ∃ h0 h1 h1f : Outcome,
      contrast h1 h1f = some true ∧
      contrast h0 h1 = some false := by
  exact ⟨.pass, .pass, .fail, rfl, rfl⟩

/-- Framework-level contrast can exist without a feature-specific contrast:
    the core model differs from the standard model, while the added feature
    does not change the core outcome. -/
theorem framework_contrast_without_feature_contrast :
    ∃ h0 h1 h1f : Outcome,
      contrast h0 h1 = some true ∧
      contrast h1 h1f = some false := by
  exact ⟨.pass, .fail, .fail, rfl, rfl⟩

/-- Unscorable observations must not be silently converted to a binary
    contrast. -/
theorem unscorable_is_not_a_binary_contrast :
    contrast .unscorable .pass = none := rfl

end HsHVerification.ThreeModelContrast
