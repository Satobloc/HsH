import Mathlib

open Matrix

namespace HsHVerification

/-!
A source-fidelity check for the distinction between a three-strand braid and
its endpoint permutation.  The two matrices below satisfy the Artin braid
relation.  Their product has a nontrivial full-twist image, while the
corresponding adjacent-transposition permutation has order three.

This is algebra only.  It does not identify a physical H(s)H filament,
worldtube, timesheet, connection, or measured observable with a braid.
-/

abbrev Mat2 := Matrix (Fin 2) (Fin 2) ℤ

def sigma1Mat : Mat2 := !![1, 1; 0, 1]
def sigma2Mat : Mat2 := !![1, 0; -1, 1]

def sigma1InvMat : Mat2 := !![1, -1; 0, 1]
def sigma2InvMat : Mat2 := !![1, 0; 1, 1]

def minusIdentity : Mat2 := !![-1, 0; 0, -1]

theorem sigma1_left_inverse : sigma1InvMat * sigma1Mat = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [sigma1InvMat, sigma1Mat, Matrix.mul_apply, Fin.sum_univ_two]

theorem sigma1_right_inverse : sigma1Mat * sigma1InvMat = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [sigma1InvMat, sigma1Mat, Matrix.mul_apply, Fin.sum_univ_two]

theorem sigma2_left_inverse : sigma2InvMat * sigma2Mat = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [sigma2InvMat, sigma2Mat, Matrix.mul_apply, Fin.sum_univ_two]

theorem sigma2_right_inverse : sigma2Mat * sigma2InvMat = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [sigma2InvMat, sigma2Mat, Matrix.mul_apply, Fin.sum_univ_two]

/-- The matrix assignments satisfy the Artin relation for B₃ generators. -/
theorem artin_braid_relation_matrix :
    sigma1Mat * sigma2Mat * sigma1Mat =
      sigma2Mat * sigma1Mat * sigma2Mat := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [sigma1Mat, sigma2Mat, Matrix.mul_apply, Fin.sum_univ_two]

/-- The matrix image of the full twist is -I, hence is not the identity. -/
theorem full_twist_matrix :
    (sigma1Mat * sigma2Mat) ^ 3 = minusIdentity := by
  simp only [pow_succ, pow_one]
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [sigma1Mat, sigma2Mat, minusIdentity,
      Matrix.mul_apply, Fin.sum_univ_two]

theorem full_twist_matrix_ne_one :
    (sigma1Mat * sigma2Mat) ^ 3 ≠ (1 : Mat2) := by
  rw [full_twist_matrix]
  intro h
  have h00 := congrArg (fun M : Mat2 => M 0 0) h
  norm_num [minusIdentity] at h00

def perm1 : Equiv.Perm (Fin 3) := Equiv.swap 0 1
def perm2 : Equiv.Perm (Fin 3) := Equiv.swap 1 2

/-- Adjacent transpositions also satisfy the Artin relation. -/
theorem artin_braid_relation_perm :
    perm1 * perm2 * perm1 = perm2 * perm1 * perm2 := by
  ext i
  fin_cases i <;> decide

/-- The permutation image of the full twist is the identity. -/
theorem full_twist_perm :
    (perm1 * perm2) ^ 3 = (1 : Equiv.Perm (Fin 3)) := by
  ext i
  fin_cases i <;> decide

/--
The endpoint-permutation representation loses braid information: this
full-twist word has identity permutation image but a nonidentity matrix image.
The result is a statement about the displayed algebraic representations only.
-/
theorem permutation_closure_does_not_determine_braid :
    (perm1 * perm2) ^ 3 = 1 ∧
      (sigma1Mat * sigma2Mat) ^ 3 ≠ (1 : Mat2) := by
  exact ⟨full_twist_perm, full_twist_matrix_ne_one⟩

end HsHVerification
