import Mathlib

/-
# UIAA 101 dynamic-rope displacement: initial-condition audit

Source: UIAA 101, Dynamic Ropes, Version 9.1 (July 2025), §3.3.4, Eq. (3).
The same double-integral display and separately defined onset speed appear
in Version 9 (September 2019), §3.3.4.

Source equation, transcribed with typesetting normalized:
  S(t) = ∫∫ from t_tens to t of (g M - F(t)) / M dt dt

The printed display shows one visible pair of integration limits for a
double integral. It does not explicitly name the inner upper-limit variable.
To avoid silently treating one parse as uniquely dictated by the source, this
module formalizes two readings:
  (1) triangular successive integration, with inner upper limit u;
  (2) a shared-upper-limit reading, equivalent to
      (t - t_tens) * ∫ from t_tens to t of acceleration.

For continuous force data, both zero-integration-constant readings have
zero derivative at t_tens. The standard separately defines
  V_tens = sqrt(2 g (2 L_ref))
as the positive speed at the onset of rope tension.

A separately named assistant reconstruction adds
  V_tens * (t - t_tens)
to either reading and restores the stated initial derivative. This is a
source-level initial-condition ambiguity, not a claim that the standard's
implementation is wrong. The referenced SCILAB implementation in the UIAA
DMS was not retrieved.

The proofs are conditional calculus only. They do not establish the
physical validity of the test model, calibration, or intended SCILAB code.
-/

namespace HsHVerification.UIAA101Kinematics

noncomputable section

-- Match the project's standard real-number additive-group and module
-- instances so interval-integral derivative lemmas elaborate consistently.
local instance (priority := 10000) : AddCommGroup ℝ :=
  Real.normedAddCommGroup.toAddCommGroup
local instance (priority := 10000) : Module ℝ ℝ :=
  RCLike.toInnerProductSpaceReal.toModule

/-- The acceleration integrand displayed in UIAA 101 Eq. (3). -/
def sourceAcceleration (g M : ℝ) (F : ℝ → ℝ) (t : ℝ) : ℝ :=
  (g * M - F t) / M

/-- A triangular-domain, zero-constant iterated-integral reading of the
successive integrations displayed in UIAA 101 Eq. (3). -/
def zeroConstantIteratedDisplacement (t0 g M : ℝ) (F : ℝ → ℝ) : ℝ → ℝ :=
  fun t => ∫ u in t0..t, ∫ s in t0..u, sourceAcceleration g M F s

/-- A shared-upper-bound reading of the printed double-integral display.
It is the product of the interval length and the single acceleration
integral over the same interval. -/
def zeroConstantSharedUpperDisplacement (t0 g M : ℝ) (F : ℝ → ℝ) : ℝ → ℝ :=
  fun t => (t - t0) * ∫ s in t0..t, sourceAcceleration g M F s

/-- The onset-speed expression separately listed by UIAA 101. -/
def onsetSpeed (g Lref : ℝ) : ℝ :=
  Real.sqrt (2 * g * (2 * Lref))

/-- Assistant reconstruction with an explicit initial-velocity term for
the triangular-domain reading. This is not the equation printed in UIAA 101. -/
def displacementWithInitialVelocity (t0 v0 g M : ℝ) (F : ℝ → ℝ) : ℝ → ℝ :=
  fun t => (t - t0) * v0 + zeroConstantIteratedDisplacement t0 g M F t

/-- Assistant reconstruction with an explicit initial-velocity term for
the shared-upper-bound reading. This is not the equation printed in UIAA 101. -/
def sharedUpperDisplacementWithInitialVelocity
    (t0 v0 g M : ℝ) (F : ℝ → ℝ) : ℝ → ℝ :=
  fun t => (t - t0) * v0 + zeroConstantSharedUpperDisplacement t0 g M F t

/-- Under continuity of the force trace, the triangular-domain,
zero-constant iterated-integral reading has zero derivative at its
lower-limit time. -/
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

/-- Under continuity of the force trace, the shared-upper-bound
zero-constant reading also has zero derivative at its lower limit. -/
theorem zeroConstantSharedUpperDisplacement_hasDerivAt_zero
    (t0 g M : ℝ) (F : ℝ → ℝ) (hF : Continuous F) :
    HasDerivAt (zeroConstantSharedUpperDisplacement t0 g M F) 0 t0 := by
  have hacc : Continuous (sourceAcceleration g M F) := by
    unfold sourceAcceleration
    fun_prop
  have hinner :=
    intervalIntegral.integral_hasDerivAt_right
      (hacc.intervalIntegrable t0 t0)
      hacc.aestronglyMeasurable.stronglyMeasurableAtFilter
      hacc.continuousAt
  have hshift : HasDerivAt (fun t : ℝ => t - t0) 1 t0 := by
    simpa using (hasDerivAt_id t0).sub_const t0
  simpa [zeroConstantSharedUpperDisplacement] using hshift.mul hinner

