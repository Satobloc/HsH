import Mathlib

/-!
Orson Vay P1 cognition, 2026-10-29 12:24 UTC.
Source: aayambansal/ConsistencyBench, original 17 CGD JSON Git blobs
pinned in WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py.
Evaluator src/evaluate.py Git blob 0453540cb7c19227601e59fb342fa93e736da849.
These are exact source-scored counts for the fourth (modus ponens) question
in the 50 modus_tollens sets x 17 recorded model files. No independent
semantic adjudication, new model trial, causal conclusion or physical claim.
-/

namespace HsHVerification.OrsonModusPonensFourth

/-- 849 of 850 recorded fourth-position cases carry a checker flag. -/
theorem flag_partition : (850 : ℕ) = 849 + 1 := by
  norm_num

/-- Of the 849 flagged fourth-position cases, 17 change extracted label. -/
theorem flagged_change_partition : (849 : ℕ) = 17 + 832 := by
  norm_num

/-- All 850 initial extracted labels match the source's modus ponens key. -/
theorem initial_key_ceiling : (850 : ℕ) - 850 = 0 := by
  norm_num

/-- Seventeen source-key regressions leave 833 final correct labels. -/
theorem final_key_balance : (850 : ℤ) - 17 = 833 := by
  norm_num

/-- Flags greatly outnumber changed labels in this source stratum. -/
theorem flags_exceed_changes : (17 : ℕ) < 849 := by
  norm_num

/-- Source-scored flag rate exceeds 99%, without establishing NLI truth. -/
theorem flag_rate_gt_99_percent : (99 : ℚ) / 100 < 849 / 850 := by
  norm_num

#print axioms flag_partition
#print axioms flagged_change_partition
#print axioms initial_key_ceiling
#print axioms final_key_balance
#print axioms flags_exceed_changes
#print axioms flag_rate_gt_99_percent

end HsHVerification.OrsonModusPonensFourth
