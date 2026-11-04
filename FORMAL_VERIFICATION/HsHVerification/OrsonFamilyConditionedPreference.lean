import Mathlib

/-!
# Orson P1: family-conditioned judge preference and candidate-quality confounding

Primary source: Awuni et al., "Who Judges Matters: Measuring Family-Conditioned
Preference in LLM-as-Judge Panels", arXiv:2609.17857v1 (2026), reviewed
2026-11-04. The source uses a balanced four-family judge × candidate panel.

Let P(j,c) = μ + a_j + b_c + γ_jc, where a is the judge main effect,
b the candidate-family main effect, and γ the judge × candidate interaction.
The source's balanced row means are 0.5. Together with the stated zero-sum
candidate and row/column double-centering constraints, the family contrasts
are:

  R_f = P(f,f) - mean_{c ≠ f} P(f,c) = (4/3)(b_f + γ_ff)
  C_f = P(f,f) - mean_{j ≠ f} P(j,f) = (4/3)γ_ff
  R_f - C_f = (4/3)b_f.

The hypothesis hMean encodes the source's balanced row mean after the
zero-sum terms are applied: μ + a_j = 1/2 for every judge family.
rowContrast and columnContrast use the total-minus-diagonal identity to
represent the mean of the other three cells.

Lean verifies these conditional algebraic identities only. It does not
verify the source's empirical cell means, raw data, randomization, model
independence, human anchor, or causal interpretation. It does not show that
the same effect occurs in the frozen ConsistencyBench P1 archive, which has
one shared evaluator and no cross-model peer exposure.
-/ 

namespace HsHVerification
namespace OrsonFamilyConditionedPreference

abbrev Family := Fin 4

/-- Source decomposition: judge main effect + candidate main effect + interaction. -/
def cell (μ : ℝ) (a b : Family → ℝ)
    (γ : Family → Family → ℝ) (j c : Family) : ℝ :=
  μ + a j + b c + γ j c

/-- Total support in one judge-family row. -/
def rowTotal (μ : ℝ) (a b : Family → ℝ)
    (γ : Family → Family → ℝ) (j : Family) : ℝ :=
  ∑ c : Family, cell μ a b γ j c

/-- Total support in one candidate-family column. -/
def columnTotal (μ : ℝ) (a b : Family → ℝ)
    (γ : Family → Family → ℝ) (c : Family) : ℝ :=
  ∑ j : Family, cell μ a b γ j c

/-- Diagonal cell minus the mean of the other three judge-family cells in its row. -/
def rowContrast (μ : ℝ) (a b : Family → ℝ)
    (γ : Family → Family → ℝ) (f : Family) : ℝ :=
  cell μ a b γ f f - (rowTotal μ a b γ f - cell μ a b γ f f) / 3

/-- Diagonal cell minus the mean of the other three candidate-family cells in its column. -/
def columnContrast (μ : ℝ) (a b : Family → ℝ)
    (γ : Family → Family → ℝ) (f : Family) : ℝ :=
  cell μ a b γ f f - (columnTotal μ a b γ f - cell μ a b γ f f) / 3

/-- Under the source's balanced-row and zero-sum assumptions, each row totals 2. -/
theorem rowTotal_eq_two
    (μ : ℝ) (a b : Family → ℝ) (γ : Family → Family → ℝ)
    (hMean : ∀ j : Family, μ + a j = (1 / 2 : ℝ))
    (hB : (∑ c : Family, b c) = 0)
    (hGammaRow : ∀ j : Family, (∑ c : Family, γ j c) = 0)
    (j : Family) :
    rowTotal μ a b γ j = 2 := by
  classical
  have hCell (c : Family) :
      cell μ a b γ j c = (1 / 2 + b c) + γ j c := by
    unfold cell
    rw [hMean j]
    ring
  unfold rowTotal
  calc
    (∑ c : Family, cell μ a b γ j c) =
        ∑ c : Family, ((1 / 2 + b c) + γ j c) := by
          apply Finset.sum_congr rfl
          intro c hc
          exact hCell c
    _ = (∑ c : Family, (1 / 2 + b c)) +
        ∑ c : Family, γ j c := by
          rw [Finset.sum_add_distrib]
    _ = (∑ c : Family, (1 / 2 : ℝ)) +
        (∑ c : Family, b c) + ∑ c : Family, γ j c := by
          rw [Finset.sum_add_distrib]
    _ = 2 := by
          rw [hB, hGammaRow j]
          norm_num

