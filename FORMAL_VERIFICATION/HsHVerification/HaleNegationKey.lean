import Mathlib

/-!
# Hale: literal double negation versus intended single negation in ConsistencyBench

Primary benchmark: aayambansal/ConsistencyBench
- data/consistency_bench_sample.json blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d
- src/evaluate.py blob 0453540cb7c19227601e59fb342fa93e736da849

Actual source pattern in all 50 "negation" sets, question index 2:
"Is the negation of the following statement true?
 \"It is NOT the case that P.\""
The source reasoning and key evaluate not-P; a literal grammatical
reading evaluates not-(not-P). The 50 actual source truth values are
20 true and 30 false; the two interpretations reverse the Boolean key
for every such row. This file proves ONLY the conditional logical
distinction. It does not determine intended natural-language semantics,
validate the benchmark's factual premises, or verify model-call provenance.
-/

namespace HsHVerification.HaleNegationKey

/-- The explicitly quoted source statement: "It is NOT the case that P". -/
def quotedStatement (P : Prop) : Prop := ¬ P

/-- Literal reading: the negation OF the quoted negative statement. -/
def literalQuestion (P : Prop) : Prop := ¬ quotedStatement P

/-- Source reasoning's intended reading: the quoted negative statement itself. -/
def sourceKeyQuestion (P : Prop) : Prop := quotedStatement P

theorem literal_question_iff_positive (P : Prop) :
    literalQuestion P ↔ P := by
  simp [literalQuestion, quotedStatement]

theorem source_question_iff_negative (P : Prop) :
    sourceKeyQuestion P ↔ ¬ P := by
  rfl

theorem two_readings_cannot_both_be_true (P : Prop) :
    ¬ (literalQuestion P ∧ sourceKeyQuestion P) := by
  simp [literalQuestion, sourceKeyQuestion, quotedStatement]

theorem one_of_two_readings_true (P : Prop) :
    literalQuestion P ∨ sourceKeyQuestion P := by
  classical
  by_cases h : P
  · exact Or.inl (literal_question_iff_positive P |>.2 h)
  · exact Or.inr (source_question_iff_negative P |>.2 h)

theorem archived_true_premise_case :
    literalQuestion True ∧ ¬ sourceKeyQuestion True := by
  simp [literalQuestion, sourceKeyQuestion, quotedStatement]

theorem archived_false_premise_case :
    ¬ literalQuestion False ∧ sourceKeyQuestion False := by
  simp [literalQuestion, sourceKeyQuestion, quotedStatement]

#print axioms literal_question_iff_positive
#print axioms source_question_iff_negative
#print axioms two_readings_cannot_both_be_true
#print axioms one_of_two_readings_true
#print axioms archived_true_premise_case
#print axioms archived_false_premise_case

end HsHVerification.HaleNegationKey
