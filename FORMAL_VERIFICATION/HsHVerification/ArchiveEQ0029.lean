import Mathlib

namespace HsHVerification.ArchiveEQ0029

def pseudoMass (mnu cosB B rho : ℝ) : ℝ :=
  mnu * cosB^2 * B^4 * rho

theorem dimensionless_ledger :
    (1 : ℤ) + 2 * 0 + 4 * 0 + 0 = 1 := by
  norm_num

theorem pseudoMass_nonnegative {mnu cosB B rho : ℝ}
    (hm : 0 ≤ mnu) (hr : 0 ≤ rho) :
    0 ≤ pseudoMass mnu cosB B rho := by
  unfold pseudoMass
  positivity

theorem pseudoMass_positive {mnu cosB B rho : ℝ}
    (hm : 0 < mnu) (hc : cosB ≠ 0)
    (hB : B ≠ 0) (hr : 0 < rho) :
    0 < pseudoMass mnu cosB B rho := by
  unfold pseudoMass
  positivity

theorem zero_neutrino (cosB B rho : ℝ) :
    pseudoMass 0 cosB B rho = 0 := by
  simp [pseudoMass]

theorem zero_projection (mnu cosB rho : ℝ) :
    pseudoMass mnu cosB 0 rho = 0 := by
  simp [pseudoMass]

theorem zero_attenuation (mnu cosB B : ℝ) :
    pseudoMass mnu cosB B 0 = 0 := by
  simp [pseudoMass]

theorem fitted_neutrino_is_identity {target cosB B rho : ℝ}
    (hc : cosB ≠ 0) (hB : B ≠ 0) (hr : rho ≠ 0) :
    pseudoMass (target / (cosB^2 * B^4 * rho)) cosB B rho = target := by
  have hden : cosB^2 * B^4 * rho ≠ 0 := by
    exact mul_ne_zero (mul_ne_zero (pow_ne_zero 2 hc) (pow_ne_zero 4 hB)) hr
  unfold pseudoMass
  calc
    target / (cosB^2 * B^4 * rho) * cosB^2 * B^4 * rho =
        target / (cosB^2 * B^4 * rho) * (cosB^2 * B^4 * rho) := by ring
    _ = target := div_mul_cancel₀ target hden

theorem linear_in_neutrino (m1 m2 cosB B rho : ℝ) :
    pseudoMass (m1 + m2) cosB B rho =
      pseudoMass m1 cosB B rho + pseudoMass m2 cosB B rho := by
  unfold pseudoMass
  ring

end HsHVerification.ArchiveEQ0029
