import Mathlib

/-!
Source-conditional formalization of the pairwise predicate in the archived
ConsistencyBench evaluator.

Primary source:
- `aayambansal/ConsistencyBench/src/evaluate.py`, blob
  `0453540cb7c19227601e59fb342fa93e736da849`, lines 372-385.
- The paper's written PCR definition is in
  `final-paper/main.tex`, blob `dbd471235a310aa9821c95faf570432c21339592`,
  line 105.
- The 17-model pooled counts are transcribed from HsH issue #1103 and its
  source-locked replay report, SHA-256
  `2fbad094e37acd6d53c3b838ab5440cf331c67af09ee5131514aee5a1ca92099`.

The evaluator compares correctness Booleans after its answer-normalization
step. This module formalizes only that Boolean layer and the arithmetic
partition of the reported pooled counts. It does NOT formalize answer
normalization, raw JSON extraction, key validity, model identity, semantic
compatibility, model-call independence, peer interaction, or causality.
It does not establish that the archived outputs are true or that the paper's
causal interpretation is correct.
-/

namespace HsHVerification.ConsistencyBenchPCRPredicate

/-- The evaluator's source predicate after answer normalization. -/
def codePCR (correctI correctJ : Bool) : Bool :=
  (correctI == correctJ) || (correctI && correctJ)

/-- The paper's written pair criterion: both answers are correct. -/
def bothCorrect (correctI correctJ : Bool) : Bool :=
  correctI && correctJ

/-- The additional class admitted by the evaluator: both answers are wrong. -/
def bothIncorrect (correctI correctJ : Bool) : Bool :=
  (!correctI) && (!correctJ)

/-- The second disjunct in the evaluator is redundant: the predicate is
    equality of correctness status, not joint correctness. -/
theorem codePCR_eq_same_status (correctI correctJ : Bool) :
    codePCR correctI correctJ = (correctI == correctJ) := by
  cases correctI <;> cases correctJ <;> rfl

/-- The evaluator partitions accepted pairs into both-correct and
    both-incorrect pairs. -/
theorem codePCR_partition (correctI correctJ : Bool) :
    codePCR correctI correctJ =
      (bothCorrect correctI correctJ || bothIncorrect correctI correctJ) := by
  cases correctI <;> cases correctJ <;> rfl

/-- Minimal truth-table witness: two wrong answers are counted by the
    evaluator predicate but not by the paper's both-correct criterion. -/
theorem both_wrong_pair_is_counted :
    codePCR false false = true ∧ bothCorrect false false = false := by
  decide

/-- For every finite list of pairwise correctness states, the evaluator's
    accepted-pair count is exactly both-correct plus both-incorrect. -/
theorem count_partition (pairs : List (Bool × Bool)) :
    pairs.countP (fun p => codePCR p.1 p.2) =
      pairs.countP (fun p => bothCorrect p.1 p.2) +
      pairs.countP (fun p => bothIncorrect p.1 p.2) := by
  induction pairs with
  | nil =>
      simp
  | cons pair tail ih =>
      rcases pair with ⟨correctI, correctJ⟩
      have ih' :
          tail.countP (fun p => (p.1 == p.2) || (p.1 && p.2)) =
            tail.countP (fun p => p.1 && p.2) +
            tail.countP (fun p => (!p.1) && (!p.2)) := by
        simpa [codePCR, bothCorrect, bothIncorrect] using ih
      cases correctI <;> cases correctJ <;>
        simp [codePCR, bothCorrect, bothIncorrect, ih'] <;> omega

/-- The pooled 17-model report's vanilla pair counts:
    code predicate = both-correct + both-incorrect. -/
theorem vanilla_report_partition :
    (14919 : Nat) = 11707 + 3212 := by
  norm_num

/-- The pooled 17-model report's CGD pair counts:
    code predicate = both-correct + both-incorrect. -/
theorem cgd_report_partition :
    (16064 : Nat) = 13054 + 3010 := by
  norm_num

/-- Exact pooled count changes reported in issue #1103. -/
theorem pooled_delta_values :
    (16064 : Int) - 14919 = 1145 ∧
    (13054 : Int) - 11707 = 1347 ∧
    (3010 : Int) - 3212 = -202 := by
  norm_num

/-- The change in the evaluator's same-status count decomposes into
    the change in both-correct pairs plus the change in both-incorrect pairs. -/
theorem pooled_delta_decomposition :
    (16064 : Int) - 14919 =
      ((13054 : Int) - 11707) + ((3010 : Int) - 3212) := by
  norm_num

/-- The same exact decomposition holds after converting the pooled count
    changes to percentage points over the common 28,050 pair denominator. -/
theorem pooled_percentage_point_decomposition :
    (100 : ℚ) * ((16064 : ℚ) - 14919) / 28050 =
      (100 : ℚ) * ((13054 : ℚ) - 11707) / 28050 +
      (100 : ℚ) * ((3010 : ℚ) - 3212) / 28050 := by
  norm_num

#print axioms HsHVerification.ConsistencyBenchPCRPredicate.codePCR_eq_same_status
#print axioms HsHVerification.ConsistencyBenchPCRPredicate.codePCR_partition
#print axioms HsHVerification.ConsistencyBenchPCRPredicate.both_wrong_pair_is_counted
#print axioms HsHVerification.ConsistencyBenchPCRPredicate.count_partition
#print axioms HsHVerification.ConsistencyBenchPCRPredicate.vanilla_report_partition
#print axioms HsHVerification.ConsistencyBenchPCRPredicate.cgd_report_partition
#print axioms HsHVerification.ConsistencyBenchPCRPredicate.pooled_delta_values
#print axioms HsHVerification.ConsistencyBenchPCRPredicate.pooled_delta_decomposition
#print axioms HsHVerification.ConsistencyBenchPCRPredicate.pooled_percentage_point_decomposition

end HsHVerification.ConsistencyBenchPCRPredicate
