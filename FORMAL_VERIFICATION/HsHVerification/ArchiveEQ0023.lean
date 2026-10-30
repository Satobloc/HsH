import Mathlib

/- EQ-0023: algebraic kernel of the JPL planar ellipse/UI reconstruction.
   c,s stand for cos E,sin E; k^2=1-e^2. No physical claim is encoded. -/
namespace ArchiveEQ0023

theorem jpl_radial_identity
    (a e c s k : ℝ) (hcs : c^2 + s^2 = 1) (hk : k^2 = 1 - e^2) :
    (a * (c - e))^2 + (a * k * s)^2 = (a * (1 - e*c))^2 := by
  nlinarith [sq_nonneg (e*s), sq_nonneg (c-e)]

theorem perihelion_positive (a e : ℝ) (ha : 0 < a) (he : e < 1) :
    0 < a * (1-e) := mul_pos ha (sub_pos.mpr he)

theorem ellipse_denominator_positive (e ν : ℝ) (he0 : 0 ≤ e) (he1 : e < 1) :
    0 < 1 + e * Real.cos ν := by
  have hc : -1 ≤ Real.cos ν := neg_one_le_cos ν
  nlinarith [mul_nonneg he0 (add_nonneg hc (by norm_num : 0 ≤ (1:ℝ)))]

theorem circular_limit (a : ℝ) : a * (1-(0:ℝ)) = a ∧ a * (1+(0:ℝ)) = a := by
  constructor <;> ring

theorem bound_order (a e : ℝ) (ha : 0 ≤ a) (he : 0 ≤ e) :
    a*(1-e) ≤ a*(1+e) := by nlinarith

end ArchiveEQ0023
