import Mathlib

/-!
# Why paired sample identity is necessary for joint covariance

The source-specific sample-key contract is already formalized in Nadir PR
#1189, module `HsHVerification.NadirVortexPairedSampleIdentity`. That module
requires the two opposing contour observations to share the complete
(run/acquisition/camera/lens/view/calibration/grid/frame/index) key before
the source-defined two-channel readout is admitted.

This module does not duplicate that key type. It proves a separate,
general information limit: identical unordered marginal values can yield
different cross-covariances under different pairings. Therefore marginal
summaries alone cannot recover a joint covariance.

The finite witness is pure mathematics, not a physical fixture or dataset.
It does not instantiate the Kelvin-vortex experiment, its camera system,
the Figshare files, an H(s)H map, a fit, a prediction, or an empirical result.
-/

namespace HsHVerification.PairedSampleProvenanceGate

/-- An unordered two-value marginal summary that forgets pairing/order. -/
def unorderedMarginals2 (x : Fin 2 → ℝ) : ℝ × ℝ :=
  (min (x 0) (x 1), max (x 0) (x 1))

/-- Mean of two observations. -/
noncomputable def mean2 (x : Fin 2 → ℝ) : ℝ :=
  (x 0 + x 1) / 2

/-- Empirical centered cross-product with 1/n normalization for n = 2. -/
noncomputable def empiricalCrossCovariance2 (x y : Fin 2 → ℝ) : ℝ :=
  ((x 0 - mean2 x) * (y 0 - mean2 y) +
   (x 1 - mean2 x) * (y 1 - mean2 y)) / 2

def leftValues : Fin 2 → ℝ := ![-1, 1]
def alignedRight : Fin 2 → ℝ := ![-1, 1]
def reversedRight : Fin 2 → ℝ := ![1, -1]

/-- Reordering one channel leaves its unordered two-value marginal unchanged. -/
theorem aligned_and_reversed_right_have_same_marginals :
    unorderedMarginals2 alignedRight =
      unorderedMarginals2 reversedRight := by
  norm_num [unorderedMarginals2, alignedRight, reversedRight]

theorem aligned_cross_covariance_is_one :
    empiricalCrossCovariance2 leftValues alignedRight = 1 := by
  norm_num [empiricalCrossCovariance2, mean2, leftValues, alignedRight]

theorem reversed_cross_covariance_is_neg_one :
    empiricalCrossCovariance2 leftValues reversedRight = -1 := by
  norm_num [empiricalCrossCovariance2, mean2, leftValues, reversedRight]

/--
No deterministic function of the two unordered marginal summaries can recover
the paired cross-covariance for every two-observation arrangement. The two
arrangements have identical marginal value sets but opposite cross-covariances.
-/
theorem unordered_marginals_do_not_determine_cross_covariance :
    ¬ ∃ f : (ℝ × ℝ) → (ℝ × ℝ) → ℝ,
      ∀ x y,
        f (unorderedMarginals2 x) (unorderedMarginals2 y) =
          empiricalCrossCovariance2 x y := by
  rintro ⟨f, hf⟩
  have hsame :
      f (unorderedMarginals2 leftValues)
          (unorderedMarginals2 alignedRight) =
        f (unorderedMarginals2 leftValues)
          (unorderedMarginals2 reversedRight) := by
    rw [aligned_and_reversed_right_have_same_marginals]
  rw [hf leftValues alignedRight, hf leftValues reversedRight,
    aligned_cross_covariance_is_one, reversed_cross_covariance_is_neg_one] at hsame
  norm_num at hsame

#print axioms aligned_and_reversed_right_have_same_marginals
#print axioms aligned_cross_covariance_is_one
#print axioms reversed_cross_covariance_is_neg_one
#print axioms unordered_marginals_do_not_determine_cross_covariance

end HsHVerification.PairedSampleProvenanceGate
