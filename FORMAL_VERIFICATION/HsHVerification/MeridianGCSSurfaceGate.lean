import Mathlib
import HsHVerification.MeridianGCSAlgebra

/-!
# Meridian GCS apex surface gate

At the GCS apex, the source implementation uses a cross-section frame
whose orientation parameter is beta. Direct differentiation of that
parametric surface gives, up to orientation, the apex area factor

  a * (X₀ + a * sin(theta)).

This module proves the conditional algebraic sign consequences of that
factor. It does not formalize the differentiation from the full surface
map, nor does a sign change alone prove a global self-intersection.
-/

namespace HsHVerification.MeridianGCSSurfaceGate

open HsHVerification.MeridianGCSAlgebra

/-- Signed apex surface-area factor, with u standing for sin(theta). -/
def apexSurfaceAreaFactor (X₀ a u : ℝ) : ℝ :=
  a * (X₀ + a * u)

/-- If the cross-section radius exceeds X₀, the inner and outer
    apex directions have opposite area-factor signs. -/
theorem apex_surface_area_factor_changes_sign
    (X₀ a : ℝ) (hX₀ : 0 < X₀) (hXa : X₀ < a) :
    apexSurfaceAreaFactor X₀ a (-1) < 0 ∧
      0 < apexSurfaceAreaFactor X₀ a 1 := by
  constructor
  · simp [apexSurfaceAreaFactor]
    nlinarith
  · simp [apexSurfaceAreaFactor]
    nlinarith

/-- For the source-derived GCS apex definitions, the local regularity
    margin X₀ - a is positive exactly when κ < sin(alpha), assuming
    positive H and 0 < κ < 1. -/
theorem apex_regular_parameter_iff
    (H s κ : ℝ) (hH : 0 < H) (hκ0 : 0 < κ) (hκ1 : κ < 1) :
    apexCrossSectionRadius H s κ < apexAxisOffset H s κ ↔ κ < s := by
  have hdiff := apex_cross_section_minus_axis_offset H s κ hκ0 hκ1
  have hfac : 0 < H / (1 + κ) := by positivity
  have hplus : 1 + κ ≠ 0 := by linarith
  have heq : H * (κ - s) / (1 + κ) =
      (H / (1 + κ)) * (κ - s) := by
    field_simp [hplus]
  constructor
  · intro h
    have hneg :
        apexCrossSectionRadius H s κ -
          apexAxisOffset H s κ < 0 := sub_neg.mpr h
    rw [hdiff, heq] at hneg
    by_contra hs
    have hnonneg : 0 ≤ κ - s := by linarith
    have hprod : 0 ≤ (H / (1 + κ)) * (κ - s) :=
      mul_nonneg (le_of_lt hfac) hnonneg
    linarith
  · intro h
    have hneg : κ - s < 0 := by linarith
    have hprod :
        (H / (1 + κ)) * (κ - s) < 0 :=
      mul_neg_of_pos_of_neg hfac hneg
    have hmargin :
        apexCrossSectionRadius H s κ -
          apexAxisOffset H s κ < 0 := by
      rw [hdiff, heq]
      exact hprod
    exact sub_neg.mp hmargin

end HsHVerification.MeridianGCSSurfaceGate
