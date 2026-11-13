import Mathlib

/-!
EQ-0014 historical shared-B audit.
Theorems formalize only the exact algebra and sign/uniqueness domain used by
the numerical test; they do not promote the archived formulas to physics.
-/

namespace HsHVerification.ArchiveEQ0014

def q (B : ℝ) : ℝ := B * (1 - B^2)

theorem q_expansion (B : ℝ) :
    q B = B - B^3 := by
  simp [q]
  ring

theorem q_positive_on_local_domain
    (B : ℝ) (h0 : 0 < B) (h1 : B < 1) :
    0 < q B := by
  rw [q]
  have hl : 0 < 1 - B := sub_pos.mpr h1
  have hr : 0 < 1 + B := by linarith
  rw [show 1 - B^2 = (1 - B) * (1 + B) by ring]
  exact mul_pos h0 (mul_pos hl hr)

theorem mass_sensitivity_identity (B mu : ℝ)
    (hB : B ≠ 0) (hmu : mu = 3 / (2 * B^5)) :
    (-5 * mu / B) = -15 / (2 * B^6) := by
  rw [hmu]
  field_simp
  ring

theorem semantic_fork_nonidentity (x : ℝ) :
    x - x^3 = x ↔ x = 0 := by
  constructor
  · intro h
    have hx3 : x^3 = 0 := by linarith
    by_contra hx
    exact (pow_ne_zero 3 hx) hx3
  · intro h
    simp [h]

end HsHVerification.ArchiveEQ0014
