import Mathlib
import HsHVerification.MonotoneClockTransform

/-!
# Joint clock-calibration families and robust cross-clock order

The preceding monotone-transform theorem handles two intervals under one
shared map. This module distinguishes that case from two source clocks whose
calibrations may vary jointly.

A family index denotes one admissible *joint calibration state*. If the
two calibrations are independent, the admissible index should encode their
Cartesian product. If they are correlated, it should encode only the
source-authorized admissible pairs. The family is nonempty by construction.

The robust order condition is imposed on every admissible pair of mapped
boundary values. Individual strict monotonicity of each clock map does not
supply that cross-clock separation. The theorem therefore makes the missing
joint-calibration premise explicit rather than inferring synchronization.

This is a mathematical contract only. It does not authenticate clocks,
calibration records, uncertainty bounds, validity intervals, or physical
measurements. No timestamps, numerical fixtures, or physical calculations
are used.
-/

namespace HsHVerification.JointClockCalibration

open HsHVerification.AldusTemporalProvenance
open HsHVerification.ClockTransform

/-- A nonempty family of paired clock transforms into a common target clock.
    The admissible index preserves any dependence between the two
    calibrations; independence is represented only if the index is a product. -/
structure JointClockCalibrationFamily where
  admissible : Type
  nonempty : Nonempty admissible
  first : admissible → ClockTransform
  second : admissible → ClockTransform
  firstSourceDomain : ClockDomain
  firstSourceScale : ClockScale
  secondSourceDomain : ClockDomain
  secondSourceScale : ClockScale
  firstSourceDomainEq :
    ∀ θ, (first θ).sourceDomain = firstSourceDomain
  firstSourceScaleEq :
    ∀ θ, (first θ).sourceScale = firstSourceScale
  secondSourceDomainEq :
    ∀ θ, (second θ).sourceDomain = secondSourceDomain
  secondSourceScaleEq :
    ∀ θ, (second θ).sourceScale = secondSourceScale
  targetDomainEq :
    ∀ θ, (first θ).targetDomain = (second θ).targetDomain
  targetScaleEq :
    ∀ θ, (first θ).targetScale = (second θ).targetScale

/-- Transform the first source interval under one admissible joint state. -/
def mapFirst
    (J : JointClockCalibrationFamily)
    (a : TimeInterval)
    (θ : J.admissible)
    (hDomain : a.clockDomain = J.firstSourceDomain)
    (hScale : a.clockScale = J.firstSourceScale) : TimeInterval :=
  mapInterval (J.first θ) a
    (hDomain.trans (J.firstSourceDomainEq θ).symm)
    (hScale.trans (J.firstSourceScaleEq θ).symm)

/-- Transform the second source interval under the same joint state. -/
def mapSecond
    (J : JointClockCalibrationFamily)
    (b : TimeInterval)
    (θ : J.admissible)
    (hDomain : b.clockDomain = J.secondSourceDomain)
    (hScale : b.clockScale = J.secondSourceScale) : TimeInterval :=
  mapInterval (J.second θ) b
    (hDomain.trans (J.secondSourceDomainEq θ).symm)
    (hScale.trans (J.secondSourceScaleEq θ).symm)

/-- The joint image of the first interval's upper boundary and the second
    interval's lower boundary over every admissible calibration state. -/
def jointBoundaryImage
    (J : JointClockCalibrationFamily)
    (a b : TimeInterval) : Set (Nat × Nat) :=
  {p | ∃ θ : J.admissible,
    p = ((J.first θ).toTarget a.upper,
      (J.second θ).toTarget b.lower)}

/-- Robust order requires strict separation for every admissible joint
    calibration state, not merely for one selected or best-fitting pair. -/
def uniformlySeparated
    (J : JointClockCalibrationFamily)
    (a b : TimeInterval) : Prop :=
  ∀ p ∈ jointBoundaryImage J a b, p.1 < p.2

/-- Set-image separation is exactly universal separation over the joint
    calibration family. -/
