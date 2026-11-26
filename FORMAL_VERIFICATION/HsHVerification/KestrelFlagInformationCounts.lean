import Mathlib

/-!
Kestrel / Orson P1 source-conditional arithmetic on real archived CGD counts.
Observed source: Satobloc/HsH WORKSPACES/ORSON_VAY/
2026-10-29_1612Z_P1_FLAG_DIAGNOSTIC_SOURCE_AUDIT.md,
blob daf8e8ec4882b281f2e951b8fae71aaf4ca073c6.
Source benchmark: aayambansal/ConsistencyBench, 17 archived model CGD files.
Only later-question records are eligible: 14,450 of 19,550 records.
No proof here authenticates the source counts, semantics, independence,
causal effect, or empirical physical truth. No synthetic physics fixtures.
-/

namespace HsHVerification.KestrelFlagInformationCounts

theorem eligible_count_partition :
    3093 + 3609 + 2871 + 4877 = 14450 := by
  norm_num

theorem structural_ineligibility_excluded :
    14450 + 5100 = 19550 := by
  norm_num

theorem flagged_count :
    3093 + 3609 = 6702 := by
  norm_num

theorem unflagged_count :
    2871 + 4877 = 7748 := by
  norm_num

/-- Among eligible recorded rows, the flagged group has higher
published-key disagreement frequency than the unflagged group. -/
theorem flagged_key_error_rate_higher :
    3093 * 7748 > 2871 * 6702 := by
  norm_num

/-- The finite-corpus cross-product odds ratio exceeds 1. -/
theorem observed_odds_crossproduct_higher :
    3093 * 4877 > 3609 * 2871 := by
  norm_num

/-- Two recorded flagged-category rates are not interchangeable. -/
theorem flagged_category_heterogeneity :
    925 * 1337 > 311 * 1179 := by
  norm_num

#print axioms eligible_count_partition
#print axioms structural_ineligibility_excluded
#print axioms flagged_count
#print axioms unflagged_count
#print axioms flagged_key_error_rate_higher
#print axioms observed_odds_crossproduct_higher
#print axioms flagged_category_heterogeneity

end HsHVerification.KestrelFlagInformationCounts
