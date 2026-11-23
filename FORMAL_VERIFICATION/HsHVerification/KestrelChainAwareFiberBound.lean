import Mathlib
import HsHVerification.RavelNStageHeterogeneousErrorTransfer

/-!
# Kestrel: chain-aware fiber-separation bound

This module composes the finite-chain approximation bound with a
projection-fiber obstruction.

If the approximate chain factors through a declared upstream projection
p : X₀ → Y, then any two admissible inputs with the same p-value receive
the same decoded approximate output. Ravel's finite-chain theorem bounds
each exact/approximate output discrepancy by the recursively propagated
stagewise budget Eₙ. Therefore, if the exact final outputs on one projection
fiber are separated by more than 2 Eₙ, no single deterministic decoder
through p can satisfy the chain error bound for both inputs.

This is conditional map mathematics. It does not instantiate a physical
H(s)H projection, instrument, metric, unit conversion, calibration, or
measured system. The source-to-map translation and empirical validity of
the stage contracts remain separate obligations.
-/

namespace HsHVerification.KestrelChainAwareFiberBound

open HsHVerification.RavelNStageHeterogeneousErrorTransfer

universe u v

variable {X : Nat → Type u}
variable {Y : Type v}
variable [∀ n, PseudoMetricSpace (X n)]
variable (A : ∀ n, X n → Prop)
variable (S : ∀ n, StageContract A n)

/-- If the approximate finite chain is a deterministic decoder of an
    upstream projection, then two admissible inputs in the same projection
    fiber cannot have exact final outputs separated by more than twice the
    propagated chain-error budget. -/
