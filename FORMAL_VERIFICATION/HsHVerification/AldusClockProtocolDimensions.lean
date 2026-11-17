import Mathlib

/-!
# Dimensional audit of a historical SAT clock protocol

Source target:
  Satobloc/SAT_THEORY_ARCHIVE_2023-25/
  PREDICTIONS/CLOCK SHIFT PREDICTION PROTOCOL.txt

Source blob SHA-1:
  142b7bcc3420bc25f2147ecebe90ef5b67c0d0dc

The source is a historical assistant-authored memo dated 2025-06-03,
not a verified Nathan-authored equation or an accepted physical law.

This module formalizes only unit-exponent arithmetic under the explicitly
declared coordinate and normalization conventions below. It does not
validate the physical interpretation of theta4, u, divergence, or clocks.
-/

namespace HsHVerification.AldusClockProtocolDimensions

/-- Integer exponents in the (length, time) basis. -/
structure Dimension where
  lengthExponent : Int
  timeExponent : Int
  deriving DecidableEq, Repr

def dimensionless : Dimension := ⟨0, 0⟩
def lengthDim : Dimension := ⟨1, 0⟩
def inverseLengthDim : Dimension := ⟨-1, 0⟩
def timeDim : Dimension := ⟨0, 1⟩
def inverseTimeDim : Dimension := ⟨0, -1⟩

/-- Multiplication of quantities adds their dimension exponents. -/
def dimMul (a b : Dimension) : Dimension :=
  ⟨a.lengthExponent + b.lengthExponent,
   a.timeExponent + b.timeExponent⟩

/-- Division of quantities subtracts their dimension exponents. -/
def dimDiv (a b : Dimension) : Dimension :=
  ⟨a.lengthExponent - b.lengthExponent,
   a.timeExponent - b.timeExponent⟩

/-- A trigonometric function of an angle is dimensionless in SI. -/
def sinSquaredTheta4Dim : Dimension := dimensionless

/--
Under the normalized-u, time-coordinate convention, the divergence
of the foliation vector has inverse-time dimension.
-/
def foliationDivergenceTimeDim : Dimension := inverseTimeDim

/-- The 2025 memo's Z3 multiplier, transcribed without correction. -/
def z3MultiplierDim : Dimension :=
  dimMul sinSquaredTheta4Dim foliationDivergenceTimeDim

def properTimeIntervalDim : Dimension := timeDim

/-- The dimension of the memo's multiplier applied to a proper-time interval. -/
def z3ClockIntervalDim : Dimension :=
  dimMul z3MultiplierDim properTimeIntervalDim

theorem z3_multiplier_has_inverse_time_units :
    z3MultiplierDim = inverseTimeDim := by
  rfl

theorem z3_multiplier_is_not_dimensionless :
    z3MultiplierDim ≠ dimensionless := by
  decide

theorem z3_multiplier_times_proper_time_is_dimensionless :
    z3ClockIntervalDim = dimensionless := by
  rfl

theorem z3_result_is_not_a_proper_time_interval :
    z3ClockIntervalDim ≠ properTimeIntervalDim := by
  decide

/--
Any factor that preserves the dimension of a proper-time interval
must itself be dimensionless.
-/
theorem time_preserving_multiplier_is_dimensionless
    (factor : Dimension)
    (h : dimMul factor properTimeIntervalDim = properTimeIntervalDim) :
    factor = dimensionless := by
  rcases factor with ⟨l, t⟩
  simp [dimMul, properTimeIntervalDim, timeDim] at h
  rcases h with ⟨hl, ht⟩
  have ht0 : t = 0 := by omega
  simp [dimensionless, hl, ht0]

/--
A characteristic time scale has the units needed to make the divergence
dimensionless. This is a dimensional requirement, not a source-authorized
correction to the historical equation.
-/
def characteristicTimeScaleDim : Dimension := timeDim

def normalizedDivergenceDim : Dimension :=
  dimMul characteristicTimeScaleDim foliationDivergenceTimeDim

def normalizedZ3MultiplierDim : Dimension :=
  dimMul sinSquaredTheta4Dim normalizedDivergenceDim

def normalizedClockIntervalDim : Dimension :=
  dimMul normalizedZ3MultiplierDim properTimeIntervalDim

theorem normalized_divergence_is_dimensionless :
    normalizedDivergenceDim = dimensionless := by
  rfl

theorem normalized_factor_preserves_proper_time :
    normalizedClockIntervalDim = properTimeIntervalDim := by
  rfl

/-- The same dimensional issue under a length-coordinate convention. -/
def foliationDivergenceLengthDim : Dimension := inverseLengthDim
def properLengthIntervalDim : Dimension := lengthDim

def z3LengthClockIntervalDim : Dimension :=
  dimMul
    (dimMul sinSquaredTheta4Dim foliationDivergenceLengthDim)
    properLengthIntervalDim

theorem z3_length_convention_result_is_dimensionless :
    z3LengthClockIntervalDim = dimensionless := by
  rfl

/--
The later static expression sin²(theta4) * DeltaPhi / c² is
dimensionless when potential and speed-squared share L² T⁻² units.
This does not derive that expression from the earlier Z3 multiplier.
-/
def gravitationalPotentialDifferenceDim : Dimension := ⟨2, -2⟩
def speedOfLightSquaredDim : Dimension := ⟨2, -2⟩

def staticPotentialRatioDim : Dimension :=
  dimDiv gravitationalPotentialDifferenceDim speedOfLightSquaredDim

def staticRedshiftDim : Dimension :=
  dimMul sinSquaredTheta4Dim staticPotentialRatioDim

theorem static_potential_ratio_is_dimensionless :
    staticPotentialRatioDim = dimensionless := by
  rfl

theorem static_redshift_is_dimensionless :
    staticRedshiftDim = dimensionless := by
  rfl

#eval z3MultiplierDim
#eval z3ClockIntervalDim
#eval normalizedClockIntervalDim
#eval staticRedshiftDim

#print axioms z3_multiplier_has_inverse_time_units
#print axioms z3_multiplier_is_not_dimensionless
#print axioms z3_multiplier_times_proper_time_is_dimensionless
#print axioms z3_result_is_not_a_proper_time_interval
#print axioms time_preserving_multiplier_is_dimensionless
#print axioms normalized_factor_preserves_proper_time
#print axioms static_redshift_is_dimensionless

end HsHVerification.AldusClockProtocolDimensions