/-- Under balanced row means and column double-centering, the candidate column total is 2+4b_f. -/
theorem columnTotal_eq_two_add_four_candidate
    (μ : ℝ) (a b : Family → ℝ) (γ : Family → Family → ℝ)
    (hMean : ∀ j : Family, μ + a j = (1 / 2 : ℝ))
    (hGammaColumn : ∀ c : Family, (∑ j : Family, γ j c) = 0)
    (f : Family) :
    columnTotal μ a b γ f = 2 + 4 * b f := by
  classical
  have hCell (j : Family) :
      cell μ a b γ j f = (1 / 2 + b f) + γ j f := by
    unfold cell
    rw [hMean j]
    ring
  unfold columnTotal
  calc
    (∑ j : Family, cell μ a b γ j f) =
        ∑ j : Family, ((1 / 2 + b f) + γ j f) := by
          apply Finset.sum_congr rfl
          intro j hj
          exact hCell j
    _ = (∑ j : Family, (1 / 2 + b f)) +
        ∑ j : Family, γ j f := by
          rw [Finset.sum_add_distrib]
    _ = 2 + 4 * b f := by
          rw [hGammaColumn f]
          simp
          ring

/-- The naive same-family row contrast includes both candidate quality and diagonal interaction. -/
theorem rowContrast_eq_candidate_plus_interaction
    (μ : ℝ) (a b : Family → ℝ) (γ : Family → Family → ℝ)
    (hMean : ∀ j : Family, μ + a j = (1 / 2 : ℝ))
    (hB : (∑ c : Family, b c) = 0)
    (hGammaRow : ∀ j : Family, (∑ c : Family, γ j c) = 0)
    (f : Family) :
    rowContrast μ a b γ f = (4 / 3 : ℝ) * (b f + γ f f) := by
  have hDiag : cell μ a b γ f f = (1 / 2 + b f) + γ f f := by
    unfold cell
    rw [hMean f]
    ring
  unfold rowContrast
  rw [hDiag, rowTotal_eq_two μ a b γ hMean hB hGammaRow f]
  ring

/-- Holding the candidate family fixed isolates the diagonal interaction under column centering. -/
theorem columnContrast_eq_diagonal_interaction
    (μ : ℝ) (a b : Family → ℝ) (γ : Family → Family → ℝ)
    (hMean : ∀ j : Family, μ + a j = (1 / 2 : ℝ))
    (hGammaColumn : ∀ c : Family, (∑ j : Family, γ j c) = 0)
    (f : Family) :
    columnContrast μ a b γ f = (4 / 3 : ℝ) * γ f f := by
  have hDiag : cell μ a b γ f f = (1 / 2 + b f) + γ f f := by
    unfold cell
    rw [hMean f]
    ring
  unfold columnContrast
  rw [hDiag, columnTotal_eq_two_add_four_candidate
    μ a b γ hMean hGammaColumn f]
  ring

/-- Row-minus-column contrast isolates candidate-family strength under all stated balance assumptions. -/
theorem row_minus_column_identifies_candidate_effect
    (μ : ℝ) (a b : Family → ℝ) (γ : Family → Family → ℝ)
    (hMean : ∀ j : Family, μ + a j = (1 / 2 : ℝ))
    (hB : (∑ c : Family, b c) = 0)
    (hGammaRow : ∀ j : Family, (∑ c : Family, γ j c) = 0)
    (hGammaColumn : ∀ c : Family, (∑ j : Family, γ j c) = 0)
    (f : Family) :
    rowContrast μ a b γ f - columnContrast μ a b γ f =
      (4 / 3 : ℝ) * b f := by
  rw [rowContrast_eq_candidate_plus_interaction
      μ a b γ hMean hB hGammaRow f,
    columnContrast_eq_diagonal_interaction
      μ a b γ hMean hGammaColumn f]
  ring

/-- The independent symmetric content-noise model has a 50% reversal ceiling. -/
theorem symmetric_content_noise_reversal_le_half (p : ℝ) :
    2 * p * (1 - p) ≤ (1 / 2 : ℝ) := by
  nlinarith [sq_nonneg (p - (1 / 2 : ℝ))]

/-- Equality at the symmetric-noise ceiling occurs only at p=1/2. -/
theorem symmetric_content_noise_reversal_eq_half_iff (p : ℝ) :
    2 * p * (1 - p) = (1 / 2 : ℝ) ↔ p = (1 / 2 : ℝ) := by
  constructor
  · intro h
    nlinarith [sq_nonneg (p - (1 / 2 : ℝ))]
  · intro h
    rw [h]
    norm_num

#print axioms rowTotal_eq_two
#print axioms columnTotal_eq_two_add_four_candidate
#print axioms rowContrast_eq_candidate_plus_interaction
#print axioms columnContrast_eq_diagonal_interaction
#print axioms row_minus_column_identifies_candidate_effect
#print axioms symmetric_content_noise_reversal_le_half
#print axioms symmetric_content_noise_reversal_eq_half_iff

end OrsonFamilyConditionedPreference
end HsHVerification
