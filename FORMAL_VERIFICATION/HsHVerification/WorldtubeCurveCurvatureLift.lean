import Mathlib

namespace HsHVerification.WorldtubeCurveCurvatureLift

/--
A coordinate dot product on the three spatial coordinates and on the
four-coordinate Euclidean lift. The finite sums make the support and
metric assumptions explicit.
-/
def dot3 (v a : Fin 3 → ℝ) : ℝ :=
  ∑ i : Fin 3, v i * a i

def dot4 (v a : Fin 4 → ℝ) : ℝ :=
  ∑ i : Fin 4, v i * a i

/--
For the affine Euclidean lift X(w) = (x(w), w), with w used as the
curve parameter, the lifted velocity and acceleration have the forms
(v, 1) and (a, 0). This is a conditional coordinate construction.
-/
def liftVelocity (v : Fin 3 → ℝ) : Fin 4 → ℝ :=
  Fin.cases 1 v

def liftAcceleration (a : Fin 3 → ℝ) : Fin 4 → ℝ :=
  Fin.cases 0 a

/--
The Gram-determinant expression for squared Euclidean curve curvature:
(|V|^2 |A|^2 - (V dot A)^2) / |V|^6.
This definition is meaningful as a curvature expression when V is
nonzero. The theorem below is only the algebraic reduction for the
specified affine lift.
-/
noncomputable def gramCurvatureSq (v a : Fin 4 → ℝ) : ℝ :=
  (dot4 v v * dot4 a a - (dot4 v a) ^ 2) / (dot4 v v) ^ 3

noncomputable def liftedGramCurvatureSq (v a : Fin 3 → ℝ) : ℝ :=
  gramCurvatureSq (liftVelocity v) (liftAcceleration a)

theorem dot4_liftVelocity_self (v : Fin 3 → ℝ) :
    dot4 (liftVelocity v) (liftVelocity v) = 1 + dot3 v v := by
  simp [dot4, dot3, liftVelocity, Fin.sum_univ_succ]

theorem dot4_liftAcceleration_self (a : Fin 3 → ℝ) :
    dot4 (liftAcceleration a) (liftAcceleration a) = dot3 a a := by
  simp [dot4, dot3, liftAcceleration, Fin.sum_univ_succ]

theorem dot4_liftVelocity_acceleration
    (v a : Fin 3 → ℝ) :
    dot4 (liftVelocity v) (liftAcceleration a) = dot3 v a := by
  simp [dot4, dot3, liftVelocity, liftAcceleration, Fin.sum_univ_succ]

/--
Conditional Euclidean-lift identity recovered from the historical
assistant derivation. It proves the Gram-curvature algebra for the
explicit lift X(w) = (x(w), w). It does not prove that the physical
H(s)H worldtube uses this lift, that w has unit parameter speed, or
that this Euclidean curvature is the physical curvature/inertia law.
-/
theorem lifted_gram_curvature_sq_eq
    (v a : Fin 3 → ℝ) :
    liftedGramCurvatureSq v a =
      ((1 + dot3 v v) * dot3 a a - (dot3 v a) ^ 2) /
        (1 + dot3 v v) ^ 3 := by
  unfold liftedGramCurvatureSq gramCurvatureSq
  rw [dot4_liftVelocity_self, dot4_liftAcceleration_self,
    dot4_liftVelocity_acceleration]

#print axioms lifted_gram_curvature_sq_eq

end HsHVerification.WorldtubeCurveCurvatureLift
