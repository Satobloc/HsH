import Mathlib

/-!
# Conditional Euclidean curvature of a lifted spatial curve

This module formalizes a bounded, assistant-authored mathematical
reconstruction, not a Nathan-authored equation or a physical model.

Nathan Direct source anchors:
* Meridian Free Build, conversation 6ac45d1f-17b0-83ea-ad1f-fa524602378b:
  user messages 3c657387-b80b-4982-a61a-8e6d8568b8d1 (2026-10-09 01:50:55Z),
  5a929b5e-515e-4f77-a32a-e49feef42812 (2026-10-09 02:46:38Z), and
  1178f25c-9f92-4d1c-b43b-06482e6bf1b1 (2026-10-09 07:40:38Z).
  Raw Git blob: 7af1561b321f4d9364da5eb111df689efc652827.
* Meridian Minkowski Ring Analysis, conversation
  6ad7e9c0-e8a0-83e9-984e-94d020de3abf:
  user messages f658b2db-32f0-45cd-828b-140691cc9afb (2026-10-20 23:53:30Z),
  090f5160-1020-486d-9c42-df3d7dff2063 (2026-10-21 00:17:23Z), and
  c5525f53-b7cc-4444-8102-3bf6fdb1c892 (2026-10-21 13:55:40Z).
  Raw Git blob: 56a84cb85d5c386efa4ea11d322d11e95e2c7703.

Nathan Direct states that worldtube bending/curvature is equivalent to inertia
at the classical Minkowski limit by construction; separately, a 4D filament
and its 3D intersectional trace are distinguished. The later 4D-donut
acceleration statement is explicitly called a working hypothesis without
proof. The source notations w = c t (2026-10-09) and literal cw = t
(2026-10-21) are not reconciled here.

The specific Euclidean lift X(w) = (x(w), w), and its circular-helix
specialization below, are assistant-authored mathematical constructions.
They do NOT identify this 1D curve with the finite-core 4D worldtube W⁴,
do NOT prove the worldtube/inertia claim, and do NOT formalize the 4D
filament / 3D-slice relation. No physical premise or observation is encoded.

All variables are local to this artifact. In particular cosVal is used rather
than bare c, which remains reserved for the standard speed-of-light symbol.
-/

namespace HsHVerification.SableEuclideanHelixCurvature

abbrev Vec3 := ℝ × (ℝ × ℝ)
abbrev Vec4 := ℝ × (ℝ × (ℝ × ℝ))

def dot3 (u v : Vec3) : ℝ :=
  u.1 * v.1 + u.2.1 * v.2.1 + u.2.2 * v.2.2

def dot4 (u v : Vec4) : ℝ :=
  u.1 * v.1 + u.2.1 * v.2.1 +
    u.2.2.1 * v.2.2.1 + u.2.2.2 * v.2.2.2

def tangentLift (v : Vec3) : Vec4 :=
  (v.1, v.2.1, v.2.2, 1)

def accelerationLift (a : Vec3) : Vec4 :=
  (a.1, a.2.1, a.2.2, 0)

/-- The lifted tangent has squared Euclidean norm 1 + |v|². -/
theorem dot4_tangentLift (v : Vec3) :
    dot4 (tangentLift v) (tangentLift v) = 1 + dot3 v v := by
  simp [dot4, dot3, tangentLift]
  ring

/-- The lifted acceleration has the same squared norm as its spatial part. -/
theorem dot4_accelerationLift (a : Vec3) :
    dot4 (accelerationLift a) (accelerationLift a) = dot3 a a := by
  simp [dot4, dot3, accelerationLift]

/-- The lifted tangent-acceleration inner product is the spatial one. -/
theorem dot4_tangent_accelerationLift (v a : Vec3) :
    dot4 (tangentLift v) (accelerationLift a) = dot3 v a := by
  simp [dot4, dot3, tangentLift, accelerationLift]

