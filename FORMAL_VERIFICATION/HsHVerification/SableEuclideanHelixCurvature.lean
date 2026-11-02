import Mathlib

/-!
# Conditional Euclidean curvature of a lifted spatial curve

This module formalizes an assistant-authored reconstruction from the
2026-10-21 Meridian Minkowski Ring Analysis conversation:
  X(w) = (R cos (ω w), R sin (ω w), 0, w).

The proof is deliberately conditional. It treats the fourth coordinate as
the parameter w and takes the spatial tangent v = x'(w) and acceleration
a = x''(w) as inputs. It proves the Euclidean Gram-determinant curvature
identity for the lifted curve (x(w), w).

It does NOT identify this 1D curve with Nathan's later-described finite-core
4D worldtube W⁴, does not prove a worldtube/inertia law, and does not reconcile
the distinct source notations w = c t (2026-10-09) and literal cw = t
(2026-10-21). The native metric assumption here is Euclidean R⁴ only for this
assistant reconstruction. No physical premise is formalized.
-/

namespace HsHVerification.SableEuclideanHelixCurvature

abbrev Vec3 := ℝ × ℝ × ℝ
abbrev Vec4 := ℝ × ℝ × ℝ × ℝ

def dot3 (u v : Vec3) : ℝ :=
  u.1 * v.1 + u.2.1 * v.2.1 + u.2.2 * v.2.2

def dot4 (u v : Vec4) : ℝ :=
  u.1 * v.1 + u.2.1 * v.2.1 + u.2.2 * v.2.2 + u.2.2.2 * v.2.2.2

def tangentLift (v : Vec3) : Vec4 :=
  (v.1, v.2.1, v.2.2, 1)

def accelerationLift (a : Vec3) : Vec4 :=
  (a.1, a.2.1, a.2.2, 0)

/-- Euclidean curvature squared for a lifted tangent/acceleration pair. -/
def liftedCurvatureSq (v a : Vec3) : ℝ :=
  let t := tangentLift v
  let acc := accelerationLift a
  (dot4 t t * dot4 acc acc - (dot4 t acc)^2) / (dot4 t t)^3

/-- The same curvature expression reduced to the three spatial components. -/
def reducedCurvatureSq (v a : Vec3) : ℝ :=
  ((1 + dot3 v v) * dot3 a a - (dot3 v a)^2) / (1 + dot3 v v)^3

/--
For the Euclidean lift X(w) = (x(w), w), with spatial tangent v and
acceleration a, the four-dimensional Gram-determinant curvature formula
reduces to this three-dimensional expression.
-/
theorem lifted_curve_curvature_sq (v a : Vec3) :
    liftedCurvatureSq v a = reducedCurvatureSq v a := by
  simp [liftedCurvatureSq, reducedCurvatureSq, tangentLift, accelerationLift, dot3, dot4]
  ring

def circularHelixVelocity (R ω s c : ℝ) : Vec3 :=
  (-R * ω * s, R * ω * c, 0)

def circularHelixAcceleration (R ω s c : ℝ) : Vec3 :=
  (-R * ω^2 * c, -R * ω^2 * s, 0)

/--
Conditional curvature of a circular helix lift, assuming only that the
transverse sine/cosine pair is unit-normalized.
-/
theorem circular_helix_curvature_sq_of_unit_pair
    (R ω s c : ℝ) (hunit : s^2 + c^2 = 1) :
    liftedCurvatureSq
      (circularHelixVelocity R ω s c)
      (circularHelixAcceleration R ω s c)
      = R^2 * ω^4 / (1 + R^2 * ω^2)^2 := by
  rw [lifted_curve_curvature_sq]
  have hunit' : c^2 + s^2 = 1 := by nlinarith [hunit]
  simp [reducedCurvatureSq, dot3, circularHelixVelocity,
    circularHelixAcceleration, hunit, hunit']
  ring

/-- Trigonometric specialization of the unit-pair result. -/
theorem circular_helix_curvature_sq
    (R ω θ : ℝ) :
    liftedCurvatureSq
      (circularHelixVelocity R ω (Real.sin θ) (Real.cos θ))
      (circularHelixAcceleration R ω (Real.sin θ) (Real.cos θ))
      = R^2 * ω^4 / (1 + R^2 * ω^2)^2 := by
  apply circular_helix_curvature_sq_of_unit_pair
  simpa using Real.sin_sq_add_cos_sq θ

#print axioms lifted_curve_curvature_sq
#print axioms circular_helix_curvature_sq_of_unit_pair
#print axioms circular_helix_curvature_sq

end HsHVerification.SableEuclideanHelixCurvature
