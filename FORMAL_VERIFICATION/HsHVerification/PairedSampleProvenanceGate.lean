import Mathlib

/-!
# Paired-sample identity and covariance identifiability

A paired row carries two channel observations under one shared acquisition
key. Channel, calibration, and sample-point identities remain channel-specific;
they are not required to be equal.

The finite witness below shows that identical unordered marginal values can
produce opposite cross-covariances under different pairings. Therefore
marginal values without a pairing relation do not identify joint covariance.

This is a pure mathematical witness, not a physical fixture or dataset. It
does not instantiate a measured system, instrument, calibration, H(s)H map,
fit, prediction, or empirical result. The acquisition key is only a typed
admission contract; its truth must still be established from source records.
-/

namespace HsHVerification.PairedSampleProvenanceGate

/-- Shared identity of one acquisition/frame/grid event. -/
structure AcquisitionKey where
  systemId : String
  runId : String
  acquisitionId : String
  frameId : String
  timeIndex : String
  axialGridId : String
  deriving DecidableEq, Repr

/-- A channel-specific observation; channels/calibrations/points may differ. -/
structure ChannelObservation where
  key : AcquisitionKey
  channelId : String
  calibrationId : String
  samplePointId : String
  value : ℝ

/--
A row is admissible only when both channel observations refer to the same
declared acquisition key. The pairing rule and point identities remain
explicit data; key equality alone does not validate their source provenance.
-/
structure PairedObservation where
  pairingRuleId : String
  first : ChannelObservation
  second : ChannelObservation
  sameAcquisition : first.key = second.key

/-- The shared-acquisition condition is part of the paired-row type. -/
theorem paired_observation_key_matches (p : PairedObservation) :
    p.first.key = p.second.key := p.sameAcquisition

/-- A two-value marginal summary that forgets observation order/pairing. -/
def unorderedMarginals2 (x : Fin 2 → ℝ) : ℝ × ℝ :=
  (min (x 0) (x 1), max (x 0) (x 1))

/-- Mean of two observations. -/
def mean2 (x : Fin 2 → ℝ) : ℝ :=
  (x 0 + x 1) / 2

/-- Empirical centered cross-product with 1/n normalization for n = 2. -/
def empiricalCrossCovariance2 (x y : Fin 2 → ℝ) : ℝ :=
  ((x 0 - mean2 x) * (y 0 - mean2 y) +
   (x 1 - mean2 x) * (y 1 - mean2 y)) / 2

def leftValues : Fin 2 → ℝ := ![-1, 1]
def alignedRight : Fin 2 → ℝ := ![-1, 1]
def reversedRight : Fin 2 → ℝ := ![1, -1]

/-- Reordering one channel leaves its unordered two-value marginal unchanged. -/
theorem aligned_and_reversed_right_have_same_marginals :
    unorderedMarginals2 alignedRight =
      unorderedMarginals2 reversedRight := by
  simp [unorderedMarginals2, alignedRight, reversedRight, min_comm, max_comm]

theorem aligned_cross_covariance_is_one :
    empiricalCrossCovariance2 leftValues alignedRight = 1 := by
  norm_num [empiricalCrossCovariance2, mean2, leftValues, alignedRight]

theorem reversed_cross_covariance_is_neg_one :
    empiricalCrossCovariance2 leftValues reversedRight = -1 := by
  norm_num [empiricalCrossCovariance2, mean2, leftValues, reversedRight]

/--
No deterministic function of the two unordered marginal summaries can recover
the paired cross-covariance for every two-observation arrangement.
The two arrangements have identical marginal value sets but opposite
cross-covariances.
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

#print axioms paired_observation_key_matches
#print axioms aligned_and_reversed_right_have_same_marginals
#print axioms aligned_cross_covariance_is_one
#print axioms reversed_cross_covariance_is_neg_one
#print axioms unordered_marginals_do_not_determine_cross_covariance

end HsHVerification.PairedSampleProvenanceGate
