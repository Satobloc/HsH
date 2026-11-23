import Mathlib
import HsHVerification.KestrelChainAwareFiberBound

/-!
# Nadir: factorized terminal-to-detector error transfer

Kestrel's near-fiber theorem ends in the terminal carrier X_n. Sable's
terminal-map proposal identifies two possible closures into detector space:
a direct map X_n -> D, or a factorized map X_n -> Field -> D.

This module formalizes the factorized route. The adapter and readout have
separate pseudometric spaces, admissible domains, and Lipschitz bounds.
Their composition transports the upstream near-fiber/stagewise error budget
into detector space, with separate endpoint detector-error radii.

The resulting bound is deterministic and worst-case. It is not a standard
deviation, confidence interval, covariance model, or physical prediction.
The maps, domains, metrics, units, Lipschitz certificates, endpoint radii,
and their source bindings remain external evidence obligations.

The direct route is the one-stage special case Field = Detector, adapter =
the direct terminal-to-detector map, and readout = identity with Lipschitz
constant 1. No physical H(s)H map is instantiated here.
-/

namespace HsHVerification.NadirFactorizedDetectorErrorTransfer

open HsHVerification.RavelNStageHeterogeneousErrorTransfer
open HsHVerification.KestrelChainAwareFiberBound

/-- A factorized terminal-to-detector closure with separately declared
    admissible domains and Lipschitz bounds for each map. The fields are
    formal premises; they do not authenticate source artifacts. -/
structure FactorizedDetectorReadout
    (Terminal Field Detector : Type*)
    [PseudoMetricSpace Terminal]
    [PseudoMetricSpace Field]
    [PseudoMetricSpace Detector] where
  terminalDomain : Terminal → Prop
  fieldDomain : Field → Prop
  adapter : Terminal → Field
  readout : Field → Detector
  adapterLipschitzConstant : ℝ
  readoutLipschitzConstant : ℝ
  adapterLipschitzNonneg : 0 ≤ adapterLipschitzConstant
  readoutLipschitzNonneg : 0 ≤ readoutLipschitzConstant
  adapterPreservesDomain :
    ∀ x, terminalDomain x → fieldDomain (adapter x)
  adapterLipschitzOnDomain :
    ∀ x y, terminalDomain x → terminalDomain y →
      dist (adapter x) (adapter y) ≤
        adapterLipschitzConstant * dist x y
  readoutLipschitzOnDomain :
    ∀ f g, fieldDomain f → fieldDomain g →
      dist (readout f) (readout g) ≤
        readoutLipschitzConstant * dist f g

/-- The complete factorized terminal-to-detector map. -/
def detectorMap
    {Terminal Field Detector : Type*}
    [PseudoMetricSpace Terminal]
    [PseudoMetricSpace Field]
    [PseudoMetricSpace Detector]
    (R : FactorizedDetectorReadout Terminal Field Detector) :
    Terminal → Detector :=
  fun x => R.readout (R.adapter x)

/-- The two separately bounded maps induce a detector-space Lipschitz
    bound with the product of their constants. The estimate applies only
    when both terminal inputs lie in the declared terminal domain. -/
theorem detectorMap_lipschitzOnDomain
    {Terminal Field Detector : Type*}
    [PseudoMetricSpace Terminal]
    [PseudoMetricSpace Field]
    [PseudoMetricSpace Detector]
    (R : FactorizedDetectorReadout Terminal Field Detector)
    {x y : Terminal}
    (hx : R.terminalDomain x)
    (hy : R.terminalDomain y) :
    dist (detectorMap R x) (detectorMap R y) ≤
      (R.readoutLipschitzConstant * R.adapterLipschitzConstant) *
        dist x y := by
  have hFieldX : R.fieldDomain (R.adapter x) :=
    R.adapterPreservesDomain x hx
  have hFieldY : R.fieldDomain (R.adapter y) :=
    R.adapterPreservesDomain y hy
  have hAdapter :=
    R.adapterLipschitzOnDomain x y hx hy
  have hReadout :=
    R.readoutLipschitzOnDomain (R.adapter x) (R.adapter y)
      hFieldX hFieldY
  calc
    dist (detectorMap R x) (detectorMap R y)
        ≤ R.readoutLipschitzConstant *
            dist (R.adapter x) (R.adapter y) := hReadout
    _ ≤ R.readoutLipschitzConstant *
          (R.adapterLipschitzConstant * dist x y) :=
      mul_le_mul_of_nonneg_left hAdapter R.readoutLipschitzNonneg
    _ = (R.readoutLipschitzConstant *
          R.adapterLipschitzConstant) * dist x y := by ring

