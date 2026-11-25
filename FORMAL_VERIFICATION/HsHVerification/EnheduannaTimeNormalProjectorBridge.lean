import Mathlib

/-!
# Enheduanna: regular-level-set normal to Householder projector bridge

## Epistemic and source boundary

This is a conditional, pointwise coordinate theorem in a positive-definite
Euclidean four-frame. The coordinate vector dT represents a covector at one
point; the Euclidean metric identifies it with its gradient. The theorem
assumes dT is nonzero at that point.

Historical source record (not a standard-reference attribution):
Satobloc/SAT_THEORY_ARCHIVE_2023-25,
SATOBLOC/SATO-BLOCK Hamiltonian and Hilbert Space.txt,
blob 13b6da983ea8dcad5509b1c6941b8855a2653677, added by commit
aaac961cfc519873eff650c12f39d005eda30e6a on 2026-05-31T23:05:38Z.
Its verbatim source expressions include:
  u^mu = partial^mu T
  C1: u^mu u_mu + 1 = 0
  P_{mu nu} = g_{mu nu} + u_mu u_nu
The source projector is a covariant rank-two tensor; raising one index with
its Lorentzian metric gives the corresponding endomorphism. This module does
not change those equations or prove equivalence to them.

The scalar pairing below is only the normal contraction of the separate
assistant-derived candidate Householder sign-flip expression discussed in
Calder PR #679:
  g_H(n,v) = h(n,v) - 2 h(n,n) h(n,v).
It is repeated locally so this proof does not depend on that PR's currently
uncompilable module. It is not a second general metric implementation and
does not establish that the candidate metric is source-native or physical.

This proves only a finite-dimensional algebraic bridge:
  nonzero dT -> normalized Euclidean normal -> candidate Lorentzian
  plus-sign projector = Euclidean orthogonal projector onto ker(dT).

It does NOT construct a global time function, foliation, physical normal
field, worldtube, timesheet, contact surface, dynamics, or instrument map.
It does not establish u = normalized(grad T) as Nathan Direct, or show
that any observable differs from standard physics. It is not an empirical
calculation or theory promotion.
-/

namespace HsHVerification.EnheduannaTimeNormalProjectorBridge

abbrev Four := Fin 4 → ℝ

/-- Euclidean coordinate dot product on a four-vector. -/
def euclideanDot4 (x y : Four) : ℝ :=
  ∑ i : Fin 4, x i * y i

/-- Squared Euclidean norm of the coordinate covector representing dT. -/
def levelCovectorNormSq (dT : Four) : ℝ :=
  euclideanDot4 dT dT

/-- Pointwise Euclidean-unit normal obtained from a nonzero coordinate dT. -/
def normalizedLevelNormal (dT : Four) : Four :=
  fun i => (Real.sqrt (levelCovectorNormSq dT))⁻¹ * dT i

/-- The candidate Householder metric evaluated only on (n,v), with u=n. -/
def candidateHouseholderNormalPairing (n v : Four) : ℝ :=
  euclideanDot4 n v - 2 * euclideanDot4 n n * euclideanDot4 n v

/-- Euclidean orthogonal projector onto the kernel of the level covector. -/
def euclideanLevelProjector (dT v : Four) : Four :=
  fun i =>
    v i -
      euclideanDot4 (normalizedLevelNormal dT) v *
        normalizedLevelNormal dT i

/-- Candidate Lorentzian I + u tensor u-flat projector, in its normal contraction. -/
def householderLorentzianProjector (dT v : Four) : Four :=
  fun i =>
    v i +
      candidateHouseholderNormalPairing
        (normalizedLevelNormal dT) v *
        normalizedLevelNormal dT i

/-- Dot product is linear in its first scalar-multiplied argument. -/
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

/-- Dot product is linear in its second scalar-multiplied argument. -/
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

/-- Dot product distributes over subtraction in its second argument. -/
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

/-- A nonzero coordinate covector has strictly positive squared norm. -/
theorem levelCovectorNormSq_pos (dT : Four) (hdT : dT ≠ 0) :
    0 < levelCovectorNormSq dT := by
  have hnonneg : 0 ≤ euclideanDot4 dT dT := by
    unfold euclideanDot4
    exact Finset.sum_nonneg fun i hi => mul_self_nonneg (dT i)
  by_contra hnot
  have hle : levelCovectorNormSq dT ≤ 0 := le_of_not_gt hnot
  have hzero : levelCovectorNormSq dT = 0 := le_antisymm hle hnonneg
  have hcoord : ∀ i : Fin 4, dT i = 0 := by
    intro i
    have hsingle : dT i * dT i ≤ euclideanDot4 dT dT := by
      unfold euclideanDot4
      exact Finset.single_le_sum
        (fun j hj => mul_self_nonneg (dT j))
        (Finset.mem_univ i)
    rw [hzero] at hsingle
    have hterm : dT i * dT i = 0 :=
      le_antisymm hsingle (mul_self_nonneg (dT i))
    exact mul_self_eq_zero.mp hterm
  apply hdT
  funext i
  exact hcoord i

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

/-- The candidate Householder normal pairing reduces to the negative Euclidean pairing. -/
theorem candidateHouseholderNormalPairing_eq_neg
    (dT v : Four) (hdT : dT ≠ 0) :
    candidateHouseholderNormalPairing (normalizedLevelNormal dT) v =
      -euclideanDot4 (normalizedLevelNormal dT) v := by
  unfold candidateHouseholderNormalPairing
  rw [normalizedLevelNormal_unit dT hdT]
  ring

/-- The candidate Lorentzian plus-sign projector equals the Euclidean orthogonal projector. -/
theorem householder_projector_eq_euclidean
    (dT v : Four) (hdT : dT ≠ 0) :
    householderLorentzianProjector dT v =
      euclideanLevelProjector dT v := by
  have hpair :=
    candidateHouseholderNormalPairing_eq_neg dT v hdT
  funext i
  simp [householderLorentzianProjector, euclideanLevelProjector, hpair]

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

#print axioms levelCovectorNormSq_pos
#print axioms normalizedLevelNormal_unit
#print axioms candidateHouseholderNormalPairing_eq_neg
#print axioms householder_projector_eq_euclidean
#print axioms euclideanLevelProjector_maps_to_kernel
#print axioms householderProjector_maps_to_level_kernel
#print axioms householderProjector_fixes_level_tangent

end HsHVerification.EnheduannaTimeNormalProjectorBridge
