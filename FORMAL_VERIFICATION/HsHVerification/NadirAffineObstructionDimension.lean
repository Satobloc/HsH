import Mathlib
import HsHVerification.NadirAffineTranslationQuotient

/-!
# Nadir: dimension and scale classification of the affine translation obstruction

Source boundary:
* The 2026-09-11 Rotoexpando manuscript defines framed spheres
  S_i = (c_i, r_i, F_i), F_i ∈ SO(d), relative scale σ_ij = r_j/r_i,
  relative frame Q_ij = F_j F_i⁻¹, and the Euclidean similarity map
  x ↦ c_j + σ_ij Q_ij (x - c_i).
* The 2026-09-26 Run 141 sandbox proposes the origin-shift quotient
  V / range(I - L), L = σQ. That quotient construction is sandbox
  mathematics, not a Nathan-authored physical law.

This file proves:
1. In finite dimension, the dimension of coker(I-L) equals the dimension
   of ker(I-L), i.e. the fixed-vector subspace of L.
2. If Q is a real linear isometry and σ > 0 with σ ≠ 1, then I - σQ
   is injective and hence surjective in finite dimension. The affine
   translation quotient is therefore zero for every translation vector.
3. At unit scale, the quotient dimension equals the dimension of the
   fixed-vector subspace of Q.

The result uses only norm preservation and finite-dimensional rank-nullity.
It does not identify a physical worldtube, prove a nested-helix map,
establish an empirical holonomy, or impose SO(d)'s determinant +1
condition; the isometry theorem holds on the larger O(d) class.
-/

namespace HsHVerification.NadirAffineObstructionDimension

open HsHVerification.NadirAffineTranslationQuotient

section RankNullity

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

/-- The affine translation cokernel has the same dimension as the kernel
    of I-L. This is rank-nullity applied to the endomorphism I-L. -/
theorem affineObstruction_finrank_eq_kernel_finrank
    [FiniteDimensional ℝ V] (L : V →ₗ[ℝ] V) :
    Module.finrank ℝ (V ⧸ LinearMap.range (identityMinus L)) =
      Module.finrank ℝ (LinearMap.ker (identityMinus L)) := by
  have hquot :=
    Submodule.finrank_quotient_add_finrank
      (LinearMap.range (identityMinus L))
  have hrank :=
    LinearMap.finrank_range_add_finrank_ker (identityMinus L)
  omega

/-- The kernel of I-L is exactly the fixed-vector subspace of L. -/
theorem mem_identityMinus_ker_iff_fixed
    (L : V →ₗ[ℝ] V) (x : V) :
    x ∈ LinearMap.ker (identityMinus L) ↔ L x = x := by
  change identityMinus L x = 0 ↔ L x = x
  change x - L x = 0 ↔ L x = x
  constructor
  · intro h
    exact (sub_eq_zero.mp h).symm
  · intro h
    exact sub_eq_zero.mpr h.symm

end RankNullity

section ScaledIsometry

variable {V : Type*} [NormedAddCommGroup V]
  [InnerProductSpace ℝ V]

/-- The linear part σQ of a positive scaling followed by an isometry. -/
def scaledIsometryLinearPart
    (σ : ℝ) (Q : V ≃ₗᵢ[ℝ] V) : V →ₗ[ℝ] V :=
  similarityLinearPart σ Q.toLinearEquiv

/-- If σ is positive and not one, I-σQ has no nonzero fixed vector.
    The proof is purely metric: a fixed vector would have norm σ times
    itself, contradicting σ ≠ 1. -/
