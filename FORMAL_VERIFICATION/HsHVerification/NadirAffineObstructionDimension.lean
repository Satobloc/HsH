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
        (LinearMap.ker (identityMinus Q.toLinearMap)) := by
  simpa [similarityLinearPart, one_smul] using
    (affineObstruction_finrank_eq_kernel_finrank
      (L := Q.toLinearMap))

#print axioms affineObstruction_finrank_eq_kernel_finrank
#print axioms mem_identityMinus_ker_iff_fixed
#print axioms identityMinus_scaledIsometry_injective
#print axioms identityMinus_scaledIsometry_surjective
#print axioms affineObstructionClass_eq_zero_of_scaledIsometry
#print axioms affineObstruction_finrank_eq_zero_of_scaledIsometry
#print axioms affineObstruction_finrank_eq_fixedSpace_of_unitScale

end ScaledIsometry

end HsHVerification.NadirAffineObstructionDimension
