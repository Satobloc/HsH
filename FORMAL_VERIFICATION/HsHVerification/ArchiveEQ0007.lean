import Mathlib

/-!
Archive recovery EQ-0007: D4 linearized-Ricci component audit.
Source: SAT O Derivations/CODE-LOCKED DERIVS.txt, D4, lines 172-221.
Blob: 783b05d39d59bf854b92090e15d205e6823b51c8

For the flat-background test h_12 = cos(k*x0), the trace and divergence terms
vanish. The archive expression gives zero, while the missing tensor Laplacian
contributes k^2/2 at x0=0. This does not establish an H(s)H curvature source.
-/

namespace HsHVerification.ArchiveEQ0007

theorem corrected_offdiag_component (k : ℝ) :
    -(1 / 2 : ℝ) * (-k ^ 2) = k ^ 2 / 2 := by
  ring

theorem archive_component_disagrees
    (k : ℝ) (hk : k ≠ 0) :
    (0 : ℝ) ≠ k ^ 2 / 2 := by
  have hk2 : k ^ 2 ≠ 0 := pow_ne_zero 2 hk
  intro h
  apply hk2
  linarith

theorem singular_limit (epsilon : ℝ) (h : epsilon = 1) :
    1 - epsilon ^ 2 = 0 := by
  subst epsilon
  norm_num

theorem strain_metric_length_exponents_differ : (-1 : ℤ) ≠ 0 := by
  norm_num

end HsHVerification.ArchiveEQ0007
