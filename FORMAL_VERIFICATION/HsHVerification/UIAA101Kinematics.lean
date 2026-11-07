import Mathlib

/-!
# UIAA 101 dynamic-rope displacement: initial-velocity boundary audit

Source: UIAA 101, Dynamic Ropes, Version 9.1 (July 2025), §3.3.4, Eq. (3).
The same printed double-integral expression and separately listed onset speed
are present in UIAA 101 Version 9 (September 2019), §3.3.4.

Verbatim source transcription (notation preserved):
  S(t) = ∫ from t_tens to t ∫ from t_tens to t (g M - F(t)) / M dt dt
The source separately defines:
  V_tens = sqrt(2 g (2 L_ref)).

For the formalization below, the printed double integral is normalized with
distinct dummy variables as the usual iterated integral. The theorem proves
only its calculus boundary consequence: its derivative at the lower limit is
zero for continuous force data. If the separately defined nonzero V_tens is
intended to be the initial velocity at that same lower limit, the expression
needs the additional term V_tens * (t - t_tens).

This is a conditional source-level mathematical audit, not a claim about the
UIAA SCILAB implementation. That implementation is referenced by the standard
but was not retrieved here. The standard's force-threshold definition of
t_tens and its verbal definition of V_tens also need to be reconciled before
treating them as exactly the same instant.
-/

namespace HsHVerification.UIAA101Kinematics

noncomputable section

/-- The acceleration integrand printed in UIAA 101 Eq. (3). -/
def sourceAcceleration (g M : ℝ) (F : ℝ → ℝ) (t : ℝ) : ℝ :=
  (g * M - F t) / M

/-- Dummy-variable normalization of the standard's printed double integral. -/
def printedDisplacement (t0 g M : ℝ) (F : ℝ → ℝ) : ℝ → ℝ :=
  fun t => ∫ u in t0..t, ∫ s in t0..u, sourceAcceleration g M F s

/-- The onset-speed expression separately listed by UIAA 101. -/
def onsetSpeed (g Lref : ℝ) : ℝ :=
  Real.sqrt (2 * g * (2 * Lref))

/-- Assistant reconstruction with an explicit initial-velocity term.
This is not the equation printed in UIAA 101. -/
def correctedDisplacement (t0 v0 g M : ℝ) (F : ℝ → ℝ) : ℝ → ℝ :=
  fun t => (t - t0) * v0 + printedDisplacement t0 g M F t

/-- Under continuity of the force trace, the printed double integral has
zero derivative at its lower limit. -/
theorem printedDisplacement_hasDerivAt_zero
    (t0 g M : ℝ) (F : ℝ → ℝ) (hF : Continuous F) :
    HasDerivAt (printedDisplacement t0 g M F) 0 t0 := by
  have hacc : Continuous (sourceAcceleration g M F) := by
    unfold sourceAcceleration
    fun_prop
  have hinnerDiff :
      Differentiable ℝ
        (fun u : ℝ => ∫ s in t0..u, sourceAcceleration g M F s) :=
    intervalIntegral.differentiable_integral_of_continuous hacc
  have hinnerCont :
      Continuous
        (fun u : ℝ => ∫ s in t0..u, sourceAcceleration g M F s) :=
    hinnerDiff.continuous
  have houter :=
    intervalIntegral.integral_hasDerivAt_right
      (hinnerCont.intervalIntegrable t0 t0)
      hinnerCont.aestronglyMeasurable.stronglyMeasurableAtFilter
      hinnerCont.continuousAt
  simpa [printedDisplacement] using houter

/-- The onset speed is strictly positive for positive gravitational
acceleration and positive reference length. -/
theorem onsetSpeed_pos {g Lref : ℝ}
    (hg : 0 < g) (hL : 0 < Lref) :
    0 < onsetSpeed g Lref := by
  unfold onsetSpeed
  apply Real.sqrt_pos.2
  positivity

/-- The printed expression cannot have the separately defined positive
onset speed as its derivative at the same lower-limit time. -/
theorem printed_formula_derivative_not_onset_speed
    (t0 g M Lref : ℝ) (F : ℝ → ℝ) (hF : Continuous F)
    (hg : 0 < g) (hL : 0 < Lref) :
    deriv (printedDisplacement t0 g M F) t0 ≠ onsetSpeed g Lref := by
  have hprint := printedDisplacement_hasDerivAt_zero t0 g M F hF
  rw [hprint.deriv]
  exact ne_of_gt (onsetSpeed_pos hg hL)

/-- The separately written linear term restores the chosen initial
velocity at the lower-limit time. -/
theorem correctedDisplacement_hasDerivAt
    (t0 v0 g M : ℝ) (F : ℝ → ℝ) (hF : Continuous F) :
    HasDerivAt (correctedDisplacement t0 v0 g M F) v0 t0 := by
  have hprint := printedDisplacement_hasDerivAt_zero t0 g M F hF
  have hshift : HasDerivAt (fun t : ℝ => t - t0) 1 t0 := by
    simpa using (hasDerivAt_id t0).sub_const t0
  have hlinear :
      HasDerivAt (fun t : ℝ => (t - t0) * v0) v0 t0 := by
    simpa using hshift.mul_const v0
  simpa [correctedDisplacement] using hlinear.add hprint

/-- With the standard's onset-speed expression substituted, the corrected
reconstruction has that initial derivative. -/
theorem corrected_formula_derivative_is_onset_speed
    (t0 g M Lref : ℝ) (F : ℝ → ℝ) (hF : Continuous F) :
    deriv (correctedDisplacement t0 (onsetSpeed g Lref) g M F) t0 =
      onsetSpeed g Lref := by
  exact
    (correctedDisplacement_hasDerivAt
      t0 (onsetSpeed g Lref) g M F hF).deriv

#print axioms printedDisplacement_hasDerivAt_zero
#print axioms onsetSpeed_pos
#print axioms printed_formula_derivative_not_onset_speed
#print axioms correctedDisplacement_hasDerivAt
#print axioms corrected_formula_derivative_is_onset_speed

end
end HsHVerification.UIAA101Kinematics
