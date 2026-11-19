import Mathlib

/-!
# Hale / Kolmogorov–Barenblatt source-parameter interval check

Primary source:
Takumi Matsuzawa, Minhui Zhu, Nigel Goldenfeld, William T. M. Irvine,
"Nonlinear diffusion and decay of a blob of turbulence spreading into a
quiescent fluid," PNAS 123 (2026), e2526858123,
DOI: 10.1073/pnas.2526858123.

Supporting Information, §D, p. 7, reports:
* instantaneous eddy adaptation: ell(t) = alpha * h(t);
* alpha in [0.3, 0.6];
* epsilon_0 = 0.88 plus/minus 0.10;
* c_0 = 1.20 plus/minus 0.11;
* the model's numerical shooting maps the observed large-blob exponent
  theta = 0.16 plus/minus 0.06 to epsilon_0/(c_0*alpha^2) in [40, 122].

The plus/minus values and alpha range are source-reported loose bounds, not a
joint confidence region or a covariance model. This module proves only
the exact rational interval arithmetic conditional on treating those
marginal bounds as a rectangular enclosure. It does not validate the
measurements, their uncertainty semantics, or the numerical shooting map.
-/

namespace HsHVerification.HaleKBParameterBounds

/-- The dimensionless ratio appearing in the instantaneous-eddy reduction. -/
def parameterRatio (epsilon0 c0 alpha : ℚ) : ℚ :=
  epsilon0 / (c0 * alpha ^ 2)

/-- Source-reported marginal lower/upper bounds, encoded exactly as rationals. -/
def epsilonLower : ℚ := 78 / 100
def epsilonUpper : ℚ := 98 / 100
def c0Lower : ℚ := 109 / 100
def c0Upper : ℚ := 131 / 100
def alphaLower : ℚ := 3 / 10
def alphaUpper : ℚ := 3 / 5

/-- Lower corner of the source-parameter rectangular enclosure. -/
def ratioLower : ℚ := 650 / 393

/-- Upper corner of the source-parameter rectangular enclosure. -/
def ratioUpper : ℚ := 9800 / 981

/--
If the source-reported marginal ranges are treated as a rectangular box,
the ratio epsilon0/(c0*alpha^2) lies in the exact rational enclosure
[650/393, 9800/981].
-/
theorem parameterRatio_enclosed
    (epsilon0 c0 alpha : ℚ)
    (hEpsilonLower : epsilonLower ≤ epsilon0)
    (hEpsilonUpper : epsilon0 ≤ epsilonUpper)
    (hC0Lower : c0Lower ≤ c0)
    (hC0Upper : c0 ≤ c0Upper)
    (hAlphaLower : alphaLower ≤ alpha)
    (hAlphaUpper : alpha ≤ alphaUpper) :
    ratioLower ≤ parameterRatio epsilon0 c0 alpha ∧
      parameterRatio epsilon0 c0 alpha ≤ ratioUpper := by
  have hAlphaLowerBound : (3 : ℚ) / 10 ≤ alpha := by
    simpa [alphaLower] using hAlphaLower
  have hAlphaUpperBound : alpha ≤ (3 : ℚ) / 5 := by
    simpa [alphaUpper] using hAlphaUpper
  have hAlphaSqLower : alphaLower ^ 2 ≤ alpha ^ 2 := by
    change ((3 : ℚ) / 10) ^ 2 ≤ alpha ^ 2
    have h1 : 0 ≤ alpha - (3 : ℚ) / 10 := by
      linarith [hAlphaLowerBound]
    have h2 : 0 ≤ alpha + (3 : ℚ) / 10 := by
      linarith [hAlphaLowerBound]
    have hprod : 0 ≤ (alpha - (3 : ℚ) / 10) * (alpha + (3 : ℚ) / 10) :=
      mul_nonneg h1 h2
    nlinarith [hprod]
  have hAlphaSqUpper : alpha ^ 2 ≤ alphaUpper ^ 2 := by
    change alpha ^ 2 ≤ ((3 : ℚ) / 5) ^ 2
    have h1 : 0 ≤ (3 : ℚ) / 5 - alpha := by
      linarith [hAlphaUpperBound]
    have h2 : 0 ≤ (3 : ℚ) / 5 + alpha := by
      linarith [hAlphaLowerBound]
    have hprod : 0 ≤ ((3 : ℚ) / 5 - alpha) * ((3 : ℚ) / 5 + alpha) :=
      mul_nonneg h1 h2
    nlinarith [hprod]
  have hC0Positive : 0 < c0 := by
    dsimp [c0Lower] at hC0Lower
    linarith
  have hAlphaPositive : 0 < alpha := by
    dsimp [alphaLower] at hAlphaLower
    linarith
  have hDenominatorPositive : 0 < c0 * alpha ^ 2 :=
    mul_pos hC0Positive (sq_pos_of_pos hAlphaPositive)
  have hDenominatorLower :
      c0Lower * alphaLower ^ 2 ≤ c0 * alpha ^ 2 := by
    calc
      c0Lower * alphaLower ^ 2 ≤ c0 * alphaLower ^ 2 := by
        exact mul_le_mul_of_nonneg_right hC0Lower (sq_nonneg alphaLower)
      _ ≤ c0 * alpha ^ 2 := by
        exact mul_le_mul_of_nonneg_left hAlphaSqLower (le_of_lt hC0Positive)
  have hDenominatorUpper :
      c0 * alpha ^ 2 ≤ c0Upper * alphaUpper ^ 2 := by
    calc
      c0 * alpha ^ 2 ≤ c0Upper * alpha ^ 2 := by
        exact mul_le_mul_of_nonneg_right hC0Upper (sq_nonneg alpha)
      _ ≤ c0Upper * alphaUpper ^ 2 := by
        exact mul_le_mul_of_nonneg_left hAlphaSqUpper (by
          dsimp [c0Upper]
          norm_num)
  have hLowerNumerator :
      ratioLower * (c0 * alpha ^ 2) ≤ epsilon0 := by
    calc
      ratioLower * (c0 * alpha ^ 2) ≤
          ratioLower * (c0Upper * alphaUpper ^ 2) := by
        exact mul_le_mul_of_nonneg_left hDenominatorUpper (by norm_num [ratioLower])
      _ ≤ epsilonLower := by
        norm_num [ratioLower, c0Upper, alphaUpper, epsilonLower]
      _ ≤ epsilon0 := hEpsilonLower
  have hUpperNumerator :
      epsilon0 ≤ ratioUpper * (c0 * alpha ^ 2) := by
    calc
      epsilon0 ≤ epsilonUpper := hEpsilonUpper
      _ ≤ ratioUpper * (c0Lower * alphaLower ^ 2) := by
        norm_num [ratioUpper, epsilonUpper, c0Lower, alphaLower]
      _ ≤ ratioUpper * (c0 * alpha ^ 2) := by
        exact mul_le_mul_of_nonneg_left hDenominatorLower (by norm_num [ratioUpper])
  constructor
  · exact (le_div_iff₀ hDenominatorPositive).2 hLowerNumerator
  · exact (div_le_iff₀ hDenominatorPositive).2 hUpperNumerator

/- Exact lower corner: 0.78 / (1.31 * 0.6^2) = 650/393. -/
#eval parameterRatio epsilonLower c0Upper alphaUpper

/- Exact upper corner: 0.98 / (1.09 * 0.3^2) = 9800/981. -/
#eval parameterRatio epsilonUpper c0Lower alphaLower

#print axioms parameterRatio_enclosed

end HsHVerification.HaleKBParameterBounds
