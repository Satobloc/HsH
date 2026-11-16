import Mathlib

/-!
# Run-dependent calibration and reduced-law factorization

This is a conditional map-level refinement of the existing law-factorization
and instrument-masking notes in HsH issues #1591 and #1603.

The physical-law map, calibration state, and instrument response are kept as
separate inputs. If both the physical law and calibration state factor through
a proposed reduced representation, then the observed law factors through it.
If calibration is omitted, two states with the same reduced representation
and the same physical law can still have different observed outputs. In that
case no deterministic observed-law factor map exists on the proposed reduced
space. Including calibration in the reduced representation restores
set-level factorization whenever the physical law already factors.

The measurable theorem uses Mathlib's Doob-Dynkin factorization result. It
requires the observed-output codomain to be nonempty and standard Borel, and
requires both the physical-law and calibration maps to be measurable with
respect to the pullback sigma-algebra of the proposed reduced map.

This is not a probability-measure or Markov-kernel construction: the law
spaces and instrument map remain abstract types. It does not establish that
any H(s)H physical map exists, that calibration is known, or that a particular
instrument preserves a physical distinction.
-/

namespace HsHVerification.AldusCalibrationFiberFactorization

open scoped MeasureTheory

/-- A map factors through a proposed reduced representation as a set map. -/
def FactorsThrough {X R Y : Type*} (pi : X → R) (f : X → Y) : Prop :=
  ∃ g : R → Y, ∀ x, f x = g (pi x)

/-- If both the physical-law map and the calibration state factor through the
same reduced representation, their instrument-composed observed map does too. -/
theorem observed_law_factors_when_physical_and_calibration_factor
    {X R C P O : Type*}
    (pi : X → R) (calibration : X → C) (physicalLaw : X → P)
    (instrument : C × P → O)
    (hCalibration : FactorsThrough pi calibration)
    (hPhysical : FactorsThrough pi physicalLaw) :
    FactorsThrough pi (fun x => instrument (calibration x, physicalLaw x)) := by
  rcases hCalibration with ⟨calibrationBar, hCalibration⟩
  rcases hPhysical with ⟨physicalBar, hPhysical⟩
  refine ⟨fun r => instrument (calibrationBar r, physicalBar r), ?_⟩
  intro x
  change instrument (calibration x, physicalLaw x) =
    instrument (calibrationBar (pi x), physicalBar (pi x))
  rw [hCalibration x, hPhysical x]

/-- If two states share the same reduced representation and physical law but
their omitted calibration states produce different instrument outputs, the
observed map cannot factor through the reduced representation. -/
theorem omitted_calibration_can_block_reduced_factorization
    {X R C P O : Type*}
    (pi : X → R) (calibration : X → C) (physicalLaw : X → P)
    (instrument : C × P → O)
    (x y : X)
    (hSameReduced : pi x = pi y)
    (hSamePhysical : physicalLaw x = physicalLaw y)
    (hCalibrationSeparates :
      instrument (calibration x, physicalLaw x) ≠
        instrument (calibration y, physicalLaw x)) :
    ¬ FactorsThrough pi (fun z => instrument (calibration z, physicalLaw z)) := by
  intro hFactor
  rcases hFactor with ⟨observedBar, hObserved⟩
  apply hCalibrationSeparates
  calc
    instrument (calibration x, physicalLaw x) = observedBar (pi x) := hObserved x
    _ = observedBar (pi y) := by rw [hSameReduced]
    _ = instrument (calibration y, physicalLaw y) := (hObserved y).symm
    _ = instrument (calibration y, physicalLaw x) := by rw [hSamePhysical]

/-- The augmented representation retains both the original reduced state and
the calibration state. -/
def augmentedProjection {X R C : Type*}
    (pi : X → R) (calibration : X → C) : X → R × C :=
  fun x => (pi x, calibration x)

/-- If the physical-law map factors through the original reduced state, then
the observed map always factors through the augmented state that also carries
calibration. -/
theorem observed_law_factors_through_augmented_state
    {X R C P O : Type*}
    (pi : X → R) (calibration : X → C) (physicalLaw : X → P)
    (instrument : C × P → O)
    (hPhysical : FactorsThrough pi physicalLaw) :
    FactorsThrough (augmentedProjection pi calibration)
      (fun x => instrument (calibration x, physicalLaw x)) := by
  rcases hPhysical with ⟨physicalBar, hPhysical⟩
  refine ⟨fun rc => instrument (rc.2, physicalBar rc.1), ?_⟩
  intro x
  simp [augmentedProjection, hPhysical x]

/-- Measurable Doob-Dynkin factorization for a run-dependent instrument:
if calibration and the physical-law map are measurable with respect to the
pullback sigma-algebra of pi, and the instrument map is measurable, then
the observed map has a measurable factor on the reduced space, provided the
observed-output codomain is nonempty and standard Borel. -/
theorem measurable_observed_law_factors_through_reduced_state
    {X R C P O : Type*}
    [MeasurableSpace X] [MeasurableSpace R] [MeasurableSpace C]
    [MeasurableSpace P] [MeasurableSpace O]
    [Nonempty O] [StandardBorelSpace O]
    (pi : X → R) (calibration : X → C) (physicalLaw : X → P)
    (instrument : C × P → O)
    (hCalibration : Measurable[MeasurableSpace.comap pi inferInstance] calibration)
    (hPhysical : Measurable[MeasurableSpace.comap pi inferInstance] physicalLaw)
    (hInstrument : Measurable instrument) :
    ∃ observedBar : R → O,
      Measurable observedBar ∧
      (fun x => instrument (calibration x, physicalLaw x)) = observedBar ∘ pi := by
  letI : MeasurableSpace X := MeasurableSpace.comap pi inferInstance
  have hPair : Measurable (fun x => (calibration x, physicalLaw x)) :=
    hCalibration.prodMk hPhysical
  have hObserved : Measurable (fun x => instrument (calibration x, physicalLaw x)) :=
    hInstrument.comp hPair
  exact Measurable.exists_eq_measurable_comp (f := pi) hObserved

#print axioms observed_law_factors_when_physical_and_calibration_factor
#print axioms omitted_calibration_can_block_reduced_factorization
#print axioms observed_law_factors_through_augmented_state
#print axioms measurable_observed_law_factors_through_reduced_state

end HsHVerification.AldusCalibrationFiberFactorization
