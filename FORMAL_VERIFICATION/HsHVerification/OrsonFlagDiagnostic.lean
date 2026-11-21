import Mathlib

/-!
Orson Vay P1 cognition, 2026-10-29 16:12 UTC.
Source-locked descriptive counts from 17 public ConsistencyBench CGD result
JSON Git blobs listed in WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py
(manifest Git blob 2e10ed2510b8ce14e716780a887c0fe23c3067b9).
Original evaluator src/evaluate.py blob 0453540cb7c19227601e59fb342fa93e736da849.
Actual GitHub-connected JS parsed 17/17 original files and matched source
final individual_correct metrics, with no mismatches. Source-key correctness is
NOT independent semantic adjudication. No new model trials or causal claims.
All proof statements are conditional on the transcription of counts.
-/

namespace HsHVerification.OrsonFlagDiagnostic

/-- Among all 19,550 archived positions: flag and initial source-key error. -/
theorem all_flag_partition : (3093 : ℕ) + 3609 = 6702 := by
  norm_num

/-- All positions partition into four cells of the source-key proxy table. -/
theorem all_four_cells : (3093 : ℕ) + 3609 + 3890 + 8958 = 19550 := by
  norm_num

/-- Restricting to later questions (positions with an earlier answer) removes
structurally ineligible first questions from the unflagged cells. -/
theorem eligible_four_cells :
    (3093 : ℕ) + 3609 + 2871 + 4877 = 14450 := by
  norm_num

/-- The recorded flagged set contains more source-key-correct than
source-key-incorrect initial labels, under the published benchmark key. -/
theorem flagged_correct_exceeds_wrong : (3093 : ℕ) < 3609 := by
  norm_num

/-- Positive predictive value for initial source-key error is below one-half. -/
theorem source_key_ppv_below_half : (3093 : ℚ) / 6702 < 1 / 2 := by
  norm_num

/-- Sensitivity for initial source-key error among checker-eligible positions
is just above one-half; not semantic NLI contradiction sensitivity. -/
theorem eligible_source_key_sensitivity_above_half :
    (1 : ℚ) / 2 < 3093 / 5964 := by
  norm_num

/-- Category-conditioned source-key PPV is not a universal checker parameter:
modus_tollens and syllogistic strata have different observed ratios. -/
theorem category_source_key_ppv_separation :
    (311 : ℚ) / 1337 < 925 / 1179 := by
  norm_num

/-- In the modus_tollens fourth-position ceiling stratum, 849 flags contain
zero initially source-key-wrong labels. -/
theorem fourth_position_no_initial_source_key_errors :
    (0 : ℕ) + 849 = 849 := by
  norm_num

/-- Algebraic decomposition of a confusion table is independent of source
interpretation, provided its four cells are mutually exclusive and exhaustive. -/
theorem four_cell_balance
    (tp fp fn tn n : ℕ)
    (h : tp + fp + fn + tn = n) :
    (tp + fn) + (fp + tn) = n := by
  omega

#print axioms all_flag_partition
#print axioms all_four_cells
#print axioms eligible_four_cells
#print axioms flagged_correct_exceeds_wrong
#print axioms source_key_ppv_below_half
#print axioms eligible_source_key_sensitivity_above_half
#print axioms category_source_key_ppv_separation
#print axioms fourth_position_no_initial_source_key_errors
#print axioms four_cell_balance

end HsHVerification.OrsonFlagDiagnostic
