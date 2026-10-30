import Mathlib

/-!
Source-anchored rational arithmetic for actual muonic helium-3/4 measurements.
CREMA arXiv:2305.11679v2 PDF eqs. (14),(16),(17),(18),(19).
All energy numbers in meV, slope in meV/fm^2, radius-squared in fm^2.
The HTML rendering of eq. (16) omits the final +15.499(378) meV
nuclear-structure term visible in the PDF. Do not use the truncated equation.
Conditional mathematics, not a new H(s)H physical prediction.
-/

namespace HsHVerification.RavelMuonic2026

def e3 : ℚ := 1258598 / 1000
def e4 : ℚ := 1378521 / 1000
def qedIntercept : ℚ := 1644348 / 1000
def nuclearCorrection : ℚ := 15499 / 1000
def slope3 : ℚ := 103383 / 1000
def slope4 : ℚ := 106209 / 1000
def isotopeOffset : ℚ := 2585 / 10000
def inverseRadiusSq : ℚ := (qedIntercept + nuclearCorrection - e3) / slope3
def truncatedInverseRadiusSq : ℚ := (qedIntercept - e3) / slope3

theorem published_slopes_positive : 0 < slope3 ∧ 0 < slope4 := by
  norm_num [slope3, slope4]

theorem omitted_nuclear_term_is_nonzero : nuclearCorrection ≠ 0 := by
  norm_num [nuclearCorrection]

theorem omitted_term_changes_inverse_radius_squared :
    inverseRadiusSq - truncatedInverseRadiusSq =
      nuclearCorrection / slope3 := by
  norm_num [inverseRadiusSq, truncatedInverseRadiusSq,
    nuclearCorrection, slope3, qedIntercept, e3]

theorem source_inverse_radius_squared_bounds :
    (38811 : ℚ) / 10000 < inverseRadiusSq ∧
    inverseRadiusSq < (38813 : ℚ) / 10000 := by
  norm_num [inverseRadiusSq, qedIntercept, nuclearCorrection, e3, slope3]

theorem affine_readout_inversion
    (a b t energy radiusSq : ℚ) (hb : b ≠ 0)
    (h : energy = a - b * radiusSq + t) :
    radiusSq = (a + t - energy) / b := by
  apply (eq_div_iff hb).2
  linarith

#print axioms HsHVerification.RavelMuonic2026.published_slopes_positive
#print axioms HsHVerification.RavelMuonic2026.omitted_nuclear_term_is_nonzero
#print axioms HsHVerification.RavelMuonic2026.omitted_term_changes_inverse_radius_squared
#print axioms HsHVerification.RavelMuonic2026.source_inverse_radius_squared_bounds
#print axioms HsHVerification.RavelMuonic2026.affine_readout_inversion

end HsHVerification.RavelMuonic2026
