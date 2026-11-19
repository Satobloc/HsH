import Mathlib
import HsHVerification.JointClockCalibrationFamily

/-!
# Source-validity windows for joint clock calibration

A monotone transform and a joint calibration family do not by themselves
authorize extrapolation beyond the source interval on which a calibration is
known to be valid. This module adds a proof-carrying coverage gate.

The guaranteed bounds are conservative source-side validity bounds. If the
validity endpoints are uncertain, they must already be reduced to a
source-authorized guaranteed-valid core. The propositions below do not
authenticate those bounds or their provenance.
-/

namespace HsHVerification.ClockCalibrationValidity

open HsHVerification.AldusTemporalProvenance
open HsHVerification.JointClockCalibration

/-- A conservative, source-side interval on which a clock calibration is
    declared guaranteed valid. The domain and scale must be known. -/
structure GuaranteedCalibrationWindow where
  clockDomain : ClockDomain
  clockScale : ClockScale
  clockDomainKnown : clockDomain ≠ .unknown
  clockScaleKnown : clockScale ≠ .unknown
  guaranteedFrom : Nat
  guaranteedThrough : Nat
  ordered : guaranteedFrom ≤ guaranteedThrough

/-- An event interval is covered only when its entire source-time interval
    lies inside the guaranteed-valid window, in the same clock and scale. -/
def covers (W : GuaranteedCalibrationWindow) (I : TimeInterval) : Prop :=
  I.clockDomain = W.clockDomain ∧
  I.clockScale = W.clockScale ∧
  W.guaranteedFrom ≤ I.lower ∧
  I.upper ≤ W.guaranteedThrough

/-- Every admissible source time inside a covered event interval lies inside
    the guaranteed-valid calibration window. -/
theorem every_admissible_source_time_lies_in_guaranteed_window
    (W : GuaranteedCalibrationWindow)
    (I : TimeInterval)
    (hCovered : covers W I)
    {t : Nat}
    (hAdmissible : I.lower ≤ t ∧ t ≤ I.upper) :
    W.guaranteedFrom ≤ t ∧ t ≤ W.guaranteedThrough := by
  rcases hCovered with ⟨_, _, hFrom, hThrough⟩
  rcases hAdmissible with ⟨hLower, hUpper⟩
  exact ⟨le_trans hFrom hLower, le_trans hUpper hThrough⟩

/-- A joint calibration family augmented with a guaranteed source-validity
    window for each clock in each admissible joint state. The windows remain
    in their respective source clocks; no conversion is inferred. -/
structure JointClockCalibrationWithValidity where
  family : JointClockCalibrationFamily
  firstWindow : family.admissible → GuaranteedCalibrationWindow
  secondWindow : family.admissible → GuaranteedCalibrationWindow
  firstWindowDomainEq :
    ∀ θ, (firstWindow θ).clockDomain = family.firstSourceDomain
  firstWindowScaleEq :
    ∀ θ, (firstWindow θ).clockScale = family.firstSourceScale
  secondWindowDomainEq :
    ∀ θ, (secondWindow θ).clockDomain = family.secondSourceDomain
  secondWindowScaleEq :
    ∀ θ, (secondWindow θ).clockScale = family.secondSourceScale

/-- Map the first event interval only after proving that its whole interval
    is covered by the first clock's guaranteed-valid source window. -/
def mapFirstWithinValidity
    (J : JointClockCalibrationWithValidity)
    (a : TimeInterval)
    (θ : J.family.admissible)
    (hCovered : covers (J.firstWindow θ) a) : TimeInterval :=
  mapFirst J.family a θ
    ((hCovered.1).trans (J.firstWindowDomainEq θ))
    ((hCovered.2.1).trans (J.firstWindowScaleEq θ))

/-- Map the second event interval only after proving that its whole interval
    is covered by the second clock's guaranteed-valid source window. -/
def mapSecondWithinValidity
    (J : JointClockCalibrationWithValidity)
    (b : TimeInterval)
    (θ : J.family.admissible)
    (hCovered : covers (J.secondWindow θ) b) : TimeInterval :=
  mapSecond J.family b θ
    ((hCovered.1).trans (J.secondWindowDomainEq θ))
    ((hCovered.2.1).trans (J.secondWindowScaleEq θ))

/-- Both source intervals must be covered for every admissible joint
    calibration state before a universal cross-clock order is used. -/
def uniformlyCovered
    (J : JointClockCalibrationWithValidity)
    (a b : TimeInterval) : Prop :=
  (∀ θ : J.family.admissible, covers (J.firstWindow θ) a) ∧
  (∀ θ : J.family.admissible, covers (J.secondWindow θ) b)

/-- Uniform joint-boundary separation plus per-state coverage of both entire
    source intervals yields definite order for every admissible calibration
    state, without applying a transform outside its declared validity window. -/
theorem uniformlySeparated_orders_every_supported_joint_calibration
    (J : JointClockCalibrationWithValidity)
    (a b : TimeInterval)
    (hCovered : uniformlyCovered J a b)
    (hSeparated : uniformlySeparated J.family a b) :
    ∀ θ : J.family.admissible,
      definitelyBefore
        (mapFirstWithinValidity J a θ (hCovered.1 θ))
        (mapSecondWithinValidity J b θ (hCovered.2 θ)) := by
  intro θ
  simpa [mapFirstWithinValidity, mapSecondWithinValidity] using
    (uniformlySeparated_orders_every_joint_calibration
      J.family
      ((hCovered.1 θ).1.trans (J.firstWindowDomainEq θ))
      ((hCovered.1 θ).2.1.trans (J.firstWindowScaleEq θ))
      ((hCovered.2 θ).1.trans (J.secondWindowDomainEq θ))
      ((hCovered.2 θ).2.1.trans (J.secondWindowScaleEq θ))
      hSeparated θ)

/-- One admissible state whose first event interval exceeds its calibration
    validity window refutes uniform two-clock coverage. -/
theorem one_first_window_failure_refutes_uniform_coverage
    (J : JointClockCalibrationWithValidity)
    (a b : TimeInterval)
    (θ : J.family.admissible)
    (hFailure : ¬ covers (J.firstWindow θ) a) :
    ¬ uniformlyCovered J a b := by
  intro hCovered
  exact hFailure (hCovered.1 θ)

/-- One admissible state whose second event interval exceeds its calibration
    validity window refutes uniform two-clock coverage. -/
theorem one_second_window_failure_refutes_uniform_coverage
    (J : JointClockCalibrationWithValidity)
    (a b : TimeInterval)
    (θ : J.family.admissible)
    (hFailure : ¬ covers (J.secondWindow θ) b) :
    ¬ uniformlyCovered J a b := by
  intro hCovered
  exact hFailure (hCovered.2 θ)

#print axioms every_admissible_source_time_lies_in_guaranteed_window
#print axioms uniformlySeparated_orders_every_supported_joint_calibration
#print axioms one_first_window_failure_refutes_uniform_coverage
#print axioms one_second_window_failure_refutes_uniform_coverage

end HsHVerification.ClockCalibrationValidity
