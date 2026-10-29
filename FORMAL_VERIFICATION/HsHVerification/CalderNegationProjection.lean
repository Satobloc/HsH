import HsHVerification.CalderNegationLedger
import Mathlib

/-!
Calder :24 | 2026-10-29. Decomposition of the observed 17-model
negation-category score sensitivity. The only changed scoring key is
question index 2 (Q3); the other three positions retain original keys.
Lean verifies conditional aggregation, not authenticity of the archived
model calls, semantic correctness of the rekey, or causal effects.
-/ 

namespace HsHVerification.CalderNegationProjection

def sourceQ3Nets : List Int :=
  [16, 13, 1, -10, 0, -3, -8, -8, 16, -5, 0, 11, 0, 14, -4, 0, -4]

def correctedQ3Nets : List Int :=
  [-18, -5, -13, 10, 0, -3, 8, -3, -15, 4, -3, -11, -4, -14, 4, -10, 3]

theorem source_q3_total : sourceQ3Nets.foldl (· + ·) 0 = 29 := by decide
theorem corrected_q3_total : correctedQ3Nets.foldl (· + ·) 0 = -70 := by decide

theorem unchanged_other_positions :
    HsHVerification.CalderNegationLedger.sourceNets.foldl (· + ·) 0 -
        sourceQ3Nets.foldl (· + ·) 0 =
    HsHVerification.CalderNegationLedger.correctedNets.foldl (· + ·) 0 -
        correctedQ3Nets.foldl (· + ·) 0 := by
  rw [HsHVerification.CalderNegationLedger.source_total,
      HsHVerification.CalderNegationLedger.corrected_total,
      source_q3_total, corrected_q3_total]
  norm_num

theorem total_key_sensitivity_is_q3_sensitivity :
    HsHVerification.CalderNegationLedger.correctedNets.foldl (· + ·) 0 -
        HsHVerification.CalderNegationLedger.sourceNets.foldl (· + ·) 0 =
    correctedQ3Nets.foldl (· + ·) 0 -
        sourceQ3Nets.foldl (· + ·) 0 := by
  rw [HsHVerification.CalderNegationLedger.source_total,
      HsHVerification.CalderNegationLedger.corrected_total,
      source_q3_total, corrected_q3_total]
  norm_num

theorem common_part_cancels (sourceQ3 correctedQ3 other : Int) :
    (correctedQ3 + other) - (sourceQ3 + other) =
      correctedQ3 - sourceQ3 := by omega

#print axioms source_q3_total
#print axioms corrected_q3_total
#print axioms unchanged_other_positions
#print axioms total_key_sensitivity_is_q3_sensitivity
#print axioms common_part_cancels

end HsHVerification.CalderNegationProjection
