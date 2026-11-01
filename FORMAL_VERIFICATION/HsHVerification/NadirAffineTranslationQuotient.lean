import Mathlib

/-!
# Nadir: Hagalaz similarity composition and affine translation quotient

Primary historical source:
* `HSH_RESOURCES/REDISCOVERED/rotoexpando_geometry_definition.tex`,
  blob `5c21c6152482249e4432ded423b0040e70fc8b4f`, dated 2026-09-11,
  byline Nathan McKnight and collaborators. It defines framed spheres,
  relative scale/frame data, the Hagalaz tuple, and the map
  `x ↦ c_j + σ Q (x - c_i)`. The manuscript explicitly says it is not
  assumed to be a physical theory, Hagalaz is optional shorthand with no
  independent ontology, and the nested-helix-to-framed-sphere map remains
  undefined.

Sandbox sources:
* `RUN_141_GAUGE_SAFE_HAGALAZ_TRIANGLE_RESIDUAL.md`, blob
  `8b5b8768527dfff5b198e324b2f823257889f385`, document date 2026-09-26,
  status SANDBOXED; author/outer role is not authenticated.
* `PLAYGROUND_004_30SEP_RECOVERY_COLLISION.md`, blob
  `e56b9cfffc4aa7a76b7302d6f1a66ad2ac2d4e4f`, assistant-generated
  reconstruction.
* `RUN_077_LITERAL_HAGALAZ_COMPOSITION.md`, blob
  `a106e8328345534d74460b17196d4ab35a4b06bf`, assistant sandbox.

This module proves only conditional algebraic statements. It does not
establish the missing nested-helix-to-framed-sphere map, SO(4) orthogonality
conditions, a physical worldtube, a responsive-medium law, a measured
observable, or the truth/authorship of the sandbox premises.
-/

namespace HsHVerification.NadirAffineTranslationQuotient

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

/-- Relative radius scale σᵢⱼ = rⱼ / rᵢ from the historical framed-sphere source. -/
def relativeScale (r_i r_j : ℝ) : ℝ := r_j / r_i

/-- Relative frame Qᵢⱼ = Fⱼ ∘ Fᵢ⁻¹. -/
def relativeFrame (F_i F_j : V ≃ₗ[ℝ] V) : V ≃ₗ[ℝ] V :=
  F_i.symm.trans F_j

/-- The source-defined framed-sphere similarity map. -/
def similarityMap (c_i c_j : V) (σ : ℝ)
    (Q : V ≃ₗ[ℝ] V) (x : V) : V :=
  c_j + σ • Q (x - c_i)

/-- Specialization of the similarity map to the relative radius and frame data. -/
def framedSimilarityMap (c_i c_j : V) (r_i r_j : ℝ)
    (F_i F_j : V ≃ₗ[ℝ] V) (x : V) : V :=
  similarityMap c_i c_j (relativeScale r_i r_j)
    (relativeFrame F_i F_j) x

/-- Relative frames compose exactly: Qⱼₖ ∘ Qᵢⱼ = Qᵢₖ. -/
theorem relativeFrame_comp_apply
    (F_i F_j F_k : V ≃ₗ[ℝ] V) (x : V) :
    relativeFrame F_j F_k (relativeFrame F_i F_j x) =
      relativeFrame F_i F_k x := by
  simp [relativeFrame]

/-- Relative radius scales compose exactly when the intermediate radius is nonzero. -/
theorem relativeScale_comp
    (r_i r_j r_k : ℝ) (h_i : r_i ≠ 0) (h_j : r_j ≠ 0) :
    relativeScale r_j r_k * relativeScale r_i r_j =
      relativeScale r_i r_k := by
  unfold relativeScale
  field_simp [h_i, h_j]
  ring

/-- The framed-sphere maps form a composable groupoid under the stated
    nonzero-radius conditions. No orthogonality assumption is needed:
    arbitrary invertible linear frames suffice. -/
