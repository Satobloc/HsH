import Mathlib

/-!
Mercer measured S2 regular-multiplier source-fidelity gate, 2026-10-27.
Measured fit: GRAVITY Collaboration (2020), A&A 636 L5, Table E.1,
e = 0.884649 +/- 0.000066. Exact rational central value below is
measured input, not a free theory parameter.
Historical source: Satobloc/SAT_THEORY_ARCHIVE_2023-25
SOFTWARE/equation_true_curve_surface_projection_polar.py
Git blob 52107ba00737e5098f8557595096cc251b075300.

These are conditional scalar algebra statements, not physical predictions.
The differential identity grad(hF)|_(F=0) = h grad F is checked in
independent SymPy source-audit code, not proved in this module.
-/
namespace HsHVerification.MercerS2RegularMultiplier

theorem same_zero_predicate (F h : ℝ) (hh : h ≠ 0) :
    (h * F = 0 ↔ F = 0) := by
  constructor
  · intro hz
    exact (mul_eq_zero.mp hz).resolve_left hh
  · intro hz
    simp [hz]

theorem s2_eccentricity_positive :
    (0 : ℚ) < 884649 / 1000000 := by
  norm_num

theorem s2_eccentricity_below_one :
    (884649 / 1000000 : ℚ) < 1 := by
  norm_num

theorem s2_apsis_multipliers_distinct :
    (1 - (884649 / 1000000 : ℚ)) ≠
    (1 + (884649 / 1000000 : ℚ)) := by
  norm_num

theorem s2_apsis_multiplier_ratio :
    (1 + (884649 / 1000000 : ℚ)) /
    (1 - (884649 / 1000000 : ℚ)) =
    (1884649 : ℚ) / 115351 := by
  norm_num

#print axioms same_zero_predicate
#print axioms s2_eccentricity_positive
#print axioms s2_eccentricity_below_one
#print axioms s2_apsis_multipliers_distinct
#print axioms s2_apsis_multiplier_ratio

end HsHVerification.MercerS2RegularMultiplier
