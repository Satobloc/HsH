import Mathlib

/-!
Kestrel S2 orbital-plane -> sky-plane -> EHT angular-ratio gate, 2026-10-28.
Empirical anchors: GRAVITY Collaboration (2020), A&A 636 L5, Table E.1:
 a=125.058 plus-or-minus0.041 mas, e=0.884649 plus-or-minus0.000066,
 i=134.567 plus-or-minus0.033 deg, omega=66.263 plus-or-minus0.031 deg.
EHT Collaboration (2022), ApJL 930 L15: ring diameter 51.8 plus-or-minus2.3 microas.
The symbolic theorems are conditional identities and bounds; the measured
numerical replay, covariances, and astrophysical limitations are separate.
No H(s)H material-core or emission law is assumed or proved.
-/
namespace HsHVerification.KestrelS2SkyProjection

/-- Angular orbital-plane pericenter for a fitted Kepler ellipse. -/
noncomputable def peri (a e : ℝ) : ℝ := a * (1 - e)

/-- Projection factor squared for the argument of periapsis and inclination.
    This excludes the node angle, which rotates the image on the sky. -/
noncomputable def projectionSq (inclination omega : ℝ) : ℝ :=
  (Real.cos omega)^2 + (Real.cos inclination)^2 * (Real.sin omega)^2

/-- Equivalent sky-projection expression; no orbital dynamics involved. -/
theorem projection_sq_identity (inclination omega : ℝ) :
    projectionSq inclination omega =
      1 - (Real.sin inclination)^2 * (Real.sin omega)^2 := by
  unfold projectionSq
  have hi : (Real.cos inclination)^2 = 1 - (Real.sin inclination)^2 := by
    nlinarith [Real.sin_sq_add_cos_sq inclination]
  have hw : (Real.cos omega)^2 = 1 - (Real.sin omega)^2 := by
    nlinarith [Real.sin_sq_add_cos_sq omega]
  rw [hi, hw]
  ring

/-- The sky-plane radius is not greater than the orbital-plane radius
    when its projection factor lies between zero and one. -/
theorem projected_radius_bound (r q : ℝ) (hr : 0 ≤ r) (hq0 : 0 ≤ q)
    (hq1 : q ≤ 1) : r * q ≤ r := by
  calc
    r * q ≤ r * 1 := mul_le_mul_of_nonneg_left hq1 hr
    _ = r := by ring

/-- The angular ratio is invariant when both angular scales are multiplied
    by the same nonzero factor; a scalar ratio cannot identify both. -/
theorem common_angular_scale_cancels
    (a e diameter scale : ℝ) (hd : diameter ≠ 0) (hs : scale ≠ 0) :
    peri (scale * a) e / (scale * diameter) = peri a e / diameter := by
  unfold peri
  field_simp [hd, hs]
  all_goals ring

/-- The orbital-to-ring and ring-to-gravitational-scale ratios compose.
    This is an algebraic readout contract, not a model prediction. -/
theorem three_scale_composition
    (r diameter grav : ℝ) (hd : diameter ≠ 0) (hg : grav ≠ 0) :
    (r / diameter) * (diameter / grav) = r / grav := by
  field_simp [hd, hg]

/-- Comparing with the EHT ring radius rather than its diameter doubles
    the dimensionless ratio. Keep this factor explicit in all figures. -/
theorem diameter_radius_factor_two
    (r diameter : ℝ) (hd : diameter ≠ 0) :
    r / (diameter / 2) = 2 * (r / diameter) := by
  field_simp [hd]
  all_goals ring

#print axioms projection_sq_identity
#print axioms projected_radius_bound
#print axioms common_angular_scale_cancels
#print axioms three_scale_composition
#print axioms diameter_radius_factor_two

end HsHVerification.KestrelS2SkyProjection
