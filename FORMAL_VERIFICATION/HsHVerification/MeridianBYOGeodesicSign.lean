import Mathlib

/-!
# Meridian: source-bound correction to the BYO Lagrangian sphere-geodesic test

Historical source:
Satobloc/SAT_THEORY_ARCHIVE_2023-25,
`EARLY 2026/SAT EARLY 2026 — BYO LAGRANGIAN.txt`,
blob `47ee684888525d9d71a6dd701041685681f3dc49`
(first extant Git commit 2026-09-04T20:33:20Z).

The source prints the test equation

  X'' + (X'' · X) X / R^2 = 0.

For a nondegenerate great-circle 2-jet at t = 0,

  X  = (R, 0, 0, 0)
  X' = (0, R*ω, 0, 0)
  X''= (-R*ω^2, 0, 0, 0),

the displayed residual is (-2*R*ω^2, 0, 0, 0), not zero.
The affine-parameter sphere-geodesic equation instead uses the speed term:

  X'' + (X' · X') X / R^2 = 0.

This module proves the pointwise algebraic counterexample and the corrected
residual for this circle 2-jet. It does not prove the full geodesic equation
for arbitrary curves, validate the UI, establish that this assistant-voiced
design document is Nathan Direct, or establish any physical premise.
-/

namespace HsHVerification.MeridianBYOGeodesicSign

structure Vec4 where
  x1 : ℝ
  x2 : ℝ
  x3 : ℝ
  x4 : ℝ
deriving DecidableEq

def add4 (u v : Vec4) : Vec4 :=
  ⟨u.x1 + v.x1, u.x2 + v.x2, u.x3 + v.x3, u.x4 + v.x4⟩

def smul4 (c : ℝ) (v : Vec4) : Vec4 :=
  ⟨c * v.x1, c * v.x2, c * v.x3, c * v.x4⟩

def dot4 (u v : Vec4) : ℝ :=
  u.x1 * v.x1 + u.x2 * v.x2 + u.x3 * v.x3 + u.x4 * v.x4

def zero4 : Vec4 := ⟨0, 0, 0, 0⟩

/-- Position, velocity and acceleration at t = 0 for a radius-R circle
    in the (x1,x2)-plane with angular frequency ω. -/
def circlePosition (R : ℝ) : Vec4 := ⟨R, 0, 0, 0⟩

def circleVelocity (R ω : ℝ) : Vec4 := ⟨0, R * ω, 0, 0⟩

def circleAcceleration (R ω : ℝ) : Vec4 := ⟨-R * ω ^ 2, 0, 0, 0⟩

/-- Residual of the equation printed in the historical BYO Lagrangian file:
    X'' + (X'' · X) X / R^2. -/
def publishedResidual (R ω : ℝ) : Vec4 :=
  add4 (circleAcceleration R ω)
    (smul4
      (dot4 (circleAcceleration R ω) (circlePosition R) / R ^ 2)
      (circlePosition R))

/-- Residual of the affine-parameter sphere-geodesic equation:
    X'' + (X' · X') X / R^2. -/
def correctedResidual (R ω : ℝ) : Vec4 :=
  add4 (circleAcceleration R ω)
    (smul4
      (dot4 (circleVelocity R ω) (circleVelocity R ω) / R ^ 2)
      (circlePosition R))

theorem circle_position_norm_sq (R : ℝ) :
    dot4 (circlePosition R) (circlePosition R) = R ^ 2 := by
  simp [dot4, circlePosition]
  ring

theorem circle_speed_sq (R ω : ℝ) :
    dot4 (circleVelocity R ω) (circleVelocity R ω) = R ^ 2 * ω ^ 2 := by
  simp [dot4, circleVelocity]
  ring

theorem circle_acceleration_dot_position (R ω : ℝ) :
    dot4 (circleAcceleration R ω) (circlePosition R) =
      -R ^ 2 * ω ^ 2 := by
  simp [dot4, circleAcceleration, circlePosition]
  ring

theorem published_residual_first_coordinate
    (R ω : ℝ) (hR : R ≠ 0) :
    (publishedResidual R ω).x1 = -2 * R * ω ^ 2 := by
  simp [publishedResidual, add4, smul4, dot4,
    circlePosition, circleAcceleration]
  field_simp [hR]
  ring

theorem corrected_residual_eq_zero
    (R ω : ℝ) (hR : R ≠ 0) :
    correctedResidual R ω = zero4 := by
  ext <;> simp [zero4, correctedResidual, add4, smul4, dot4,
    circlePosition, circleVelocity, circleAcceleration] <;>
    field_simp [hR] <;> ring

theorem published_residual_ne_zero
    (R ω : ℝ) (hR : R ≠ 0) (hω : ω ≠ 0) :
    publishedResidual R ω ≠ zero4 := by
  intro h
  have hfirst : (publishedResidual R ω).x1 = 0 := by
    simpa [zero4] using congrArg Vec4.x1 h
  rw [published_residual_first_coordinate R ω hR] at hfirst
  have hne : (-2 : ℝ) * R * ω ^ 2 ≠ 0 := by
    exact mul_ne_zero (mul_ne_zero (by norm_num) hR) (pow_ne_zero 2 hω)
  exact hne hfirst

#print axioms circle_position_norm_sq
#print axioms circle_speed_sq
#print axioms circle_acceleration_dot_position
#print axioms published_residual_first_coordinate
#print axioms corrected_residual_eq_zero
#print axioms published_residual_ne_zero

end HsHVerification.MeridianBYOGeodesicSign
