import Mathlib

/-!
Orson Vay | P1 cognition | within-CGD source-scored revision balance
2026-10-28 21:12 UTC

External empirical source (not certified by Lean):
aayambansal/ConsistencyBench, 17 original results/*_cgd.json Git blobs
pinned in WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py;
evaluator src/evaluate.py blob 0453540cb7c19227601e59fb342fa93e736da849.
17 * 300 genuine archived model-output sets, 19,550 question records.
The source key's negation Q3 is disputed. Two score definitions are compared.
Theorems below certify conditional arithmetic ONLY, not key semantics,
model cognition, causal inference, API provenance, or physical SAT.
-/

namespace HsHVerification.OrsonRevisionBalance

/-- A transition tally balances if every repair adds one correct response
and every regression removes one. This is conditional on classification. -/
theorem net_gain_identity (initial final repairs regress : ℤ)
    (h : final + regress = initial + repairs) :
    final - initial = repairs - regress := by
  omega

/-- Exact published-key counts from the independently parsed 17 files. -/
theorem original_key_gain :
    (13221 : ℤ) - 12567 = 1158 - 504 := by
  norm_num

/-- Same recorded answers, with the disputed negation Q3 key corrected. -/
theorem corrected_key_gain :
    (13229 : ℤ) - 12674 = 1122 - 567 := by
  norm_num

/-- Key choice changes the measured within-CGD net gain by 99 labels. -/
theorem key_choice_gain_delta :
    ((13221 : ℤ) - 12567) - ((13229 : ℤ) - 12674) = 99 := by
  norm_num

/-- Original key already yields a small negative negation-category change. -/
theorem negation_original_loss :
    (2130 : ℤ) - 2140 = -10 := by
  norm_num

/-- The corrected negation key makes that negative change larger. -/
theorem negation_corrected_loss :
    (2138 : ℤ) - 2247 = -109 := by
  norm_num

/-- Most checker flags do not produce a changed extracted answer label. -/
theorem flagged_partition :
    (6702 : ℕ) = 2010 + 4692 := by
  norm_num

/-- Changed labels split into repairs, regressions and wrong-to-wrong. -/
theorem changed_partition :
    (2010 : ℕ) = 1158 + 504 + 348 := by
  norm_num

#print axioms net_gain_identity
#print axioms original_key_gain
#print axioms corrected_key_gain
#print axioms key_choice_gain_delta
#print axioms negation_original_loss
#print axioms negation_corrected_loss
#print axioms flagged_partition
#print axioms changed_partition

end HsHVerification.OrsonRevisionBalance
