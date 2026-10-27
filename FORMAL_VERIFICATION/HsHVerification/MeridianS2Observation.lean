import HsHVerification.MeridianS2Geometry
import Mathlib

/-!
# Meridian S2 observation/projection gate | 2026-10-27

Measured system: GRAVITY S2/Sgr A* astrometry+spectroscopy, 1992-2019,
published GRAVITY Collaboration (2020) A&A 636 L5, Eq (1) and Table 1.
GR comparator: Delta_phi = 6 pi mu/[a(1-e^2)c^2].
The paper's fitted f_SP=1.10 +/- 0.19 is not a blind H(s)H prediction.

Formalization is only rational algebra, not a derivation of GR, H(s)H,
Euclidean worldtube dynamics, orbital parameter covariance, or a
physical observation map. The geometric bridge to the prior module
is deliberately conditional.
-/

namespace HsHVerification.MeridianS2Observation

noncomputable def baselinePrecession (coeff mu semi e c : ℝ) : ℝ :=
  coeff * mu / (semi * (1 - e^2) * c^2)

noncomputable def inferredFactor (observed baseline : ℝ) : ℝ :=
  observed / baseline

theorem precession_scale (coeff mu semi e c f : ℝ) :
    baselinePrecession (f * coeff) mu semi e c =
      f * baselinePrecession coeff mu semi e c := by
  unfold baselinePrecession
  ring

theorem fitted_observation_roundtrip (observed baseline : ℝ)
    (hb : baseline ≠ 0) :
    inferredFactor observed baseline * baseline = observed := by
  unfold inferredFactor
  field_simp [hb]

theorem zero_coefficient_zero_precession (mu semi e c : ℝ) :
    baselinePrecession 0 mu semi e c = 0 := by
  simp [baselinePrecession]

#print axioms precession_scale
#print axioms fitted_observation_roundtrip
#print axioms zero_coefficient_zero_precession

end HsHVerification.MeridianS2Observation