theorem identityMinus_scaledIsometry_injective
    (σ : ℝ) (hσ : 0 < σ) (hσ_ne_one : σ ≠ 1)
    (Q : V ≃ₗᵢ[ℝ] V) :
    Function.Injective
      (identityMinus (scaledIsometryLinearPart σ Q)) := by
  intro x y hxy
  let f := identityMinus (scaledIsometryLinearPart σ Q)
  have hzero : f (x - y) = 0 := by
    rw [map_sub, hxy, sub_self]
  have hsub : x - y - σ • Q (x - y) = 0 := by
    simpa [f, scaledIsometryLinearPart, identityMinus,
      similarityLinearPart] using hzero
  have hfix : x - y = σ • Q (x - y) :=
    sub_eq_zero.mp hsub
  have hnorm : ‖x - y‖ = σ * ‖x - y‖ := by
    calc
      ‖x - y‖ = ‖σ • Q (x - y)‖ := by rw [← hfix]
      _ = ‖σ‖ * ‖Q (x - y)‖ := norm_smul _ _
      _ = σ * ‖x - y‖ := by
        rw [Real.norm_eq_abs, abs_of_pos hσ, Q.norm_map]
  have hcoef : 1 - σ ≠ 0 := by
    intro h
    apply hσ_ne_one
    linarith
  have hprod : (1 - σ) * ‖x - y‖ = 0 := by
    nlinarith [hnorm]
  have hnorm_zero : ‖x - y‖ = 0 :=
    (mul_eq_zero.mp hprod).resolve_left hcoef
  exact sub_eq_zero.mp (norm_eq_zero.mp hnorm_zero)

/-- In finite dimension, the injectivity above makes I-σQ surjective. -/
theorem identityMinus_scaledIsometry_surjective
    [FiniteDimensional ℝ V] (σ : ℝ) (hσ : 0 < σ) (hσ_ne_one : σ ≠ 1)
    (Q : V ≃ₗᵢ[ℝ] V) :
    Function.Surjective
      (identityMinus (scaledIsometryLinearPart σ Q)) :=
  (LinearMap.injective_iff_surjective).mp
    (identityMinus_scaledIsometry_injective σ hσ hσ_ne_one Q)

/-- Away from unit scale, every affine translation is removable by an
    origin shift: the quotient obstruction class is zero. -/
theorem affineObstructionClass_eq_zero_of_scaledIsometry
    [FiniteDimensional ℝ V] (σ : ℝ) (hσ : 0 < σ) (hσ_ne_one : σ ≠ 1)
    (Q : V ≃ₗᵢ[ℝ] V) (t : V) :
    affineObstructionClass (scaledIsometryLinearPart σ Q) t = 0 := by
  apply affineObstructionClass_eq_zero_of_surjective
  exact identityMinus_scaledIsometry_surjective σ hσ hσ_ne_one Q

/-- At non-unit positive scale, the affine translation cokernel is
    zero-dimensional. -/
theorem affineObstruction_finrank_eq_zero_of_scaledIsometry
    [FiniteDimensional ℝ V] (σ : ℝ) (hσ : 0 < σ) (hσ_ne_one : σ ≠ 1)
    (Q : V ≃ₗᵢ[ℝ] V) :
    Module.finrank ℝ
      (V ⧸ LinearMap.range
        (identityMinus (scaledIsometryLinearPart σ Q))) = 0 := by
  rw [affineObstruction_finrank_eq_kernel_finrank]
  have hinj :=
    identityMinus_scaledIsometry_injective σ hσ hσ_ne_one Q
  have hker :
      LinearMap.ker (identityMinus (scaledIsometryLinearPart σ Q)) = ⊥ :=
    LinearMap.ker_eq_bot.mpr hinj
  simp [hker]

/-- At unit scale, the affine translation-obstruction dimension is exactly
    the dimension of the fixed-vector subspace of Q. -/
theorem affineObstruction_finrank_eq_fixedSpace_of_unitScale
    [FiniteDimensional ℝ V] (Q : V ≃ₗ[ℝ] V) :
    Module.finrank ℝ
      (V ⧸ LinearMap.range
        (identityMinus (similarityLinearPart 1 Q))) =
      Module.finrank ℝ
        (LinearMap.ker (identityMinus (Q.toLinearMap))) := by
  have hunit : similarityLinearPart 1 Q = Q.toLinearMap := by
    ext x
    simp [similarityLinearPart]
  rw [hunit]
  exact affineObstruction_finrank_eq_kernel_finrank
    (L := Q.toLinearMap)

