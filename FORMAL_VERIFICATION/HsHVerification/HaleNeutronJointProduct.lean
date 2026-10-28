import HsHVerification.HaleNeutronCalibrationBudget
import Mathlib

/-!
Hale, measured Werner 1975 system: wavelength x field-integral
product degeneracy under the conditional standard spinor model.
No fabricated physical inputs and no claim of universal rope behavior.
-/

namespace HsHVerification.HaleNeutronBudget

theorem wavelength_length_factorization (lambda length f g : ℝ) :
    (lambda * f) * (length * g) = (lambda * length) * (f * g) := by
  ring

theorem same_wavelength_length_product_same_period
    (C B lambda₁ length₁ lambda₂ length₂ : ℝ)
    (h : B * lambda₁ * length₁ = C)
    (hprod : lambda₁ * length₁ = lambda₂ * length₂) :
    B * lambda₂ * length₂ = C := by
  calc
    B * lambda₂ * length₂ = B * (lambda₂ * length₂) := by ring
    _ = B * (lambda₁ * length₁) := by rw [← hprod]
    _ = C := by nlinarith [h]

theorem two_nonincreasing_factors_cannot_increase_product
    (f g target : ℝ)
    (hf : 0 ≤ f) (hg : 0 ≤ g)
    (hfmax : f ≤ 1) (hgmax : g ≤ 1)
    (htarget : target = f * g) : target ≤ 1 := by
  have h1 : f * g ≤ 1 * g := mul_le_mul_of_nonneg_right hfmax hg
  have h2 : (1 : ℝ) * g ≤ 1 * 1 :=
    mul_le_mul_of_nonneg_left hgmax (by norm_num)
  nlinarith

#print axioms wavelength_length_factorization
#print axioms same_wavelength_length_product_same_period
#print axioms two_nonincreasing_factors_cannot_increase_product

end HsHVerification.HaleNeutronBudget