universe u v w z

variable {X : Nat → Type u} {Y : Type v}
variable {Field : Type w} {Detector : Type z}
variable [∀ n, PseudoMetricSpace (X n)]
variable [PseudoMetricSpace Y]
variable [PseudoMetricSpace Field]
variable [PseudoMetricSpace Detector]
variable (A : ∀ n, X n → Prop)
variable (S : ∀ n, StageContract A n)

/-- End-to-end detector-space bound for a finite-chain decoder that is
    only approximately constant on an upstream projection neighborhood.

    The terminal observations are first bounded in X_n by Kestrel's
    near-fiber theorem. The factorized adapter/readout then transports that
    bound into Detector space. Finally, independent detector-endpoint
    radii are added. Every radius is a deterministic metric bound in its
    own declared space. -/
theorem factorizedObservedNearFiberSeparationBound
    (n : Nat)
    (p : X 0 → Y)
    (decoder : Y → X n)
    (K rho : ℝ)
    (x y : X 0)
    (hx : A 0 x)
    (hy : A 0 y)
    (hApproximationFactorsThroughProjection :
      ∀ z, A 0 z →
        approximateIter A S n z = decoder (p z))
    (hProjectedClose : dist (p x) (p y) ≤ rho)
    (hDecoderPairwiseStability :
      dist (decoder (p x)) (decoder (p y)) ≤
        K * dist (p x) (p y))
    (hK_nonneg : 0 ≤ K)
    (observedX observedY : X n)
    (etaX etaY : ℝ)
    (hObservedX :
      dist observedX (exactIter A S n x) ≤ etaX)
    (hObservedY :
      dist observedY (exactIter A S n y) ≤ etaY)
    (R : FactorizedDetectorReadout (X n) Field Detector)
    (hObservedXDomain : R.terminalDomain observedX)
    (hObservedYDomain : R.terminalDomain observedY)
    (detectorX detectorY : Detector)
    (deltaX deltaY : ℝ)
    (hDetectorX :
      dist detectorX (detectorMap R observedX) ≤ deltaX)
    (hDetectorY :
      dist detectorY (detectorMap R observedY) ≤ deltaY) :
    dist detectorX detectorY ≤
      deltaX + deltaY +
        (R.readoutLipschitzConstant * R.adapterLipschitzConstant) *
          (etaX + etaY + 2 * errorBudget A S n + K * rho) := by
  have hTerminalBound :=
    HsHVerification.KestrelChainAwareFiberBound.observedNearFiberSeparationBound
      A S n p decoder K rho x y hx hy
      hApproximationFactorsThroughProjection hProjectedClose
      hDecoderPairwiseStability hK_nonneg observedX observedY
      etaX etaY hObservedX hObservedY
  have hReadoutBound :=
    detectorMap_lipschitzOnDomain R hObservedXDomain hObservedYDomain
  have hComposedBound :
      dist (detectorMap R observedX) (detectorMap R observedY) ≤
        (R.readoutLipschitzConstant * R.adapterLipschitzConstant) *
          (etaX + etaY + 2 * errorBudget A S n + K * rho) := by
    calc
      dist (detectorMap R observedX) (detectorMap R observedY)
          ≤ (R.readoutLipschitzConstant *
              R.adapterLipschitzConstant) *
                dist observedX observedY := hReadoutBound
      _ ≤ (R.readoutLipschitzConstant *
            R.adapterLipschitzConstant) *
              (etaX + etaY + 2 * errorBudget A S n + K * rho) :=
        mul_le_mul_of_nonneg_left hTerminalBound
          (mul_nonneg R.readoutLipschitzNonneg
            R.adapterLipschitzNonneg)
  have hDetectorY' :
      dist (detectorMap R observedY) detectorY ≤ deltaY := by
    simpa [dist_comm] using hDetectorY
  calc
    dist detectorX detectorY
        ≤ dist detectorX (detectorMap R observedX) +
            dist (detectorMap R observedX) detectorY :=
      dist_triangle _ _ _
    _ ≤ deltaX +
          (dist (detectorMap R observedX) (detectorMap R observedY) +
            dist (detectorMap R observedY) detectorY) := by
      have h := dist_triangle
        (detectorMap R observedX) (detectorMap R observedY) detectorY
      linarith [hDetectorX, h]
    _ ≤ deltaX +
          ((R.readoutLipschitzConstant * R.adapterLipschitzConstant) *
            (etaX + etaY + 2 * errorBudget A S n + K * rho) +
            deltaY) := by
      linarith [hComposedBound, hDetectorY']
    _ = deltaX + deltaY +
          (R.readoutLipschitzConstant * R.adapterLipschitzConstant) *
            (etaX + etaY + 2 * errorBudget A S n + K * rho) := by
      ring

/-- A detector pair separated beyond the complete factorized near-fiber
    budget cannot satisfy all declared projection, chain, map, and endpoint
    contracts simultaneously. This is a conditional no-go result for the
    specified map family, not a theory-wide or empirical rejection. -/
theorem noFactorizedDetectorReadoutWithinObservedNearFiberBudget
    (n : Nat)
    (p : X 0 → Y)
    (decoder : Y → X n)
    (K rho : ℝ)
    (x y : X 0)
    (hx : A 0 x)
    (hy : A 0 y)
    (hApproximationFactorsThroughProjection :
      ∀ z, A 0 z →
        approximateIter A S n z = decoder (p z))
    (hProjectedClose : dist (p x) (p y) ≤ rho)
    (hDecoderPairwiseStability :
      dist (decoder (p x)) (decoder (p y)) ≤
        K * dist (p x) (p y))
    (hK_nonneg : 0 ≤ K)
    (observedX observedY : X n)
    (etaX etaY : ℝ)
    (hObservedX :
      dist observedX (exactIter A S n x) ≤ etaX)
    (hObservedY :
      dist observedY (exactIter A S n y) ≤ etaY)
    (R : FactorizedDetectorReadout (X n) Field Detector)
    (hObservedXDomain : R.terminalDomain observedX)
    (hObservedYDomain : R.terminalDomain observedY)
    (detectorX detectorY : Detector)
    (deltaX deltaY : ℝ)
    (hDetectorX :
      dist detectorX (detectorMap R observedX) ≤ deltaX)
    (hDetectorY :
      dist detectorY (detectorMap R observedY) ≤ deltaY)
    (hDetectorSeparated :
      deltaX + deltaY +
        (R.readoutLipschitzConstant * R.adapterLipschitzConstant) *
          (etaX + etaY + 2 * errorBudget A S n + K * rho) <
        dist detectorX detectorY) :
    False := by
  have hBound :=
    factorizedObservedNearFiberSeparationBound A S n p decoder K rho
      x y hx hy hApproximationFactorsThroughProjection hProjectedClose
      hDecoderPairwiseStability hK_nonneg observedX observedY
      etaX etaY hObservedX hObservedY R hObservedXDomain
      hObservedYDomain detectorX detectorY deltaX deltaY
      hDetectorX hDetectorY
  linarith

#print axioms detectorMap_lipschitzOnDomain
#print axioms factorizedObservedNearFiberSeparationBound
#print axioms noFactorizedDetectorReadoutWithinObservedNearFiberBudget

end HsHVerification.NadirFactorizedDetectorErrorTransfer