#print axioms affineObstruction_finrank_eq_kernel_finrank
#print axioms mem_identityMinus_ker_iff_fixed
#print axioms identityMinus_scaledIsometry_injective
#print axioms identityMinus_scaledIsometry_surjective
#print axioms affineObstructionClass_eq_zero_of_scaledIsometry
#print axioms affineObstruction_finrank_eq_zero_of_scaledIsometry
#print axioms affineObstruction_finrank_eq_fixedSpace_of_unitScale

end ScaledIsometry


/-!
## Orthogonal representative of the affine translation quotient

This section is a new conditional mathematical construction built on the
assistant-authored Run 141 affine quotient. The 2026-09-11 Rotoexpando
manuscript defines the framed-sphere similarity map, but does not define this
orthogonal quotient projection. The inner product is additional structure:
without it, the quotient has no preferred representative.

For finite-dimensional real inner-product spaces, the range of (I-L) has an
orthogonal complement. The quotient V/range(I-L) is linearly equivalent to
that complement by sending [t] to the orthogonal projection of t. Mathlib's
adjoint-range theorem identifies the target with ker((I-L)^*).

This is not a holonomy theorem, a nested-helix map, or a physical observable.
-/

section OrthogonalQuotientProjection

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]
  [FiniteDimensional ℝ V]

/-- In finite dimension, range(I-L) and its orthogonal complement form a
    direct-sum decomposition of V. -/
theorem affineShiftRangeIsCompl
    (L : V →ₗ[ℝ] V) :
    IsCompl (LinearMap.range (identityMinus L))
      ((LinearMap.range (identityMinus L))ᗮ) := by
  let S : Submodule ℝ V := LinearMap.range (identityMinus L)
  haveI : FiniteDimensional ℝ S :=
    Submodule.finiteDimensional_of_le (le_top : S ≤ ⊤)
  haveI : CompleteSpace S := FiniteDimensional.complete ℝ S
  exact S.isCompl_orthogonal

/-- The quotient map induced by orthogonal projection onto range(I-L)ᗮ.
    It sends the class [t] to the orthogonal representative of that class. -/
noncomputable def affineQuotientOrthogonalProjection
    (L : V →ₗ[ℝ] V) :
    (V ⧸ LinearMap.range (identityMinus L)) →ₗ[ℝ]
      (LinearMap.range (identityMinus L))ᗮ :=
  let S : Submodule ℝ V := LinearMap.range (identityMinus L)
  S.liftQ
    (Sᗮ.projectionOnto S (affineShiftRangeIsCompl L).symm)
    (le_of_eq
      (Submodule.ker_projectionOnto
        (affineShiftRangeIsCompl L).symm).symm)

/-- On a quotient representative, the induced map is the chosen orthogonal
    projection. -/
@[simp] theorem affineQuotientOrthogonalProjection_mk
    (L : V →ₗ[ℝ] V) (t : V) :
    affineQuotientOrthogonalProjection L (Submodule.Quotient.mk t) =
      (LinearMap.range (identityMinus L))ᗮ.projectionOnto
        (LinearMap.range (identityMinus L))
        (affineShiftRangeIsCompl L).symm t := by
  simp [affineQuotientOrthogonalProjection]

/-- The projected representative vanishes exactly when the original
    translation lies in range(I-L), matching the Run 141 vanishing criterion. -/
theorem affineQuotientOrthogonalProjection_mk_eq_zero_iff
    (L : V →ₗ[ℝ] V) (t : V) :
    affineQuotientOrthogonalProjection L (Submodule.Quotient.mk t) = 0
      ↔ t ∈ LinearMap.range (identityMinus L) := by
  rw [affineQuotientOrthogonalProjection_mk]
  change
    ((LinearMap.range (identityMinus L))ᗮ.projectionOnto
      (LinearMap.range (identityMinus L))
      (affineShiftRangeIsCompl L).symm) t = 0 ↔
    t ∈ LinearMap.range (identityMinus L)
  rw [← LinearMap.mem_ker]
  rw [Submodule.ker_projectionOnto (affineShiftRangeIsCompl L).symm]

/-- The projection and quotient maps compose to the orthogonal projection
    on V. This is the explicit map diagram, not an analogy. -/
