import HsHVerification.AlberrSpinorSignProjection

/-!
# Conditional interferometric reference readout, Danner et al. (2020)
Real-amplitude restricted comparator: reference r in second path.
This is not a complete Hilbert-space measurement model or H(s)H claim.
-/
namespace HsHVerification.AlberrInterferometricReference
open HsHVerification.AlberrSpinorSignProjection
def coherentIntensity (a b r : ℝ) : ℝ := (a + r) ^ 2 + b ^ 2
theorem coherent_sign_difference (a b r : ℝ) :
    coherentIntensity a b r - coherentIntensity (-a) (-b) r =
    4 * a * r := by
  unfold coherentIntensity
  ring
theorem no_reference_sign_invisible (a b : ℝ) :
    coherentIntensity a b 0 = coherentIntensity (-a) (-b) 0 := by
  unfold coherentIntensity
  ring
theorem reference_distinguishes_of_nonzero (a b r : ℝ)
    (ha : a ≠ 0) (hr : r ≠ 0) :
    coherentIntensity a b r ≠ coherentIntensity (-a) (-b) r := by
  intro heq
  have hd := coherent_sign_difference a b r
  have hzero : (4 : ℝ) * a * r = 0 := by
    rw [heq] at hd
    linarith
  have hnz : (4 : ℝ) * a * r ≠ 0 := by
    exact mul_ne_zero (mul_ne_zero (by norm_num) ha) hr
  exact hnz hzero
theorem same_spin_readout_different_path_readout (a b r : ℝ) :
    (spinZ (-a) (-b), spinX (-a) (-b)) =
      (spinZ a b, spinX a b) ∧
    coherentIntensity a b r - coherentIntensity (-a) (-b) r =
      4 * a * r := by
  constructor
  · exact spin_pair_sign_invisible a b
  · exact coherent_sign_difference a b r
#print axioms coherent_sign_difference
#print axioms no_reference_sign_invisible
#print axioms reference_distinguishes_of_nonzero
#print axioms same_spin_readout_different_path_readout
end HsHVerification.AlberrInterferometricReference
