import Mathlib

/-!
# NIST point-mass Legendre-series cancellation audit

Primary source: S. Schlamminger et al., Metrologia 63 (2026) 025012,
DOI 10.1088/1681-7575/ae570f, final NIST-hosted PDF (pub_id 961075),
pp. 13-14, Eqs. (25)-(29).

Equation (25) contains terms η^(2*l) * (P_(2*l)(cos Δφ) + P_(2*l)(sin Δφ)).
The accompanying text says odd l contributions cancel on differentiation,
then Eq. (27) retains only degrees 4*l. The degree-2 term does cancel.
The degree-6 term does not: its derivative combination is
  -(63/32) * sin(4 Δφ),
or, with s = sin Δφ and c = cos Δφ,
  -(63/8) * s * c * (c^2 - s^2).

The module proves only finite polynomial identities and conditional
non-cancellation when 0 < s < c. The scaled degree-6 derivative polynomial
below is 16 times P₆', avoiding noncomputable real division in its definition.

It does not formalize the infinite-series convergence, source transcription,
measured η, numerical maximizer, instrument, or any physical premise. It is
not a proof of the NIST paper's complete model or an H(s)H statement.
-/

namespace HsHVerification.NISTLegendreCancellation

/-- Derivative of the degree-2 Legendre polynomial P₂. -/
def p2Prime (x : ℝ) : ℝ := 3 * x

/-- Sixteen times the derivative of
    P₆(x) = (231 x⁶ - 315 x⁴ + 105 x² - 5) / 16. -/
def p6PrimeScaled (x : ℝ) : ℝ :=
  1386 * x ^ 5 - 1260 * x ^ 3 + 210 * x

/-- The degree-2 derivative combination cancels identically. -/
def p2DerivativeCombination (s c : ℝ) : ℝ :=
  -s * p2Prime c + c * p2Prime s

theorem p2DerivativeCombination_eq_zero (s c : ℝ) :
    p2DerivativeCombination s c = 0 := by
  simp [p2DerivativeCombination, p2Prime]
  ring

/-- Sixteen times the degree-6 derivative combination,
    corresponding to the ℓ = 3 term in Eq. (25). -/
def p6DerivativeCombinationScaled (s c : ℝ) : ℝ :=
  -s * p6PrimeScaled c + c * p6PrimeScaled s

theorem p6DerivativeCombinationScaled_factor (s c : ℝ) :
    p6DerivativeCombinationScaled s c =
      -126 * s * c * (c ^ 2 - s ^ 2) := by
  simp [p6DerivativeCombinationScaled, p6PrimeScaled]
  ring_nf

/-- For 0 < s < c, the degree-6 term cannot cancel. In the angular
    application, s = sin Δφ and c = cos Δφ on 0 < Δφ < π/4. -/
theorem p6DerivativeCombinationScaled_ne_zero
    {s c : ℝ} (hs : 0 < s) (hc : 0 < c) (hsc : s < c) :
    p6DerivativeCombinationScaled s c ≠ 0 := by
  rw [p6DerivativeCombinationScaled_factor]
  have hdiff : 0 < c ^ 2 - s ^ 2 := by nlinarith
  have hprod : 0 < s * c * (c ^ 2 - s ^ 2) := by positivity
  have hneg : -126 * s * c * (c ^ 2 - s ^ 2) < 0 := by
    nlinarith
  exact ne_of_lt hneg

#print axioms p2DerivativeCombination_eq_zero
#print axioms p6DerivativeCombinationScaled_factor
#print axioms p6DerivativeCombinationScaled_ne_zero

end HsHVerification.NISTLegendreCancellation