theorem affineQuotientOrthogonalProjection_comp_mkQ
    (L : V →ₗ[ℝ] V) :
    (affineQuotientOrthogonalProjection L).comp
      (Submodule.mkQ (LinearMap.range (identityMinus L))) =
    (LinearMap.range (identityMinus L))ᗮ.projectionOnto
      (LinearMap.range (identityMinus L))
      (affineShiftRangeIsCompl L).symm := by
  ext t
  simp [affineQuotientOrthogonalProjection]

/-- The affine translation quotient is linearly equivalent to the orthogonal
    complement of range(I-L). -/
noncomputable def affineQuotientOrthogonalEquiv
    (L : V →ₗ[ℝ] V) :
    (V ⧸ LinearMap.range (identityMinus L)) ≃ₗ[ℝ]
      (LinearMap.range (identityMinus L))ᗮ :=
  LinearEquiv.ofBijective (affineQuotientOrthogonalProjection L) (by
    constructor
    · apply LinearMap.ker_eq_bot.mp
      simpa [affineQuotientOrthogonalProjection] using
        (Submodule.ker_liftQ_eq_bot'
          (LinearMap.range (identityMinus L))
          ((LinearMap.range (identityMinus L))ᗮ.projectionOnto
            (LinearMap.range (identityMinus L))
            (affineShiftRangeIsCompl L).symm)
          (Submodule.ker_projectionOnto
            (affineShiftRangeIsCompl L).symm).symm)
    · intro y
      refine ⟨Submodule.Quotient.mk (y : V), ?_⟩
      simp [affineQuotientOrthogonalProjection]
  )

/-- The inverse equivalence is the inclusion of the orthogonal complement
    followed by the quotient map. -/
@[simp] theorem affineQuotientOrthogonalEquiv_symm_apply
    (L : V →ₗ[ℝ] V)
    (y : (LinearMap.range (identityMinus L))ᗮ) :
    (affineQuotientOrthogonalEquiv L).symm y =
      Submodule.Quotient.mk (y : V) := by
  apply (affineQuotientOrthogonalEquiv L).injective
  simp [affineQuotientOrthogonalEquiv, affineQuotientOrthogonalProjection]

/-- The orthogonal complement of range(I-L) is exactly the kernel of the
    adjoint operator. -/
theorem affineShiftRange_orthogonal_eq_adjointKernel
    (L : V →ₗ[ℝ] V) :
    (LinearMap.range (identityMinus L))ᗮ =
      LinearMap.ker ((identityMinus L).adjoint) := by
  exact LinearMap.orthogonal_range (identityMinus L)

/-- The orthogonal-complement representative and the adjoint-kernel
    representative are the same vector, with only the subtype changed. -/
noncomputable def affineOrthogonalComplementEquivAdjointKernel
    (L : V →ₗ[ℝ] V) :
    (LinearMap.range (identityMinus L))ᗮ ≃ₗ[ℝ]
      LinearMap.ker ((identityMinus L).adjoint) :=
  LinearEquiv.ofEq _ _ (affineShiftRange_orthogonal_eq_adjointKernel L)

/-- Explicit quotient-to-adjoint-kernel equivalence:
    [t] maps to the orthogonal representative in ker((I-L)^*). -/
noncomputable def affineQuotientAdjointKernelEquiv
    (L : V →ₗ[ℝ] V) :
    (V ⧸ LinearMap.range (identityMinus L)) ≃ₗ[ℝ]
      LinearMap.ker ((identityMinus L).adjoint) :=
  (affineQuotientOrthogonalEquiv L).trans
    (affineOrthogonalComplementEquivAdjointKernel L)

#print axioms affineShiftRangeIsCompl
#print axioms affineQuotientOrthogonalProjection_mk
#print axioms affineQuotientOrthogonalProjection_mk_eq_zero_iff
#print axioms affineQuotientOrthogonalProjection_comp_mkQ
#print axioms affineQuotientOrthogonalEquiv
#print axioms affineQuotientOrthogonalEquiv_symm_apply
#print axioms affineShiftRange_orthogonal_eq_adjointKernel
#print axioms affineOrthogonalComplementEquivAdjointKernel
#print axioms affineQuotientAdjointKernelEquiv

end OrthogonalQuotientProjection

end HsHVerification.NadirAffineObstructionDimension
