import Mathlib
import HsHVerification.CalderProjectorSignature

/-!
# Enheduanna: regular-level-set normal to Householder readout projector

## Epistemic and source boundary

This is a conditional, pointwise coordinate theorem. It reuses
CalderPreferredDirectionMetric.preferredDirectionMetric from the
Calder projector-signature proposal. That metric is explicitly an
assistant-derived candidate, not a recovered Nathan Direct equation
or an adopted physical law.

The vector dT below is the coordinate representative of a covector
at one point in a positive-definite Euclidean four-frame. The Euclidean
metric identifies it with its gradient. The theorem assumes dT != 0
at that point, normalizes it, and proves that the candidate Lorentzian
plus-sign projector agrees with the Euclidean orthogonal projector onto
ker dT.

This does NOT construct a global time function, foliation, physical
normal field, worldtube, timesheet, contact surface, or instrument map.
It does not establish that the candidate metric is physically correct,
that u = normalized(grad T) is Nathan Direct, or that any observable
differs from standard physics. It is not an empirical calculation.

The historical Blockwave Lorentzian projector and the candidate
Euclidean-to-Lorentzian sign-flip metric remain separate source strata.
-/

namespace HsHVerification.EnheduannaTimeNormalHouseholderBridge

open HsHVerification.CalderPreferredDirectionMetric

abbrev Four := Fin 4 → ℝ

/-- Euclidean squared norm of the coordinate covector representing dT. -/
def levelCovectorNormSq (dT : Four) : ℝ :=
  euclideanDot4 dT dT

/-- Pointwise Euclidean-unit normal obtained from a nonzero coordinate dT. -/
def normalizedLevelNormal (dT : Four) : Four :=
  fun i => (Real.sqrt (levelCovectorNormSq dT))⁻¹ * dT i

/-- Euclidean orthogonal projector onto the kernel of the level covector. -/
def euclideanLevelProjector (dT v : Four) : Four :=
  fun i =>
    v i -
      euclideanDot4 (normalizedLevelNormal dT) v *
        normalizedLevelNormal dT i

/-- Candidate Lorentzian I + u tensor u-flat projector using the Householder readout metric. -/
def householderLorentzianProjector (dT v : Four) : Four :=
  fun i =>
    v i +
      preferredDirectionMetric
        (normalizedLevelNormal dT) (normalizedLevelNormal dT) v *
        normalizedLevelNormal dT i

/-- Euclidean dot product is linear in its first scalar-multiplied argument. -/
lemma euclideanDot4_smul_left (a : ℝ) (x y : Four) :
    euclideanDot4 (fun i => a * x i) y = a * euclideanDot4 x y := by
  unfold euclideanDot4
  calc
    (∑ i : Fin 4, (a * x i) * y i)
        = ∑ i : Fin 4, a * (x i * y i) := by
            apply Finset.sum_congr rfl
            intro i hi
            ring
    _ = a * ∑ i : Fin 4, x i * y i := by
          rw [← Finset.mul_sum]

/-- Euclidean dot product is linear in its second scalar-multiplied argument. -/
lemma euclideanDot4_smul_right (a : ℝ) (x y : Four) :
    euclideanDot4 x (fun i => a * y i) = a * euclideanDot4 x y := by
  unfold euclideanDot4
  calc
    (∑ i : Fin 4, x i * (a * y i))
        = ∑ i : Fin 4, a * (x i * y i) := by
            apply Finset.sum_congr rfl
            intro i hi
            ring
    _ = a * ∑ i : Fin 4, x i * y i := by
          rw [← Finset.mul_sum]

/-- Euclidean dot product distributes over subtraction in its second argument. -/
lemma euclideanDot4_sub_right (x y z : Four) :
    euclideanDot4 x (fun i => y i - z i) =
      euclideanDot4 x y - euclideanDot4 x z := by
  unfold euclideanDot4
  calc
    (∑ i : Fin 4, x i * (y i - z i))
        = ∑ i : Fin 4, (x i * y i - x i * z i) := by
            apply Finset.sum_congr rfl
            intro i hi
            ring
    _ = (∑ i : Fin 4, x i * y i) -
          (∑ i : Fin 4, x i * z i) := by
            rw [Finset.sum_sub_distrib]

/-- A nonzero coordinate covector has strictly positive Euclidean squared norm. -/
theorem levelCovectorNormSq_pos (dT : Four) (hdT : dT ≠ 0) :
    0 < levelCovectorNormSq dT := by
  unfold levelCovectorNormSq
  exact euclideanDot4_self_pos dT hdT

