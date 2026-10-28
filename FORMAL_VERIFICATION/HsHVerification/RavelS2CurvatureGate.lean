import HsHVerification.RavelS2GramGeometry
import Mathlib

/-!
# Ravel S2: apsis curvature and reflection non-identifiability

At a Keplerian apsis, spatial v dot a = 0. For the assumed
flat Euclidean marked lift X_alpha(t)=(x(t),alpha*c*t), the squared
extrinsic curvature is Gram(V,A)/|V|^6. This is a mathematical
definition of curve curvature, NOT a Kerr/GR or H(s)H prediction.
The sign of alpha is invisible to spatial projection and Gram
curvature: two coordinate embeddings can be related by reflection.
Source anchor: GRAVITY Collaboration 2020, Table E.1, S2 fitted orbit.
-/

namespace HsHVerification.RavelS2CurvatureGate

open HsHVerification.RavelS2GramGeometry

noncomputable def curvatureSq (v a : Spatial) (alpha c : ℝ) : ℝ :=
  markedGram v a alpha c / (markedSpeedSq v alpha c)^3

theorem gram_at_apsis (v a : Spatial) (alpha c : ℝ)
    (horth : dot3 v a = 0) :
    markedGram v a alpha c =
      (dot3 v v + (alpha*c)^2) * dot3 a a := by
  rw [gram_factorization, horth]
  ring

theorem curvature_sq_at_apsis (v a : Spatial) (alpha c : ℝ)
    (horth : dot3 v a = 0)
    (hspeed : dot3 v v + (alpha*c)^2 ≠ 0) :
    curvatureSq v a alpha c =
      dot3 a a / (dot3 v v + (alpha*c)^2)^2 := by
  unfold curvatureSq
  rw [gram_at_apsis v a alpha c horth, velocity_norm]
  field_simp
  ring

theorem speed_reflection (v : Spatial) (alpha c : ℝ) :
    markedSpeedSq v (-alpha) c = markedSpeedSq v alpha c := by
  rw [velocity_norm, velocity_norm]
  ring

theorem gram_reflection (v a : Spatial) (alpha c : ℝ) :
    markedGram v a (-alpha) c = markedGram v a alpha c := by
  rw [gram_factorization, gram_factorization]
  ring

theorem curvature_sq_reflection (v a : Spatial) (alpha c : ℝ) :
    curvatureSq v a (-alpha) c = curvatureSq v a alpha c := by
  unfold curvatureSq
  rw [gram_reflection, speed_reflection]

theorem projection_reflection (x : Spatial) (s alpha : ℝ) :
    projectSpatial (liftPosition x s alpha) =
      projectSpatial (liftPosition x s (-alpha)) := by
  rw [projection_lift, projection_lift]

theorem reflection_distinct_as_coordinates (x : Spatial) (s alpha : ℝ)
    (hs : s ≠ 0) (ha : alpha ≠ 0) :
    liftPosition x s alpha ≠ liftPosition x s (-alpha) := by
  intro heq
  have hfourth : alpha * s = (-alpha) * s :=
    congrArg (fun p : Marked => p.2.2.2) heq
  have hzero : alpha * s = 0 := by
    nlinarith [hfourth]
  exact (mul_ne_zero ha hs) hzero

#print axioms gram_at_apsis
#print axioms curvature_sq_at_apsis
#print axioms speed_reflection
#print axioms gram_reflection
#print axioms curvature_sq_reflection
#print axioms projection_reflection
#print axioms reflection_distinct_as_coordinates

end HsHVerification.RavelS2CurvatureGate
