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

/-- Composition of the forward projection interval with the inverse
circular-chord cosine gate. The observed ratio is a premise, not a proof
of measurement fidelity or independent physical prediction. -/
theorem measured_projection_to_cosine_bound
    (r projected trueChord c : ℝ)
    (hr : 0 < r)
    (hproj : projected ≤ trueChord)
    (hdiam : trueChord ≤ 2 * r)
    (hobs : projected / (2 * r) = (703 : ℝ) / 704)
    (hcircle : (trueChord / (2 * r)) ^ 2 = (1 - c) / 2) :
    c ≤ -(246401 : ℝ) / 247808 := by
  have hratio : (703 : ℝ) / 704 ≤ trueChord / (2 * r) := by
    rw [← hobs]
    exact (projected_chord_interval r projected trueChord hr hproj hdiam).1
  exact cosine_bound_rational (trueChord / (2 * r)) c hratio hcircle

/-- Scalar chord geometry cannot tell which tracer was first:
reversing a signed angular separation preserves its cosine. -/
theorem chord_reversal_blind (angle : ℝ) :
    Real.cos (-angle) = Real.cos angle := by
  exact Real.cos_neg angle

#print axioms cosine_upper_bound
#print axioms cosine_bound_rational
#print axioms measured_projection_to_cosine_bound
#print axioms chord_reversal_blind

end HsHVerification.MeridianTangChordInverse
