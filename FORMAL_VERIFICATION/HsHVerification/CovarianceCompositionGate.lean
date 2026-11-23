import Mathlib

/-!
# Covariance transport through composed observation maps

This module supplies a reusable matrix-level contract for uncertainty
transport through a chain of linear maps. The input covariance is a FULL
joint covariance matrix: off-diagonal blocks are retained, so no
independence between stages or sources is assumed.

The finite two-input witness proves that marginal variances alone do not
determine the variance of a mixed readout. Two symmetric positive
semidefinite covariance matrices can have identical diagonals and produce
different output variances under the same sum map.

This is abstract mathematics and a workflow contract. It instantiates no
physical system, H(s)H map, dataset, unit, calibration, fit, or prediction.
The covariance pushforward formula is standard linear uncertainty
propagation; the theorem does not validate any source-to-map translation.
-/

namespace HsHVerification.CovarianceCompositionGate

open Matrix

/-- Push a full covariance matrix through a linear observation map. -/
def covariancePushforward {α β : Type*}
    [Fintype α] [DecidableEq α]
    [Fintype β] [DecidableEq β]
    (A : Matrix β α ℝ) (C : Matrix α α ℝ) : Matrix β β ℝ :=
  A * C * A.transpose

/--
Covariance transport is compositional: pushing through A and then B is
identical to pushing once through the composite map B ∘ A.
No diagonalization or independence assumption occurs.
-/
theorem covariancePushforward_comp
    {α β γ : Type*}
    [Fintype α] [DecidableEq α]
    [Fintype β] [DecidableEq β]
    [Fintype γ] [DecidableEq γ]
    (A : Matrix β α ℝ) (B : Matrix γ β ℝ)
    (C : Matrix α α ℝ) :
    covariancePushforward (B * A) C =
      covariancePushforward B (covariancePushforward A C) := by
  simp [covariancePushforward, Matrix.mul_assoc, Matrix.transpose_mul]

/-- A symmetric input covariance remains symmetric after pushforward. -/
theorem covariancePushforward_symmetric
    {α β : Type*}
    [Fintype α] [DecidableEq α]
    [Fintype β] [DecidableEq β]
    (A : Matrix β α ℝ) (C : Matrix α α ℝ)
    (hC : C.transpose = C) :
    (covariancePushforward A C).transpose =
      covariancePushforward A C := by
  simp [covariancePushforward, Matrix.transpose_mul,
    Matrix.mul_assoc, hC]

