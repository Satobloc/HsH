import HsHVerification.SableP1ModelFlagSource
import Mathlib
/-!
Loom source-role audit: leave out ONLY the fourth question of each original
modus_tollens set (50 per archived model file). All 850 excluded occurrences
were initially correct under the published source key; 849 were checker-flagged.
Source: 17 exact original aayambansal/ConsistencyBench CGD Git blobs listed in
WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py,
blob 2e10ed2510b8ce14e716780a887c0fe23c3067b9.
Original data re-read 2026-10-29 20:24 UTC, all 17 final score metrics matched.
This is a POST-HOC source-key sensitivity check, not an independently
adjudicated contradiction test, not a causal trial, not physics.
-/
namespace HsHVerification.LoomP1MP4Source
open HsHVerification.SableP1ModelFlagSource

-- Original model order exactly follows SableP1ModelFlagSource.observed.
-- For gpt-4o one fourth-position response is unflagged; all other 16
-- models have all 50 flagged. Every one of these 850 was source-key correct.
def mp4FlaggedKeyRight : List Nat :=
  [49,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50,50]

def omitMP4 (c : Counts) (nFlagged : Nat) : Counts :=
  ⟨c.tp, c.fp - nFlagged, c.fn, c.tn - (50 - nFlagged)⟩

def observedWithoutMP4 : List Counts :=
  List.zipWith omitMP4 observed mp4FlaggedKeyRight

def pooledWithoutMP4 : Counts :=
  observedWithoutMP4.foldl add ⟨0,0,0,0⟩

theorem mp4_list_length : mp4FlaggedKeyRight.length = 17 := by decide
theorem excluded_850_and_flagged_849 :
    mp4FlaggedKeyRight.foldl (· + ·) 0 = 849 ∧
    mp4FlaggedKeyRight.length * 50 = 850 := by decide
theorem no_truncated_subtraction :
    ∀ c ∈ (List.zip observed mp4FlaggedKeyRight),
      c.2 ≤ c.1.fp ∧ 50 - c.2 ≤ c.1.tn := by decide
theorem remaining_each_800 :
    ∀ c ∈ observedWithoutMP4, c.tp+c.fp+c.fn+c.tn = 800 := by decide
theorem remaining_pooled :
    pooledWithoutMP4 = ⟨3093,2760,2871,4876⟩ := by decide
theorem remaining_sign_partition :
    (observedWithoutMP4.filter flagMoreKeyWrong).length = 16 ∧
    (observedWithoutMP4.filter flagLessKeyWrong).length = 1 := by decide
theorem remaining_all_signs_strict :
    ∀ c ∈ observedWithoutMP4,
      flagMoreKeyWrong c = true ∨ flagLessKeyWrong c = true := by decide

#print axioms mp4_list_length
#print axioms excluded_850_and_flagged_849
#print axioms no_truncated_subtraction
#print axioms remaining_each_800
#print axioms remaining_pooled
#print axioms remaining_sign_partition
#print axioms remaining_all_signs_strict
end HsHVerification.LoomP1MP4Source
