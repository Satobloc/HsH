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
noncomputable def relativeScale (r_i r_j : ℝ) : ℝ := r_j / r_i

/-- Relative frame Qᵢⱼ = Fⱼ ∘ Fᵢ⁻¹. -/
def relativeFrame (F_i F_j : V ≃ₗ[ℝ] V) : V ≃ₗ[ℝ] V :=
  F_i.symm.trans F_j

/-- The source-defined framed-sphere similarity map. -/
def similarityMap (c_i c_j : V) (σ : ℝ)
    (Q : V ≃ₗ[ℝ] V) (x : V) : V :=
  c_j + σ • Q (x - c_i)

/-- Specialization of the similarity map to the relative radius and frame data. -/
noncomputable def framedSimilarityMap (c_i c_j : V) (r_i r_j : ℝ)
    (F_i F_j : V ≃ₗ[ℝ] V) (x : V) : V :=
  similarityMap c_i c_j (relativeScale r_i r_j)
    (relativeFrame F_i F_j) x

/-- Relative frames compose exactly: Qⱼₖ ∘ Qᵢⱼ = Qᵢₖ. -/
theorem relativeFrame_comp_apply
    (F_i F_j F_k : V ≃ₗ[ℝ] V) (x : V) :
    relativeFrame F_j F_k (relativeFrame F_i F_j x) =
      relativeFrame F_i F_k x := by
  simp [relativeFrame]

/-! The historical manuscript uses rᵢ as a radius and normalizes by it, but
does not write an explicit quantified positivity hypothesis. The algebraic
composition theorem below is valid for signed, nonzero scalar parameters.
The following positive-radius specialization makes the ordinary geometric
interpretation explicit as an additional assumption, not a verbatim source axiom. -/

/-- Explicit positive-radius assumptions imply a positive relative scale. -/
theorem relativeScale_pos_of_positive_radii
    (r_i r_j : ℝ) (h_i : 0 < r_i) (h_j : 0 < r_j) :
    0 < relativeScale r_i r_j := by
  unfold relativeScale
  exact div_pos h_j h_i

/-- Relative radius scales compose exactly for nonzero scalar radii. -/
theorem relativeScale_comp
    (r_i r_j r_k : ℝ) (h_i : r_i ≠ 0) (h_j : r_j ≠ 0) :
    relativeScale r_j r_k * relativeScale r_i r_j =
      relativeScale r_i r_k := by
  unfold relativeScale
  field_simp [h_i, h_j]

/-- With all three geometric radii explicitly positive, all pairwise
    relative scales are positive and the scale-composition law holds. -/
theorem relativeScale_comp_of_positive_radii
    (r_i r_j r_k : ℝ)
    (h_i : 0 < r_i) (h_j : 0 < r_j) (h_k : 0 < r_k) :
    0 < relativeScale r_j r_k ∧
    0 < relativeScale r_i r_j ∧
    0 < relativeScale r_i r_k ∧
    relativeScale r_j r_k * relativeScale r_i r_j =
      relativeScale r_i r_k := by
  exact ⟨relativeScale_pos_of_positive_radii r_j r_k h_j h_k,
    relativeScale_pos_of_positive_radii r_i r_j h_i h_j,
    relativeScale_pos_of_positive_radii r_i r_k h_i h_k,
    relativeScale_comp r_i r_j r_k (ne_of_gt h_i) (ne_of_gt h_j)⟩

/-- The framed-sphere similarity maps compose under the stated nonzero-radius
    conditions. No orthogonality assumption is needed for this algebraic identity:
    arbitrary invertible linear frames suffice. -/
theorem framedSimilarityMap_comp
    (c_i c_j c_k : V) (r_i r_j r_k : ℝ)
    (F_i F_j F_k : V ≃ₗ[ℝ] V)
    (h_i : r_i ≠ 0) (h_j : r_j ≠ 0) (x : V) :
    framedSimilarityMap c_j c_k r_j r_k F_j F_k
      (framedSimilarityMap c_i c_j r_i r_j F_i F_j x) =
    framedSimilarityMap c_i c_k r_i r_k F_i F_k x := by
  unfold framedSimilarityMap similarityMap
  simp only [add_sub_cancel_left]
  rw [map_smul, smul_smul, relativeFrame_comp_apply,
    relativeScale_comp r_i r_j r_k h_i h_j]

