import Mathlib
import HsHVerification.MeridianSagnacProjection

/-!
Conditional multi-channel inversion and published CONT17 residual arithmetic.
Böhm et al. (2019), DOI 10.5194/adgeo-50-9-2019, Sections 3-4:
observed ring-laser plus VLBI adjustment, not a measurement of H(s)H.
XB delta-UT1: 24% RMS reduction; XB y_p: 14%; XA x_p: 9%.
The published full-VLBI benchmark and adjusted results share inputs and
model choices; squared RMS is not an independent physical prediction.
-/

namespace HsHVerification.MeridianSagnacMeasuredFusion

open HsHVerification.MeridianSagnacProjection

def xbUt1RmsReduction : ℚ := 24 / 100
def xbYpRmsReduction : ℚ := 14 / 100
def xaXpRmsReduction : ℚ := 9 / 100

/-- Source-conditional exact conversion: 24% RMS reduction -> 42.24%
reduction in squared RMS relative to the same published benchmark. -/
theorem xb_ut1_squared_rms_reduction :
    1 - (1 - xbUt1RmsReduction)^2 = 264 / 625 := by
  norm_num [xbUt1RmsReduction]

theorem xb_yp_squared_rms_reduction :
    1 - (1 - xbYpRmsReduction)^2 = 651 / 2500 := by
  norm_num [xbYpRmsReduction]

theorem xa_xp_squared_rms_reduction :
    1 - (1 - xaXpRmsReduction)^2 = 1719 / 10000 := by
  norm_num [xaXpRmsReduction]

theorem reported_gain_order :
    xaXpRmsReduction < xbYpRmsReduction ∧
      xbYpRmsReduction < xbUt1RmsReduction := by
  norm_num [xaXpRmsReduction, xbYpRmsReduction, xbUt1RmsReduction]

/-- Three independent axis projections with a known nonzero common scale
determine a 3-component angular velocity. A single projection does not.
This is conditional linear algebra, not an assertion that three such
physical sensors were installed in the 2017 campaign. -/
theorem three_axes_determine_rotation
    (k wx wy wz ux uy uz : ℝ) (hk : k ≠ 0)
    (hx : sagnac k 1 0 0 wx wy wz = sagnac k 1 0 0 ux uy uz)
    (hy : sagnac k 0 1 0 wx wy wz = sagnac k 0 1 0 ux uy uz)
    (hz : sagnac k 0 0 1 wx wy wz = sagnac k 0 0 1 ux uy uz) :
    wx = ux ∧ wy = uy ∧ wz = uz := by
  have hx' : k * wx = k * ux := by simpa [sagnac] using hx
  have hy' : k * wy = k * uy := by simpa [sagnac] using hy
  have hz' : k * wz = k * uz := by simpa [sagnac] using hz
  have hx0 : k * (wx - ux) = 0 := by nlinarith [hx']
  have hy0 : k * (wy - uy) = 0 := by nlinarith [hy']
  have hz0 : k * (wz - uz) = 0 := by nlinarith [hz']
  have hx1 : wx - ux = 0 := (mul_eq_zero.mp hx0).resolve_left hk
  have hy1 : wy - uy = 0 := (mul_eq_zero.mp hy0).resolve_left hk
  have hz1 : wz - uz = 0 := (mul_eq_zero.mp hz0).resolve_left hk
  exact ⟨sub_eq_zero.mp hx1, sub_eq_zero.mp hy1, sub_eq_zero.mp hz1⟩

#print axioms xb_ut1_squared_rms_reduction
#print axioms xb_yp_squared_rms_reduction
#print axioms xa_xp_squared_rms_reduction
#print axioms reported_gain_order
#print axioms three_axes_determine_rotation

end HsHVerification.MeridianSagnacMeasuredFusion
