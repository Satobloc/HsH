import Mathlib

/-!
Calder :12 | 2026-10-29 10:12 UTC | P1 source-locked repeated-Q3
within-CGD initial/final label-discordance audit.

Original observed records: 17 public ConsistencyBench CGD model JSON files,
50 negation sets each, from aayambansal/ConsistencyBench/results.
Exact Git blob SHA manifest:
HsH WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py
(source manifest blob 2e10ed2510b8ce14e716780a887c0fe23c3067b9).
Benchmark sample: data/consistency_bench_sample.json,
blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d.
Evaluator: src/evaluate.py,
blob 0453540cb7c19227601e59fb342fa93e736da849.

For each model, group Q3 (zero-based index 2) by EXACT question text.
14 of 19 Q3 text groups recur in >=2 source sets. A group is discordant
when its archived labels have >1 distinct string. Each group's initial and
final discordance is measured on THE SAME original CGD run records.
Gained = initially concordant, finally discordant; lost = the converse;
both = discordant initially and finally. No new model calls or synthetic
observations. These source-transcribed counts are NOT independently
verified by Lean; this module verifies only their arithmetic.

The model groups share 19 question texts, common prompt templates and
related model families. This is not an iid sample or a causal CGD trial.
No semantic-key adjudication, SAT physics or cognition law follows.
-/

namespace HsHVerification.CalderNegationRepeatStability

-- Order follows the 17-model source SHA manifest above.
def initialDiscordant : List Nat :=
  [1, 2, 7, 1, 0, 0, 0, 11, 1, 1, 8, 0, 7, 0, 2, 2, 2]

def finalDiscordant : List Nat :=
  [2, 2, 9, 6, 0, 2, 2, 12, 4, 1, 8, 3, 9, 3, 3, 8, 5]

def gainedDiscordance : List Nat :=
  [2, 2, 4, 5, 0, 2, 2, 2, 3, 1, 1, 3, 3, 3, 3, 7, 3]

def lostDiscordance : List Nat :=
  [1, 2, 2, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 2, 1, 0]

def bothDiscordant : List Nat :=
  [0, 0, 5, 1, 0, 0, 0, 10, 1, 0, 7, 0, 6, 0, 0, 1, 2]

theorem seventeen_source_models : initialDiscordant.length = 17 := by decide
theorem q3_model_groups : 17 * 14 = 238 := by norm_num
theorem q3_initial_total : initialDiscordant.foldl (· + ·) 0 = 45 := by decide
theorem q3_final_total : finalDiscordant.foldl (· + ·) 0 = 79 := by decide
theorem q3_gained_total : gainedDiscordance.foldl (· + ·) 0 = 46 := by decide
theorem q3_lost_total : lostDiscordance.foldl (· + ·) 0 = 12 := by decide
theorem q3_both_total : bothDiscordant.foldl (· + ·) 0 = 33 := by decide

theorem q3_transition_balance :
    finalDiscordant.foldl (· + ·) 0 -
      initialDiscordant.foldl (· + ·) 0 =
    gainedDiscordance.foldl (· + ·) 0 -
      lostDiscordance.foldl (· + ·) 0 := by
  rw [q3_final_total, q3_initial_total, q3_gained_total, q3_lost_total]

theorem q3_discordance_partition :
    initialDiscordant.foldl (· + ·) 0 =
      bothDiscordant.foldl (· + ·) 0 +
        lostDiscordance.foldl (· + ·) 0 ∧
    finalDiscordant.foldl (· + ·) 0 =
      bothDiscordant.foldl (· + ·) 0 +
        gainedDiscordance.foldl (· + ·) 0 := by
  rw [q3_initial_total, q3_final_total, q3_both_total,
      q3_lost_total, q3_gained_total]
  norm_num

theorem common_discordance_cancels (both gained lost : Int) :
    (both + gained) - (both + lost) = gained - lost := by
  omega

#print axioms seventeen_source_models
#print axioms q3_model_groups
#print axioms q3_initial_total
#print axioms q3_final_total
#print axioms q3_gained_total
#print axioms q3_lost_total
#print axioms q3_both_total
#print axioms q3_transition_balance
#print axioms q3_discordance_partition
#print axioms common_discordance_cancels

end HsHVerification.CalderNegationRepeatStability
