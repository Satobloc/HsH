import Mathlib

/-!
# Ravel S2: typed Euclidean marked-curve Gram geometry

Physical source: GRAVITY Collaboration (2020), A&A 636 L5,
DOI 10.1051/0004-6361/202037813, Table E.1.
Measured-fit S2 orbital elements anchor the separate numerical replay.
This file proves conditional mathematics for an ASSUMED flat Euclidean R4
marked lift X_alpha(t)=(x(t), alpha*c*t). It does not establish the physical
status of a fourth coordinate, a worldtube, or a gravity theory.
The spatial 3-vector and marked 4-vector below are explicit products of Reals.
-/

namespace HsHVerification.RavelS2GramGeometry

abbrev Spatial := ℝ × ℝ × ℝ
abbrev Marked := ℝ × ℝ × ℝ × ℝ

def dot3 (v a : Spatial) : ℝ :=
  v.1 * a.1 + v.2.1 * a.2.1 + v.2.2 * a.2.2

def dot4 (v a : Marked) : ℝ :=
  v.1 * a.1 + v.2.1 * a.2.1 + v.2.2.1 * a.2.2.1 +
    v.2.2.2 * a.2.2.2

def liftPosition (x : Spatial) (s alpha : ℝ) : Marked :=
  (x.1, x.2.1, x.2.2, alpha * s)

def projectSpatial (x : Marked) : Spatial :=
  (x.1, x.2.1, x.2.2.1)

def liftVelocity (v : Spatial) (alpha c : ℝ) : Marked :=
  (v.1, v.2.1, v.2.2, alpha * c)

def liftAcceleration (a : Spatial) : Marked :=
  (a.1, a.2.1, a.2.2, 0)

def markedSpeedSq (v : Spatial) (alpha c : ℝ) : ℝ :=
  dot4 (liftVelocity v alpha c) (liftVelocity v alpha c)

def markedGram (v a : Spatial) (alpha c : ℝ) : ℝ :=
  markedSpeedSq v alpha c * dot4 (liftAcceleration a) (liftAcceleration a) -
    (dot4 (liftVelocity v alpha c) (liftAcceleration a)) ^ 2

theorem projection_lift (x : Spatial) (s alpha : ℝ) :
    projectSpatial (liftPosition x s alpha) = x := by
  cases x with
  | mk x yz =>
    cases yz with
    | mk y z => rfl

theorem velocity_norm (v : Spatial) (alpha c : ℝ) :
    markedSpeedSq v alpha c = dot3 v v + (alpha * c)^2 := by
  simp only [markedSpeedSq, dot4, liftVelocity, dot3]
  ring

theorem acceleration_norm (a : Spatial) :
    dot4 (liftAcceleration a) (liftAcceleration a) = dot3 a a := by
  simp only [dot4, liftAcceleration, dot3, mul_zero, add_zero]

theorem velocity_acceleration_dot (v a : Spatial) (alpha c : ℝ) :
    dot4 (liftVelocity v alpha c) (liftAcceleration a) = dot3 v a := by
  simp only [dot4, liftVelocity, liftAcceleration, dot3, mul_zero, add_zero]

theorem gram_factorization (v a : Spatial) (alpha c : ℝ) :
    markedGram v a alpha c =
      (dot3 v v + (alpha*c)^2) * dot3 a a - (dot3 v a)^2 := by
  unfold markedGram
  rw [velocity_norm, acceleration_norm, velocity_acceleration_dot]

#print axioms projection_lift
#print axioms velocity_norm
#print axioms acceleration_norm
#print axioms velocity_acceleration_dot
#print axioms gram_factorization

end HsHVerification.RavelS2GramGeometry
