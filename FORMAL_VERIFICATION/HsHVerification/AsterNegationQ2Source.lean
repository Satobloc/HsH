import HsHVerification.AsterNegationQ2Semantic
import Mathlib

/-!
# Aster: source-locked flag versus answer-key projection
17 real recorded ConsistencyBench CGD model files, pinned by the existing
Orson 2026_10_28_cgd_revision_balance_replay.py manifest.
Negation Q2: 850 model-set occurrences; 593 both-initial-label key matches,
116 of those flagged, 477 unflagged. Total Q2 flags 159.
Seven flagged bare-Yes/No pairs in Gemini 2.5 Flash correspond to four
distinct premises; CB-92210 is a real archived witness, not a fixture.
The formal theorem is about *recorded key agreement*, not semantic truth.
-/

namespace HsHVerification.AsterNegationQ2Source

structure ArchivedPair where
  initialQ1 : Bool
  initialQ2 : Bool
  keyQ1 : Bool
  keyQ2 : Bool
  flagQ2 : Bool
  deriving DecidableEq, Repr

def bothMatchKeys (r : ArchivedPair) : Prop :=
  r.initialQ1 = r.keyQ1 ∧ r.initialQ2 = r.keyQ2

-- Original Gemini 2.5 Flash CGD, source set CB-92210:
-- Q1 raw "Yes.", Q2 raw "No.", both published-key correct,
-- but the archived contradiction_detected flag on Q2 is true.
def cb92210 : ArchivedPair :=
  ⟨true, false, true, false, true⟩

theorem cb92210_matches_both_keys_and_flagged :
    bothMatchKeys cb92210 ∧ cb92210.flagQ2 = true := by
  decide

theorem a_flag_does_not_entail_source_key_error :
    ¬ (∀ r : ArchivedPair, r.flagQ2 = true → ¬ bothMatchKeys r) := by
  intro h
  exact (h cb92210 (by decide)) (by decide)

theorem recorded_both_key_correct_partition :
    (116 + 477 : Nat) = 593 := by
  norm_num

theorem recorded_flag_partition :
    (116 + 43 : Nat) = 159 := by
  norm_num

theorem recorded_negation_q2_total :
    (593 + 257 : Nat) = 850 := by
  norm_num

theorem recorded_minimal_witness_bound :
    (7 : Nat) ≤ 116 := by
  norm_num

#print axioms cb92210_matches_both_keys_and_flagged
#print axioms a_flag_does_not_entail_source_key_error
#print axioms recorded_both_key_correct_partition
#print axioms recorded_flag_partition
#print axioms recorded_negation_q2_total
#print axioms recorded_minimal_witness_bound

end HsHVerification.AsterNegationQ2Source
