import Mathlib
import HsHVerification.RavelJointAccommodationReadout
import HsHVerification.RavelCouplingDimensionalAudit

/-!
# Mercer: dimensionally typed coupled readout

This module closes one narrow gap between the coupling-preserving projection
contract and the existing pairwise-discrimination workflow.

1. A joint readout (observable, coupling signature) descends through a
   projection exactly when BOTH components are constant on each projection
   fiber.
2. If the two components have different physical dimensions, their raw
   squared differences cannot be added as one scalar quantity. A diagonal
   product discrepancy therefore requires a positive reference scale for
   each channel, with the same dimension as that channel.

The statements are abstract. No H(s)H physical map, metric, calibration,
covariance, or measured system is instantiated here. The normalized squared
discrepancy is not asserted to be a metric or a likelihood.
-/

namespace HsHVerification.MercerCoupledReadoutMetric

open HsHVerification.RavelCarrierSliceReconstruction
open HsHVerification.RavelJointAccommodationReadout
open HsHVerification.RavelCouplingDimensionalAudit

universe u v z a b

variable {Ambient : Type u} {Base : Type v} {Label : Type z}
variable {Observable : Type a} {Coupling : Type b}
variable (T : FiberedSupport Ambient Base)
variable (S : EmbeddedSupportFamily Ambient Label)
variable (baseOf : Label → Base)

abbrev State := JointState T S baseOf

/-- The coupled readout retains both the observable and its coupling signature. -/
def jointReadout
    (observable : State T S baseOf → Observable)
    (coupling : State T S baseOf → Coupling) :
    State T S baseOf → Observable × Coupling :=
  fun p => (observable p, coupling p)

/-- A joint readout descends to a tube-only quotient iff both components
    are separately constant on every same-tube fiber. -/
theorem jointReadoutDescendsToTubeIff
    (observable : State T S baseOf → Observable)
    (coupling : State T S baseOf → Coupling) :
    DescendsToTubeOnlyQuotient T S baseOf
      (jointReadout T S baseOf observable coupling) ↔
    ∀ p q, sameTube T S baseOf p q →
      observable p = observable q ∧ coupling p = coupling q := by
  change
    DescendsToTubeOnlyQuotient T S baseOf
      (fun p => (observable p, coupling p)) ↔
    ∀ p q, sameTube T S baseOf p q →
      observable p = observable q ∧ coupling p = coupling q
  have hGeneric := readout_descends_iff_constant_on_same_tube_fibers
    T S baseOf (fun p => (observable p, coupling p))
  constructor
  · intro hDesc p q hSame
    exact Prod.ext_iff.mp (hGeneric.mp hDesc p q hSame)
  · intro hComponents
    apply hGeneric.mpr
    intro p q hSame
    exact Prod.ext (hComponents p q hSame).1 (hComponents p q hSame).2

/-- Symmetric result for a sheet-only quotient. -/
theorem jointReadoutDescendsToSheetIff
    (observable : State T S baseOf → Observable)
    (coupling : State T S baseOf → Coupling) :
    DescendsToSheetOnlyQuotient T S baseOf
      (jointReadout T S baseOf observable coupling) ↔
    ∀ p q, sameSheet T S baseOf p q →
      observable p = observable q ∧ coupling p = coupling q := by
  change
    DescendsToSheetOnlyQuotient T S baseOf
      (fun p => (observable p, coupling p)) ↔
    ∀ p q, sameSheet T S baseOf p q →
      observable p = observable q ∧ coupling p = coupling q
  have hGeneric := readout_descends_iff_constant_on_same_sheet_fibers
    T S baseOf (fun p => (observable p, coupling p))
  constructor
  · intro hDesc p q hSame
    exact Prod.ext_iff.mp (hGeneric.mp hDesc p q hSame)
  · intro hComponents
    apply hGeneric.mpr
    intro p q hSame
    exact Prod.ext (hComponents p q hSame).1 (hComponents p q hSame).2

/-- A coupling difference on one same-tube fiber blocks deterministic
    tube-only reduction of the joint readout, even if the observable itself
    happens to agree. -/
theorem couplingDifferenceForbidsTubeOnlyReduction
    (observable : State T S baseOf → Observable)
    (coupling : State T S baseOf → Coupling)
    (p q : State T S baseOf)
    (same : sameTube T S baseOf p q)
    (different : coupling p ≠ coupling q) :
    ¬ DescendsToTubeOnlyQuotient T S baseOf
      (jointReadout T S baseOf observable coupling) := by
  intro hdesc
  have hcomponents :=
    (jointReadoutDescendsToTubeIff T S baseOf observable coupling).mp hdesc
  exact different (hcomponents p q same).2

/-- A corresponding observable difference also blocks tube-only reduction. -/
theorem observableDifferenceForbidsTubeOnlyReduction
    (observable : State T S baseOf → Observable)
    (coupling : State T S baseOf → Coupling)
    (p q : State T S baseOf)
    (same : sameTube T S baseOf p q)
    (different : observable p ≠ observable q) :
    ¬ DescendsToTubeOnlyQuotient T S baseOf
      (jointReadout T S baseOf observable coupling) := by
  intro hdesc
  have hcomponents :=
    (jointReadoutDescendsToTubeIff T S baseOf observable coupling).mp hdesc
  exact different (hcomponents p q same).1

/-! ## Dimensional typing for a heterogeneous product readout -/

/-- The dimension signature of a dimensionless quantity. -/
def dDimensionless : Dim := ⟨0, 0, 0⟩

/-- A scalar value carrying an SI dimension signature. -/
structure UnitTagged (d : Dim) where
  value : ℝ

