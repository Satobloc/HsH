import Mathlib

/-!
# Mira: historical SAT O reconnection weight and phase information gate

Historical source: Satobloc/SAT_THEORY_ARCHIVE_2023-25,
`SAT O Derivations/ACTION PLAN.txt`, blob 06d9a5142ba4521de970d81bde3564fa31ad0d40.
The archived proposal sums exp of NEGATIVE REAL costs over reconnection paths.
These are conditional mathematical facts only, not a physical S-matrix,
reconnection law, or proof of source-to-formalization fidelity.
-/

namespace HsHVerification.MiraReconnectionWeightGate

/-- Every finite sum of real exponential weights is nonnegative. -/
theorem finite_real_exp_weight_nonnegative {ι : Type*}
    (paths : Finset ι) (cost : ι → ℝ) :
    0 ≤ paths.sum (fun i => Real.exp (-cost i)) := by
  apply Finset.sum_nonneg
  intro i hi
  exact le_of_lt (Real.exp_pos _)

/-- A real positive-weight path sum cannot produce a negative real value. -/
theorem finite_real_exp_weight_not_negative {ι : Type*}
    (paths : Finset ι) (cost : ι → ℝ) :
    ¬ paths.sum (fun i => Real.exp (-cost i)) < 0 := by
  exact not_lt_of_ge (finite_real_exp_weight_nonnegative paths cost)

/-- If the source cost does not distinguish two candidate phase states,
then this weight formula cannot distinguish them either. -/
theorem identical_costs_identical_weights {ι : Type*}
    (paths : Finset ι) (costA costB : ι → ℝ)
    (h : ∀ i ∈ paths, costA i = costB i) :
    paths.sum (fun i => Real.exp (-costA i)) =
      paths.sum (fun i => Real.exp (-costB i)) := by
  apply Finset.sum_congr rfl
  intro i hi
  rw [h i hi]

#print axioms finite_real_exp_weight_nonnegative
#print axioms finite_real_exp_weight_not_negative
#print axioms identical_costs_identical_weights

end HsHVerification.MiraReconnectionWeightGate
