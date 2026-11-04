import HsHVerification.CalderNeutronIntegralGate
import Mathlib

/-!
Werner et al. 1975 observed an interference oscillation period
62 ± 2 gauss in magnet air-gap field, using neutron wavelength 1.445 Å.
Treating 60..64 G as a reported numerical interval, NOT a Gaussian CI.
K = 4π h / (m_n λ γ_n) converted to G cm, using CODATA 2022,
is calculated separately in the reproducible Python script.
These are conditional algebraic constraints, NOT empirical H(s)H proofs.
-/

namespace HsHVerification.CalderNeutron

theorem measured_period_inverse_bounds (K B L : ℝ)
    (hK : 0 ≤ K) (hBmin : 60 ≤ B) (hBmax : B ≤ 64)
    (h : B * L = K) :
    K / 64 ≤ L ∧ L ≤ K / 60 := by
  have hBpos : 0 < B := by linarith
  have hL : 0 ≤ L := by
    by_contra hn
    have hLneg : L < 0 := lt_of_not_ge hn
    have hmul : B * L < 0 := mul_neg_of_pos_of_neg hBpos hLneg
    linarith
  constructor
  · have hupper : K ≤ 64 * L := by
      calc
        K = B * L := h.symm
        _ ≤ 64 * L := mul_le_mul_of_nonneg_right hBmax hL
    apply (div_le_iff₀ (by norm_num : (0 : ℝ) < 64)).2
    nlinarith
  · have hlower : 60 * L ≤ K := by
      calc
        60 * L ≤ B * L := mul_le_mul_of_nonneg_right hBmin hL
        _ = K := h
    apply (le_div_iff₀ (by norm_num : (0 : ℝ) < 60)).2
    nlinarith

theorem nominal_period_inversion (K L : ℝ)
    (h : (62 : ℝ) * L = K) : L = K / 62 := by
  exact inverse_calibration K 62 L (by norm_num) h

#print axioms measured_period_inverse_bounds
#print axioms nominal_period_inversion

end HsHVerification.CalderNeutron
