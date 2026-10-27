import Mathlib

/-!
Orson cognition/P1, 2026-10-27. Source-critical Boolean formalization of
ConsistencyBench sample's 50 negation families, first three yes/no prompts.
Original source: aayambansal/ConsistencyBench, sample Git blob
10eb2da27c84c706d8e9e2325afca864fcae6a0d.
Q1 asks P, Q2 asks whether P is false, Q3 asks whether NOT(NOT P)
is true. Published Q3 key uses NOT P. The actual archive must be
checked separately; this module proves conditional logical consequences.
No claim about model cognition, physical systems or causal CGD effects.
-/

namespace HsHVerification.OrsonNegationKeyGate

def semanticThird (p : Bool) : Bool := !(!p)
def publishedThird (p : Bool) : Bool := !p

theorem semantic_third_equals_first (p : Bool) :
    semanticThird p = p := by
  cases p <;> rfl

theorem semantic_and_published_third_disagree (p : Bool) :
    semanticThird p ≠ publishedThird p := by
  cases p <;> decide

theorem no_response_satisfies_both_third_keys (p response : Bool) :
    ¬ (response = semanticThird p ∧ response = publishedThird p) := by
  intro h
  exact semantic_and_published_third_disagree p (h.1.symm.trans h.2)

def sourceThreePass (p q1 q2 q3 : Bool) : Bool :=
  (q1 == p) && (q2 == !p) && (q3 == !p)

def semanticThreePass (p q1 q2 q3 : Bool) : Bool :=
  (q1 == p) && (q2 == !p) && (q3 == !(!p))

theorem source_perfect_semantic_fails (p : Bool) :
    sourceThreePass p p (!p) (!p) = true ∧
    semanticThreePass p p (!p) (!p) = false := by
  cases p <;> decide

theorem semantic_perfect_source_fails (p : Bool) :
    semanticThreePass p p (!p) p = true ∧
    sourceThreePass p p (!p) p = false := by
  cases p <;> decide

theorem no_joint_three_pass (p q1 q2 q3 : Bool) :
    ¬ (sourceThreePass p q1 q2 q3 = true ∧
       semanticThreePass p q1 q2 q3 = true) := by
  cases p <;> cases q1 <;> cases q2 <;> cases q3 <;> decide

#print axioms semantic_third_equals_first
#print axioms semantic_and_published_third_disagree
#print axioms no_response_satisfies_both_third_keys
#print axioms source_perfect_semantic_fails
#print axioms semantic_perfect_source_fails
#print axioms no_joint_three_pass

end HsHVerification.OrsonNegationKeyGate
