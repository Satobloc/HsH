import Mathlib

/-!
# FIE Proposition E: proposal-versus-assertion source-fidelity gate

Historical sources:
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt
  Git blob 81ae23a106939cba7e3d134ed5c90a7d7a979a25, line 24:
  vacuum lattice explicitly introduced as a proposal.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/THE LOGIC OF SAT.txt
  Git blob 6509a651ca4e72b1048d99e893555e333d52421a, line 39:
  derivative wording states the lattice as an unqualified fact.

Interpretive scope:
The source's "it is proposed" is approximated by existential compatibility
across a two-world semantics, NOT claimed to be its unique philosophical
meaning. The theorem shows that a possible claim does not entail the
corresponding assertion in the distinguished actual world.
The model is logical/source-critical, not a physical vacuum simulation.
No lattice geometry or empirical observation is proved here.
-/

namespace HsHVerification.FIEProposalFidelity

inductive World where
  | actual
  | compatible

def latticePresent : World → Prop
  | .actual => False
  | .compatible => True

def sourceProposal (P : World → Prop) : Prop :=
  ∃ w : World, P w

def derivativeAssertion (P : World → Prop) : Prop :=
  P .actual

/-- A logically possible proposal may hold while the asserted actuality fails. -/
theorem proposal_can_hold_without_actuality :
    sourceProposal latticePresent ∧ ¬ derivativeAssertion latticePresent := by
  constructor
  · exact ⟨.compatible, trivial⟩
  · simp [derivativeAssertion, latticePresent]

/-- The general promotion from proposal to categorical assertion is invalid
    under this explicit possible-worlds reading of "proposed". -/
theorem unqualified_promotion_is_not_valid :
    ¬ (∀ P : World → Prop, sourceProposal P → derivativeAssertion P) := by
  intro h
  have hactual : derivativeAssertion latticePresent :=
    h latticePresent ⟨.compatible, trivial⟩
  exact proposal_can_hold_without_actuality.2 hactual

#print axioms proposal_can_hold_without_actuality
#print axioms unqualified_promotion_is_not_valid

end HsHVerification.FIEProposalFidelity
