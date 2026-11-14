import Mathlib

/-!
Orson Vay source-audited P1, 2026-10-28 06Z.
Source: aayambansal/ConsistencyBench src/evaluate.py,
Git blob 0453540cb7c19227601e59fb342fa93e736da849.
17 archived *_cgd.json files, 300 sets and 1150 question
records each, 19,550 archived question records in total.
Counts are SOURCE TRANSCRIPTIONS verified separately by JS; Lean
does not authenticate them or any API calls.

The CGD code checks each preceding answer until the first flagged
contradiction. If no contradiction occurs, all j preceding answers
are checked. For a flagged question j>0, 1..j checks are possible.
The original outputs store a flag but not the first triggering pair,
so exact checker-call counts are not reconstructible from these files.
-/

namespace HsHVerification.OrsonSharedNLI

def minimumChecks (priorCount : Nat) (flagged : Bool) : Nat :=
  if flagged then 1 else priorCount

theorem unflagged_checks_all (priorCount : Nat) :
    minimumChecks priorCount false = priorCount := rfl

theorem flagged_checks_at_least_one (priorCount : Nat) :
    minimumChecks priorCount true = 1 := rfl

theorem minimum_le_possible (priorCount : Nat)
    (h : 1 ≤ priorCount) (flagged : Bool) :
    minimumChecks priorCount flagged ≤ priorCount := by
  cases flagged with
  | false => simp [minimumChecks]
  | true => simpa [minimumChecks] using h

-- Source counts: 17 x 850 checker-eligible question records.
theorem eligible_question_total :
    17 * (50 * 2 + 250 * 3) = 14450 := by norm_num

-- 17 x (50*3 + 250*6) possible preceding-answer pair slots.
theorem possible_pair_total :
    17 * (50 * 3 + 250 * 6) = 28050 := by norm_num

-- Flagged positions j=1,2,3: 1541,2143,3018 respectively.
-- A flagged j=2 can save at most 1 check, j=3 at most 2.
theorem source_aggregate_lower_bound :
    28050 - (2143 + 2 * 3018) = (19871 : Nat) := by norm_num

theorem source_bounds_consistent :
    (19871 : Nat) ≤ 28050 ∧ 6702 ≤ 14450 := by norm_num

theorem flagged_position_partition :
    (1541 : Nat) + 2143 + 3018 = 6702 := by norm_num

/-!
## Truncation-aware checker-call bounds

The pinned evaluator passes each raw answer through a 500-Python-character
prefix before the shared NLI comparison. The 17 source-locked result files
show 3,123 possible prior/current comparison slots with at least one
truncated endpoint. The first-positive loop stops after the first flagged
comparison, but the archive stores neither the triggering prior index nor
the judge output. The per-position values below are source-derived lower
and upper bounds on comparison invocations whose prompt contains at least
one truncated endpoint; they are not exact API-call counts.

For a flagged row, the unknown trigger can occur at any prior index, so the
number of truncated comparisons is bounded by the earliest and latest
possible trigger positions. For an unflagged row, all prior comparisons
are attempted and the truncated-comparison count is determined by the
stored raw-response lengths. The finite table was replayed from the exact
17 result blobs at ConsistencyBench commit
bfc676baa848c7f1715bb73aee148180de15516e.

Lean checks arithmetic over this source-derived table only. It does not
authenticate the Python-to-table transcription, recover the missing trigger
index, validate NLI semantics, or establish causal effects.
-/

def truncatedComparisonCallBoundsByPosition : List (Nat × Nat) :=
  [(298, 298), (811, 1162), (931, 1663)]

def minimumTruncatedComparisonCalls : Nat :=
  (truncatedComparisonCallBoundsByPosition.map (fun p => p.1)).sum

def maximumTruncatedComparisonCalls : Nat :=
  (truncatedComparisonCallBoundsByPosition.map (fun p => p.2)).sum

theorem truncated_position_table_has_three_positions :
    truncatedComparisonCallBoundsByPosition.length = 3 := by decide

theorem truncated_comparison_call_bounds :
    minimumTruncatedComparisonCalls = 2040 ∧
    maximumTruncatedComparisonCalls = 3123 := by decide

theorem truncated_comparison_calls_within_total_pair_slots :
    maximumTruncatedComparisonCalls ≤ 28050 := by decide

#eval minimumTruncatedComparisonCalls
#eval maximumTruncatedComparisonCalls

#print axioms truncated_position_table_has_three_positions
#print axioms truncated_comparison_call_bounds
#print axioms truncated_comparison_calls_within_total_pair_slots

#print axioms unflagged_checks_all
#print axioms flagged_checks_at_least_one
#print axioms minimum_le_possible
#print axioms eligible_question_total
#print axioms possible_pair_total
#print axioms source_aggregate_lower_bound
#print axioms source_bounds_consistent
#print axioms flagged_position_partition

end HsHVerification.OrsonSharedNLI
