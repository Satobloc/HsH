import Mathlib
import HsHVerification.AldusTemporalProvenance

/-!
# Producer quiescence before prediction sealing

This module isolates one missing temporal edge in the existing P2 chronology
wrapper. The wrapper currently proves prediction-seal-before-holdout-unblinding.
It does not carry a producer-run completion event or prove that the producer
was quiescent before the prediction was sealed.

The interval-order theorems below are conditional on source-bound
`TimeInterval` values whose clock domain and scale are already known and
comparable. They establish that strict interval separation orders every
admissible event time, not merely the interval endpoints.

This module deliberately uses no concrete timestamps, numeric witness,
`#eval` fixture, or empirical claim. The previous exact-point witness was
removed because it encoded an ordinal as UTC/Unix-seconds and was not a
source-backed measurement.

These proofs do not authenticate event records, bind events to one provider
run, validate interval bounds or clock calibration, prove complete access
logging, prove holdout inaccessibility, or validate any physical model.
-/

namespace HsHVerification.ProducerQuiescence

open HsHVerification.AldusTemporalProvenance

/-- If two source-bound intervals are definitely ordered in the same known
    clock domain and scale, every pair of admissible times they contain has
    that order. -/
theorem definitelyBefore_orders_every_admissible_time_pair
    {earlier later : TimeInterval}
    (hBefore : definitelyBefore earlier later)
    {tEarlier tLater : Nat}
    (hEarlier : earlier.lower ≤ tEarlier ∧ tEarlier ≤ earlier.upper)
    (hLater : later.lower ≤ tLater ∧ tLater ≤ later.upper) :
    tEarlier < tLater := by
  exact Nat.lt_of_le_of_lt hEarlier.2
    (Nat.lt_of_lt_of_le hBefore.2 hLater.1)

/-- Conditional producer-quiescence chain: if completion is definitely before
    sealing, and sealing is definitely before unblinding, then every
    admissible completion time precedes every admissible unblinding time. -/
theorem producer_completion_before_unblinding_for_all_admissible_times
    {completed predictionSealTime unblindingTime : TimeInterval}
    (hCompletedBeforeSeal : definitelyBefore completed predictionSealTime)
    (hSealBeforeUnblinding : definitelyBefore predictionSealTime unblindingTime)
    {tCompleted tUnblinding : Nat}
    (hCompleted : completed.lower ≤ tCompleted ∧ tCompleted ≤ completed.upper)
    (hUnblinding : unblindingTime.lower ≤ tUnblinding ∧
      tUnblinding ≤ unblindingTime.upper) :
    tCompleted < tUnblinding := by
  have hCompletedBeforeUnblinding :=
    definitelyBefore_transitive hCompletedBeforeSeal hSealBeforeUnblinding
  exact definitelyBefore_orders_every_admissible_time_pair
    hCompletedBeforeUnblinding hCompleted hUnblinding

/-- Conditional interval-level chain retained from the original module. -/
theorem producer_completion_before_seal_and_seal_before_unblinding
    {completed predictionSealTime unblindingTime : TimeInterval}
    (hCompletedBeforeSeal : definitelyBefore completed predictionSealTime)
    (hSealBeforeUnblinding : definitelyBefore predictionSealTime unblindingTime) :
    definitelyBefore completed unblindingTime :=
  definitelyBefore_transitive
    hCompletedBeforeSeal
    hSealBeforeUnblinding

#print axioms definitelyBefore_orders_every_admissible_time_pair
#print axioms producer_completion_before_unblinding_for_all_admissible_times
#print axioms producer_completion_before_seal_and_seal_before_unblinding

end HsHVerification.ProducerQuiescence
