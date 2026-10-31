import Mathlib

/-!
Archive recovery EQ-0011: D8 interaction-polynomial audit.
Source: SAT O Derivations/CODE-LOCKED DERIVS.txt, D8, lines 398-448.
Blob: 783b05d39d59bf854b92090e15d205e6823b51c8

These theorems formalize only dimensional exponents and a representative
quartic-sextic stability identity. They do not derive D8's coefficients,
field normalization, sign convention, or physical interpretation.
-/

namespace HsHVerification.ArchiveEQ0011

theorem quartic_coupling_dimension :
    (-4 : ℤ) - 4 * (-1) = 0 := by
  norm_num

theorem sextic_coupling_dimension :
    (-4 : ℤ) - 6 * (-1) = 2 := by
  norm_num

theorem yukawa_coupling_dimension :
    (-4 : ℚ) - (2 * (-3 / 2) + (-1)) = 0 := by
  norm_num

theorem normalized_polynomial_factorization (u : ℝ) :
    (-3 * u^2 + 2 * u^3) + 1 = (u - 1)^2 * (2*u + 1) := by
  ring

theorem normalized_polynomial_lower_bound (u : ℝ) (hu : 0 ≤ u) :
    -1 ≤ -3 * u^2 + 2 * u^3 := by
  have hs : 0 ≤ (u - 1)^2 := sq_nonneg (u - 1)
  have hl : 0 ≤ 2*u + 1 := by nlinarith
  have hp : 0 ≤ (u - 1)^2 * (2*u + 1) := mul_nonneg hs hl
  rw [← normalized_polynomial_factorization u] at hp
  linarith

theorem normalized_stationary_minimum :
    -3 * (1 : ℝ)^2 + 2 * (1 : ℝ)^3 = -1 := by
  norm_num

end HsHVerification.ArchiveEQ0011