/-- A symbolic symmetric two-input covariance matrix. -/
def covariance2 (v₀ v₁ c : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  !![v₀, c; c, v₁]

/-- The same one-channel sum readout is applied in both witness cases. -/
def sumReadout : Matrix (Fin 1) (Fin 2) ℝ := !![1, 1]

/-- The two marginal variances, with cross-covariance deliberately omitted. -/
def diagonalEntries (C : Matrix (Fin 2) (Fin 2) ℝ) : Fin 2 → ℝ :=
  fun i => C i i

/-- The explicit quadratic form vᵀ C v for a two-input real matrix. -/
def quadraticForm2 (C : Matrix (Fin 2) (Fin 2) ℝ)
    (v : Fin 2 → ℝ) : ℝ :=
  v 0 * (C 0 0 * v 0 + C 0 1 * v 1) +
  v 1 * (C 1 0 * v 0 + C 1 1 * v 1)

/--
For this finite witness, admissibility means symmetry and nonnegativity of
the quadratic form for every vector. This is the positive-semidefinite
condition, stated explicitly rather than inferred from diagonal entries.
-/
def IsCovariance2 (C : Matrix (Fin 2) (Fin 2) ℝ) : Prop :=
  C.transpose = C ∧ ∀ v : Fin 2 → ℝ, 0 ≤ quadraticForm2 C v

/-- Same unit marginal variances with zero cross-covariance (not an independence claim). -/
def zeroCrossCovariance : Matrix (Fin 2) (Fin 2) ℝ :=
  covariance2 1 1 0

/-- Same unit marginal variances with perfect positive cross-covariance. -/
def sharedCovariance : Matrix (Fin 2) (Fin 2) ℝ :=
  covariance2 1 1 1

/-- The sum readout sees both off-diagonal covariance terms. -/
theorem sumReadout_variance_formula (v₀ v₁ c : ℝ) :
    covariancePushforward sumReadout (covariance2 v₀ v₁ c) 0 0 =
      v₀ + v₁ + 2 * c := by
  simp [covariancePushforward, sumReadout, covariance2,
    Matrix.mul_apply, Fin.sum_univ_two]
  ring

/-- The two covariance matrices have identical marginal variances. -/
theorem same_marginals :
    diagonalEntries zeroCrossCovariance =
      diagonalEntries sharedCovariance := by
  funext i
  fin_cases i <;>
    norm_num [diagonalEntries, zeroCrossCovariance,
      sharedCovariance, covariance2]

/-- The zero-cross-covariance witness is symmetric and positive semidefinite. -/
theorem zeroCrossCovariance_valid :
    IsCovariance2 zeroCrossCovariance := by
  constructor
  · ext i j
    fin_cases i <;> fin_cases j <;>
      norm_num [zeroCrossCovariance, covariance2]
  · intro v
    norm_num [quadraticForm2, zeroCrossCovariance, covariance2]
    nlinarith [sq_nonneg (v 0), sq_nonneg (v 1)]

/-- The perfectly correlated witness is symmetric and positive semidefinite. -/
theorem sharedCovariance_valid :
    IsCovariance2 sharedCovariance := by
  constructor
  · ext i j
    fin_cases i <;> fin_cases j <;>
      norm_num [sharedCovariance, covariance2]
  · intro v
    norm_num [quadraticForm2, sharedCovariance, covariance2]
    nlinarith [sq_nonneg (v 0 + v 1)]

/-- The same sum map gives variance 2 in the first witness. -/
theorem sumReadout_variance_zeroCross :
    covariancePushforward sumReadout zeroCrossCovariance 0 0 = 2 := by
  calc
    covariancePushforward sumReadout zeroCrossCovariance 0 0 =
        1 + 1 + 2 * 0 := by
          simpa [zeroCrossCovariance] using
            (sumReadout_variance_formula 1 1 0)
    _ = 2 := by norm_num

/-- The same sum map gives variance 4 in the second witness. -/
theorem sumReadout_variance_shared :
    covariancePushforward sumReadout sharedCovariance 0 0 = 4 := by
  calc
    covariancePushforward sumReadout sharedCovariance 0 0 =
        1 + 1 + 2 * 1 := by
          simpa [sharedCovariance] using
            (sumReadout_variance_formula 1 1 1)
    _ = 4 := by norm_num

/--
No function of the two marginal variances alone can recover the output
variance for every admissible joint covariance matrix under the sum map.
The omitted cross-covariance is an essential input.
-/
theorem diagonal_only_cannot_determine_output_variance :
    ¬ ∃ f : (Fin 2 → ℝ) → ℝ,
      ∀ C, IsCovariance2 C →
        f (diagonalEntries C) =
          covariancePushforward sumReadout C 0 0 := by
  rintro ⟨f, hf⟩
  have hsame :
      f (diagonalEntries zeroCrossCovariance) =
        f (diagonalEntries sharedCovariance) :=
    congrArg f same_marginals
  rw [hf zeroCrossCovariance zeroCrossCovariance_valid,
    hf sharedCovariance sharedCovariance_valid,
    sumReadout_variance_zeroCross,
    sumReadout_variance_shared] at hsame
  norm_num at hsame

#print axioms covariancePushforward_comp
#print axioms covariancePushforward_symmetric
#print axioms sumReadout_variance_formula
#print axioms same_marginals
#print axioms zeroCrossCovariance_valid
#print axioms sharedCovariance_valid
#print axioms diagonal_only_cannot_determine_output_variance

end HsHVerification.CovarianceCompositionGate