/-- The normalized level-set normal has unit Euclidean norm. -/
theorem normalizedLevelNormal_unit (dT : Four) (hdT : dT ≠ 0) :
    euclideanDot4 (normalizedLevelNormal dT)
      (normalizedLevelNormal dT) = 1 := by
  let q := levelCovectorNormSq dT
  have hq : 0 < q := by
    dsimp [q]
    exact levelCovectorNormSq_pos dT hdT
  let s := Real.sqrt q
  have hs : 0 < s := Real.sqrt_pos.2 hq
  have hs2 : s * s = q := by
    dsimp [s]
    nlinarith [Real.sq_sqrt (le_of_lt hq)]
  calc
    euclideanDot4 (normalizedLevelNormal dT)
        (normalizedLevelNormal dT)
        = s⁻¹ * (s⁻¹ * q) := by
            change euclideanDot4
              (fun i => s⁻¹ * dT i)
              (fun i => s⁻¹ * dT i) = _
            rw [euclideanDot4_smul_left, euclideanDot4_smul_right]
            rfl
    _ = 1 := by
          rw [← hs2]
          field_simp [ne_of_gt hs]

/-- A vector tangent to the regular level set is orthogonal to its normalized normal. -/
theorem normalizedLevelNormal_orthogonal_of_level_tangent
    (dT v : Four) (hdT : dT ≠ 0)
    (hT : euclideanDot4 dT v = 0) :
    euclideanDot4 (normalizedLevelNormal dT) v = 0 := by
  unfold normalizedLevelNormal
  rw [euclideanDot4_smul_left, hT]
  simp

/-- The Householder Lorentzian plus-sign projector equals the Euclidean
orthogonal projector whenever the candidate normal is Euclidean-unit. -/
theorem householder_projector_eq_euclidean
    (dT v : Four) (hdT : dT ≠ 0) :
    householderLorentzianProjector dT v =
      euclideanLevelProjector dT v := by
  have hn := normalizedLevelNormal_unit dT hdT
  have hmetric :
      preferredDirectionMetric
        (normalizedLevelNormal dT) (normalizedLevelNormal dT) v =
        -euclideanDot4 (normalizedLevelNormal dT) v := by
    unfold preferredDirectionMetric
    rw [hn]
    ring
  funext i
  simp [householderLorentzianProjector, euclideanLevelProjector, hmetric]

/-- The Euclidean projector's output lies in the original level-set kernel. -/
theorem euclideanLevelProjector_maps_to_kernel
    (dT v : Four) (hdT : dT ≠ 0) :
    euclideanDot4 dT (euclideanLevelProjector dT v) = 0 := by
  have hn := normalizedLevelNormal_unit dT hdT
  have horth :
      euclideanDot4 (normalizedLevelNormal dT)
        (euclideanLevelProjector dT v) = 0 := by
    unfold euclideanLevelProjector
    rw [euclideanDot4_sub_right, euclideanDot4_smul_right, hn]
    ring
  have hs :
      Real.sqrt (levelCovectorNormSq dT) ≠ 0 :=
    ne_of_gt (Real.sqrt_pos.2 (levelCovectorNormSq_pos dT hdT))
  have hscale :
      dT =
        fun i =>
          Real.sqrt (levelCovectorNormSq dT) *
            normalizedLevelNormal dT i := by
    funext i
    simp only [normalizedLevelNormal]
    field_simp [hs]
  calc
    euclideanDot4 dT (euclideanLevelProjector dT v)
        = euclideanDot4
            (fun i =>
              Real.sqrt (levelCovectorNormSq dT) *
                normalizedLevelNormal dT i)
            (euclideanLevelProjector dT v) := by
              rw [hscale]
    _ = Real.sqrt (levelCovectorNormSq dT) *
          euclideanDot4 (normalizedLevelNormal dT)
            (euclideanLevelProjector dT v) :=
          euclideanDot4_smul_left _ _ _
    _ = 0 := by
          rw [horth]
          ring

/-- The candidate Lorentzian projector also maps into ker dT. -/
theorem householderProjector_maps_to_level_kernel
    (dT v : Four) (hdT : dT ≠ 0) :
    euclideanDot4 dT (householderLorentzianProjector dT v) = 0 := by
  rw [householder_projector_eq_euclidean dT v hdT]
  exact euclideanLevelProjector_maps_to_kernel dT v hdT

/-- Both projector representations fix every vector tangent to the level set. -/
theorem householderProjector_fixes_level_tangent
    (dT v : Four) (hdT : dT ≠ 0)
    (hT : euclideanDot4 dT v = 0) :
    householderLorentzianProjector dT v = v := by
  rw [householder_projector_eq_euclidean dT v hdT]
  have horth :=
    normalizedLevelNormal_orthogonal_of_level_tangent dT v hdT hT
  funext i
  simp [euclideanLevelProjector, horth]

#print axioms normalizedLevelNormal_unit
#print axioms householder_projector_eq_euclidean
#print axioms euclideanLevelProjector_maps_to_kernel
#print axioms householderProjector_maps_to_level_kernel
#print axioms householderProjector_fixes_level_tangent

end HsHVerification.EnheduannaTimeNormalHouseholderBridge
