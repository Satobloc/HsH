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

#print axioms unflagged_checks_all
#print axioms flagged_checks_at_least_one
#print axioms minimum_le_possible
#print axioms eligible_question_total
#print axioms possible_pair_total
#print axioms source_aggregate_lower_bound
#print axioms source_bounds_consistent
#print axioms flagged_position_partition

end HsHVerification.OrsonSharedNLI
