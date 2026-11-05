import Mathlib

/-!
Assistant-proposed, source-derived workflow contract (2026-11-05).

The M87 source audit distinguishes three observation domains:
* EHT multi-station VLBI correlated visibility products;
* ALMA connected-element visibility products;
* reconstructed images.

A model prediction and an observation may be compared directly only when
they inhabit the same declared measurement domain. A cross-domain comparison
must carry an explicit transformation into the target domain.

This module formalizes only that type-level workflow contract. It does NOT
assert that any actual EHT/ALMA bridge exists, that a supplied bridge is
physically valid, or that calibration, sampling, covariance, acquisition
independence, or an H(s)H source-to-field map has been established. No
physical fixture, measurement, parameter, or numerical value is introduced.
-/

namespace HsHVerification.MeasurementDomainCompatibility

universe u v

inductive MeasurementMode
  | ehtVlbiVisibility
  | almaConnectedElementVisibility
  | reconstructedImage
deriving DecidableEq, Repr

/-- Payload types remain abstract and mode-indexed; this file supplies no
    invented or simulated physical data. -/
structure ForwardMap (Payload : MeasurementMode → Type u)
    (State : Type v) (mode : MeasurementMode) where
  predict : State → Payload mode

/-- A matched holdout uses one measurement-mode index for both the model
    prediction and the observed payload. -/
structure MatchedHoldout (Payload : MeasurementMode → Type u)
    (State : Type v) (mode : MeasurementMode) where
  forward : ForwardMap Payload State mode
  state : State
  observed : Payload mode

/-- The comparison input is explicitly typed in the shared mode. -/
def matchedComparisonInput {Payload : MeasurementMode → Type u}
    {State : Type v} {mode : MeasurementMode}
    (h : MatchedHoldout Payload State mode) : Payload mode × Payload mode :=
  (h.forward.predict h.state, h.observed)

/-- A cross-mode bridge is an explicit transformation from one declared
    observation payload type into another. Its existence does not establish
    its calibration or physical validity. -/
structure ModeBridge (Payload : MeasurementMode → Type u)
    (from to : MeasurementMode) where
  transform : Payload from → Payload to

/-- Cross-mode comparison is admitted only with a declared bridge. -/
structure CrossModeHoldout (Payload : MeasurementMode → Type u)
    (State : Type v) (from to : MeasurementMode) where
  forward : ForwardMap Payload State from
  state : State
  bridge : ModeBridge Payload from to
  observed : Payload to

/-- The transformed prediction and observation now inhabit the target mode. -/
def crossModeComparisonInput {Payload : MeasurementMode → Type u}
    {State : Type v} {from to : MeasurementMode}
    (h : CrossModeHoldout Payload State from to) : Payload to × Payload to :=
  (h.bridge.transform (h.forward.predict h.state), h.observed)

/-- The cross-mode contract necessarily carries an explicit bridge object. -/
theorem cross_mode_holdout_requires_explicit_bridge
    {Payload : MeasurementMode → Type u}
    {State : Type v} {from to : MeasurementMode}
    (h : CrossModeHoldout Payload State from to) :
    Nonempty (ModeBridge Payload from to) := ⟨h.bridge⟩

/-- The model prediction reaches the target payload type only through the
    bridge stored in the cross-mode holdout contract. -/
theorem cross_mode_prediction_is_transformed_into_target_domain
    {Payload : MeasurementMode → Type u}
    {State : Type v} {from to : MeasurementMode}
    (h : CrossModeHoldout Payload State from to) :
    (crossModeComparisonInput h).1 =
      h.bridge.transform (h.forward.predict h.state) := rfl

/-- Same-mode comparison preserves the common domain on both sides. -/
theorem matched_holdout_compares_in_one_domain
    {Payload : MeasurementMode → Type u}
    {State : Type v} {mode : MeasurementMode}
    (h : MatchedHoldout Payload State mode) :
    (matchedComparisonInput h).1 = h.forward.predict h.state ∧
    (matchedComparisonInput h).2 = h.observed := ⟨rfl, rfl⟩

#print axioms cross_mode_holdout_requires_explicit_bridge
#print axioms cross_mode_prediction_is_transformed_into_target_domain
#print axioms matched_holdout_compares_in_one_domain

end HsHVerification.MeasurementDomainCompatibility
