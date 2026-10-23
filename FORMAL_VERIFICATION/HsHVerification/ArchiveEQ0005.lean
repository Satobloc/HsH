import Mathlib

/-!
Archive recovery EQ-0005: wave-action local energy balance.
Source: SAT O Derivations/CODE-LOCKED DERIVS.txt, D2.
Blob: 783b05d39d59bf854b92090e15d205e6823b51c8

These algebraic theorems formalize the local product-rule core of the
field-energy balance and the modal dispersion rearrangement. They do not
select an H(s)H action or establish physical applicability.
-/

namespace HsHVerification.ArchiveEQ0005

theorem wave_local_energy_balance
    (mu tension velocity velocity_t slope slope_t velocity_s slope_s : ℝ)
    (hMomentum : mu * velocity_t = tension * slope_s)
    (hCompatibility : slope_t = velocity_s) :
    mu * velocity * velocity_t + tension * slope * slope_t =
      tension * (velocity * slope_s + slope * velocity_s) := by
  rw [mul_assoc mu velocity velocity_t]
  rw [mul_comm mu velocity, ← mul_assoc velocity mu velocity_t]
  rw [hMomentum, hCompatibility]
  ring

theorem periodic_mode_dispersion
    (mu tension omega k : ℝ)
    (hmu : mu ≠ 0)
    (hMode : mu * omega ^ 2 = tension * k ^ 2) :
    omega ^ 2 = (tension / mu) * k ^ 2 := by
  field_simp [hmu]
  nlinarith

theorem zero_mode_has_zero_frequency
    (mu omega : ℝ)
    (hmu : mu ≠ 0)
    (hMode : mu * omega ^ 2 = 0) :
    omega = 0 := by
  have hsquare : omega ^ 2 = 0 := by
    exact (mul_eq_zero.mp hMode).resolve_left hmu
  nlinarith [sq_nonneg omega]

end HsHVerification.ArchiveEQ0005
