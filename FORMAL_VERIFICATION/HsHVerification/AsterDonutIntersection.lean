import Mathlib

/-!
# Aster: source-fidelity of the historical Donut surface readout

Historical source: Satobloc/SAT_THEORY_ARCHIVE_2023-25
`_AUTO_EXTRACTED_TEXT/FINDING THE DONUT (nolat).txt`
Git blob a788b5cc415f90de2d0382d3596ef07d68604687, PDF-extracted
pages 25-27. The Nathan-attributed prose describes an intersection of a
rotating vector/line with the torus surface.

Later assistant-style source:
`SAT 2026 PRE HsH/SAT 2026 WHIRLIGIG — Donut canon.txt`
Git blob 8f95b9174657617c9976ff76e17fd8ef36ad660c.
It proposes Y(t)=X_T(theta1,theta2)+epsilon V(t) and calls Y a torus curve.

This file proves a conditional geometric distinction: unconstrained
additive displacement does not in general preserve a torus surface.
It does not establish who authored the assistant-style text, that any
particular V from the original construction has this displacement,
or any empirical claim about H(s)H.
-/

namespace HsHVerification.AsterDonutIntersection

/-- Algebraic equation of the standard revolution torus. On the regular
R>r>0 domain it describes the usual embedded torus. -/
def torusPolynomial (R r x y z : ℝ) : ℝ :=
  (x^2 + y^2 + z^2 + R^2 - r^2)^2 -
    4 * R^2 * (x^2 + y^2)

/-- Outer equator of the torus is on the zero set. -/
theorem outer_equator_on_torus (R r : ℝ) :
    torusPolynomial R r (R + r) 0 0 = 0 := by
  unfold torusPolynomial
  ring

/-- Exact symbolic residual after a vertical additive displacement. -/
theorem vertical_displacement_residual (R r ε : ℝ) :
    torusPolynomial R r (R + r) 0 ε =
      ε^2 * (4 * R * (R + r) + ε^2) := by
  unfold torusPolynomial
  ring

/-- For positive radii, any nonzero vertical additive displacement from
the outer equator leaves the torus's algebraic zero set. -/
theorem vertical_displacement_off_torus
    (R r ε : ℝ) (hR : 0 < R) (hr : 0 < r) (hε : ε ≠ 0) :
    torusPolynomial R r (R + r) 0 ε ≠ 0 := by
  rw [vertical_displacement_residual]
  have he2 : 0 < ε^2 := sq_pos_of_ne_zero hε
  have hsum : 0 < R + r := add_pos hR hr
  have hprod : 0 < (4 : ℝ) * R * (R + r) := by positivity
  have hbracket : 0 < 4 * R * (R + r) + ε^2 :=
    add_pos hprod he2
  exact ne_of_gt (mul_pos he2 hbracket)

#print axioms outer_equator_on_torus
#print axioms vertical_displacement_residual
#print axioms vertical_displacement_off_torus

end HsHVerification.AsterDonutIntersection