/-- Positive-radius framed-sphere composition, returning the three
    positive scale factors together with the composed-map identity. -/
theorem framedSimilarityMap_comp_of_positive_radii
    (c_i c_j c_k : V) (r_i r_j r_k : ℝ)
    (F_i F_j F_k : V ≃ₗ[ℝ] V)
    (h_i : 0 < r_i) (h_j : 0 < r_j) (h_k : 0 < r_k) (x : V) :
    0 < relativeScale r_j r_k ∧
    0 < relativeScale r_i r_j ∧
    0 < relativeScale r_i r_k ∧
    framedSimilarityMap c_j c_k r_j r_k F_j F_k
      (framedSimilarityMap c_i c_j r_i r_j F_i F_j x) =
    framedSimilarityMap c_i c_k r_i r_k F_i F_k x := by
  rcases relativeScale_comp_of_positive_radii r_i r_j r_k h_i h_j h_k
    with ⟨h_jk, h_ij, h_ik, h_scale_comp⟩
  refine ⟨h_jk, h_ij, h_ik, ?_⟩
  unfold framedSimilarityMap similarityMap
  simp only [add_sub_cancel_left]
  rw [map_smul, smul_smul, relativeFrame_comp_apply, h_scale_comp]

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
  simp only [similarityMap, similarityLinearPart, affineIntercept]
  rw [map_sub, smul_sub]
  abel

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
  simp [affineIntercept, similarityLinearPart, map_add, sub_eq_add_neg,
    add_assoc, add_comm, add_left_comm]

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
  change (Submodule.Quotient.mk t : V ⧸ LinearMap.range (identityMinus L)) = 0 ↔
    t ∈ LinearMap.range (identityMinus L)
  exact Submodule.Quotient.mk_eq_zero (LinearMap.range (identityMinus L))

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
noncomputable def linearResidual (σ : ℝ) (Q : Matrix (Fin 4) (Fin 4) ℝ) : ℝ :=
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
      exact (Finset.sum_sq_eq_zero_iff
        (Finset.univ : Finset (Fin 4 × Fin 4)) (matrixResidualEntry Q)).mp hsum_zero
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
#print axioms relativeScale_pos_of_positive_radii
#print axioms relativeScale_comp
#print axioms relativeScale_comp_of_positive_radii
#print axioms framedSimilarityMap_comp
#print axioms framedSimilarityMap_comp_of_positive_radii
#print axioms similarityMap_affine_form
#print axioms affineIntercept_origin_shift
#print axioms affineObstructionClass_eq_zero_iff
#print axioms affineObstructionClass_origin_shift
#print axioms affineIntercept_obstruction_origin_invariant
#print axioms affineObstructionClass_eq_zero_of_surjective
#print axioms linearResidual_eq_zero_iff

end HsHVerification.NadirAffineTranslationQuotient


/-!
## Source-constrained SO(4) frame-convention invariance

The 2026-09-11 Rotoexpando geometry manuscript (HSH_RESOURCES,
`REDISCOVERED/rotoexpando_geometry_definition.tex`, blob
`5c21c6152482249e4432ded423b0040e70fc8b4f`) specifies framed spheres
with `F_i ∈ SO(d)` and the left comparison `Q_ij = F_j F_i⁻¹`.

The separate 2026-09-26 Run 141 sandbox artifact (HsH blob
`8b5b8768527dfff5b198e324b2f823257889f385`) proposes
`D_lin = (log σ)^2 + ‖Q - I‖_F^2`. That residual is sandbox
mathematics, not a Nathan-authored equation or physical law.

The following results prove that the entrywise Frobenius-squared
implementation already used above is invariant under orthogonal
conjugation. The proof needs orthogonality, not the determinant +1
condition; the source's SO(d) frames satisfy this stronger hypothesis.
-/ 

namespace HsHVerification.NadirSO4ResidualConjugacy

