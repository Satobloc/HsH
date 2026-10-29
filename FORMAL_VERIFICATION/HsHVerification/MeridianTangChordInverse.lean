import Mathlib
import HsHVerification.MeridianTangChordProjection

/-!
Source-conditional 3D circular-ring chord inversion for Tang et al. (2023).
z is true 3D chord/(2R); c is cosine of the smaller central angle.
For two points on the same circle, z^2=(1-c)/2. Image projection can
only shorten a chord. The 140.8 um radius is a model fit, not a blind
physical prediction. No quantitative uncertainty interval is claimed.
-/

namespace HsHVerification.MeridianTangChordInverse

open HsHVerification.MeridianTangChordProjection

/-- The exact printed nominal projection factor implies an algebraic
cosine ceiling, provided the points lie on one circular ring. -/
theorem cosine_upper_bound
    (z c : ℝ)
    (hz : (703 : ℝ) / 704 ≤ z)
    (hcircle : z ^ 2 = (1 - c) / 2) :
    c ≤ 1 - 2 * ((703 : ℝ) / 704) ^ 2 := by
  have hq : (0 : ℝ) ≤ (703 : ℝ) / 704 := by norm_num
  have hz0 : 0 ≤ z := le_trans hq hz
  have hprod : 0 ≤ (z - ((703 : ℝ) / 704)) *
      (z + ((703 : ℝ) / 704)) :=
    mul_nonneg (sub_nonneg.mpr hz) (add_nonneg hz0 hq)
  nlinarith [hprod]

theorem cosine_bound_rational
    (z c : ℝ)
    (hz : (703 : ℝ) / 704 ≤ z)
    (hcircle : z ^ 2 = (1 - c) / 2) :
    c ≤ -(246401 : ℝ) / 247808 := by
  have h := cosine_upper_bound z c hz hcircle
  nlinarith [h]

/-- Scalar chord geometry cannot tell which tracer was first:
reversing a signed angular separation preserves its cosine. -/
theorem chord_reversal_blind (angle : ℝ) :
    Real.cos (-angle) = Real.cos angle := by
  exact Real.cos_neg angle

#print axioms cosine_upper_bound
#print axioms cosine_bound_rational
#print axioms chord_reversal_blind

end HsHVerification.MeridianTangChordInverse
