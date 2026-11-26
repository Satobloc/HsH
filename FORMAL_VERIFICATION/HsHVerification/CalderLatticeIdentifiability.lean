import Mathlib
import HsHVerification.NadirProjectionCoarseGrainFactorization

open HsHVerification.NadirProjectionCoarseGrainFactorization

/-!
# Lattice dimension/degree non-identifiability

The regular-lattice rows in the RHEON geometry ladder use coordination
number k = 2d: (d,k) = (1,2), (2,4), (3,6).

For an additive linear response model with separate coefficients for
dimension and coordination number, every such row depends on the parameter
pair only through beta_d + 2 beta_k. The two coefficients therefore cannot
be separately recovered from those lattice rows alone.

This module proves that exact algebraic non-identifiability using the
existing projection/factorization theorem. It does not invalidate RHEON's
descriptive results, establish a causal effect, or identify graph topology
with physical spatial dimension. The mean-field graph is a separate
all-to-all topology and is not treated as a fourth lattice dimension.
-/

namespace HsHVerification.CalderLatticeIdentifiability

abbrev Coefficients := ℝ × ℝ

/-- The only coefficient combination visible on regular lattices with k = 2d. -/
def identifiedCombination (β : Coefficients) : ℝ :=
  β.1 + 2 * β.2

/-- The coefficient assigned to the lattice-dimension term. -/
def dimensionCoefficient (β : Coefficients) : ℝ :=
  β.1

/-- The coefficient assigned to the coordination-number term. -/
def degreeCoefficient (β : Coefficients) : ℝ :=
  β.2

/-- On a regular-lattice row, the additive linear predictor sees only the
    combined coefficient beta_d + 2 beta_k. -/
theorem lattice_predictor_factors
    (d βd βk : ℝ) :
    d * βd + (2 * d) * βk =
      d * identifiedCombination (βd, βk) := by
  simp [identifiedCombination]
  ring

/-- Two distinct coefficient pairs have the same identified combination. -/
theorem shared_combination_witness :
    identifiedCombination (0, 0) = identifiedCombination (2, -1) ∧
    dimensionCoefficient (0, 0) ≠ dimensionCoefficient (2, -1) ∧
    degreeCoefficient (0, 0) ≠ degreeCoefficient (2, -1) := by
  norm_num [identifiedCombination, dimensionCoefficient, degreeCoefficient]

/-- Dimension coefficient cannot be recovered as a deterministic function
    of the combined coefficient on the regular-lattice design. -/
theorem dimension_coefficient_not_descend :
    ¬ ∃ C3 : Set.range identifiedCombination → ℝ,
      ∀ β, C3
        (HsHVerification.NadirProjectionCoarseGrainFactorization.imageProjection
          identifiedCombination β) =
        dimensionCoefficient β := by
  exact no_inducedCoarseGraining_of_fiber_mismatch
      identifiedCombination id dimensionCoefficient
      (0, 0) (2, -1)
      (by norm_num [identifiedCombination])
      (by norm_num [dimensionCoefficient])

/-- Coordination-number coefficient likewise cannot be recovered
    separately from the same combined coefficient. -/
theorem degree_coefficient_not_descend :
    ¬ ∃ C3 : Set.range identifiedCombination → ℝ,
      ∀ β, C3
        (HsHVerification.NadirProjectionCoarseGrainFactorization.imageProjection
          identifiedCombination β) =
        degreeCoefficient β := by
  exact no_inducedCoarseGraining_of_fiber_mismatch
      identifiedCombination id degreeCoefficient
      (0, 0) (2, -1)
      (by norm_num [identifiedCombination])
      (by norm_num [degreeCoefficient])

#print axioms lattice_predictor_factors
#print axioms dimension_coefficient_not_descend
#print axioms degree_coefficient_not_descend

end HsHVerification.CalderLatticeIdentifiability