open HsHVerification.NadirAffineTranslationQuotient

abbrev Mat4 := Matrix (Fin 4) (Fin 4) ℝ

/-- Two-sided orthogonality of a real 4×4 frame. -/
def IsOrthogonal4 (F : Mat4) : Prop :=
  F.transpose * F = 1 ∧ F * F.transpose = 1

/-- Entrywise Frobenius norm squared. -/
def frobeniusSqEntries (A : Mat4) : ℝ :=
  ∑ p ∈ (Finset.univ : Finset (Fin 4 × Fin 4)), (A p.1 p.2)^2

/-- Trace representation of the Frobenius norm squared. -/
def frobeniusSqTrace (A : Mat4) : ℝ :=
  Matrix.trace (A.transpose * A)

/-- The entrywise and trace definitions of the Frobenius norm squared agree. -/
theorem frobeniusSqEntries_eq_trace (A : Mat4) :
    frobeniusSqEntries A = frobeniusSqTrace A := by
  classical
  unfold frobeniusSqEntries frobeniusSqTrace
  rw [← Finset.univ_product_univ, Finset.sum_product]
  simp only [Matrix.trace, Matrix.diag_apply, Matrix.mul_apply,
    Matrix.transpose_apply, pow_two]
  exact (Finset.sum_comm (s := (Finset.univ : Finset (Fin 4))) (t := (Finset.univ : Finset (Fin 4))) (f := fun i j : Fin 4 => A j i * A j i)).symm

/-- The existing Run 141 residual implementation is exactly the
    log-scale term plus the trace-form Frobenius-squared residual. -/
theorem linearResidual_eq_frobeniusSqTrace
    (σ : ℝ) (Q : Mat4) :
    HsHVerification.NadirAffineTranslationQuotient.linearResidual σ Q =
      (Real.log σ)^2 + frobeniusSqTrace (Q - 1) := by
  unfold HsHVerification.NadirAffineTranslationQuotient.linearResidual
  change (Real.log σ)^2 + frobeniusSqEntries (Q - 1) =
    (Real.log σ)^2 + frobeniusSqTrace (Q - 1)
  exact congrArg (fun x : ℝ => (Real.log σ)^2 + x)
    (frobeniusSqEntries_eq_trace (Q - 1))

/-- The trace-form Frobenius-squared residual is invariant under
    orthogonal conjugation. Only FᵀF = I is used in this norm identity. -/
theorem frobeniusSqTrace_orthogonal_conjugate
    (F A : Mat4) (hF : F.transpose * F = 1) :
    frobeniusSqTrace (F * A * F.transpose) = frobeniusSqTrace A := by
  unfold frobeniusSqTrace
  have htrans :
      (F * A * F.transpose).transpose =
        F * A.transpose * F.transpose := by
    simp [Matrix.transpose_mul, Matrix.mul_assoc]
  rw [htrans]
  calc
    Matrix.trace ((F * A.transpose * F.transpose) *
        (F * A * F.transpose)) =
      Matrix.trace (F * (A.transpose * A) * F.transpose) := by
        congr 1
        calc
          (F * A.transpose * F.transpose) * (F * A * F.transpose) =
              F * A.transpose * (F.transpose * F) * A * F.transpose := by
                simp only [Matrix.mul_assoc]
          _ = F * A.transpose * (1 : Mat4) * A * F.transpose := by
                rw [hF]
          _ = F * (A.transpose * A) * F.transpose := by
                simp [Matrix.mul_assoc]
    _ = Matrix.trace (A.transpose * A) := by
        calc
          Matrix.trace (F * (A.transpose * A) * F.transpose) =
              Matrix.trace (F * ((A.transpose * A) * F.transpose)) := by
                rw [Matrix.mul_assoc]
          _ = Matrix.trace (((A.transpose * A) * F.transpose) * F) := by
                exact Matrix.trace_mul_comm F ((A.transpose * A) * F.transpose)
          _ = Matrix.trace (A.transpose * A) := by
                simp [Matrix.mul_assoc, hF]

