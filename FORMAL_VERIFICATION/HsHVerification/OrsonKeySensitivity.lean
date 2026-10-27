import Mathlib

/-!
Orson Vay P1, 2026-10-27: source-key sensitivity gate for the real
aayambansal/ConsistencyBench archived model responses.
Sample Git blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d;
original evaluator blob 0453540cb7c19227601e59fb342fa93e736da849.

The source asks Q3 = NOT(NOT P), but supplies the key NOT P.
The corrected Q3 key is P, the Q1 key. This module proves conditional
properties of key replacement and finite response scoring, not the
historical truth of the source interpretation, observed counts,
statistical significance, or an LLM-cognition mechanism.
-/

namespace HsHVerification.OrsonKeySensitivity

inductive Answer where
  | yes
  | no
  | other
  deriving DecidableEq, Repr

/-- All unchanged questions pass iff rest=true. -/
def setPass (rest : Bool) (answer key : Answer) : Bool :=
  rest && decide (answer = key)

/-- A binary-key replacement cannot make the same set pass under both keys. -/
theorem distinct_binary_keys_no_joint_pass (rest : Bool) (answer : Answer) :
    ¬ (setPass rest answer .yes = true ∧
       setPass rest answer .no = true) := by
  cases rest <;> cases answer <;> decide

/-- Changing the Q3 key has no effect when some other answer is wrong. -/
theorem other_question_failure_blocks_key_effect (answer : Answer) :
    setPass false answer .yes = false ∧
    setPass false answer .no = false := by
  cases answer <;> decide

/-- A nonbinary/indeterminate response passes neither binary Q3 key. -/
theorem nonbinary_answer_fails_both_keys (rest : Bool) :
    setPass rest .other .yes = false ∧
    setPass rest .other .no = false := by
  cases rest <;> decide

/-- Any observed set-score reversal requires all unaffected questions correct. -/
theorem key_reversal_requires_rest_pass (rest : Bool) (answer : Answer)
    (h : setPass rest answer .yes ≠ setPass rest answer .no) :
    rest = true := by
  cases rest <;> cases answer <;> simp_all [setPass]

/-- For binary responses and all other questions correct, key reversal flips pass. -/
theorem binary_answer_key_flip (rest : Bool) (answer : Answer)
    (ha : answer = .yes ∨ answer = .no) (hr : rest = true) :
    setPass rest answer .yes ≠ setPass rest answer .no := by
  rcases ha with h | h <;> subst answer <;> subst rest <;> decide

#print axioms distinct_binary_keys_no_joint_pass
#print axioms other_question_failure_blocks_key_effect
#print axioms nonbinary_answer_fails_both_keys
#print axioms key_reversal_requires_rest_pass
#print axioms binary_answer_key_flip

end HsHVerification.OrsonKeySensitivity