theorem noProjectionDecoderWithinChainBudget
    (n : Nat)
    (p : X 0 → Y)
    (decoder : Y → X n)
    (x y : X 0)
    (hx : A 0 x)
    (hy : A 0 y)
    (hSameProjection : p x = p y)
    (hApproximationFactorsThroughProjection :
      ∀ z, A 0 z →
        approximateIter A S n z = decoder (p z))
    (hSeparated :
      2 * errorBudget A S n <
        dist (exactIter A S n x) (exactIter A S n y)) :
    False := by
  have hBoundX :=
    finiteChainProjectionErrorBound A S n x hx
  have hBoundY :=
    finiteChainProjectionErrorBound A S n y hy
  have hSameDecoder : decoder (p x) = decoder (p y) :=
    congrArg decoder hSameProjection
  have hX :
      dist (exactIter A S n x) (decoder (p x)) ≤
        errorBudget A S n := by
    simpa [hApproximationFactorsThroughProjection x hx] using hBoundX
  have hY :
      dist (decoder (p x)) (exactIter A S n y) ≤
        errorBudget A S n := by
    calc
      dist (decoder (p x)) (exactIter A S n y)
          = dist (decoder (p y)) (exactIter A S n y) := by
            rw [hSameDecoder]
      _ = dist (approximateIter A S n y) (exactIter A S n y) := by
            rw [← hApproximationFactorsThroughProjection y hy]
      _ = dist (exactIter A S n y) (approximateIter A S n y) :=
            dist_comm _ _
      _ ≤ errorBudget A S n := hBoundY
  have hTriangle :
      dist observedX observedY ≤
        dist observedX (exactIter A S n x) +
          dist (exactIter A S n x) (decoder (p x)) +
          dist (decoder (p x)) (decoder (p y)) +
          dist (decoder (p y)) (exactIter A S n y) +
          dist (exactIter A S n y) observedY := by
    have h1 :=
      dist_triangle observedX (exactIter A S n x) observedY
    have h2 :=
      dist_triangle (exactIter A S n x) (decoder (p x)) observedY
    have h3 :=
      dist_triangle (decoder (p x)) (decoder (p y)) observedY
    have h4 :=
      dist_triangle (decoder (p y)) (exactIter A S n y) observedY
    linarith
  calc
    dist observedX observedY
        ≤
      dist observedX (exactIter A S n x) +
        (dist (exactIter A S n x) (decoder (p x)) +
          (dist (decoder (p x)) (exactIter A S n y) +
            dist (exactIter A S n y) observedY)) := hTriangle
    _ ≤ etaX + etaY + 2 * errorBudget A S n := by
      linarith [hObservedX, hChainX, hChainY, hObservedY']

/-- If observed outputs on one projection fiber are separated by more
    than the two endpoint observation radii plus twice the propagated
    chain budget, no deterministic decoder through that projection can
    satisfy the chain approximation contract for both inputs. -/
theorem noProjectionDecoderWithinObservedChainBudget
    (n : Nat)
    (p : X 0 → Y)
    (decoder : Y → X n)
    (x y : X 0)
    (hx : A 0 x)
    (hy : A 0 y)
    (hSameProjection : p x = p y)
    (hApproximationFactorsThroughProjection :
      ∀ z, A 0 z →
        approximateIter A S n z = decoder (p z))
    (observedX observedY : X n)
    (etaX etaY : ℝ)
    (hObservedX :
      dist observedX (exactIter A S n x) ≤ etaX)
    (hObservedY :
      dist observedY (exactIter A S n y) ≤ etaY)
    (hObservedSeparated :
      etaX + etaY + 2 * errorBudget A S n <
        dist observedX observedY) :
    False := by
  have hBound := observedFiberSeparationBound
    A S n p decoder x y hx hy hSameProjection
    hApproximationFactorsThroughProjection observedX observedY
    etaX etaY hObservedX hObservedY
  linarith

/-- Stagewise-sum form of the detector-level no-go witness. -/
theorem noProjectionDecoderWithinObservedStagewiseBudget
    (n : Nat)
    (p : X 0 → Y)
    (decoder : Y → X n)
    (x y : X 0)
    (hx : A 0 x)
    (hy : A 0 y)
    (hSameProjection : p x = p y)
    (hApproximationFactorsThroughProjection :
      ∀ z, A 0 z →
        approximateIter A S n z = decoder (p z))
    (observedX observedY : X n)
    (etaX etaY : ℝ)
    (hObservedX :
      dist observedX (exactIter A S n x) ≤ etaX)
    (hObservedY :
      dist observedY (exactIter A S n y) ≤ etaY)
    (hObservedSeparated :
      etaX + etaY + 2 * stagewiseErrorBudget A S n <
        dist observedX observedY) :
    False := by
  have hObservedSeparated' :
      etaX + etaY + 2 * errorBudget A S n <
        dist observedX observedY := by
    have h := hObservedSeparated
    rw [errorBudget_eq_stagewiseErrorBudget A S n] at h
    exact h
  exact noProjectionDecoderWithinObservedChainBudget
    A S n p decoder x y hx hy hSameProjection
    hApproximationFactorsThroughProjection observedX observedY
    etaX etaY hObservedX hObservedY hObservedSeparated'

#print axioms observedFiberSeparationBound
#print axioms noProjectionDecoderWithinObservedChainBudget
#print axioms noProjectionDecoderWithinObservedStagewiseBudget


/-- A near-fiber extension of the observed separation bound. Exact equality
    of projected inputs is not required: it is enough to bound their
    projected distance by `rho` and to bound the decoder's output
    sensitivity on this pair by `K`. The resulting tolerance includes the
    two endpoint observation radii, both finite-chain errors, and the
    projected-input sensitivity term `K * rho`. -/
theorem observedNearFiberSeparationBound
    [PseudoMetricSpace Y]
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
      dist observedY (exactIter A S n y) ≤ etaY) :
    dist observedX observedY ≤
      etaX + etaY + 2 * errorBudget A S n + K * rho := by
  have hBoundX :=
    finiteChainProjectionErrorBound A S n x hx
  have hBoundY :=
    finiteChainProjectionErrorBound A S n y hy
  have hChainX :
      dist (exactIter A S n x) (decoder (p x)) ≤
        errorBudget A S n := by
    simpa [hApproximationFactorsThroughProjection x hx] using hBoundX
  have hChainY :
      dist (decoder (p y)) (exactIter A S n y) ≤
        errorBudget A S n := by
    calc
      dist (decoder (p y)) (exactIter A S n y)
          = dist (approximateIter A S n y) (exactIter A S n y) := by
              rw [← hApproximationFactorsThroughProjection y hy]
      _ = dist (exactIter A S n y) (approximateIter A S n y) :=
            dist_comm _ _
      _ ≤ errorBudget A S n := hBoundY
  have hDecoder :
      dist (decoder (p x)) (decoder (p y)) ≤ K * rho := by
    calc
      dist (decoder (p x)) (decoder (p y))
          ≤ K * dist (p x) (p y) := hDecoderPairwiseStability
      _ ≤ K * rho :=
        mul_le_mul_of_nonneg_left hProjectedClose hK_nonneg
  have hObservedY' :
      dist (exactIter A S n y) observedY ≤ etaY := by
    calc
      dist (exactIter A S n y) observedY
          = dist observedY (exactIter A S n y) := dist_comm _ _
      _ ≤ etaY := hObservedY
  have hTriangle :
      dist observedX observedY ≤
        dist observedX (exactIter A S n x) +
          (dist (exactIter A S n x) (decoder (p x)) +
            (dist (decoder (p x)) (decoder (p y)) +
              (dist (decoder (p y)) (exactIter A S n y) +
                dist (exactIter A S n y) observedY))) := by
    have h1 :
        dist observedX observedY ≤
          dist observedX (exactIter A S n x) +
            dist (exactIter A S n x) observedY :=
      dist_triangle observedX (exactIter A S n x) observedY
    have h2 :
        dist (exactIter A S n x) observedY ≤
          dist (exactIter A S n x) (decoder (p x)) +
            dist (decoder (p x)) observedY :=
      dist_triangle (exactIter A S n x) (decoder (p x)) observedY
    have h3 :
        dist (decoder (p x)) observedY ≤
          dist (decoder (p x)) (decoder (p y)) +
            dist (decoder (p y)) observedY :=
      dist_triangle (decoder (p x)) (decoder (p y)) observedY
    have h4 :
        dist (decoder (p y)) observedY ≤
          dist (decoder (p y)) (exactIter A S n y) +
            dist (exactIter A S n y) observedY :=
      dist_triangle (decoder (p y)) (exactIter A S n y) observedY
    calc
      dist observedX observedY
          ≤ dist observedX (exactIter A S n x) +
              dist (exactIter A S n x) observedY := h1
      _ ≤ dist observedX (exactIter A S n x) +
            (dist (exactIter A S n x) (decoder (p x)) +
              dist (decoder (p x)) observedY) :=
          add_le_add_left h2 _
      _ ≤ dist observedX (exactIter A S n x) +
            (dist (exactIter A S n x) (decoder (p x)) +
              (dist (decoder (p x)) (decoder (p y)) +
                dist (decoder (p y)) observedY)) := by
          have h3' := add_le_add_left h3
            (dist (exactIter A S n x) (decoder (p x)))
          exact add_le_add_left h3'
            (dist observedX (exactIter A S n x))
      _ ≤ dist observedX (exactIter A S n x) +
            (dist (exactIter A S n x) (decoder (p x)) +
              (dist (decoder (p x)) (decoder (p y)) +
                (dist (decoder (p y)) (exactIter A S n y) +
                  dist (exactIter A S n y) observedY))) := by
          have h4' := add_le_add_left h4
            (dist (decoder (p x)) (decoder (p y)))
          have h4'' := add_le_add_left h4'
            (dist (exactIter A S n x) (decoder (p x)))
          exact add_le_add_left h4''
            (dist observedX (exactIter A S n x))
  calc
    dist observedX observedY
        ≤
      dist observedX (exactIter A S n x) +
        (dist (exactIter A S n x) (decoder (p x)) +
          (dist (decoder (p x)) (decoder (p y)) +
            (dist (decoder (p y)) (exactIter A S n y) +
              dist (exactIter A S n y) observedY))) := hTriangle
    _ ≤ etaX + etaY + 2 * errorBudget A S n + K * rho := by
      linarith [hObservedX, hChainX, hDecoder, hChainY, hObservedY']

/-- A measured pair whose observed separation exceeds the near-fiber
    tolerance cannot be explained by any decoder satisfying the declared
    projection, pairwise-stability, and finite-chain contracts. -/
theorem noProjectionDecoderWithinObservedNearFiberBudget
    [PseudoMetricSpace Y]
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
    (hObservedSeparated :
      etaX + etaY + 2 * errorBudget A S n + K * rho <
        dist observedX observedY) :
    False := by
  have hBound := observedNearFiberSeparationBound
    A S n p decoder K rho x y hx hy
    hApproximationFactorsThroughProjection hProjectedClose
    hDecoderPairwiseStability hK_nonneg observedX observedY
    etaX etaY hObservedX hObservedY
  linarith

/-- Stagewise-sum form of the near-fiber no-go witness. -/
theorem noProjectionDecoderWithinObservedNearFiberStagewiseBudget
    [PseudoMetricSpace Y]
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
    (hObservedSeparated :
      etaX + etaY + 2 * stagewiseErrorBudget A S n + K * rho <
        dist observedX observedY) :
    False := by
  have hBound := observedNearFiberSeparationBound
    A S n p decoder K rho x y hx hy
    hApproximationFactorsThroughProjection hProjectedClose
    hDecoderPairwiseStability hK_nonneg observedX observedY
    etaX etaY hObservedX hObservedY
  have hBound' :
      dist observedX observedY ≤
        etaX + etaY + 2 * stagewiseErrorBudget A S n + K * rho := by
    have h := hBound
    rw [← errorBudget_eq_stagewiseErrorBudget A S n] at h
    exact h
  linarith

#print axioms observedNearFiberSeparationBound
#print axioms noProjectionDecoderWithinObservedNearFiberBudget
#print axioms noProjectionDecoderWithinObservedNearFiberStagewiseBudget


end HsHVerification.KestrelChainAwareFiberBound
