import Mathlib

/-!
# Mercer: regular implicit-equation multipliers and gradient-channel fidelity

Original historical assistant-authored source:
Satobloc/SAT_THEORY_ARCHIVE_2023-25
SOFTWARE/equation_true_curve_surface_projection_polar.py
Git blob 52107ba00737e5098f8557595096cc251b075300.

Real measured-system anchor: GRAVITY Collaboration (2020), S2 orbit around Sgr A*,
A&A 636 L5, Appendix E Table E.1, eccentricity 0.884649 +/- 0.000066.
The number below is the published fitted central value, not a free parameter.

These are conditional algebraic propositions about representations. They do not
prove a physical SAT/H(s)H model, an empirical fit, or a derivative chain rule.
-/

namespace HsHVerification.MercerRegularMultiplier

/-- A nonzero scalar multiplier preserves the zero set pointwise. -/
theorem nonzero_multiplier_preserves_zero_set
    (h f : ℝ) (hh : h ≠ 0) : h * f = 0 ↔ f = 0 := by
  simp [hh]

/-- Assuming the product-rule expression, its restriction to F=0 is h*dF. -/
theorem product_gradient_on_zero_locus
    (h f df dh : ℝ) (hf : f = 0) :
    h * df + f * dh = h * df := by
  simp [hf]

/-- A regular multiplier that differs at two points changes a common
nonzero gradient magnitude, even if the original magnitudes coincide. -/
theorem distinct_multiplier_changes_equal_nonzero_channel
    (hp ha g : ℝ) (hh : hp ≠ ha) (hg : g ≠ 0) :
    hp * g ≠ ha * g := by
  intro heq
  have hz : (hp - ha) * g = 0 := by
    calc
      (hp - ha) * g = hp * g - ha * g := sub_mul hp ha g
      _ = 0 := sub_eq_zero.mpr heq
  rcases mul_eq_zero.mp hz with hzero | hzero
  · exact hh (sub_eq_zero.mp hzero)
  · exact hg hzero

/-- If a source channel identifies two points but the target channel
separates them, no decoder using only the source channel can reproduce both. -/
theorem equal_channel_cannot_decode_distinct_channel
    (qp qa rp ra : ℝ) (heq : qp = qa) (hne : rp ≠ ra) :
    ¬ ∃ decoder : ℝ → ℝ, decoder qp = rp ∧ decoder qa = ra := by
  rintro ⟨decoder, hp, ha⟩
  apply hne
  calc
    rp = decoder qp := hp.symm
    _ = decoder qa := by rw [heq]
    _ = ra := ha

/-- The 2020 S2 fitted eccentricity as an exact decimal rational. -/
def measuredS2Eccentricity : ℚ := 884649 / 1000000

/-- The observed-fit central eccentricity places both apsidal radius
multipliers strictly above zero, and distinguishes them. -/
theorem measured_apsis_multiplier_gate :
    0 < (1 - measuredS2Eccentricity) ∧
    0 < (1 + measuredS2Eccentricity) ∧
    (1 - measuredS2Eccentricity) ≠ (1 + measuredS2Eccentricity) := by
  norm_num [measuredS2Eccentricity]

#print axioms nonzero_multiplier_preserves_zero_set
#print axioms product_gradient_on_zero_locus
#print axioms distinct_multiplier_changes_equal_nonzero_channel
#print axioms equal_channel_cannot_decode_distinct_channel
#print axioms measured_apsis_multiplier_gate

end HsHVerification.MercerRegularMultiplier
