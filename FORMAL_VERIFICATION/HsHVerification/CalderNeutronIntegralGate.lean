import Mathlib

/-!
Calder: conditional integral / inverse-calibration mathematics.
Real physical anchor: Werner et al. neutron interferometer, PRL 35 1053 (1975).
B * L = K is a standard Pauli spin-precession calibration equation,
NOT an H(s)H forward law. B is measured magnet-gap field in gauss,
L is effective integrated-field length in cm, K in gauss cm.
-/

namespace HsHVerification.CalderNeutron

def twoSegmentField (b₁ b₂ l₁ l₂ : ℝ) : ℝ :=
  b₁ * l₁ + b₂ * l₂

theorem inverse_calibration (K B L : ℝ)
    (hB : B ≠ 0) (h : B * L = K) : L = K / B := by
  apply (eq_div_iff hB).2
  nlinarith [h]

theorem unique_effective_length (K B L₁ L₂ : ℝ)
    (hB : B ≠ 0) (h₁ : B * L₁ = K) (h₂ : B * L₂ = K) :
    L₁ = L₂ := by
  have heq : B * L₁ = B * L₂ := h₁.trans h₂.symm
  exact mul_left_cancel₀ hB heq

theorem field_profile_redistribution (b₁ b₂ l₁ l₂ δ : ℝ)
    (hl₁ : l₁ ≠ 0) (hl₂ : l₂ ≠ 0) :
    twoSegmentField (b₁ + δ / l₁) (b₂ - δ / l₂) l₁ l₂ =
      twoSegmentField b₁ b₂ l₁ l₂ := by
  dsimp [twoSegmentField]
  field_simp [hl₁, hl₂]
  ring

#print axioms inverse_calibration
#print axioms unique_effective_length
#print axioms field_profile_redistribution

end HsHVerification.CalderNeutron
