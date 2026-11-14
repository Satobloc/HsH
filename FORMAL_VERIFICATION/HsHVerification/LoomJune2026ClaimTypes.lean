import HsHVerification.LoomJune2026EditGraph
import Mathlib

/-!
The 2026-06-22 actual user-edit siblings make two DISTINCT verbal claims:
first: "more neutrinos are produced"; revised and selected: "more likely
they are to get to us as neutrinos". The selected text still retains
the earlier clause as part of a self-correction, so the relevant claim
is classified by its explicit "or rather" qualification. This file
formalizes source labels, NOT a causal or quantitative physical theory.

Also, the selected conversation records an assistant incorrectly
expanding WWRD as Relativity, followed by Nathan's explicit Rope
correction and later Petzl reformulation. Those are different source
speakers and statuses, not a physical equivalence of rope and worldtube.
-/

namespace HsHVerification.LoomJune2026ClaimTypes
open HsHVerification.LoomJune2026EditGraph

inductive OutcomeClaim where
  | emissionProduction
  | arrivalAsNeutrino
  deriving DecidableEq, Repr

def sourceClaim : Version → OutcomeClaim
  | .first => .emissionProduction
  | .revised => .arrivalAsNeutrino
  | .selected => .arrivalAsNeutrino

theorem first_and_selected_have_distinct_claims :
    sourceClaim .first ≠ sourceClaim .selected := by decide

theorem selected_version_is_arrival_claim :
    sourceClaim .selected = .arrivalAsNeutrino := rfl

theorem identical_parent_does_not_force_identical_claim :
    ∃ a b : Version,
      parentUUID a = parentUUID b ∧ sourceClaim a ≠ sourceClaim b := by
  refine ⟨.first, .selected, rfl, ?_⟩
  decide

inductive Expansion where
  | relativity
  | rope
  | petzl
  deriving DecidableEq, Repr

inductive Speaker where
  | user
  | assistant
  deriving DecidableEq, Repr

def expansionSpeaker : Expansion → Speaker
  | .relativity => .assistant
  | .rope => .user
  | .petzl => .user

theorem assistant_relativity_is_not_user_rope :
    expansionSpeaker .relativity ≠ expansionSpeaker .rope ∧
    Expansion.relativity ≠ Expansion.rope := by decide

theorem rope_and_petzl_are_distinct_user_expressions :
    expansionSpeaker .rope = expansionSpeaker .petzl ∧
    Expansion.rope ≠ Expansion.petzl := by decide

#print axioms first_and_selected_have_distinct_claims
#print axioms selected_version_is_arrival_claim
#print axioms identical_parent_does_not_force_identical_claim
#print axioms assistant_relativity_is_not_user_rope
#print axioms rope_and_petzl_are_distinct_user_expressions

end HsHVerification.LoomJune2026ClaimTypes
