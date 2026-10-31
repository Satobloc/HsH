import Mathlib

/-!
Tern Rook, 2026-10-28, P1 source-key sensitivity, not physical theory.

Source: aayambansal/ConsistencyBench sample Git blob
10eb2da27c84c706d8e9e2325afca864fcae6a0d and 34 original
model-output Git blobs pinned in HsH
WORKSPACES/ORSON_VAY/CODE/2026_10_28_conjunction_null_replay.py
(blob 97ef954e4bd437c7a69182398c6bb97d58114b66).

17 matched model labels, 300 sets each, 5 disputed contrapositive
temperature sets each. The 17*2*5=170 original-key Q2 answers
have zero YES extracted labels, although the source keys are YES.
The model counts below are exact source-transcribed observations
under Orson's existing normalize() rule, not assumptions proven by Lean.

Negation-Q3-corrected all-four set passes: vanilla 933, CGD 1214.
Strict alternative Q2 key NO recovers 19 vanilla and 17 CGD sets.
Permissive NO/CANNOT_DETERMINE recovers 23 vanilla and 25 CGD sets.
These are conditional scoring policies, not independently blinded
semantic adjudications. Lean proves ONLY the stated algebra and
arithmetic, not dataset authenticity, key correctness, model cognition,
experimental independence, or a causal CGD effect.
-/

namespace HsHVerification.TernP1ContrapositiveRekey

theorem differential_rekey_identity (v c dv dc : ℤ) :
    (c + dc) - (v + dv) = (c - v) + (dc - dv) := by
  ring

theorem disputed_q2_record_partition :
    83 + 2 + 80 + 5 = (17 : ℕ) * 2 * 5 := by
  norm_num

theorem original_corrected_gain :
    (1214 : ℕ) - 933 = 281 := by
  norm_num

theorem strict_rekey_gain :
    ((1214 : ℕ) + 17) - (933 + 19) = 279 := by
  norm_num

theorem permissive_rekey_gain :
    ((1214 : ℕ) + 25) - (933 + 23) = 283 := by
  norm_num

theorem gain_sensitivity_interval :
    (279 : ℕ) ≤ 281 ∧ 281 ≤ 283 := by
  norm_num

theorem baseline_corrected_pair_partition :
    226 + 507 + 707 + 3575 = (17 : ℕ) * 295 := by
  norm_num

#print axioms differential_rekey_identity
#print axioms disputed_q2_record_partition
#print axioms original_corrected_gain
#print axioms strict_rekey_gain
#print axioms permissive_rekey_gain
#print axioms gain_sensitivity_interval
#print axioms baseline_corrected_pair_partition

end HsHVerification.TernP1ContrapositiveRekey
