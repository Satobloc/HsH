import HsHVerification.MeridianS2Geometry
import Mathlib

/-!
# Ravel S2 marked-lift identifiability gate | 2026-10-27

Physical anchor: GRAVITY Collaboration (2020), A&A 636 L5, Table 1,
DOI 10.1051/0004-6361/202037813, S2 orbit of Sgr A*.
The recorded fitted orbital quantities determine a conditional spatial
trajectory. They do NOT determine the metric or relative scale of an
unobserved Euclidean fourth coordinate.

Source under review: MeridianS2Geometry.lean at PR #722, Git blob
900e289391b1da84ea3825c0a07f3208c6d04b64.
For an explicitly assumed marked lift X_alpha(w)=(x(w), alpha*w), w=ct,
at pericenter where v dot a = 0, the declared Euclidean extrinsic
curvature is a/(v²+(alpha*c)²). Alpha is an embedding choice, not a
measured physical constant or fitted H(s)H parameter.

These theorems establish only a projection identity and a conditional
algebraic dependence of curvature on that choice. They do not prove
that the chosen lift is physical, derive a worldtube constitutive law,
or predict the GRAVITY observations.
-/

namespace HsHVerification.RavelS2LiftIdentifiability

def markedLift (x : Fin 3 → ℝ) (w alpha : ℝ) : (Fin 3 → ℝ) × ℝ :=
  (x, alpha * w)

noncomputable def markedCurvature (acc c v alpha : ℝ) : ℝ :=
  acc / (v^2 + (alpha * c)^2)

theorem spatial_projection_independent_of_scale
    (x : Fin 3 → ℝ) (w alpha beta : ℝ) :
    (markedLift x w alpha).1 = (markedLift x w beta).1 := by
  rfl

theorem alpha_one_agrees_with_meridian (acc c v : ℝ) :
    markedCurvature acc c v 1 =
      HsHVerification.MeridianS2Geometry.curvatureFromAcceleration acc c v := by
  simp [markedCurvature, HsHVerification.MeridianS2Geometry.curvatureFromAcceleration]

theorem curvature_strictly_decreases_with_lift_scale
    (acc c v alpha beta : ℝ)
    (hacc : 0 < acc) (hc : 0 < c)
    (halpha : 0 < alpha) (horder : alpha < beta) :
    markedCurvature acc c v beta < markedCurvature acc c v alpha := by
  unfold markedCurvature
  have hbeta : 0 < beta := lt_trans halpha horder
  have hleft : 0 < alpha * c := mul_pos halpha hc
  have hright : 0 < beta * c := mul_pos hbeta hc
  have hprod : 0 < (beta * c - alpha * c) * (beta * c + alpha * c) := by
    apply mul_pos
    · nlinarith [mul_lt_mul_of_pos_right horder hc]
    · linarith
  have hsquares : (alpha * c)^2 < (beta * c)^2 := by
    nlinarith [hprod]
  have hden : v^2 + (alpha * c)^2 < v^2 + (beta * c)^2 := by
    linarith
  have hdena : 0 < v^2 + (alpha * c)^2 := by positivity
  have hdenb : 0 < v^2 + (beta * c)^2 := by positivity
  apply (div_lt_div_iff₀ hdenb hdena).2
  nlinarith [mul_pos hacc (sub_pos.mpr hden)]

#print axioms spatial_projection_independent_of_scale
#print axioms alpha_one_agrees_with_meridian
#print axioms curvature_strictly_decreases_with_lift_scale

end HsHVerification.RavelS2LiftIdentifiability
