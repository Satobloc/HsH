import Mathlib

/-!
# Hale: mathematical audit of the secondary H(s)H manifold synthesis

Source under audit:
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H Dev +/H(s)H MANIFOLDS.txt`
- Git blob SHA-1: `54f2f530697ab6e9c44758ce3406c4144915c73d`
- File-header date: 2026-07-04.
- The bracketed numbers in that synthesis (for example `[446, 594, 811]`)
  are NotebookLM/source-list locators, not raw conversation-message IDs.
  No primary role graph is asserted by this module.

This module formalizes two conditional mathematical checks on expressions
written in that secondary synthesis. It does not establish that the formulas
are Nathan Direct, that the synthesis transcribed its sources faithfully, or
that any physical model is true.
-/

namespace HsHVerification.HaleManifoldsSynthesisAudit

abbrev Index := Fin 4
abbrev Vector4 := Index → ℝ
abbrev Matrix4 := Matrix Index Index ℝ

/-- A skew generator rotating one coordinate two-plane in Euclidean four-space. -/
def onePlaneGenerator (ω : ℝ) : Matrix4 :=
  fun i j =>
    if i.val = 1 ∧ j.val = 2 then -ω
    else if i.val = 2 ∧ j.val = 1 then ω
    else 0

/-- A unit vector in the fixed two-plane of the one-plane rotation generator. -/
def e0 : Vector4 := fun i => if i.val = 0 then 1 else 0

/-- Squared Euclidean norm of a four-coordinate vector. -/
def sqNorm (x : Vector4) : ℝ :=
  ∑ i, x i ^ 2

/-- Frobenius norm squared, written as the sum of squared matrix entries. -/
def frobeniusSq (A : Matrix4) : ℝ :=
  ∑ i, ∑ j, A j i ^ 2

theorem e0_unit : sqNorm e0 = 1 := by
  norm_num [sqNorm, e0, Fin.sum_univ_succ]

/-- The example really is a skew-symmetric generator. -/
theorem onePlaneGenerator_skew (ω : ℝ) :
    Matrix.transpose (onePlaneGenerator ω) = -onePlaneGenerator ω := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [onePlaneGenerator]

/-- The selected unit orientation lies in the generator's kernel. -/
theorem onePlaneGenerator_mulVec_e0 (ω : ℝ) :
    Matrix.mulVec (onePlaneGenerator ω) e0 = 0 := by
  ext i
  fin_cases i <;> norm_num [Matrix.mulVec, onePlaneGenerator, e0,
    Fin.sum_univ_succ]

/-- The matrix trace Tr(AᵀA) is the Frobenius norm squared. -/
theorem trace_transpose_mul_eq_frobeniusSq (A : Matrix4) :
    Matrix.trace (Matrix.transpose A * A) = frobeniusSq A := by
  simp [Matrix.trace, Matrix.mul_apply, frobeniusSq, Matrix.transpose]

/-- The one-plane generator has nonzero Frobenius trace for nonzero frequency. -/
theorem onePlaneGenerator_frobeniusSq (ω : ℝ) :
    frobeniusSq (onePlaneGenerator ω) = 2 * ω ^ 2 := by
  norm_num [frobeniusSq, onePlaneGenerator, Fin.sum_univ_succ] <;> ring

/--
The trace term is not the pointwise angular-speed squared for every unit
orientation: this unit vector is fixed by the generator, while the generator
has positive Frobenius norm whenever ω ≠ 0. A frame-level or ensemble-level
interpretation remains possible, but requires a separately stated averaging
measure or inertia metric.
-/
theorem trace_not_pointwise_speed (ω : ℝ) (hω : ω ≠ 0) :
    Matrix.trace (Matrix.transpose (onePlaneGenerator ω) *
      onePlaneGenerator ω) ≠
        sqNorm (Matrix.mulVec (onePlaneGenerator ω) e0) := by
  rw [trace_transpose_mul_eq_frobeniusSq,
    onePlaneGenerator_frobeniusSq,
    onePlaneGenerator_mulVec_e0]
  simp [sqNorm]
  exact ne_of_gt (mul_pos (by norm_num : (0 : ℝ) < 2)
    (sq_pos_of_ne_zero hω))

/--
The written quotient expression
  (ℝ⁺ × S³) / ((x, λ) ~ (-x, -λ))
does not define an involution of the stated positive-radial domain:
for every λ > 0, the transformed radial coordinate -λ is negative.
This checks only the domain mismatch in the written expression; it does not
choose a replacement domain or quotient.
-/
theorem radial_sign_flip_not_positive (λ : ℝ) (hλ : 0 < λ) :
    ¬ 0 < -λ := by
  linarith

#eval frobeniusSq (onePlaneGenerator 1)
#eval sqNorm (Matrix.mulVec (onePlaneGenerator 1) e0)

#print axioms trace_not_pointwise_speed
#print axioms radial_sign_flip_not_positive

end HsHVerification.HaleManifoldsSynthesisAudit
