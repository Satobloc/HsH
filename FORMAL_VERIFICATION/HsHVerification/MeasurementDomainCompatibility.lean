import Mathlib

/-!
Assistant-proposed, source-derived workflow contract (2026-11-05; native-path
refinement 2026-11-06).

The M87 source audit distinguishes three observation domains:
* EHT multi-station VLBI correlated visibility products;
* ALMA connected-element visibility products;
* reconstructed images.

A comparison must preserve the measurement domain. There are two distinct
routes:

1. Native-domain prediction: predict a common latent field, then apply the
   target instrument/readout operator and compare with an observation in that
   same native mode. This is the preferred route when the model can predict
   each instrument's native observable.
2. Cross-domain transfer: transform a prediction or observed product from one
   declared mode into another. This requires an explicit bridge object.

The type-level contracts below do not establish that any physical forward map,
instrument operator, or cross-mode bridge exists or is valid. They do not
validate calibration, sampling, covariance, acquisition independence, units,
uncertainty propagation, source-to-field mapping, or H(s)H. Those require
source-locked measurement records and independent empirical review. No
physical fixture, measurement, fitted parameter, or numerical value is
introduced.
-/

namespace HsHVerification.MeasurementDomainCompatibility

universe u v w

inductive MeasurementMode
  | ehtVlbiVisibility
  | almaConnectedElementVisibility
  | reconstructedImage
deriving DecidableEq, Repr

/-- Payload types remain abstract and mode-indexed; no physical data are
    invented or simulated here. -/
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

/-- A model predicts a common latent field before instrument-specific
    measurement/readout operators are applied. -/
structure LatentFieldModel (State : Type v) (Field : Type w) where
  predictField : State → Field

/-- Each native measurement mode has its own operator from the common field
    into that mode's payload type. Real instances require source-defined,
    versioned instrument and calibration records outside this abstract type. -/
structure NativeMeasurementOperator (Field : Type w)
    (Payload : MeasurementMode → Type u) where
  observe : (mode : MeasurementMode) → Field → Payload mode

/-- A native-mode holdout compares the latent model after projection through
    the target mode's own operator. It needs no cross-mode bridge. -/
structure NativeModeHoldout (Payload : MeasurementMode → Type u)
    (State : Type v) (Field : Type w) (mode : MeasurementMode) where
  model : LatentFieldModel State Field
  operator : NativeMeasurementOperator Field Payload
  state : State
  observed : Payload mode

/-- Prediction produced directly in the requested native measurement mode. -/
def nativeModePrediction {Payload : MeasurementMode → Type u}
    {State : Type v} {Field : Type w}
    (model : LatentFieldModel State Field)
    (operator : NativeMeasurementOperator Field Payload)
    (mode : MeasurementMode) (state : State) : Payload mode :=
  operator.observe mode (model.predictField state)

/-- Native comparison: both entries inhabit the observation's own mode. -/
def nativeModeComparisonInput {Payload : MeasurementMode → Type u}
    {State : Type v} {Field : Type w} {mode : MeasurementMode}
    (h : NativeModeHoldout Payload State Field mode) : Payload mode × Payload mode :=
  (nativeModePrediction h.model h.operator mode h.state, h.observed)

/-- The native path compares the mode-specific prediction with the
    observation without requiring a cross-domain transformation. -/
theorem native_mode_holdout_compares_in_native_domain
    {Payload : MeasurementMode → Type u}
    {State : Type v} {Field : Type w} {mode : MeasurementMode}
    (h : NativeModeHoldout Payload State Field mode) :
    (nativeModeComparisonInput h).1 =
      nativeModePrediction h.model h.operator mode h.state ∧
    (nativeModeComparisonInput h).2 = h.observed := ⟨rfl, rfl⟩

/-- A cross-mode bridge is an explicit transformation between two declared
    observation payload types. Its existence does not establish calibration
    or physical validity. -/
structure ModeBridge (Payload : MeasurementMode → Type u)
    (sourceMode targetMode : MeasurementMode) where
  transform : Payload sourceMode → Payload targetMode

/-- Cross-mode comparison is admitted only with a declared bridge. Use this
    route only when a native target-mode prediction is unavailable or when
    transferring an observed product is itself the defined operation. -/
structure CrossModeHoldout (Payload : MeasurementMode → Type u)
    (State : Type v) (sourceMode targetMode : MeasurementMode) where
  forward : ForwardMap Payload State sourceMode
  state : State
  bridge : ModeBridge Payload sourceMode targetMode
  observed : Payload targetMode

/-- The transformed prediction and observation now inhabit the target mode. -/
def crossModeComparisonInput {Payload : MeasurementMode → Type u}
    {State : Type v} {sourceMode targetMode : MeasurementMode}
    (h : CrossModeHoldout Payload State sourceMode targetMode) :
    Payload targetMode × Payload targetMode :=
  (h.bridge.transform (h.forward.predict h.state), h.observed)

/-- The cross-mode contract necessarily carries an explicit bridge object. -/
theorem cross_mode_holdout_requires_explicit_bridge
    {Payload : MeasurementMode → Type u}
    {State : Type v} {sourceMode targetMode : MeasurementMode}
    (h : CrossModeHoldout Payload State sourceMode targetMode) :
    Nonempty (ModeBridge Payload sourceMode targetMode) := ⟨h.bridge⟩

/-- The model prediction reaches the target payload type only through the
    bridge stored in the cross-mode holdout contract. -/
theorem cross_mode_prediction_is_transformed_into_target_domain
    {Payload : MeasurementMode → Type u}
    {State : Type v} {sourceMode targetMode : MeasurementMode}
    (h : CrossModeHoldout Payload State sourceMode targetMode) :
    (crossModeComparisonInput h).1 =
      h.bridge.transform (h.forward.predict h.state) := rfl

/-- Same-mode comparison preserves the common domain on both sides. -/
theorem matched_holdout_compares_in_one_domain
    {Payload : MeasurementMode → Type u}
    {State : Type v} {mode : MeasurementMode}
    (h : MatchedHoldout Payload State mode) :
    (matchedComparisonInput h).1 = h.forward.predict h.state ∧
    (matchedComparisonInput h).2 = h.observed := ⟨rfl, rfl⟩

#print axioms native_mode_holdout_compares_in_native_domain
#print axioms cross_mode_holdout_requires_explicit_bridge
#print axioms cross_mode_prediction_is_transformed_into_target_domain
#print axioms matched_holdout_compares_in_one_domain

end HsHVerification.MeasurementDomainCompatibility
