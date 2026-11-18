import Mathlib

/-!
Observable-family admission for the existing P2 comparison protocol.
Assistant-authored, 2026-11-18.

A single predeclared primary outcome (or jointly predeclared vector) can be
confirmatory. A secondary family requires the family and selection procedure
to be frozen and the multiplicity/selection treatment to be specified.
Post-hoc selection remains exploratory. All confirmatory paths require a
scoreable outcome, a frozen decision rule, matched comparator selection,
and dependence/covariance handling.

This encodes workflow labels only. It does not prove statistical validity,
data independence, physical prediction, or the adequacy of a correction.
-/

namespace HsHVerification.ObservableFamilyAdmission

inductive SelectionProtocol where
  | singlePrimary
  | jointPrimary
  | multiplicityAdjustedFamily
  | unadjustedFamily
  | postHoc
deriving DecidableEq, Repr

inductive Admission where
  | confirmatory
  | exploratory
  | unscorable
deriving DecidableEq, Repr

/-- Confirmatory admission requires a scoreable result and shared comparison
    controls. Only a frozen primary/joint primary or a frozen family with
    declared selection/multiplicity treatment is admitted. -/
def admit
    (scoreable decisionRuleFrozen comparatorSelectionMatched dependenceHandled : Bool)
    (selection : SelectionProtocol) : Admission :=
  if !scoreable then .unscorable
  else if !decisionRuleFrozen || !comparatorSelectionMatched || !dependenceHandled then .exploratory
  else
    match selection with
    | .singlePrimary => .confirmatory
    | .jointPrimary => .confirmatory
    | .multiplicityAdjustedFamily => .confirmatory
    | .unadjustedFamily => .exploratory
    | .postHoc => .exploratory

theorem unscorable_preempts_selection :
    admit false true true true .multiplicityAdjustedFamily = .unscorable := rfl

theorem frozen_single_primary_is_confirmatory :
    admit true true true true .singlePrimary = .confirmatory := rfl

theorem frozen_joint_primary_is_confirmatory :
    admit true true true true .jointPrimary = .confirmatory := rfl

theorem frozen_adjusted_family_is_confirmatory :
    admit true true true true .multiplicityAdjustedFamily = .confirmatory := rfl

theorem unadjusted_family_is_exploratory :
    admit true true true true .unadjustedFamily = .exploratory := rfl

theorem posthoc_selection_is_exploratory :
    admit true true true true .postHoc = .exploratory := rfl

theorem comparator_selection_mismatch_blocks_confirmatory :
    admit true true false true .singlePrimary = .exploratory := rfl

theorem dependence_unresolved_blocks_confirmatory :
    admit true true true false .jointPrimary = .exploratory := rfl

end HsHVerification.ObservableFamilyAdmission