/-- A positive calibration/reference scale carrying the same dimension
    as the channel it normalizes. -/
structure PositiveUnitScale (d : Dim) where
  value : ℝ
  positive : 0 < value

/-- Subtraction is available only between values with the same dimension. -/
def unitSubtract {d : Dim} (x y : UnitTagged d) : UnitTagged d :=
  ⟨x.value - y.value⟩

/-- Division carries the quotient of the numerator and denominator dimensions. -/
noncomputable def unitDivide {dN dD : Dim}
    (x : UnitTagged dN) (scale : PositiveUnitScale dD) :
    UnitTagged (Dim.div dN dD) :=
  ⟨x.value / scale.value⟩

/-- Transport a tagged value only along an explicit dimension equality. -/
def castUnitTagged {d1 d2 : Dim} (h : d1 = d2)
    (x : UnitTagged d1) : UnitTagged d2 :=
  h ▸ x

/-- Squaring carries the product dimension. -/
def unitSquare {d : Dim} (x : UnitTagged d) : UnitTagged (Dim.mul d d) :=
  ⟨x.value ^ 2⟩

/-- Addition is available only for values with the same dimension. -/
def unitAdd {d : Dim} (x y : UnitTagged d) : UnitTagged d :=
  ⟨x.value + y.value⟩

/-- The ratio of a dimension signature by itself is dimensionless. -/
theorem dimensionDivSelfIsDimensionless (d : Dim) :
    Dim.div d d = dDimensionless := by
  cases d with
  | mk m l t =>
    simp [Dim.div, dDimensionless]

/-- Dividing a channel difference by a positive scale of the same dimension
    produces a dimensionless value by transporting the quotient tag through
    the proved identity Dim.div d d = dDimensionless. -/
noncomputable def normalizedDifference {d : Dim}
    (x y : UnitTagged d) (scale : PositiveUnitScale d) :
    UnitTagged dDimensionless :=
  castUnitTagged (dimensionDivSelfIsDimensionless d)
    (unitDivide (unitSubtract x y) scale)

/-- A diagonal normalized squared discrepancy for two heterogeneous channels.
    Each channel is normalized through typed division; squaring and addition
    retain their dimension tags, and the final dimensionless tag follows from
    the zero-exponent identity. This is a proposed baseline discrepancy, not
    a selected H(s)H metric. -/
noncomputable def normalizedPairSquaredDiscrepancy {dO dC : Dim}
    (o1 o2 : UnitTagged dO) (oScale : PositiveUnitScale dO)
    (c1 c2 : UnitTagged dC) (cScale : PositiveUnitScale dC) :
    UnitTagged dDimensionless :=
  let o := normalizedDifference o1 o2 oScale
  let c := normalizedDifference c1 c2 cScale
  castUnitTagged (by simp [Dim.mul, dDimensionless])
    (unitAdd (unitSquare o) (unitSquare c))

/-- Squaring a same-dimension normalized component remains dimensionless. -/
theorem normalizedComponentSquareIsDimensionless (d : Dim) :
    Dim.mul (Dim.div d d) (Dim.div d d) = dDimensionless := by
  rw [dimensionDivSelfIsDimensionless]
  simp [Dim.mul, dDimensionless]

/-- A raw sum of squared channel differences can have one dimension signature
    only when the two channel dimensions are equal. -/
theorem equalSquaredDimensionsImplyEqualDimensions
    (dO dC : Dim)
    (h : Dim.mul dO dO = Dim.mul dC dC) :
    dO = dC := by
  cases dO with
  | mk mO lO tO =>
    cases dC with
    | mk mC lC tC =>
      simp [Dim.mul] at h
      rcases h with ⟨hm, hl, ht⟩
      simp
      omega

/-- If channel dimensions differ, their raw squared differences cannot be
    combined by ordinary addition without a normalization or other declared
    dimensional conversion. -/
theorem unequalDimensionsHaveUnequalSquares
    (dO dC : Dim) (different : dO ≠ dC) :
    Dim.mul dO dO ≠ Dim.mul dC dC := by
  intro h
  exact different (equalSquaredDimensionsImplyEqualDimensions dO dC h)

/-- The normalized diagonal product discrepancy is nonnegative. -/
theorem normalizedPairSquaredDiscrepancyNonnegative
    {dO dC : Dim}
    (o1 o2 : UnitTagged dO) (oScale : PositiveUnitScale dO)
    (c1 c2 : UnitTagged dC) (cScale : PositiveUnitScale dC) :
    0 ≤ (normalizedPairSquaredDiscrepancy o1 o2 oScale c1 c2 cScale).value := by
  simp [normalizedPairSquaredDiscrepancy, normalizedDifference,
    unitDivide, unitSubtract, unitSquare, unitAdd, castUnitTagged,
    dimensionDivSelfIsDimensionless, Dim.mul, Dim.div, dDimensionless]
  positivity

#print axioms unitDivide
#print axioms normalizedDifference
#print axioms normalizedPairSquaredDiscrepancy
#print axioms jointReadoutDescendsToTubeIff
#print axioms jointReadoutDescendsToSheetIff
#print axioms couplingDifferenceForbidsTubeOnlyReduction
#print axioms dimensionDivSelfIsDimensionless
#print axioms normalizedComponentSquareIsDimensionless
#print axioms equalSquaredDimensionsImplyEqualDimensions
#print axioms unequalDimensionsHaveUnequalSquares
#print axioms normalizedPairSquaredDiscrepancyNonnegative

end HsHVerification.MercerCoupledReadoutMetric
