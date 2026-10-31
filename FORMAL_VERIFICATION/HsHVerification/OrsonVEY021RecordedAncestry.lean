import Mathlib

/-!
# Orson P1: source-recorded ancestry in VEY-021

Primary source: `Satobloc/HsH`, raw conversation export
`DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_4/26.06.05•26.06.05•SAT Theory Archive Overview — raw.json`,
Git blob `dec20de13718ba09a59a76e9c958e3eee16304b0`,
conversation `6a22c443-54fc-83ea-a025-56256bbf7a27`.

The raw JSON mapping records this parent chain:

* user hypothesis: `a2841272-b665-463f-b889-f3b639f19ef2`,
  role user, parent `cf52c2fc-371c-419b-aa9d-dbc840e65026`;
* assistant endorsement: `29f51f33-aff6-4949-8939-571306e77b05`,
  role assistant, parent the user hypothesis;
* user-provided OCR/data: `dad49596-b4c2-4ac5-b7bf-a2bdd6ad17a5`,
  role user, parent the assistant endorsement;
* assistant interpretation: `39e86123-4895-43d2-8c01-f7b51d609171`,
  role assistant, parent the user-provided OCR/data.

This module formalizes only the four-node, source-recorded parent graph above.
It proves that the final assistant interpretation is a transitive descendant
of the original user hypothesis, although it is not its direct child and the
endpoint roles differ.

**Interpretive limit:** recorded conversational ancestry is not a complete
definition of statistical dependence, causal influence, internal model belief,
or consciousness. The theorem does not establish the source's authenticity;
the exact raw blob and message locators are external provenance inputs.
-/

namespace HsHVerification.OrsonVEY021RecordedAncestry

inductive Message where
  | userHypothesis
  | assistantEndorsement
  | userData
  | assistantInterpretation
  deriving DecidableEq, Repr

inductive Speaker where
  | user
  | assistant
  deriving DecidableEq, Repr

def speaker : Message → Speaker
  | .userHypothesis => .user
  | .assistantEndorsement => .assistant
  | .userData => .user
  | .assistantInterpretation => .assistant

/-- Parent-edge direction is from the recorded parent to its child. -/
inductive RecordedParent : Message → Message → Prop where
  | hypothesisToEndorsement :
      RecordedParent .userHypothesis .assistantEndorsement
  | endorsementToUserData :
      RecordedParent .assistantEndorsement .userData
  | userDataToInterpretation :
      RecordedParent .userData .assistantInterpretation

/-- Transitive recorded ancestry, deliberately distinct from statistical independence. -/
inductive RecordedAncestor : Message → Message → Prop where
  | edge {a b : Message} : RecordedParent a b → RecordedAncestor a b
  | trans {a b c : Message} :
      RecordedAncestor a b → RecordedAncestor b c → RecordedAncestor a c

def RecordedAncestryDisjoint (a b : Message) : Prop :=
  ¬ RecordedAncestor a b ∧ ¬ RecordedAncestor b a

theorem hypothesis_is_ancestor_of_interpretation :
    RecordedAncestor .userHypothesis .assistantInterpretation := by
  apply RecordedAncestor.trans
  · apply RecordedAncestor.trans
    · exact RecordedAncestor.edge RecordedParent.hypothesisToEndorsement
    · exact RecordedAncestor.edge RecordedParent.endorsementToUserData
  · exact RecordedAncestor.edge RecordedParent.userDataToInterpretation

theorem hypothesis_is_not_direct_parent_of_interpretation :
    ¬ RecordedParent .userHypothesis .assistantInterpretation := by
  intro h
  cases h

theorem endpoint_speakers_differ :
    speaker .userHypothesis ≠ speaker .assistantInterpretation := by
  decide

/-- Different speaker roles do not erase a recorded ancestry path. -/
theorem cross_role_endpoints_are_not_recorded_ancestry_disjoint :
    speaker .userHypothesis ≠ speaker .assistantInterpretation ∧
      ¬ RecordedAncestryDisjoint .userHypothesis .assistantInterpretation := by
  constructor
  · exact endpoint_speakers_differ
  · intro h
    exact h.1 hypothesis_is_ancestor_of_interpretation

#print axioms hypothesis_is_ancestor_of_interpretation
#print axioms hypothesis_is_not_direct_parent_of_interpretation
#print axioms endpoint_speakers_differ
#print axioms cross_role_endpoints_are_not_recorded_ancestry_disjoint

end HsHVerification.OrsonVEY021RecordedAncestry
