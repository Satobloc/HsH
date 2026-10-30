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
precludes closure of that same path. For an origin-centered circle, the
standard Euclidean point-inversion map preserves the circle's plane and sends
it to an origin-centered circle with reciprocal radius scale. It does not
turn one 1D ring into a 2D sphere.

The separate Cruller sandbox (blob b85f37e4137c15ff8b44d8179fc162e37afa86b3)
proposes the mapping-torus identification (n,L) ~ (Q n,0). The deck-step
convention is checked below; it is not a proof of a physical CTC.
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

/-- Standard Euclidean point inversion with length scale L.
The physical domain excludes the origin (r² = 0). -/
noncomputable def euclideanPointInversion (L x y z : ℝ) : ℝ × ℝ × ℝ :=
  let r2 := x^2 + y^2 + z^2
  (L^2 * x / r2, L^2 * y / r2, L^2 * z / r2)

/-- Point inversion preserves the plane z=0. -/
theorem euclidean_inversion_preserves_zero_plane
    (L x y z : ℝ) (hz : z = 0) :
    (euclideanPointInversion L x y z).2.2 = 0 := by
  simp [euclideanPointInversion, hz]

/-- An origin-centered circle of radius a>0 in z=0 maps into the
origin-centered circle of radius L²/a in that same plane.
This is the actual point-inversion formula, not merely an assumed
constant-scaling surrogate. The theorem proves locus membership, not
a global spacetime or horizon correspondence. -/
theorem euclidean_inversion_circle_image
    (L a x y : ℝ) (ha : a ≠ 0)
    (hcircle : x^2 + y^2 = a^2) :
    (euclideanPointInversion L x y 0).1 ^ 2
      + (euclideanPointInversion L x y 0).2.1 ^ 2
      = (L^2 / a)^2 := by
  simp [euclideanPointInversion]
  have hden : x^2 + y^2 ≠ 0 := by
    rw [hcircle]
    exact pow_ne_zero 2 ha
  field_simp [hden, ha]
  linear_combination (L^4) * hcircle

/-- For the quotient convention (n,L) ~ (Q n,0), the lifted deck step is
(x,m) ↦ (Q x,m-1). Thus the one-period lift representing the same quotient
point as (n,0) is (Q⁻¹ n,1), not (Q n,1). This is only the algebraic
gluing convention; no causal path is asserted. -/
def mappingTorusDeckStep {α : Type*} (Q : α ≃ α) (p : α × ℤ) : α × ℤ :=
  (Q p.1, p.2 - 1)

theorem mappingTorus_inverse_gluing_endpoint {α : Type*}
    (Q : α ≃ α) (n : α) :
    mappingTorusDeckStep Q (Q.symm n, 1) = (n, 0) := by
  simp [mappingTorusDeckStep]

#print axioms future_time_excludes_closed_return
#print axioms fixed_radius_inversion_image_is_circle
#print axioms radial_scaling_preserves_zero_transverse_coordinate
#print axioms euclidean_inversion_preserves_zero_plane
#print axioms euclidean_inversion_circle_image
#print axioms mappingTorus_inverse_gluing_endpoint

end HsHVerification.MeridianCosmotopologyFidelity