theorem uniformlySeparated_iff_forall_joint_state
    (J : JointClockCalibrationFamily)
    (a b : TimeInterval) :
    uniformlySeparated J a b ↔
      ∀ θ : J.admissible,
        (J.first θ).toTarget a.upper <
          (J.second θ).toTarget b.lower := by
  constructor
  · intro h θ
    exact h _ ⟨θ, rfl⟩
  · intro h p hp
    rcases hp with ⟨θ, rfl⟩
    exact h θ

/-- If every admissible paired calibration strictly separates the mapped
    event boundaries, then the two transformed intervals are definitely
    ordered for every admissible joint state in the common target clock. -/
theorem uniformlySeparated_orders_every_joint_calibration
    (J : JointClockCalibrationFamily)
    {a b : TimeInterval}
    (haDomain : a.clockDomain = J.firstSourceDomain)
    (haScale : a.clockScale = J.firstSourceScale)
    (hbDomain : b.clockDomain = J.secondSourceDomain)
    (hbScale : b.clockScale = J.secondSourceScale)
    (hSeparated : uniformlySeparated J a b) :
    ∀ θ : J.admissible,
      definitelyBefore
        (mapFirst J a θ haDomain haScale)
        (mapSecond J b θ hbDomain hbScale) := by
  intro θ
  have hBoundary :=
    (uniformlySeparated_iff_forall_joint_state J a b).mp hSeparated θ
  refine ⟨?_, hBoundary⟩
  refine ⟨?_, ⟨?_, ⟨?_, ?_⟩⟩⟩
  · dsimp [mapFirst, mapSecond, mapInterval]
    exact J.targetDomainEq θ
  · dsimp [mapFirst, mapSecond, mapInterval]
    exact J.targetScaleEq θ
  · dsimp [mapFirst, mapInterval]
    exact (J.first θ).targetDomainKnown
  · dsimp [mapFirst, mapInterval]
    exact (J.first θ).targetScaleKnown

/-- One admissible calibration pair whose mapped boundaries overlap or
    reverse is sufficient to refute uniform cross-clock ordering. -/
theorem one_nonseparated_joint_state_refutes_uniform_order
    (J : JointClockCalibrationFamily)
    (a b : TimeInterval)
    (θ : J.admissible)
    (hNotSeparated :
      (J.second θ).toTarget b.lower ≤
        (J.first θ).toTarget a.upper) :
    ¬ uniformlySeparated J a b := by
  intro hSeparated
  have hBoundary :=
    (uniformlySeparated_iff_forall_joint_state J a b).mp hSeparated θ
  exact Nat.not_lt_of_ge hNotSeparated hBoundary

/-- A family of alternative maps from one shared source clock. -/
structure SharedClockTransformFamily where
  admissible : Type
  nonempty : Nonempty admissible
  transform : admissible → ClockTransform

/-- The single-map order theorem lifts pointwise to a nonempty family when
    each admissible member is the same map for both intervals. This is the
    shared-calibration case, distinct from the paired cross-clock case above. -/
theorem shared_family_preserves_definite_order
    (F : SharedClockTransformFamily)
    {a b : TimeInterval}
    (hBefore : definitelyBefore a b)
    (haDomain :
      ∀ θ, a.clockDomain = (F.transform θ).sourceDomain)
    (haScale :
      ∀ θ, a.clockScale = (F.transform θ).sourceScale) :
    ∀ θ : F.admissible,
      definitelyBefore
        (mapInterval (F.transform θ) a
          (haDomain θ) (haScale θ))
        (mapInterval (F.transform θ) b
          (by
            calc
              b.clockDomain = a.clockDomain := hBefore.1.1.symm
              _ = (F.transform θ).sourceDomain := haDomain θ)
          (by
            calc
              b.clockScale = a.clockScale := hBefore.1.2.1.symm
              _ = (F.transform θ).sourceScale := haScale θ)) := by
  intro θ
  exact definitelyBefore_preserved_by_shared_clock_transform
    (F.transform θ) (haDomain θ) (haScale θ) hBefore

#print axioms uniformlySeparated_iff_forall_joint_state
#print axioms uniformlySeparated_orders_every_joint_calibration
#print axioms one_nonseparated_joint_state_refutes_uniform_order
#print axioms shared_family_preserves_definite_order

end HsHVerification.JointClockCalibration