/-- Conjugation carries Q-I to F(Q-I)Fᵀ when F is two-sided orthogonal. -/
theorem residualMatrix_orthogonal_conjugate
    (F Q : Mat4) (hF : IsOrthogonal4 F) :
    F * Q * F.transpose - 1 = F * (Q - 1) * F.transpose := by
  calc
    F * Q * F.transpose - 1 =
        F * Q * F.transpose - (F * 1 * F.transpose) := by
          congr 1
          simp [Matrix.mul_assoc, hF.2]
    _ = F * (Q - 1) * F.transpose := by
          simp [Matrix.mul_sub, Matrix.sub_mul, Matrix.mul_assoc]

/-- The exact entrywise Run 141 linear residual is invariant under
    orthogonal conjugation. The scale σ is held fixed and no positivity
    hypothesis is needed for this algebraic equality. -/
theorem linearResidual_orthogonal_conjugate
    (σ : ℝ) (F Q : Mat4) (hF : IsOrthogonal4 F) :
    HsHVerification.NadirAffineTranslationQuotient.linearResidual σ
        (F * Q * F.transpose) =
      HsHVerification.NadirAffineTranslationQuotient.linearResidual σ Q := by
  rw [linearResidual_eq_frobeniusSqTrace,
    linearResidual_eq_frobeniusSqTrace]
  rw [residualMatrix_orthogonal_conjugate F Q hF]
  exact congrArg (fun z : ℝ => (Real.log σ)^2 + z)
    (frobeniusSqTrace_orthogonal_conjugate F (Q - 1) hF.1)

/-- Source-convention left comparison Qᵢⱼ = FⱼFᵢᵀ, with Fᵢᵀ = Fᵢ⁻¹. -/
def leftFrameComparison (F_i F_j : Mat4) : Mat4 :=
  F_j * F_i.transpose

/-- Right increment Eᵢⱼ = FᵢᵀFⱼ, with Fᵢᵀ = Fᵢ⁻¹. -/
def rightFrameIncrement (F_i F_j : Mat4) : Mat4 :=
  F_i.transpose * F_j

/-- The source's left comparison is the initial-frame conjugate of the
    right increment when the initial frame is orthogonal. -/
theorem leftFrameComparison_eq_conjugate_rightFrameIncrement
    (F_i F_j : Mat4) (hFi : IsOrthogonal4 F_i) :
    leftFrameComparison F_i F_j =
      F_i * rightFrameIncrement F_i F_j * F_i.transpose := by
  calc
    F_j * F_i.transpose = 1 * F_j * F_i.transpose := by simp
    _ = (F_i * F_i.transpose) * F_j * F_i.transpose := by
          rw [← hFi.2]
    _ = F_i * (F_i.transpose * F_j) * F_i.transpose := by
          simp [Matrix.mul_assoc]

/-- The Run 141 Frobenius residual is independent of the left/right
    frame-comparison convention under the source's orthogonal-frame
    condition. This is a representation-invariance theorem, not a
    connection, transport, holonomy, or physical-dynamics theorem. -/
theorem linearResidual_frameConvention_invariant
    (σ : ℝ) (F_i F_j : Mat4) (hFi : IsOrthogonal4 F_i) :
    HsHVerification.NadirAffineTranslationQuotient.linearResidual σ
        (leftFrameComparison F_i F_j) =
      HsHVerification.NadirAffineTranslationQuotient.linearResidual σ
        (rightFrameIncrement F_i F_j) := by
  rw [leftFrameComparison_eq_conjugate_rightFrameIncrement F_i F_j hFi]
  exact linearResidual_orthogonal_conjugate σ F_i
    (rightFrameIncrement F_i F_j) hFi

#print axioms frobeniusSqEntries_eq_trace
#print axioms linearResidual_eq_frobeniusSqTrace
#print axioms frobeniusSqTrace_orthogonal_conjugate
#print axioms residualMatrix_orthogonal_conjugate
#print axioms linearResidual_orthogonal_conjugate
#print axioms leftFrameComparison_eq_conjugate_rightFrameIncrement
#print axioms linearResidual_frameConvention_invariant

end HsHVerification.NadirSO4ResidualConjugacy
