import Mathlib

/-!
# Calder: ConsistencyBench source-normalizer sensitivity

This module models an actual archived answer record, not a new LLM trial.
Primary source: aayambansal/ConsistencyBench
- sample blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d
- GPT-4o blob 8196ac51e92737d5a479fb4fca7f85261a7109ec
- GPT-4.1 blob 442a2dc4618ecee90f82af14b10abcf6789d8eaf
- Claude Opus 4.6 blob edbef31ca9554e2e2657d58eed55b43b748da97f
- source normalizer evaluate.py blob 0453540cb7c19227601e59fb342fa93e736da849

Observed case CB-68447, question index 1 (zero-based):
expected_answer = "No, we cannot conclude that";
all three extracted answers = "Cannot be determined".
The source normalizer checks "cannot conclude" before leading "no",
so the expected key normalizes to cannotDetermine. A deliberately
different leading-No-first interpretation normalizes it to no.

Lean checks the explicitly encoded logical consequence only. It does not
establish which key semantics is appropriate, whether archived model
outputs were genuine API calls, or any cognitive/physical hypothesis.
-/

namespace HsHVerification.CalderNormalizerSensitivity

inductive Token where
  | yes
  | no
  | cannotDetermine
  deriving DecidableEq, Repr

def recordedCB68447 : Fin 3 → Token := fun _ => .cannotDetermine
def sourceNormalizedKey : Token := .cannotDetermine
def leadingNoNormalizedKey : Token := .no

def allMatch (key : Token) (answers : Fin 3 → Token) : Prop :=
  ∀ i, answers i = key

def allMismatch (key : Token) (answers : Fin 3 → Token) : Prop :=
  ∀ i, answers i ≠ key

theorem source_key_all_match :
    allMatch sourceNormalizedKey recordedCB68447 := by
  intro i
  rfl

theorem leading_no_key_all_mismatch :
    allMismatch leadingNoNormalizedKey recordedCB68447 := by
  intro i
  simp [recordedCB68447, leadingNoNormalizedKey]

theorem recorded_case_scoring_noninvariance :
    allMatch sourceNormalizedKey recordedCB68447 ∧
    allMismatch leadingNoNormalizedKey recordedCB68447 := by
  exact ⟨source_key_all_match, leading_no_key_all_mismatch⟩

#print axioms recorded_case_scoring_noninvariance

end HsHVerification.CalderNormalizerSensitivity
