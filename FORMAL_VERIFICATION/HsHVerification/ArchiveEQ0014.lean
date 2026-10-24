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
  positivity

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
    exact pow_eq_zero hx3
  · intro h
    simp [h]

end HsHVerification.ArchiveEQ0014
