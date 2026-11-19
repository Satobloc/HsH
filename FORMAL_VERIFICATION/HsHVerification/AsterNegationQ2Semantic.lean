import Mathlib

/-!
# Aster: source-question polarity for ConsistencyBench negation Q1/Q2
External primary generator: aayambansal/ConsistencyBench,
src/generate_benchmark.py Git blob 8011bc432f5b5b2f3b728620213d473993cdeb1f.
Q1 asks whether P is true. Q2 asks whether P is false.
This formalizes classical propositional semantics, NOT any archived LLM's
semantic correctness, NLI checker behavior, or physical SAT/H(s)H claim.
-/

namespace HsHVerification.AsterNegationQ2

def q1 (p : Prop) [Decidable p] : Bool := decide p
def q2 (p : Prop) [Decidable p] : Bool := decide (¬ p)

theorem q2_is_opposite_q1 (p : Prop) [Decidable p] :
    q2 p = ! q1 p := by
  by_cases hp : p
  · simp [q1, q2, hp]
  · simp [q1, q2, hp]

theorem true_p_answers (p : Prop) [Decidable p] (hp : p) :
    q1 p = true ∧ q2 p = false := by
  simp [q1, q2, hp]

theorem false_p_answers (p : Prop) [Decidable p] (hp : ¬ p) :
    q1 p = false ∧ q2 p = true := by
  simp [q1, q2, hp]

#print axioms q2_is_opposite_q1
#print axioms true_p_answers
#print axioms false_p_answers

end HsHVerification.AsterNegationQ2
