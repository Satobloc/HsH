import Mathlib

namespace HsHVerification
namespace HaleAnalemmaRollCompatibility

/-- Dimensionless major-to-minor torus radius ratio, r = R / b. -/
def axialSpinPerOrbit (r : ℝ) : ℝ := r

/-- Analemma material windings per torus orbit, with ell = L_A / b.
    This is the inner torus circumference divided by the Analemma length. -/
def materialWindingPerOrbit (r ell : ℝ) : ℝ :=
  (2 * Real.pi * (r - 1)) / ell

/-- If physical axial spin and Analemma material winding are identified,
    their equality fixes the required dimensionless Analemma length. -/
theorem equal_phase_iff_length (r ell : ℝ)
    (hr : r ≠ 0) (hell : ell ≠ 0) :
    materialWindingPerOrbit r ell = axialSpinPerOrbit r ↔
      ell = 2 * Real.pi * (r - 1) / r := by
  unfold materialWindingPerOrbit axialSpinPerOrbit
  constructor
  · intro h
    have hmul : 2 * Real.pi * (r - 1) = ell * r :=
      (div_eq_iff hell).mp h
    calc
      ell = (ell * r) / r := by field_simp [hr]
      _ = (2 * Real.pi * (r - 1)) / r := by rw [hmul]
  · intro h
    have hnum : 2 * Real.pi * (r - 1) ≠ 0 := by
      intro hz
      apply hell
      rw [h, hz]
      simp
    rw [h]
    field_simp [hr, hnum]
    ring

/-- Under a two-circuit material winding, literal equality with physical
    axial spin forces the major/minor radius ratio to be exactly two. -/
theorem two_circuit_equality_forces_ratio_two (r ell : ℝ)
    (hEq : materialWindingPerOrbit r ell = axialSpinPerOrbit r)
    (hTwo : materialWindingPerOrbit r ell = 2) :
    r = 2 := by
  have hEq' : materialWindingPerOrbit r ell = r := by
    simpa [axialSpinPerOrbit] using hEq
  linarith

/-- The same two-circuit equality condition fixes the normalized Analemma
    length to pi minor-radii. This is conditional on the stated phase identity. -/
theorem two_circuit_equality_forces_length_pi (r ell : ℝ)
    (hr : r ≠ 0) (hell : ell ≠ 0)
    (hEq : materialWindingPerOrbit r ell = axialSpinPerOrbit r)
    (hTwo : materialWindingPerOrbit r ell = 2) :
    ell = Real.pi := by
  have hr2 : r = 2 :=
    two_circuit_equality_forces_ratio_two r ell hEq hTwo
  have hlen := (equal_phase_iff_length r ell hr hell).mp hEq
  rw [hr2] at hlen
  norm_num at hlen
  exact hlen

/-- Spherical Analemma candidate used by the current Whirligig browser:
    beta(t) = k sin(t) cos(t)^2 and azimuth phi(t) = 2t. -/
def analemmaPoint (k t : ℝ) : ℝ × ℝ × ℝ :=
  let beta := k * Real.sin t * (Real.cos t) ^ 2
  (Real.cos beta * Real.cos (2 * t),
   Real.cos beta * Real.sin (2 * t),
   Real.sin beta)

/-- The equatorial crossing point is revisited at parameters 0 and pi. -/
theorem eastRepeatedPoint (k : ℝ) :
    analemmaPoint k 0 = analemmaPoint k Real.pi := by
  simp [analemmaPoint]

/-- The opposite equatorial point is revisited at pi/2 and -pi/2
    (the latter is the same parameter modulo one full 2pi period as 3pi/2). -/
theorem westRepeatedPoint (k : ℝ) :
    analemmaPoint k (Real.pi / 2) = analemmaPoint k (-Real.pi / 2) := by
  simp [analemmaPoint]

/-- The two repeated equatorial points are antipodal. -/
theorem eastWestAntipodal (k : ℝ) :
    analemmaPoint k (Real.pi / 2) = -analemmaPoint k 0 := by
  simp [analemmaPoint]

end HaleAnalemmaRollCompatibility
end HsHVerification
