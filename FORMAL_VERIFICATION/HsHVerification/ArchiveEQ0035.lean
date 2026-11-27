import Mathlib

/-!
# ArchiveEQ0035 — Resolution-map and hierarchy obligations

This module formalizes consequences of treating a finite-sheet intersection as a
resolution map and then composing it with an observational readout.  It proves
only these abstract set/function statements.  It does not establish that the
archived SAT/H(s)H sets or maps faithfully represent a physical system.
-/

namespace HsHVerification.ArchiveEQ0035

open Set

def resolveSet {α : Type*} (sheet core : Set α) : Set α :=
  sheet ∩ core

theorem duplicated_intersection_definitions_are_equal
    {α : Type*} (sheet core : Set α) :
    resolveSet sheet core = sheet ∩ core := by
  rfl

theorem resolution_monotone
    {α : Type*} {sheet₁ sheet₂ core₁ core₂ : Set α}
    (hsheet : sheet₁ ⊆ sheet₂) (hcore : core₁ ⊆ core₂) :
    resolveSet sheet₁ core₁ ⊆ resolveSet sheet₂ core₂ := by
  intro x hx
  exact ⟨hsheet hx.1, hcore hx.2⟩

theorem downstream_readout_cannot_separate_collapsed_states
    {Fine Resolved Observable : Type*}
    (resolve : Fine → Resolved) (observe : Resolved → Observable)
    {x y : Fine} (hcollapse : resolve x = resolve y) :
    observe (resolve x) = observe (resolve y) := by
  exact congrArg observe hcollapse

theorem observable_difference_requires_resolved_difference
    {Fine Resolved Observable : Type*}
    (resolve : Fine → Resolved) (observe : Resolved → Observable)
    {x y : Fine} (hobs : observe (resolve x) ≠ observe (resolve y)) :
    resolve x ≠ resolve y := by
  intro hcollapse
  exact hobs (congrArg observe hcollapse)

theorem collapse_forbids_global_left_inverse
    {Fine Resolved : Type*} (resolve : Fine → Resolved)
    {x y : Fine} (hxy : x ≠ y) (hcollapse : resolve x = resolve y) :
    ¬ ∃ reconstruct : Resolved → Fine,
        Function.LeftInverse reconstruct resolve := by
  rintro ⟨reconstruct, hleft⟩
  apply hxy
  calc
    x = reconstruct (resolve x) := (hleft x).symm
    _ = reconstruct (resolve y) := congrArg reconstruct hcollapse
    _ = y := hleft y

#print axioms duplicated_intersection_definitions_are_equal
#print axioms resolution_monotone
#print axioms downstream_readout_cannot_separate_collapsed_states
#print axioms observable_difference_requires_resolved_difference
#print axioms collapse_forbids_global_left_inverse

end HsHVerification.ArchiveEQ0035
