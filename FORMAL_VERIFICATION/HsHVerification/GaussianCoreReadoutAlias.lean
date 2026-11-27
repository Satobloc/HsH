import Mathlib

/-!
# Gaussian core/readout variance alias

This module formalizes only the non-injectivity of the two-instrument
variance map under the conditional Gaussian-convolution variance model.

It does not prove that any physical core or instrument has a Gaussian
kernel, nor that a proposed H(s)H worldtube has a measurable thickness.
-/

namespace HsHVerification.GaussianCoreReadoutAlias

/-- Under independent Gaussian convolution, observed variance is the sum
of intrinsic core variance and readout-kernel variance. -/
def observedVariance (coreVariance blurVariance : ℝ) : ℝ :=
  coreVariance + blurVariance

/-- Two instruments with separate, unknown Gaussian readout variances. -/
def twoInstrumentVarianceMap
    (coreVariance blurVariance₁ blurVariance₂ : ℝ) : ℝ × ℝ :=
  (observedVariance coreVariance blurVariance₁,
   observedVariance coreVariance blurVariance₂)

/-- A common shift from both instrument variances into the shared core
variance leaves both observed variances unchanged. -/
theorem common_shift_alias
    (coreVariance blurVariance₁ blurVariance₂ δ : ℝ) :
    twoInstrumentVarianceMap coreVariance blurVariance₁ blurVariance₂ =
      twoInstrumentVarianceMap (coreVariance + δ)
        (blurVariance₁ - δ) (blurVariance₂ - δ) := by
  simp [twoInstrumentVarianceMap, observedVariance]
  constructor <;> ring

/-- If the shift is positive and smaller than both blur variances, the
alternative parameter triple remains positive and has a different core
variance while producing exactly the same two observed variances. -/
theorem positive_two_instrument_alias
    (coreVariance blurVariance₁ blurVariance₂ δ : ℝ)
    (hcore : 0 < coreVariance)
    (hblur₁ : 0 < blurVariance₁)
    (hblur₂ : 0 < blurVariance₂)
    (hδ : 0 < δ)
    (hδ₁ : δ < blurVariance₁)
    (hδ₂ : δ < blurVariance₂) :
    twoInstrumentVarianceMap coreVariance blurVariance₁ blurVariance₂ =
      twoInstrumentVarianceMap (coreVariance + δ)
        (blurVariance₁ - δ) (blurVariance₂ - δ) ∧
      0 < coreVariance + δ ∧
      0 < blurVariance₁ - δ ∧
      0 < blurVariance₂ - δ ∧
      coreVariance ≠ coreVariance + δ := by
  refine ⟨common_shift_alias coreVariance blurVariance₁ blurVariance₂ δ,
    ?_, ?_, ?_, ?_⟩
  · linarith
  · linarith
  · linarith
  · intro hEq
    linarith

/-- Rational witness for executable evaluation of the same algebraic
non-injectivity; it is not a physical fixture. -/
def twoInstrumentVarianceMapQ
    (coreVariance blurVariance₁ blurVariance₂ : ℚ) : ℚ × ℚ :=
  (coreVariance + blurVariance₁, coreVariance + blurVariance₂)

#eval decide
  (twoInstrumentVarianceMapQ 1 3 4 = twoInstrumentVarianceMapQ 2 2 3)
#eval decide ((1 : ℚ) ≠ 2)

#print axioms common_shift_alias
#print axioms positive_two_instrument_alias

end HsHVerification.GaussianCoreReadoutAlias
