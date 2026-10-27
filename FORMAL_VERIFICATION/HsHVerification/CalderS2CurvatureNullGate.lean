import Mathlib

/-!
Calder's source-conditioned implicit-curve null test.
Physical anchor: S2 orbit, GRAVITY Collaboration (2020), A&A 636 L5,
Appendix E Table E.1, a=125.058 mas, e=0.884649, R0=8246.7 pc.
Original SAT archive encoder:
SOFTWARE/equation_true_curve_surface_projection_polar.py
Git blob 52107ba00737e5098f8557595096cc251b075300.

At a regular zero-locus F=0, G=hF has first derivatives h grad F
and Hessian components h Hess F + product-rule cross terms.
The conditional polynomial identities below isolate which channels
are invariant under a positive nonvanishing equation multiplier.
They do not prove any H(s)H dynamics or a physical prediction.
-/

namespace HsHVerification.CalderS2Curvature

def curvatureNumerator (fx fy fxx fxy fyy : ℝ) : ℝ :=
  fxx * fy^2 - 2 * fxy * fx * fy + fyy * fx^2

theorem zero_locus_preserved (h f : ℝ) (hh : h ≠ 0) :
    h * f = 0 ↔ f = 0 := by
  simp [mul_eq_zero, hh]

theorem squared_gradient_scales (h fx fy : ℝ) :
    (h * fx)^2 + (h * fy)^2 = h^2 * (fx^2 + fy^2) := by
  ring

theorem curvature_numerator_scales
    (h hx hy fx fy fxx fxy fyy : ℝ) :
    curvatureNumerator (h * fx) (h * fy)
      (h * fxx + 2 * hx * fx)
      (h * fxy + hx * fy + hy * fx)
      (h * fyy + 2 * hy * fy) =
    h^3 * curvatureNumerator fx fy fxx fxy fyy := by
  dsimp [curvatureNumerator]
  ring

theorem curvature_ratio_invariant
    (h hx hy fx fy fxx fxy fyy d : ℝ)
    (hh : h ≠ 0) (hd : d ≠ 0) :
    curvatureNumerator (h * fx) (h * fy)
      (h * fxx + 2 * hx * fx)
      (h * fxy + hx * fy + hy * fx)
      (h * fyy + 2 * hy * fy) / (h^3 * d) =
    curvatureNumerator fx fy fxx fxy fyy / d := by
  rw [curvature_numerator_scales]
  have hh3 : h^3 ≠ 0 := pow_ne_zero 3 hh
  field_simp [hh3, hd]

theorem same_locus_different_multiplier
    (f h₁ h₂ : ℝ) (hf : f = 0) :
    h₁ * f = h₂ * f := by
  simp [hf]

#print axioms zero_locus_preserved
#print axioms squared_gradient_scales
#print axioms curvature_numerator_scales
#print axioms curvature_ratio_invariant
#print axioms same_locus_different_multiplier

end HsHVerification.CalderS2Curvature
