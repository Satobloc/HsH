import Mathlib

/-!
Source-conditional observation-projection audit, 2026-10-28.
Original evaluator: aayambansal/ConsistencyBench src/evaluate.py
Git blob 0453540cb7c19227601e59fb342fa93e736da849.
Original model output: results/gpt-4.1_cgd.json
Git blob 9ab86f214197d1c60279807850a07d9da75344b8.

Observed record A: set CB-88966, question position 2, revised response
begins "No" and archived extracted_answer is "No".
Observed record B: set CB-59986, question position 3, revised response
begins "No" and archived extracted_answer is "Cannot be determined".
These are different prompts, not two answers to the same question.
The theorem establishes that archived extracted labels cannot be recovered
from the first-token label ALONE for these two observed records.
It does not establish semantic correctness of either extraction, authenticity
of an API call, or a causal cognition result.

17 archived CGD files were source-replayed: 19,550 question records,
17,826 strict leading-token parses, 1,724 outside that strict class.
Of the 17,826, 476 differ from archived extracted_answer:
471 No -> Cannot be determined; 5 No -> Yes via FINAL ANSWER marker.
The counts are external observations encoded as constants here, not
derived by Lean from JSON or verified by Lean against the raw archive.
-/

namespace HsHVerification.MeridianAnswerProjection

structure Observed where
  firstToken : String
  extracted : String

def sourceRowA : Observed := ⟨"No", "No"⟩
def sourceRowB : Observed := ⟨"No", "Cannot be determined"⟩

theorem observed_same_first_token :
    sourceRowA.firstToken = sourceRowB.firstToken := rfl

theorem observed_different_extracted_label :
    sourceRowA.extracted ≠ sourceRowB.extracted := by decide

theorem no_prefix_only_factorization (f : String → String)
    (hA : f sourceRowA.firstToken = sourceRowA.extracted)
    (hB : f sourceRowB.firstToken = sourceRowB.extracted) : False := by
  have h : sourceRowA.extracted = sourceRowB.extracted := by
    calc
      sourceRowA.extracted = f sourceRowA.firstToken := hA.symm
      _ = f sourceRowB.firstToken := congrArg f observed_same_first_token
      _ = sourceRowB.extracted := hB
  exact observed_different_extracted_label h

theorem observed_mismatch_partition : (471 : Nat) + 5 = 476 := by
  norm_num

theorem observed_strict_prefix_partition :
    (17826 : Nat) + 1724 = 17 * 1150 := by
  norm_num

#print axioms observed_same_first_token
#print axioms observed_different_extracted_label
#print axioms no_prefix_only_factorization
#print axioms observed_mismatch_partition
#print axioms observed_strict_prefix_partition

end HsHVerification.MeridianAnswerProjection
