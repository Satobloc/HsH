import Mathlib

/-!
Nadir E989 measured-input interval gate, 2026-10-28.
Physical inputs, encoded as exact reported decimal rationals:
Aguillard et al. PRL 135 101802 (2025), Fermilab a_mu;
NIST CODATA 2022 muon rest energy; Reimann ICHEP2022 E989
nominal momentum and plus-or-minus 0.5% design momentum acceptance.

The rational arithmetic below is exact conditional mathematics. The
experimental decimals have uncertainties; no claim of exact physical
values, measured momentum distribution, SO(4) embedding, or HsH law.
-/

namespace HsHVerification.NadirE989MeasuredAcceptance

def aMu : ℚ := 1165920705 / 1000000000000
def massMeV : ℚ := 1056583755 / 10000000
def nominalP : ℚ := 3094
def fractionAcceptance : ℚ := 5 / 1000
def lowerP : ℚ := nominalP * (1 - fractionAcceptance)
def upperP : ℚ := nominalP * (1 + fractionAcceptance)

def targetGamma (n k : ℕ) : ℚ := (k : ℚ) / ((n : ℚ) * aMu)
def targetMomentumSq (n k : ℕ) : ℚ :=
  massMeV ^ 2 * (targetGamma n k ^ 2 - 1)

theorem measured_anomaly_positive : 0 < aMu := by
  norm_num [aMu]

theorem positive_design_interval : 0 < lowerP ∧ lowerP < upperP := by
  norm_num [lowerP, upperP, nominalP, fractionAcceptance]

theorem winding_322_11 : (322 : ℚ) * ((11 : ℚ) / 322) = 11 := by
  norm_num

theorem squared_322_11_within_design :
    lowerP ^ 2 < targetMomentumSq 322 11 ∧
    targetMomentumSq 322 11 < upperP ^ 2 := by
  norm_num [lowerP, upperP, nominalP, fractionAcceptance,
    targetMomentumSq, targetGamma, aMu, massMeV]

theorem squared_88_3_within_design :
    lowerP ^ 2 < targetMomentumSq 88 3 ∧
    targetMomentumSq 88 3 < upperP ^ 2 := by
  norm_num [lowerP, upperP, nominalP, fractionAcceptance,
    targetMomentumSq, targetGamma, aMu, massMeV]

#print axioms measured_anomaly_positive
#print axioms positive_design_interval
#print axioms winding_322_11
#print axioms squared_322_11_within_design
#print axioms squared_88_3_within_design

end HsHVerification.NadirE989MeasuredAcceptance
