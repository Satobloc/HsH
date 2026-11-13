import Mathlib

/-!
# ArchiveEQ0033 — Calibration/holdout identifiability gate

This file formalizes an abstract verification-workflow condition. It does not
identify a physical parameter, validate a source translation, or establish any
empirical H(s)H claim.
-/

namespace HsHVerification.ArchiveEQ0033

/-- If two parameter states are indistinguishable under calibration but have
different holdout observables, no predictor using calibration alone can recover
the holdout observable for every parameter state. -/
theorem holdout_not_identifiable_from_calibration
    {P C H : Type*} (calibration : P → C) (holdout : P → H)
    (p q : P) (hcal : calibration p = calibration q)
    (hhold : holdout p ≠ holdout q) :
    ¬ ∃ predict : C → H, ∀ x : P, predict (calibration x) = holdout x := by
  rintro ⟨predict, hpredict⟩
  apply hhold
  calc
    holdout p = predict (calibration p) := (hpredict p).symm
    _ = predict (calibration q) := congrArg predict hcal
    _ = holdout q := hpredict q

/-- Injective calibration observations uniquely identify the shared parameter
state. This is a sufficient mathematical condition, not an empirical claim
that any proposed calibration map is injective. -/
theorem shared_parameter_unique_of_injective_calibration
    {P C : Type*} (calibration : P → C)
    (hcalibration : Function.Injective calibration)
    {p q : P} (h : calibration p = calibration q) :
    p = q :=
  hcalibration h

/-- A declared left-inverse decoder supplies a holdout predictor from
calibration observations. The hypothesis is deliberately explicit. -/
def predictionFromCalibration
    {P C H : Type*} (holdout : P → H) (decode : C → P) : C → H :=
  fun c => holdout (decode c)

theorem holdout_identifiable_with_decoder
    {P C H : Type*} (calibration : P → C) (holdout : P → H)
    (decode : C → P) (hdecode : Function.LeftInverse decode calibration)
    (p : P) :
    predictionFromCalibration holdout decode (calibration p) = holdout p := by
  unfold predictionFromCalibration
  rw [hdecode p]

#print axioms holdout_not_identifiable_from_calibration
#print axioms shared_parameter_unique_of_injective_calibration
#print axioms holdout_identifiable_with_decoder

end HsHVerification.ArchiveEQ0033
