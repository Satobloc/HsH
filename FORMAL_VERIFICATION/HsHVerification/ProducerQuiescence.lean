import Mathlib
import HsHVerification.AldusTemporalProvenance

/-!
# Producer quiescence before prediction sealing

This module isolates one missing temporal edge in the existing P2 chronology
wrapper. The wrapper currently proves prediction-seal-before-holdout-unblinding.
It does not carry a producer-run completion event or prove that the producer
was quiescent before the prediction was sealed.

The first theorem is conditional: if the exact producer completion interval is
definitely before the prediction-seal interval, and the seal is definitely
before holdout unblinding, then completion is definitely before unblinding.

The second theorem is an abstract order counterexample showing that
seal-before-unblinding alone does not imply producer completion-before-
unblinding. Its ordinal points are a logical witness only, not physical times,
measurements, or a fabricated physical fixture.

Neither theorem authenticates event records, binds events to one provider run,
proves complete access logging, proves holdout inaccessibility, or validates
any physical model.
-/

namespace HsHVerification.ProducerQuiescence

open HsHVerification.AldusTemporalProvenance

/-- An abstract exact point in a named, known clock domain and scale.
    The ordinal argument has no physical-time interpretation. -/
def exactPoint (t : Nat) : TimeInterval :=
  { clockDomain := ClockDomain.utcEpoch
    clockScale := ClockScale.unixSeconds
    lower := t
    upper := t
    ordered := Nat.le_refl t }

/-- Conditional producer-quiescence chain:
    completion before seal, and seal before unblinding, imply completion
    before unblinding. The supplied intervals must already be source-bound
    to the same producer execution and comparison; this theorem does not
    establish that binding. -/
theorem producer_completion_before_seal_and_seal_before_unblinding
    {completed seal unblinding : TimeInterval}
    (hCompletedBeforeSeal : definitelyBefore completed seal)
    (hSealBeforeUnblinding : definitelyBefore seal unblinding) :
    definitelyBefore completed unblinding :=
  definitelyBefore_transitive
    hCompletedBeforeSeal
    hSealBeforeUnblinding

/-- The existing seal-before-unblinding condition alone is insufficient.
    This is a pure order-theoretic counterexample, not an empirical fixture. -/
theorem seal_before_unblinding_does_not_imply_producer_completion_before_unblinding :
    ∃ completed seal unblinding : TimeInterval,
      definitelyBefore seal unblinding ∧
      ¬ definitelyBefore completed unblinding := by
  refine ⟨exactPoint 3, exactPoint 1, exactPoint 2, ?_, ?_⟩
  · decide
  · decide

#eval compareIntervals (exactPoint 1) (exactPoint 2)
#eval compareIntervals (exactPoint 3) (exactPoint 2)

#print axioms producer_completion_before_seal_and_seal_before_unblinding
#print axioms seal_before_unblinding_does_not_imply_producer_completion_before_unblinding

end HsHVerification.ProducerQuiescence
