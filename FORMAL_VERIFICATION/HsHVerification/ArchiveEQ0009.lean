import Mathlib

/-!
Archive recovery EQ-0009: D6 translation audit.
Source: SAT O Derivations/CODE-LOCKED DERIVS.txt, D6.
Blob: 783b05d39d59bf854b92090e15d205e6823b51c8

These theorems isolate dimensional repairs, constant-coupling cancellation, and
the product-rule term omitted when a locally varying coupling is used.  They do
not derive a gauge bundle, spinor representation, or physical coupling.
-/

namespace HsHVerification.ArchiveEQ0009

theorem archive_density_square_length_mismatch : (-3 : ℤ) + 2 = -1 := by
  norm_num

theorem volume_density_requires_cubic_length : (-3 : ℤ) + 3 = 0 := by
  norm_num

theorem current_connection_requires_square_length : (-3 : ℤ) + 2 = -1 := by
  norm_num

theorem constant_coupling_cancels
    (g K : ℝ) (hg : g ≠ 0) :
    (1 / g ^ 2) * (g * K) ^ 2 = K ^ 2 := by
  field_simp

theorem variable_coupling_product_term
    (g gp J Jp ell : ℝ) :
    ell ^ 2 * (gp * J + g * Jp) - g * (ell ^ 2 * Jp) = ell ^ 2 * gp * J := by
  ring

theorem omitted_term_nonzero
    (gp J ell : ℝ) (hgp : gp ≠ 0) (hJ : J ≠ 0) (hell : ell ≠ 0) :
    ell ^ 2 * gp * J ≠ 0 := by
  exact mul_ne_zero (mul_ne_zero (pow_ne_zero 2 hell) hgp) hJ

end HsHVerification.ArchiveEQ0009
