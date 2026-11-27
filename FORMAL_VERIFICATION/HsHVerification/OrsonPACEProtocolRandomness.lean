import Mathlib

/-!
# PACE protocol-randomness scope witness
Assistant reconstruction, 2026-11-27.

Primary source: Sajjadi Mohammadabadi, "PACE: More Agents, More Samples,
or More Thinking?", arXiv:2611.17610v2 (2026-11-22), §3.3 Proposition 3.1
and Appendix A.2.

Source-critical distinction:
* The short proposition statement does not display an independence premise
  for protocol randomness.
* The Appendix A.2 proof does state the stronger condition: each private
  random seed is independent of the full tuple
  (Y, X_shared, X_1, ..., X_K).

This module formalizes a finite counterexample to the weaker condition
"protocol randomness is marginally independent of Y" (even also marginally
independent of X_shared). It shows why independence from the full input tuple,
or an equivalent conditional-independence premise, is needed.

This is an abstract four-point uniform probability model. It is not LLM
output, an experiment, a model call, a dataset, or evidence about consciousness.
It does not modify Orson P1, issue #564, PR #850, any protocol, dataset,
manuscript, or paper gate.
-/

namespace HsHVerification.OrsonPACEProtocolRandomness

abbrev Sample := Fin 4

/-- Target Y: false on the first two equally likely sample points,
    true on the last two. -/
def target (ω : Sample) : Bool := decide (2 ≤ ω.val)

/-- A protocol random bit U. It is marginally independent of Y. -/
def protocolCoin (ω : Sample) : Bool := decide (ω.val % 2 = 1)

/-- Shared context S = Y xor U. -/
def sharedEvidence (ω : Sample) : Bool :=
  decide (target ω ≠ protocolCoin ω)

/-- Private evidence is constant, so it contributes no information
    conditional on any shared context. -/
def privateEvidence (_ω : Sample) : Bool := false

/-- The transcript consists of the protocol coin itself. -/
def transcript (ω : Sample) : Bool := protocolCoin ω

/-- Exact event count in the four-point uniform sample space. -/
def count {α : Type*} [DecidableEq α] (f : Sample → α) (a : α) : Nat :=
  (Finset.univ.filter fun ω => f ω = a).card

/--
Marginal independence for the uniform four-point sample space.
After clearing denominators, P(X=x,Y=y)=P(X=x)P(Y=y) is
4 * jointCount = marginalCountX * marginalCountY.
-/
def independent {α β : Type*} [DecidableEq α] [DecidableEq β]
    (X : Sample → α) (Y : Sample → β) : Prop :=
  ∀ x y,
    count (fun ω => (X ω, Y ω)) (x, y) * 4 =
      count X x * count Y y

/--
Conditional independence factorization for the uniform four-point sample.
After clearing denominators,
P(X=x,H=h,S=s)P(S=s)=P(X=x,S=s)P(H=h,S=s).
-/
def conditionallyIndependent {α β γ : Type*}
    [DecidableEq α] [DecidableEq β] [DecidableEq γ]
    (X : Sample → α) (H : Sample → β) (S : Sample → γ) : Prop :=
  ∀ x h s,
    count (fun ω => (X ω, H ω, S ω)) (x, h, s) * count S s =
      count (fun ω => (X ω, S ω)) (x, s) *
        count (fun ω => (H ω, S ω)) (h, s)

/-- U is marginally independent of Y. -/
theorem protocolCoin_independent_of_target :
    independent target protocolCoin := by
  decide

/-- U is also marginally independent of S. -/
theorem protocolCoin_independent_of_shared :
    independent sharedEvidence protocolCoin := by
  decide

/-- Y and S are marginally independent as well. -/
theorem target_independent_of_shared :
    independent target sharedEvidence := by
  decide

/--
The constant private-evidence variable is conditionally independent of Y
given S. This is the finite factorization form of the zero-private-information
premise used by PACE Proposition 3.1.
-/
theorem privateEvidence_conditionally_independent :
    conditionallyIndependent target privateEvidence sharedEvidence := by
  decide

/--
Despite the three pairwise independence facts above, U is not independent
of the joint input tuple (Y,S). Pairwise marginal independence does not imply
independence from the full tuple.
-/
theorem protocolCoin_not_independent_of_joint_input :
    ¬ independent (fun ω => (target ω, sharedEvidence ω)) protocolCoin := by
  decide

/--
With transcript H=U, conditional independence of Y and H given S fails.
At (Y=false,H=false,S=false), the cleared-denominator factors are 2 and 1.
-/
theorem transcript_not_conditionally_independent :
    ¬ conditionallyIndependent target transcript sharedEvidence := by
  decide

/-- Compact statement of the finite counterexample. -/
theorem weak_marginal_independence_is_insufficient :
    independent target protocolCoin ∧
    independent sharedEvidence protocolCoin ∧
    independent target sharedEvidence ∧
    conditionallyIndependent target privateEvidence sharedEvidence ∧
    ¬ independent (fun ω => (target ω, sharedEvidence ω)) protocolCoin ∧
    ¬ conditionallyIndependent target transcript sharedEvidence := by
  exact ⟨protocolCoin_independent_of_target,
    protocolCoin_independent_of_shared,
    target_independent_of_shared,
    privateEvidence_conditionally_independent,
    protocolCoin_not_independent_of_joint_input,
    transcript_not_conditionally_independent⟩

/-- Executable finite checks: pairwise independence, zero private dependence,
    failure of full-tuple independence, and transcript conditional dependence. -/
#eval decide (independent target protocolCoin)
#eval decide (independent sharedEvidence protocolCoin)
#eval decide (conditionallyIndependent target privateEvidence sharedEvidence)
#eval decide (independent (fun ω => (target ω, sharedEvidence ω)) protocolCoin)
#eval decide (conditionallyIndependent target transcript sharedEvidence)

#print axioms protocolCoin_independent_of_target
#print axioms privateEvidence_conditionally_independent
#print axioms protocolCoin_not_independent_of_joint_input
#print axioms transcript_not_conditionally_independent

end HsHVerification.OrsonPACEProtocolRandomness
