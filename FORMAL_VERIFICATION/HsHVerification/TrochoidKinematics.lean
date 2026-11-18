import Mathlib

namespace HsHVerification.TrochoidKinematics

/-!
Conditional coordinate geometry for a point on a cylinder whose translation is
perpendicular to its rotation axis. The horizontal path is a trochoid, not a
helix. These lemmas establish only the algebra of the stated parameterization;
they do not identify any physical vortex, worldtube, or H(s)H map.
-/

/-- Horizontal velocity of a material point in the planar trochoid model. -/
def velocity (U r omega theta : ℝ) : ℝ × ℝ :=
  (U - r * omega * Real.sin theta, r * omega * Real.cos theta)

/-- Horizontal acceleration for the same coordinate parameterization. -/
def acceleration (r omega theta : ℝ) : ℝ × ℝ :=
  (-r * omega ^ 2 * Real.cos theta, -r * omega ^ 2 * Real.sin theta)

/-- Squared Euclidean speed of the parameterized point. -/
def speedSquared (U r omega theta : ℝ) : ℝ :=
  (velocity U r omega theta).1 ^ 2 +
    (velocity U r omega theta).2 ^ 2

/-- Signed planar cross product of velocity and acceleration. -/
def signedCross (U r omega theta : ℝ) : ℝ :=
  (velocity U r omega theta).1 * (acceleration r omega theta).2 -
    (velocity U r omega theta).2 * (acceleration r omega theta).1

/-- The phase-dependent speed identity for the planar trochoid. -/
theorem speedSquared_formula (U r omega theta : ℝ) :
    speedSquared U r omega theta =
      U ^ 2 + (r * omega) ^ 2 -
        2 * U * r * omega * Real.sin theta := by
  unfold speedSquared velocity
  calc
    (U - r * omega * Real.sin theta) ^ 2 +
        (r * omega * Real.cos theta) ^ 2 =
      U ^ 2 - 2 * U * r * omega * Real.sin theta +
        (r * omega) ^ 2 *
          (Real.sin theta ^ 2 + Real.cos theta ^ 2) := by ring
    _ = U ^ 2 + (r * omega) ^ 2 -
        2 * U * r * omega * Real.sin theta := by
      rw [Real.sin_sq_add_cos_sq]
      ring

/-- The signed curvature numerator identity for the trochoid coordinates. -/
theorem signedCross_formula (U r omega theta : ℝ) :
    signedCross U r omega theta =
      r * omega ^ 2 * (r * omega - U * Real.sin theta) := by
  unfold signedCross velocity acceleration
  calc
    (U - r * omega * Real.sin theta) *
        (-r * omega ^ 2 * Real.sin theta) -
      (r * omega * Real.cos theta) *
        (-r * omega ^ 2 * Real.cos theta) =
      -U * r * omega ^ 2 * Real.sin theta +
        (r * omega) ^ 2 * omega *
          (Real.sin theta ^ 2 + Real.cos theta ^ 2) := by ring
    _ = r * omega ^ 2 *
        (r * omega - U * Real.sin theta) := by
      rw [Real.sin_sq_add_cos_sq]
      ring

/-- At the cycloid-cusp phase, equal surge and rim speeds make the coordinate
velocity vanish. The premise is exact and conditional. -/
theorem velocity_zero_at_cycloid_cusp
    (U r omega theta : ℝ)
    (hU : U = r * omega)
    (hsin : Real.sin theta = 1) :
    velocity U r omega theta = (0, 0) := by
  have hcos : Real.cos theta = 0 := by
    nlinarith [Real.sin_sq_add_cos_sq theta, hsin]
  simp [velocity, hU, hsin, hcos]

/-- The squared-speed formula degenerates to zero at the exact cycloid cusp. -/
theorem speedSquared_zero_at_cycloid_cusp
    (U r omega theta : ℝ)
    (hU : U = r * omega)
    (hsin : Real.sin theta = 1) :
    speedSquared U r omega theta = 0 := by
  rw [speedSquared_formula, hU, hsin]
  ring

/-- The signed cross-product numerator also vanishes at the cusp phase. -/
theorem signedCross_zero_at_cycloid_cusp
    (U r omega theta : ℝ)
    (hU : U = r * omega)
    (hsin : Real.sin theta = 1) :
    signedCross U r omega theta = 0 := by
  rw [signedCross_formula, hU, hsin]
  ring

#print axioms speedSquared_formula
#print axioms signedCross_formula
#print axioms velocity_zero_at_cycloid_cusp
#print axioms speedSquared_zero_at_cycloid_cusp
#print axioms signedCross_zero_at_cycloid_cusp

end HsHVerification.TrochoidKinematics