theorem framedSimilarityMap_comp
    (c_i c_j c_k : V) (r_i r_j r_k : ℝ)
    (F_i F_j F_k : V ≃ₗ[ℝ] V)
    (h_i : r_i ≠ 0) (h_j : r_j ≠ 0) (x : V) :
    framedSimilarityMap c_j c_k r_j r_k F_j F_k
      (framedSimilarityMap c_i c_j r_i r_j F_i F_j x) =
    framedSimilarityMap c_i c_k r_i r_k F_i F_k x := by
  unfold framedSimilarityMap similarityMap
  change c_k + relativeScale r_j r_k •
      relativeFrame F_j F_k
        ((c_j + relativeScale r_i r_j •
          relativeFrame F_i F_j (x - c_i)) - c_j) =
    c_k + relativeScale r_i r_k •
      relativeFrame F_i F_k (x - c_i)
  rw [add_sub_cancel_left]
  rw [map_smul]
  rw [relativeFrame_comp_apply]
  rw [smul_smul]
  rw [relativeScale_comp r_i r_j r_k h_i h_j]

/-- The linear part L = σQ of the affine representation. -/
def similarityLinearPart (σ : ℝ) (Q : V ≃ₗ[ℝ] V) : V →ₗ[ℝ] V :=
  σ • Q.toLinearMap

/-- The affine intercept t corresponding to the source's centered map:
    cⱼ + σQ(x-cᵢ) = (σQ)x + t, with t = cⱼ - σQ cᵢ. -/
def affineIntercept (c_i c_j : V) (σ : ℝ)
    (Q : V ≃ₗ[ℝ] V) : V :=
  c_j - similarityLinearPart σ Q c_i

/-- The centered Hagalaz map equals its global affine form. -/
theorem similarityMap_affine_form
    (c_i c_j x : V) (σ : ℝ) (Q : V ≃ₗ[ℝ] V) :
    similarityMap c_i c_j σ Q x =
      similarityLinearPart σ Q x + affineIntercept c_i c_j σ Q := by
  simp [similarityMap, similarityLinearPart, affineIntercept,
    map_sub, smul_sub, sub_eq_add_neg, add_assoc, add_comm, add_left_comm]
  <;> abel

/-- Simultaneously translating both frame centers leaves their displacement unchanged. -/
theorem centerDisplacement_origin_invariant
    (c_i c_j g : V) :
    (c_j + g) - (c_i + g) = c_j - c_i := by
  abel

/-- The affine intercept changes by (I-L)g when both frame centers are
    shifted by g, using the source's stated coordinate convention. -/
theorem affineIntercept_origin_shift
    (c_i c_j g : V) (σ : ℝ) (Q : V ≃ₗ[ℝ] V) :
    affineIntercept (c_i + g) (c_j + g) σ Q =
      affineIntercept c_i c_j σ Q +
        ((LinearMap.id : V →ₗ[ℝ] V) -
          similarityLinearPart σ Q) g := by
  simp [affineIntercept, similarityLinearPart, map_add, smul_add,
    sub_eq_add_neg, add_assoc, add_comm, add_left_comm]
  <;> abel

/-- Explicit I-L linear map. -/
def identityMinus (L : V →ₗ[ℝ] V) : V →ₗ[ℝ] V :=
  (LinearMap.id : V →ₗ[ℝ] V) - L

/-- The affine translation obstruction is the class in coker(I-L). -/
def affineObstructionClass (L : V →ₗ[ℝ] V) :
    V →ₗ[ℝ] V ⧸ LinearMap.range (identityMinus L) :=
  Submodule.mkQ (LinearMap.range (identityMinus L))

/-- The obstruction class vanishes exactly when t lies in range(I-L). -/
theorem affineObstructionClass_eq_zero_iff
    (L : V →ₗ[ℝ] V) (t : V) :
    affineObstructionClass L t = 0 ↔
      t ∈ LinearMap.range (identityMinus L) := by
  simp only [affineObstructionClass, Submodule.mkQ_apply,
    Submodule.Quotient.mk_eq_zero, identityMinus]

/-- Changing the origin by g shifts t by (I-L)g but leaves its quotient class unchanged. -/
theorem affineObstructionClass_origin_shift
    (L : V →ₗ[ℝ] V) (t g : V) :
    affineObstructionClass L (t + identityMinus L g) =
      affineObstructionClass L t := by
  have hmem : identityMinus L g ∈ LinearMap.range (identityMinus L) :=
    ⟨g, rfl⟩
  rw [map_add]
  have hzero : affineObstructionClass L (identityMinus L g) = 0 :=
    (affineObstructionClass_eq_zero_iff L (identityMinus L g)).2 hmem
  rw [hzero, add_zero]

/-- The affine-intercept quotient class is invariant under a simultaneous
    shift of the two framed-sphere centers. -/