/-- The onset speed is strictly positive for positive gravitational
acceleration and positive reference length. -/
theorem onsetSpeed_pos {g Lref : ℝ}
    (hg : 0 < g) (hL : 0 < Lref) :
    0 < onsetSpeed g Lref := by
  unfold onsetSpeed
  apply Real.sqrt_pos.2
  positivity

/-- Under the triangular zero-constant interpretation, the initial
derivative differs from the positive onset speed defined by the standard. -/
theorem zeroConstantIteratedDerivative_not_onsetSpeed
    (t0 g M Lref : ℝ) (F : ℝ → ℝ) (hF : Continuous F)
    (hg : 0 < g) (hL : 0 < Lref) :
    deriv (zeroConstantIteratedDisplacement t0 g M F) t0 ≠ onsetSpeed g Lref := by
  have hprint := zeroConstantIteratedDisplacement_hasDerivAt_zero t0 g M F hF
  rw [hprint.deriv]
  exact (ne_of_gt (onsetSpeed_pos hg hL)).symm

/-- Under the shared-upper-bound zero-constant interpretation, the initial
derivative also differs from the positive onset speed defined by the standard. -/
theorem zeroConstantSharedUpperDerivative_not_onsetSpeed
    (t0 g M Lref : ℝ) (F : ℝ → ℝ) (hF : Continuous F)
    (hg : 0 < g) (hL : 0 < Lref) :
    deriv (zeroConstantSharedUpperDisplacement t0 g M F) t0 ≠ onsetSpeed g Lref := by
  have hprint := zeroConstantSharedUpperDisplacement_hasDerivAt_zero t0 g M F hF
  rw [hprint.deriv]
  exact (ne_of_gt (onsetSpeed_pos hg hL)).symm

/-- Adding an explicit initial-velocity term restores the chosen initial
derivative for the triangular-domain reading. -/
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

/-- Adding an explicit initial-velocity term restores the chosen initial
derivative for the shared-upper-bound reading. -/
theorem sharedUpperDisplacementWithInitialVelocity_hasDerivAt
    (t0 v0 g M : ℝ) (F : ℝ → ℝ) (hF : Continuous F) :
    HasDerivAt (sharedUpperDisplacementWithInitialVelocity t0 v0 g M F) v0 t0 := by
  have hprint := zeroConstantSharedUpperDisplacement_hasDerivAt_zero t0 g M F hF
  have hshift : HasDerivAt (fun t : ℝ => t - t0) 1 t0 := by
    simpa using (hasDerivAt_id t0).sub_const t0
  have hlinear :
      HasDerivAt (fun t : ℝ => (t - t0) * v0) v0 t0 := by
    simpa using hshift.mul_const v0
  simpa [sharedUpperDisplacementWithInitialVelocity] using hlinear.add hprint

/-- With the standard's onset-speed expression substituted, the triangular
assistant reconstruction has that initial derivative. -/
theorem displacementWithInitialVelocity_derivative_is_onsetSpeed
    (t0 g M Lref : ℝ) (F : ℝ → ℝ) (hF : Continuous F) :
    deriv (displacementWithInitialVelocity t0 (onsetSpeed g Lref) g M F) t0 =
      onsetSpeed g Lref := by
  exact
    (displacementWithInitialVelocity_hasDerivAt
      t0 (onsetSpeed g Lref) g M F hF).deriv

/-- With the standard's onset-speed expression substituted, the shared-upper
assistant reconstruction has that initial derivative. -/
theorem sharedUpperDisplacementWithInitialVelocity_derivative_is_onsetSpeed
    (t0 g M Lref : ℝ) (F : ℝ → ℝ) (hF : Continuous F) :
    deriv (sharedUpperDisplacementWithInitialVelocity
      t0 (onsetSpeed g Lref) g M F) t0 = onsetSpeed g Lref := by
  exact
    (sharedUpperDisplacementWithInitialVelocity_hasDerivAt
      t0 (onsetSpeed g Lref) g M F hF).deriv

#print axioms zeroConstantIteratedDisplacement_hasDerivAt_zero
#print axioms zeroConstantSharedUpperDisplacement_hasDerivAt_zero
#print axioms onsetSpeed_pos
#print axioms zeroConstantIteratedDerivative_not_onsetSpeed
#print axioms zeroConstantSharedUpperDerivative_not_onsetSpeed
#print axioms displacementWithInitialVelocity_hasDerivAt
#print axioms sharedUpperDisplacementWithInitialVelocity_hasDerivAt
#print axioms displacementWithInitialVelocity_derivative_is_onsetSpeed
#print axioms sharedUpperDisplacementWithInitialVelocity_derivative_is_onsetSpeed

end
end HsHVerification.UIAA101Kinematics
