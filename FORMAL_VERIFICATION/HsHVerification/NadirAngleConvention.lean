import Mathlib

/-!
# Nadir angle-convention crosswalk

This module formalizes only the reciprocal-slope identity for a regular
helix with positive axial and radial components.

The plane-relative pitch convention has tangent slope axial/radial.
The complementary normal-relative convention has tangent slope radial/axial.
Their product is one.

This is a coordinate identity, not a physical prediction.  It does not
identify the carrier axis with the timesheet normal, select which dated
Nathan-direct theta_4 convention governs a given source, or derive the
Nadir readout metric.
-/

namespace HsHVerification.NadirAngleConvention

/-- Tangent slope for a pitch angle measured from the plane. -/
noncomputable def planePitchSlope (axial radial : ℝ) : ℝ := axial / radial

/-- Tangent slope for the complementary angle measured from the plane normal. -/
noncomputable def normalIncidenceSlope (axial radial : ℝ) : ℝ := radial / axial

/-- Under positive nonzero axial and radial components, the two slopes are reciprocal. -/
theorem plane_normal_slopes_reciprocal
    (axial radial : ℝ) (haxial : 0 < axial) (hradial : 0 < radial) :
    planePitchSlope axial radial * normalIncidenceSlope axial radial = 1 := by
  unfold planePitchSlope normalIncidenceSlope
  have haxial0 : axial ≠ 0 := ne_of_gt haxial
  have hradial0 : radial ≠ 0 := ne_of_gt hradial
  field_simp [haxial0, hradial0]

end HsHVerification.NadirAngleConvention
