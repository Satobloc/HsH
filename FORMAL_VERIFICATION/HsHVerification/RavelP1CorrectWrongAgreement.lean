import Mathlib

/-!
Source-conditional arithmetic for the 17-model ConsistencyBench CGD archive.
The inputs were replayed from 17 original result blobs and matched all 136
rows of Meridian's identity-preserving matrix, 2026-10-29.
This checks arithmetic and a projection identity only. It does NOT prove that
the archived keys are semantically valid, that the parser is reliable, that
model calls were independent, or that observed agreement is causal.
-/

namespace HsHVerification.RavelP1CorrectWrongAgreement

def initialCorrect : ℤ := 79354
def initialWrong : ℤ := 23443
def finalCorrect : ℤ := 84558
def finalWrong : ℤ := 18323

theorem initial_partition :
    initialCorrect + initialWrong = 102797 := by
  norm_num [initialCorrect, initialWrong]

theorem final_partition :
    finalCorrect + finalWrong = 102881 := by
  norm_num [finalCorrect, finalWrong]

theorem correct_gain :
    finalCorrect - initialCorrect = 5204 := by
  norm_num [initialCorrect, finalCorrect]

theorem wrong_gain :
    finalWrong - initialWrong = -5120 := by
  norm_num [initialWrong, finalWrong]

theorem general_partition_difference (ic iw fc fw : ℤ) :
    (fc + fw) - (ic + iw) = (fc - ic) + (fw - iw) := by
  ring

theorem source_net_change :
    (finalCorrect + finalWrong) -
      (initialCorrect + initialWrong) = 84 := by
  norm_num [initialCorrect, initialWrong, finalCorrect, finalWrong]

theorem source_gain_cancellation : (5204 : ℤ) + (-5120) = 84 := by
  norm_num

#print axioms HsHVerification.RavelP1CorrectWrongAgreement.initial_partition
#print axioms HsHVerification.RavelP1CorrectWrongAgreement.final_partition
#print axioms HsHVerification.RavelP1CorrectWrongAgreement.correct_gain
#print axioms HsHVerification.RavelP1CorrectWrongAgreement.wrong_gain
#print axioms HsHVerification.RavelP1CorrectWrongAgreement.general_partition_difference
#print axioms HsHVerification.RavelP1CorrectWrongAgreement.source_net_change
#print axioms HsHVerification.RavelP1CorrectWrongAgreement.source_gain_cancellation

end HsHVerification.RavelP1CorrectWrongAgreement
