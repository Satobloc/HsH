import Mathlib

/-!
Source-fidelity gates for the archived HsH COSMOTOPOLOGY dialogue
(blob 9f42b96adfa1cb9b310ad8d89843b93ae0379922; flattened role labels).

The historical assistant associated nontrivial torus/Klein winding classes with
closed timelike curves without specifying a Lorentzian causal structure.
It also proposed ordinary conformal inversion of a microscopic ring into a
macroscopic spherical horizon. The following are conditional mathematical
checks, not an assertion that any particular SAT/H(s)H geometry is physical.

A strictly increasing real-valued global time along a future-directed path
precludes closure of that same path. For an origin-centered circle, conformal
inversion has a constant radial scale on the circle, hence maps it to a circle
in its original plane, not to a two-dimensional sphere.
-/

namespace HsHVerification.MeridianCosmotopologyFidelity

/-- A path with strictly increasing global time cannot close at its endpoint. -/
theorem future_time_excludes_closed_return {α : Type*}
    (time : α → ℝ) {start finish : α}
    (hfuture : time start < time finish)
    (hclosed : finish = start) : False := by
  rw [hclosed] at hfuture
  exact (lt_irrefl _) hfuture

/-- Any constant radial scaling maps an origin-centered circle to a circle. 
For ordinary inversion on the original radius-a circle, the scale is L²/a². -/
theorem fixed_radius_inversion_image_is_circle
    (x y a scale : ℝ) (hcircle : x^2 + y^2 = a^2) :
    (scale*x)^2 + (scale*y)^2 = (scale*a)^2 := by
  calc
    (scale*x)^2 + (scale*y)^2 = scale^2 * (x^2 + y^2) := by ring
    _ = scale^2 * a^2 := by rw [hcircle]
    _ = (scale*a)^2 := by ring

/-- The same scalar inversion preserves the original plane z=0. -/
theorem radial_scaling_preserves_zero_transverse_coordinate
    (scale z : ℝ) (hz : z = 0) : scale*z = 0 := by
  simp [hz]

#print axioms future_time_excludes_closed_return
#print axioms fixed_radius_inversion_image_is_circle
#print axioms radial_scaling_preserves_zero_transverse_coordinate

end HsHVerification.MeridianCosmotopologyFidelity
