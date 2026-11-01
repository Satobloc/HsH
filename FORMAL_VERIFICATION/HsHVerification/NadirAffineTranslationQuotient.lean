import Mathlib

/-!
# Nadir: affine translation quotient and linear residual zero set

Source boundary:
* `RUN_141_GAUGE_SAFE_HAGALAZ_TRIANGLE_RESIDUAL.md`, HsH blob
  `8b5b... `, dated 2026-09-26 in the document, status SANDBOXED;
  the artifact has no authenticated author/role metadata.
* `PLAYGROUND_004_30SEP_RECOVERY_COLLISION.md`, HsH blob
  `e56b9cfffc4aa7a76b7302d6f1a66ad2ac2d4e4f`, assistant-generated
  reconstruction.

This module proves only conditional algebraic statements encoded below.
It does not attribute the source equations to Nathan Direct, establish a
physical similarity/holonomy model, prove the canonical orthogonal-projection
formula, or validate any physical premise or observable.
-/

namespace HsHVerification.NadirAffineTranslationQuotient

/-- The proposed linear residual as written in the Run 141 sandbox:
    (log σ)^2 plus the squared Frobenius distance from Q to the identity. -/
def linearResidual (σ : ℝ) (Q : Matrix (Fin 4) (Fin 4) ℝ) : ℝ :=
  (Real.log σ)^2 +
    ∑ p in Finset.univ,
      (Q p.1 p.2 - (1 : Matrix (Fin 4) (Fin 4) ℝ) p.1 p.2)^2

/-- The zero set of the proposed residual is exactly the identity similarity.
    No orthogonality hypothesis on Q is needed for this zero-set statement. -/
theorem linearResidual_eq_zero_iff
    (σ : ℝ) (Q : Matrix (Fin 4) (Fin 4) ℝ) (hσ : 0 < σ) :
    linearResidual σ Q = 0 ↔ σ = 1 ∧ Q = 1 := by
  constructor
  · intro h
    have hsum_nonneg :
        0 ≤ ∑ p in Finset.univ,
          (Q p.1 p.2 - (1 : Matrix (Fin 4) (Fin 4) ℝ) p.1 p.2)^2 := by
      apply Finset.sum_nonneg
      intro p hp
      exact sq_nonneg _
    have hsum_zero :
        ∑ p in Finset.univ,
          (Q p.1 p.2 - (1 : Matrix (Fin 4) (Fin 4) ℝ) p.1 p.2)^2 = 0 := by
      unfold linearResidual at h
      nlinarith [sq_nonneg (Real.log σ), hsum_nonneg]
    have hlog_zero : Real.log σ = 0 := by
      unfold linearResidual at h
      nlinarith [sq_nonneg (Real.log σ), hsum_nonneg]
    have hσ_one : σ = 1 :=
      Real.eq_one_of_pos_of_log_eq_zero hσ hlog_zero
    have hentries :
        ∀ p ∈ Finset.univ,
          Q p.1 p.2 - (1 : Matrix (Fin 4) (Fin 4) ℝ) p.1 p.2 = 0 := by
      exact (Finset.sum_sq_eq_zero_iff).mp hsum_zero
    have hQ_one : Q = 1 := by
      ext i j
      have hij := hentries (i, j) (Finset.mem_univ _)
      exact sub_eq_zero.mp hij
    exact ⟨hσ_one, hQ_one⟩
  · rintro ⟨rfl, rfl⟩
    simp [linearResidual]

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

/-- The affine translation obstruction is the class in the cokernel of I - L. -/
def affineObstructionClass (L : V →ₗ[ℝ] V) :
    V →ₗ[ℝ] V ⧸ LinearMap.range (LinearMap.id - L) :=
  Submodule.mkQ (LinearMap.range (LinearMap.id - L))

/-- The obstruction class vanishes exactly when t lies in the image of I - L. -/
theorem affineObstructionClass_eq_zero_iff
    (L : V →ₗ[ℝ] V) (t : V) :
    affineObstructionClass L t = 0 ↔
      t ∈ LinearMap.range (LinearMap.id - L) := by
  simp [affineObstructionClass]

/-- Changing the origin shifts t by (I - L)g but leaves its quotient class unchanged. -/
theorem affineObstructionClass_origin_shift
    (L : V →ₗ[ℝ] V) (t g : V) :
    affineObstructionClass L (t + (LinearMap.id - L) g) =
      affineObstructionClass L t := by
  have hmem : (LinearMap.id - L) g ∈ LinearMap.range (LinearMap.id - L) :=
    ⟨g, rfl⟩
  simp [affineObstructionClass, hmem]

/-- If I - L is surjective, the affine translation quotient is trivial. -/
theorem affineObstructionClass_eq_zero_of_surjective
    (L : V →ₗ[ℝ] V)
    (hL : Function.Surjective (LinearMap.id - L))
    (t : V) :
    affineObstructionClass L t = 0 := by
  apply (affineObstructionClass_eq_zero_iff L t).2
  exact hL t

end HsHVerification.NadirAffineTranslationQuotient
