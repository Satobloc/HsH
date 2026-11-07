import Mathlib

/-!
# UIAA 101 dynamic-rope displacement: initial-condition audit

Source: UIAA 101, Dynamic Ropes, Version 9.1 (July 2025), §3.3.4, Eq. (3).
The same printed equation and separately listed onset speed appear in
Version 9 (September 2019), §3.3.4.

Verbatim equation as typeset in the standard:
  S(t) = ∫ from t_tens to t of (g M - F(t)) / M dt dt

The standard separately defines:
  V_tens = sqrt(2 g (2 L_ref)).

The displayed equation uses a single integral sign followed by two
differentials. The formalization below makes one explicit interpretation:
a definite iterated integral with distinct dummy variables and both
integration constants set to zero. It proves that this interpretation has
zero derivative at the lower-limit time for continuous force data.

If V_tens is intended as the initial derivative at that same time, it must
enter as an integration constant or an explicit term
  V_tens * (t - t_tens).
The standard says to perform successive integrations and separately defines
V_tens, but does not explicitly show how that initial condition enters Eq. (3).
The referenced SCILAB implementation is available through the UIAA DMS but
was not retrieved here. This is therefore a source-level initial-condition
ambiguity, not a claim that the standard's implementation is wrong.

The proof is conditional calculus only. It does not establish the physical
validity of the test model, calibration, or the intended SCILAB implementation.
-/

namespace HsHVerification.UIAA101Kinematics

noncomputable section

-- Align the real scalar module and additive-group instances with the
-- interval-integral fundamental-theorem API used below.
local instance : AddCommGroup ℝ := Real.normedAddCommGroup.toAddCommGroup
local instance : Module ℝ ℝ := RCLike.toInnerProductSpaceReal.toModule

/-- The acceleration integrand displayed in UIAA 101 Eq. (3). -/
def sourceAcceleration (g M : ℝ) (F : ℝ → ℝ) (t : ℝ) : ℝ :=
  (g * M - F t) / M

/-- One zero-integration-constant iterated-integral reading of the
successive integrations displayed in UIAA 101 Eq. (3). -/
def zeroConstantIteratedDisplacement (t0 g M : ℝ) (F : ℝ → ℝ) : ℝ → ℝ :=
  fun t => ∫ u in t0..t, ∫ s in t0..u, sourceAcceleration g M F s

/-- The onset-speed expression separately listed by UIAA 101. -/
def onsetSpeed (g Lref : ℝ) : ℝ :=
  Real.sqrt (2 * g * (2 * Lref))

/-- Assistant reconstruction with an explicit initial-velocity term.
This is not the equation printed in UIAA 101. -/
def displacementWithInitialVelocity (t0 v0 g M : ℝ) (F : ℝ → ℝ) : ℝ → ℝ :=
  fun t => (t - t0) * v0 + zeroConstantIteratedDisplacement t0 g M F t

/-- Under continuity of the force trace, the zero-constant iterated-integral
reading has zero derivative at its lower limit. -/
theorem zeroConstantIteratedDisplacement_hasDerivAt_zero
    (t0 g M : ℝ) (F : ℝ → ℝ) (hF : Continuous F) :
    HasDerivAt (zeroConstantIteratedDisplacement t0 g M F) 0 t0 := by
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
  simpa [zeroConstantIteratedDisplacement] using houter

/-- The onset speed is strictly positive for positive gravitational
acceleration and positive reference length. -/
theorem onsetSpeed_pos {g Lref : ℝ}
    (hg : 0 < g) (hL : 0 < Lref) :
    0 < onsetSpeed g Lref := by
  unfold onsetSpeed
  apply Real.sqrt_pos.2
  positivity

/-- Under the zero-constant iterated-integral interpretation, the initial
derivative differs from the positive onset speed defined by the standard. -/
theorem zeroConstantIteratedDerivative_not_onsetSpeed
    (t0 g M Lref : ℝ) (F : ℝ → ℝ) (hF : Continuous F)
    (hg : 0 < g) (hL : 0 < Lref) :
    deriv (zeroConstantIteratedDisplacement t0 g M F) t0 ≠ onsetSpeed g Lref := by
  have hprint := zeroConstantIteratedDisplacement_hasDerivAt_zero t0 g M F hF
  rw [hprint.deriv]
  exact (ne_of_gt (onsetSpeed_pos hg hL)).symm

/-- Adding an explicit initial-velocity term restores the chosen initial
derivative at the lower-limit time. -/
theorem displacementWithInitialVelocity_hasDerivAt
    (t0 v0 g M : ℝ) (F : ℝ → ℝ) (hF : Continuous F) :
    HasDerivAt (displacementWithInitialVelocity t0 v0 g M F) v0 t0 := by
  have hprint := zeroConstantIteratedDisplacement_hasDerivAt_zero t0 g M F hF
  have hshift : HasDerivAt (fun t : ℝ => t - t0) 1 t0 := by
    simpa using (hasDerivAt_id t0).sub_const t0
  have hlinear :
      HasDerivAt (fun t : ℝ => (t - t0) * v0) v0 t0 := by
    simpa using hshift.mul_const v0
  simpa [displacementWithInitialVelocity] using hlinear.add hprint

/-- With the standard's onset-speed expression substituted, the explicit
initial-velocity reconstruction has that initial derivative. -/
theorem displacementWithInitialVelocity_derivative_is_onsetSpeed
    (t0 g M Lref : ℝ) (F : ℝ → ℝ) (hF : Continuous F) :
    deriv (displacementWithInitialVelocity t0 (onsetSpeed g Lref) g M F) t0 =
      onsetSpeed g Lref := by
  exact
    (displacementWithInitialVelocity_hasDerivAt
      t0 (onsetSpeed g Lref) g M F hF).deriv

#print axioms zeroConstantIteratedDisplacement_hasDerivAt_zero
#print axioms onsetSpeed_pos
#print axioms zeroConstantIteratedDerivative_not_onsetSpeed
#print axioms displacementWithInitialVelocity_hasDerivAt
#print axioms displacementWithInitialVelocity_derivative_is_onsetSpeed

end
end HsHVerification.UIAA101Kinematics
