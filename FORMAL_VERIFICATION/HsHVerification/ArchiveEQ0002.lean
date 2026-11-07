import Mathlib

namespace HsHVerification.ArchiveEQ0002

theorem diagonal_product_one (epsilon : ℝ) :
    Real.exp (-2 * epsilon) * Real.exp (2 * epsilon) = 1 := by
  rw [← Real.exp_add]
  ring_nf
  simp

theorem stretch_product_one (epsilon : ℝ) :
    Real.exp epsilon * Real.exp (-epsilon) = 1 := by
  rw [← Real.exp_add]
  ring_nf
  simp

theorem shape_entries_positive (epsilon : ℝ) :
    0 < Real.exp (-2 * epsilon) ∧ 0 < Real.exp (2 * epsilon) := by
  exact ⟨Real.exp_pos _, Real.exp_pos _⟩

theorem hencky_trace_zero (epsilon : ℝ) :
    (0 : ℝ) + 0 + epsilon + (-epsilon) = 0 := by
  ring

end HsHVerification.ArchiveEQ0002
