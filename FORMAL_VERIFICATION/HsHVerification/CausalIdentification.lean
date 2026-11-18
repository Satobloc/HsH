import Mathlib

/-!
Ravel / Review-MIND, 2026-11-18.

A single observed binary outcome under one assignment does not identify the
unit's treatment effect. Two potential-outcome worlds can agree on the
observed outcome while disagreeing about whether treatment changes it.

This is an abstract causal-identification theorem. It is not an LLM experiment,
a numeric fixture, or a model of interference among interacting agents.
-/

namespace HsHVerification.CausalIdentification

structure PotentialOutcomes where
  control : Bool
  treated : Bool
deriving DecidableEq, Repr

/-- The outcome observed under a binary assignment. -/
def observed (assignment : Bool) (p : PotentialOutcomes) : Bool :=
  if assignment then p.treated else p.control

/-- A deterministic unit-level treatment effect exists iff the two potential
    outcomes differ. -/
def effect (p : PotentialOutcomes) : Prop :=
  p.control ≠ p.treated

/-- A potential-outcome world is compatible with the observed assignment/outcome. -/
def compatible (assignment outcome : Bool) (p : PotentialOutcomes) : Prop :=
  observed assignment p = outcome

/-- An observation identifies the effect when all compatible worlds agree. -/
structure Identified (assignment outcome : Bool) : Prop where
  agreement : ∀ (p q : PotentialOutcomes), compatible assignment outcome p →
    compatible assignment outcome q → effect p ↔ effect q

/-- World in which treatment has no effect. -/
def sameOutcomeWorld (outcome : Bool) : PotentialOutcomes :=
  ⟨outcome, outcome⟩

/-- Alternative world with the same observed outcome but a nonzero effect. -/
def alternativeWorld (assignment outcome : Bool) : PotentialOutcomes :=
  if assignment then ⟨!outcome, outcome⟩ else ⟨outcome, !outcome⟩

theorem same_world_matches_observation (assignment outcome : Bool) :
    compatible assignment outcome (sameOutcomeWorld outcome) := by
  simp [compatible, observed, sameOutcomeWorld]

theorem alternative_world_matches_observation (assignment outcome : Bool) :
    compatible assignment outcome (alternativeWorld assignment outcome) := by
  cases assignment <;> cases outcome <;> simp [compatible, observed, alternativeWorld]

theorem same_world_has_no_effect (outcome : Bool) :
    ¬ effect (sameOutcomeWorld outcome) := by
  simp [effect, sameOutcomeWorld]

theorem alternative_world_has_effect (assignment outcome : Bool) :
    effect (alternativeWorld assignment outcome) := by
  cases assignment <;> cases outcome <;> simp [effect, alternativeWorld]

/-- Non-identifiability: one observed binary outcome, even with assignment
    recorded, is compatible with both a no-effect world and an effect world.
    This establishes an identifiability limit, not a treatment-effect estimate. -/
theorem one_observation_does_not_identify_effect (assignment outcome : Bool) :
    ¬ Identified assignment outcome := by
  intro h
  have hAgreement :
      effect (sameOutcomeWorld outcome) ↔
        effect (alternativeWorld assignment outcome) := by
    apply h.agreement
    · exact same_world_matches_observation assignment outcome
    · exact alternative_world_matches_observation assignment outcome
  exact (same_world_has_no_effect outcome)
    (hAgreement.mpr (alternative_world_has_effect assignment outcome))

end HsHVerification.CausalIdentification