theorem affineIntercept_obstruction_origin_invariant
    (c_i c_j g : V) (σ : ℝ) (Q : V ≃ₗ[ℝ] V) :
    affineObstructionClass (similarityLinearPart σ Q)
      (affineIntercept (c_i + g) (c_j + g) σ Q) =
    affineObstructionClass (similarityLinearPart σ Q)
      (affineIntercept c_i c_j σ Q) := by
  rw [affineIntercept_origin_shift]
  exact affineObstructionClass_origin_shift
    (similarityLinearPart σ Q) (affineIntercept c_i c_j σ Q) g

/-- If I-L is surjective, the affine translation quotient is trivial. -/
theorem affineObstructionClass_eq_zero_of_surjective
    (L : V →ₗ[ℝ] V)
    (hL : Function.Surjective (identityMinus L))
    (t : V) :
    affineObstructionClass L t = 0 := by
  apply (affineObstructionClass_eq_zero_iff L t).2
  exact hL t

/-- One matrix-entry residual used in the Run 141 Frobenius expression. -/
def matrixResidualEntry (Q : Matrix (Fin 4) (Fin 4) ℝ)
    (p : Fin 4 × Fin 4) : ℝ :=
  Q p.1 p.2 - (1 : Matrix (Fin 4) (Fin 4) ℝ) p.1 p.2

/-- The proposed Run 141 linear residual, written as a squared Frobenius residual. -/
def linearResidual (σ : ℝ) (Q : Matrix (Fin 4) (Fin 4) ℝ) : ℝ :=
  (Real.log σ)^2 +
    ∑ p ∈ (Finset.univ : Finset (Fin 4 × Fin 4)),
      (matrixResidualEntry Q p)^2

/-- The zero set of the proposed residual is exactly the identity similarity.
    No orthogonality hypothesis on Q is needed for this zero-set statement. -/
theorem linearResidual_eq_zero_iff
    (σ : ℝ) (Q : Matrix (Fin 4) (Fin 4) ℝ) (hσ : 0 < σ) :
    linearResidual σ Q = 0 ↔ σ = 1 ∧ Q = 1 := by
  constructor
  · intro h
    have hsum_nonneg :
        0 ≤ ∑ p ∈ (Finset.univ : Finset (Fin 4 × Fin 4)),
          (matrixResidualEntry Q p)^2 := by
      apply Finset.sum_nonneg
      intro p hp
      exact sq_nonneg _
    have hsum_zero :
        ∑ p ∈ (Finset.univ : Finset (Fin 4 × Fin 4)),
          (matrixResidualEntry Q p)^2 = 0 := by
      unfold linearResidual at h
      nlinarith [sq_nonneg (Real.log σ), hsum_nonneg]
    have hlog_zero : Real.log σ = 0 := by
      unfold linearResidual at h
      nlinarith [sq_nonneg (Real.log σ), hsum_nonneg]
    have hσ_one : σ = 1 :=
      Real.eq_one_of_pos_of_log_eq_zero hσ hlog_zero
    have hentries :
        ∀ p ∈ (Finset.univ : Finset (Fin 4 × Fin 4)),
          matrixResidualEntry Q p = 0 := by
      exact (Finset.sum_sq_eq_zero_iff).mp hsum_zero
    have hQ_one : Q = 1 := by
      ext i j
      have hij := hentries (i, j) (Finset.mem_univ _)
      have hij' : Q i j - (1 : Matrix (Fin 4) (Fin 4) ℝ) i j = 0 := by
        simpa [matrixResidualEntry] using hij
      exact sub_eq_zero.mp hij'
    exact ⟨hσ_one, hQ_one⟩
  · rintro ⟨hσ_one, hQ_one⟩
    subst σ
    subst Q
    simp [linearResidual, matrixResidualEntry]

#print axioms relativeFrame_comp_apply
#print axioms relativeScale_comp
#print axioms framedSimilarityMap_comp
#print axioms similarityMap_affine_form
#print axioms affineIntercept_origin_shift
#print axioms affineObstructionClass_eq_zero_iff
#print axioms affineObstructionClass_origin_shift
#print axioms affineIntercept_obstruction_origin_invariant
#print axioms affineObstructionClass_eq_zero_of_surjective
#print axioms linearResidual_eq_zero_iff

end HsHVerification.NadirAffineTranslationQuotient
