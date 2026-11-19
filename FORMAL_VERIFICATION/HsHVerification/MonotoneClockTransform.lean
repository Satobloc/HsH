import Mathlib
import HsHVerification.AldusTemporalProvenance

/-!
# Monotone clock-transform order preservation

This module formalizes one narrow admissible case for transforming the
source-bound intervals used by AldusTemporalProvenance: both intervals come
from the same known source clock and are transformed by the same strictly
monotone map into one known target clock and scale.

The result is conditional mathematics. The map and its strict monotonicity
are inputs to the theorem; this module does not authenticate a calibration,
validate its uncertainty model, establish clock-domain identity, or supply
a real clock conversion. Separate transformations from independent source
clocks require a joint calibration relation and a common-reference
uncertainty analysis. Two unrelated monotone maps are not silently treated
as one shared calibration.

No concrete timestamps, numeric witnesses, #eval fixtures, or physical
calculations are used.
-/

namespace HsHVerification.ClockTransform

open HsHVerification.AldusTemporalProvenance

/-- A mathematical map from one declared clock domain/scale to another.
    This is not, by itself, an empirical calibration certificate. -/
structure ClockTransform where
  sourceDomain : ClockDomain
  sourceScale : ClockScale
  targetDomain : ClockDomain
  targetScale : ClockScale
  targetDomainKnown : targetDomain ≠ .unknown
  targetScaleKnown : targetScale ≠ .unknown
  toTarget : Nat → Nat
  strictlyMonotone : StrictMono toTarget

/-- Map interval bounds through one common clock transform. The equality
    arguments ensure that the interval is from the transform's declared
    source clock and scale. -/
def mapInterval
    (T : ClockTransform)
    (I : TimeInterval)
    (_hDomain : I.clockDomain = T.sourceDomain)
    (_hScale : I.clockScale = T.sourceScale) : TimeInterval where
  clockDomain := T.targetDomain
  clockScale := T.targetScale
  lower := T.toTarget I.lower
  upper := T.toTarget I.upper
  ordered := by
    by_cases hEq : I.lower = I.upper
    · simp [hEq]
    · have hOrd := I.ordered
      have hlt : I.lower < I.upper := by omega
      exact Nat.le_of_lt (T.strictlyMonotone hlt)

/-- Every admissible source time remains inside the transformed interval
    after applying the same monotone clock map. -/
theorem mapped_interval_contains_mapped_admissible_time
    (T : ClockTransform)
    {I : TimeInterval}
    (hDomain : I.clockDomain = T.sourceDomain)
    (hScale : I.clockScale = T.sourceScale)
    {t : Nat}
    (hMem : I.lower ≤ t ∧ t ≤ I.upper) :
    (mapInterval T I hDomain hScale).lower ≤ T.toTarget t ∧
      T.toTarget t ≤ (mapInterval T I hDomain hScale).upper := by
  rcases hMem with ⟨hLower, hUpper⟩
  constructor
  · by_cases hEq : I.lower = t
    · simp [mapInterval, hEq]
    · have hlt : I.lower < t := by omega
      exact Nat.le_of_lt (T.strictlyMonotone hlt)
  · by_cases hEq : t = I.upper
    · simp [mapInterval, hEq]
    · have hlt : t < I.upper := by omega
      exact Nat.le_of_lt (T.strictlyMonotone hlt)

/-- Strict interval order is preserved when both intervals are transformed
    by the same strictly monotone map into one known target clock. -/
theorem definitelyBefore_preserved_by_shared_clock_transform
    (T : ClockTransform)
    {a b : TimeInterval}
    (haDomain : a.clockDomain = T.sourceDomain)
    (haScale : a.clockScale = T.sourceScale)
    (hBefore : definitelyBefore a b) :
    definitelyBefore
      (mapInterval T a haDomain haScale)
      (mapInterval T b
        (by
          calc
            b.clockDomain = a.clockDomain := hBefore.1.1.symm
            _ = T.sourceDomain := haDomain)
        (by
          calc
            b.clockScale = a.clockScale := hBefore.1.2.1.symm
            _ = T.sourceScale := haScale)) := by
  constructor
  · exact ⟨rfl, ⟨rfl, ⟨T.targetDomainKnown, T.targetScaleKnown⟩⟩⟩
  · exact T.strictlyMonotone hBefore.2


/-- Compose two transforms only when the first target domain/scale exactly
    matches the second source domain/scale. The bridge equalities are explicit
    inputs; no implicit clock or unit conversion is inferred. -/
def compose
    (first second : ClockTransform)
    (_domainBridge : first.targetDomain = second.sourceDomain)
    (_scaleBridge : first.targetScale = second.sourceScale) :
    ClockTransform where
  sourceDomain := first.sourceDomain
  sourceScale := first.sourceScale
  targetDomain := second.targetDomain
  targetScale := second.targetScale
  targetDomainKnown := second.targetDomainKnown
  targetScaleKnown := second.targetScaleKnown
  toTarget := fun t => second.toTarget (first.toTarget t)
  strictlyMonotone := by
    intro a b h
    exact second.strictlyMonotone (first.strictlyMonotone h)

/-- A two-stage clock transformation preserves strict interval order only
    through an explicit, type-compatible bridge between the intermediate
    clock domain and scale. -/
theorem definitelyBefore_preserved_by_composed_clock_transforms
    (first second : ClockTransform)
    (domainBridge : first.targetDomain = second.sourceDomain)
    (scaleBridge : first.targetScale = second.sourceScale)
    {a b : TimeInterval}
    (haDomain : a.clockDomain = first.sourceDomain)
    (haScale : a.clockScale = first.sourceScale)
    (hBefore : definitelyBefore a b) :
    definitelyBefore
      (mapInterval (compose first second domainBridge scaleBridge)
        a haDomain haScale)
      (mapInterval (compose first second domainBridge scaleBridge)
        b
        (by
          calc
            b.clockDomain = a.clockDomain := hBefore.1.1.symm
            _ = first.sourceDomain := haDomain)
        (by
          calc
            b.clockScale = a.clockScale := hBefore.1.2.1.symm
            _ = first.sourceScale := haScale)) := by
  exact definitelyBefore_preserved_by_shared_clock_transform
    (compose first second domainBridge scaleBridge)
    haDomain haScale hBefore

#print axioms mapped_interval_contains_mapped_admissible_time
#print axioms definitelyBefore_preserved_by_shared_clock_transform
#print axioms definitelyBefore_preserved_by_composed_clock_transforms

end HsHVerification.ClockTransform
