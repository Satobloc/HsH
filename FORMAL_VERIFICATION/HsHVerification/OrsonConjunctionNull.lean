import Mathlib

/-!
Orson Vay :12, 2026-10-28. ConsistencyBench source-specific conditional
arithmetic, based on genuine archived model-output records.

Source evaluator: aayambansal/ConsistencyBench src/evaluate.py,
Git blob 0453540cb7c19227601e59fb342fa93e736da849.
Original sample: blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d.
35 model-result files, 18 vanilla and 17 CGD, all 300 sets per file.
This formalization does not authenticate model calls, prove independence,
establish a causal treatment effect, or validate the semantic keys.
The category-by-question-position product baseline is a CONDITIONAL
independence null, not an empirical assumption shown to hold.
-/

namespace HsHVerification.OrsonConjunctionNull

theorem conjunction_gap_factorization (p : ℚ) :
    p - p * p = p * (1 - p) := by
  ring

theorem conjunction_gap_nonnegative (p : ℚ)
    (hp0 : 0 ≤ p) (hp1 : p ≤ 1) :
    0 ≤ p - p * p := by
  have h := mul_nonneg hp0 (sub_nonneg.mpr hp1)
  nlinarith

-- Source-observed set counts versus category/position-marginal
-- independent-null expected set counts, in units of 300 sets.
theorem gpt41_vanilla_source_below_null :
    (140 : ℚ) < (141156 : ℚ) / 1000 := by
  norm_num

theorem gpt4o_vanilla_source_below_null :
    (60 : ℚ) < (6201736 : ℚ) / 100000 := by
  norm_num

-- Across the same 17 paired model labels (5,100 set positions per arm).
-- Counts are conditioned on exact archived-output transcriptions.
theorem original_gain_decomposition :
    (339 : ℚ) =
      (22470590 : ℚ) / 100000 +
      (11429410 : ℚ) / 100000 := by
  norm_num

theorem corrected_gain_decomposition :
    (281 : ℚ) =
      (16338598 : ℚ) / 100000 +
      (11761402 : ℚ) / 100000 := by
  norm_num

theorem original_structural_null_fraction_positive :
    (0 : ℚ) < (22470590 : ℚ) / 100000 / 339 := by
  norm_num

theorem corrected_structural_null_fraction_positive :
    (0 : ℚ) < (16338598 : ℚ) / 100000 / 281 := by
  norm_num

#print axioms conjunction_gap_factorization
#print axioms conjunction_gap_nonnegative
#print axioms gpt41_vanilla_source_below_null
#print axioms gpt4o_vanilla_source_below_null
#print axioms original_gain_decomposition
#print axioms corrected_gain_decomposition
#print axioms original_structural_null_fraction_positive
#print axioms corrected_structural_null_fraction_positive

end HsHVerification.OrsonConjunctionNull
