import Mathlib

/-!
# PACE protocol-randomness scope witness
Assistant reconstruction, 2026-11-27.

Primary source: Sajjadi Mohammadabadi, "PACE: More Agents, More Samples,
or More Thinking?", arXiv:2611.17610v2 (2026-11-22), §3.3 Proposition 3.1
and Appendix A.2.

Source-critical distinction:
* The main-text proof sketch abbreviates protocol randomness as independent
  of Y.
* Appendix A.2 states the stronger condition: each private random seed is
  independent of the full tuple (Y, X_shared, X_1, ..., X_K).

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

/-- A protocol random bit U. -/
def protocolCoin (ω : Sample) : Bool := decide (ω.val % 2 = 1)

/-- Shared context S = Y xor U. -/
def sharedEvidence (ω : Sample) : Bool :=
  decide (target ω ≠ protocolCoin ω)

/-- Private evidence is constant. -/
def privateEvidence (_ω : Sample) : Bool := false

/-- The transcript consists of the protocol coin itself. -/
def transcript (ω : Sample) : Bool := protocolCoin ω

/-- Exact event count in the four-point uniform sample space. -/
def count {α : Type*} [DecidableEq α] (f : Sample → α) (a : α) : Nat :=
  (Finset.univ.filter fun ω => f ω = a).card

/--
Marginal independence for the uniform four-point sample space.
After clearing denominators, 4 * jointCount = marginalCountX * marginalCountY.
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
  intro x y
  cases x <;> cases y <;> decide

/-- U is also marginally independent of S. -/
theorem protocolCoin_independent_of_shared :
    independent sharedEvidence protocolCoin := by
  intro x y
  cases x <;> cases y <;> decide

/-- Y and S are marginally independent as well. -/
theorem target_independent_of_shared :
    independent target sharedEvidence := by
  intro x y
  cases x <;> cases y <;> decide

/--
The constant private-evidence variable is conditionally independent of Y
given S. This is the finite factorization form of the zero-private-information
premise used by PACE Proposition 3.1.
-/
theorem privateEvidence_conditionally_independent :
    conditionallyIndependent target privateEvidence sharedEvidence := by
  intro x h s
  cases x <;> cases h <;> cases s <;> decide

/--
Despite the three pairwise independence facts above, U is not independent
of the joint input tuple (Y,S). Pairwise marginal independence does not imply
independence from the full tuple.
-/
theorem protocolCoin_not_independent_of_joint_input :
    ¬ independent (fun ω => (target ω, sharedEvidence ω)) protocolCoin := by
  intro h
  have hcase := h (false, false) false
  have hbad :
      count (fun ω => ((target ω, sharedEvidence ω), protocolCoin ω))
          ((false, false), false) * 4 ≠
        count (fun ω => (target ω, sharedEvidence ω)) (false, false) *
          count protocolCoin false := by
    decide
  exact hbad hcase

/--
With transcript H=U, conditional independence of Y and H given S fails.
At (Y=false,H=false,S=false), the cleared-denominator factors are 2 and 1.
-/
theorem transcript_not_conditionally_independent :
    ¬ conditionallyIndependent target transcript sharedEvidence := by
  intro h
  have hcase := h false false false
  have hbad :
      count (fun ω => (target ω, transcript ω, sharedEvidence ω))
          (false, false, false) * count sharedEvidence false ≠
        count (fun ω => (target ω, sharedEvidence ω)) (false, false) *
          count (fun ω => (transcript ω, sharedEvidence ω)) (false, false) := by
    decide
  exact hbad hcase

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

/-- Finite Boolean evaluators for executable smoke checks. -/
def boolValues : List Bool := [false, true]

def independentBool (X Y : Sample → Bool) : Bool :=
  boolValues.all fun x =>
    boolValues.all fun y =>
      decide (count (fun ω => (X ω, Y ω)) (x, y) * 4 =
        count X x * count Y y)

def conditionallyIndependentBool (X H S : Sample → Bool) : Bool :=
  boolValues.all fun x =>
    boolValues.all fun h =>
      boolValues.all fun s =>
        decide (count (fun ω => (X ω, H ω, S ω)) (x, h, s) * count S s =
          count (fun ω => (X ω, S ω)) (x, s) *
            count (fun ω => (H ω, S ω)) (h, s))

#print axioms protocolCoin_independent_of_target
#print axioms privateEvidence_conditionally_independent
#print axioms protocolCoin_not_independent_of_joint_input
#print axioms transcript_not_conditionally_independent

end HsHVerification.OrsonPACEProtocolRandomness

#eval HsHVerification.OrsonPACEProtocolRandomness.independentBool
  HsHVerification.OrsonPACEProtocolRandomness.target
  HsHVerification.OrsonPACEProtocolRandomness.protocolCoin
#eval HsHVerification.OrsonPACEProtocolRandomness.independentBool
  HsHVerification.OrsonPACEProtocolRandomness.sharedEvidence
  HsHVerification.OrsonPACEProtocolRandomness.protocolCoin
#eval HsHVerification.OrsonPACEProtocolRandomness.conditionallyIndependentBool
  HsHVerification.OrsonPACEProtocolRandomness.target
  HsHVerification.OrsonPACEProtocolRandomness.privateEvidence
  HsHVerification.OrsonPACEProtocolRandomness.sharedEvidence
#eval HsHVerification.OrsonPACEProtocolRandomness.independentBool
  (fun ω => (HsHVerification.OrsonPACEProtocolRandomness.target ω,
    HsHVerification.OrsonPACEProtocolRandomness.sharedEvidence ω))
  HsHVerification.OrsonPACEProtocolRandomness.protocolCoin
#eval HsHVerification.OrsonPACEProtocolRandomness.conditionallyIndependentBool
  HsHVerification.OrsonPACEProtocolRandomness.target
  HsHVerification.OrsonPACEProtocolRandomness.transcript
  HsHVerification.OrsonPACEProtocolRandomness.sharedEvidence
