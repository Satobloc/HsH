import HsHVerification.MercerGWAreaBounds
import Mathlib

/-!
The exact standard-Kerr area A=8*pi*(GM_sun^N/c^2)^2 * m^2 * (1+sqrt(1-chi^2))
is used as a comparator. IAU nominal GM_sun and SI c are exact conversion values.
GWOSC GW150914-v3 90% marginal endpoints:
m1 upper 40.3 Msun, m2 upper 33.6 Msun, mf lower 60.1 Msun,
chi_f upper 0.74. Endpoints form a sensitivity rectangle, NOT a joint posterior.
-/
namespace HsHVerification.MercerGWAreaReadout
open HsHVerification.MercerGWAreaBounds

def scaledArea (k m q : ℝ) : ℝ := k * areaCoeff m q

theorem positive_scale_preserves_growth (k m1 m2 mf q1 q2 qf : ℝ)
    (hk : 0 < k) (hq1 : q1 ≤ 1) (hq2 : q2 ≤ 1)
    (hmargin : initialSpinlessUpper m1 m2 < areaCoeff mf qf) :
    scaledArea k m1 q1 + scaledArea k m2 q2 < scaledArea k mf qf := by
  have h := positive_margin_implies_growth m1 m2 mf q1 q2 qf hq1 hq2 hmargin
  have hs := mul_lt_mul_of_pos_left h hk
  simpa [scaledArea, mul_add] using hs

theorem measured_spin_q_lower :
    (0.67 : ℝ) < Real.sqrt (1 - (0.74 : ℝ) ^ 2) := by
  have hn : 0 ≤ (1 : ℝ) - (0.74 : ℝ) ^ 2 := by norm_num
  have hsq := Real.sq_sqrt hn
  have hpos := Real.sqrt_nonneg ((1 : ℝ) - (0.74 : ℝ) ^ 2)
  nlinarith

theorem measured_endpoint_margin :
    initialSpinlessUpper (40.3 : ℝ) (33.6 : ℝ) <
      areaCoeff (60.1 : ℝ) (Real.sqrt (1 - (0.74 : ℝ) ^ 2)) := by
  have hq := measured_spin_q_lower
  unfold initialSpinlessUpper areaCoeff
  nlinarith

#print axioms positive_scale_preserves_growth
#print axioms measured_spin_q_lower
#print axioms measured_endpoint_margin
end HsHVerification.MercerGWAreaReadout
