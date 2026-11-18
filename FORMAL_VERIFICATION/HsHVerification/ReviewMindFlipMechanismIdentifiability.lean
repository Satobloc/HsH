import Mathlib

namespace HsHVerification

/-- A raw answer change in the peer-exposed condition. -/
def observedPeerFlip (initial peerFinal : Bool) : Bool :=
  initial != peerFinal

/-- A change in the matched no-peer self-reflection control. -/
def selfOnlyFlip (initial selfFinal : Bool) : Bool :=
  initial != selfFinal

/-- Operational sensitivity between the no-peer and peer-stance conditions.
This is not a claim about internal motive or long-horizon causal influence. -/
def peerConditionDifference (selfFinal peerFinal : Bool) : Bool :=
  selfFinal != peerFinal

/--
A raw peer-condition flip can be observationally identical in two cases:
the answer would already have changed during self-reflection, or it changes
only after peer-stance exposure. Therefore the raw flip alone does not
identify the mechanism. This finite counterexample formalizes a measurement
distinction, not a model-behavior result.
-/
theorem observed_peer_flip_not_identifying_mechanism :
    ∃ initial selfA selfB peerFinal : Bool,
      observedPeerFlip initial peerFinal = true ∧
      selfOnlyFlip initial selfA = true ∧
      peerConditionDifference selfA peerFinal = false ∧
      selfOnlyFlip initial selfB = false ∧
      peerConditionDifference selfB peerFinal = true := by
  exact ⟨false, true, false, true, by decide⟩

#eval observedPeerFlip false true
#eval selfOnlyFlip false true
#eval peerConditionDifference true true
#eval selfOnlyFlip false false
#eval peerConditionDifference false true

#print axioms observed_peer_flip_not_identifying_mechanism

end HsHVerification
