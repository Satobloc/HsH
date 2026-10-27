import HsHVerification.CalderNeutronMeasuredGate
import Mathlib

/-!
Hale, 2026-10-27: measured neutron-interferometry calibration budget.
Werner et al., PRL 35, 1053 (1975), Eq. (5)-(7):
1.445 Angstrom neutron wavelength, probe-derived 2.7 cm effective
field-integral coefficient, observed gap-field period 62 +/- 2 gauss.
K >= 187 gauss cm is a rounded EXTERNAL numerical premise from
CODATA-2022-based Python calculation (K=187.743430... G cm).
Formalized statements are conditional algebra, NOT proof of the
physical premise, a confidence interval, or H(s)H.
-/

namespace HsHVerification.HaleNeutronBudget

theorem measured_band_lower_bound (K B L : ℝ)
    (hK : 0 ≤ K) (hBmin : 60 ≤ B) (hBmax : B ≤ 64)
    (h : B * L = K) : K / 64 ≤ L :=
  (HsHVerification.CalderNeutron.measured_period_inverse_bounds
    K B L hK hBmin hBmax h).1

theorem nominal_probe_incompatible (K B L : ℝ)
    (hK : 187 ≤ K) (hBmax : B ≤ 64)
    (hL : L = 2.7) (h : B * L = K) : False := by
  rw [hL] at h
  nlinarith

theorem necessary_length_exceeds_nominal (K B L : ℝ)
    (hK : 187 ≤ K) (hBmax : B ≤ 64)
    (hLnonneg : 0 ≤ L) (h : B * L = K) : (2.7 : ℝ) < L := by
  have hbound : B * L ≤ 64 * L :=
    mul_le_mul_of_nonneg_right hBmax hLnonneg
  nlinarith

#print axioms measured_band_lower_bound
#print axioms nominal_probe_incompatible
#print axioms necessary_length_exceeds_nominal

end HsHVerification.HaleNeutronBudget