/-- Euclidean curvature squared for a lifted tangent/acceleration pair. -/
noncomputable def liftedCurvatureSq (v a : Vec3) : ℝ :=
  let t := tangentLift v
  let acc := accelerationLift a
  (dot4 t t * dot4 acc acc - (dot4 t acc)^2) / (dot4 t t)^3

/-- The same curvature expression reduced to the three spatial components. -/
noncomputable def reducedCurvatureSq (v a : Vec3) : ℝ :=
  ((1 + dot3 v v) * dot3 a a - (dot3 v a)^2) / (1 + dot3 v v)^3

/--
For the Euclidean lift X(w) = (x(w), w), with spatial tangent v and
acceleration a, the four-dimensional Gram-determinant curvature formula
reduces to this three-dimensional expression.
-/
theorem lifted_curve_curvature_sq (v a : Vec3) :
    liftedCurvatureSq v a = reducedCurvatureSq v a := by
  simp [liftedCurvatureSq, reducedCurvatureSq,
    dot4_tangentLift, dot4_accelerationLift,
    dot4_tangent_accelerationLift]

def circularHelixVelocity (R ω sinVal cosVal : ℝ) : Vec3 :=
  (-R * ω * sinVal, R * ω * cosVal, 0)

def circularHelixAcceleration (R ω sinVal cosVal : ℝ) : Vec3 :=
  (-R * ω^2 * cosVal, -R * ω^2 * sinVal, 0)

/--
Conditional curvature of a circular-helix lift, assuming only that the
transverse sine/cosine pair is unit-normalized.
-/
theorem circular_helix_curvature_sq_of_unit_pair
    (R ω sinVal cosVal : ℝ)
    (hunit : sinVal^2 + cosVal^2 = 1) :
    liftedCurvatureSq
      (circularHelixVelocity R ω sinVal cosVal)
      (circularHelixAcceleration R ω sinVal cosVal)
      = R^2 * ω^4 / (1 + R^2 * ω^2)^2 := by
  rw [lifted_curve_curvature_sq]
  unfold reducedCurvatureSq
  have hunit' : cosVal^2 + sinVal^2 = 1 := by nlinarith [hunit]
  have hv :
      dot3 (circularHelixVelocity R ω sinVal cosVal)
        (circularHelixVelocity R ω sinVal cosVal)
        = R^2 * ω^2 * (sinVal^2 + cosVal^2) := by
    simp [dot3, circularHelixVelocity]
    ring
  have ha :
      dot3 (circularHelixAcceleration R ω sinVal cosVal)
        (circularHelixAcceleration R ω sinVal cosVal)
        = R^2 * ω^4 * (cosVal^2 + sinVal^2) := by
    simp [dot3, circularHelixAcceleration]
    ring
  have hcross :
      dot3 (circularHelixVelocity R ω sinVal cosVal)
        (circularHelixAcceleration R ω sinVal cosVal) = 0 := by
    simp [dot3, circularHelixVelocity, circularHelixAcceleration]
    ring
  rw [hv, ha, hcross, hunit, hunit']
  have hden : 1 + R^2 * ω^2 ≠ 0 := by positivity
  field_simp [hden]
  ring

/-- Trigonometric specialization of the unit-pair result. -/
theorem circular_helix_curvature_sq
    (R ω θ : ℝ) :
    liftedCurvatureSq
      (circularHelixVelocity R ω (Real.sin θ) (Real.cos θ))
      (circularHelixAcceleration R ω (Real.sin θ) (Real.cos θ))
      = R^2 * ω^4 / (1 + R^2 * ω^2)^2 := by
  apply circular_helix_curvature_sq_of_unit_pair
  exact Real.sin_sq_add_cos_sq θ

#print axioms lifted_curve_curvature_sq
#print axioms circular_helix_curvature_sq_of_unit_pair
#print axioms circular_helix_curvature_sq

end HsHVerification.SableEuclideanHelixCurvature
