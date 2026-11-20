import Mathlib

/-!
# Source-bound Doppler parameter identifiability

Pennings et al. (2015), JFM 778, equations (2.7) and (2.20), use a
constant mean axial free-stream velocity W in an additive convective
frequency term W * kX. The remaining mode/core/surface-tension
contribution is abstracted here as intrinsicModeTerm.

This module proves only algebraic properties of that additive decomposition.
It does not formalize the complete Bessel-function dispersion relation, the
experimental flow field, or a mapping from a boundary PTV measurement to an
interior or free-stream velocity. In particular, it does not establish that
the intrinsic term is independently free in the physical model.
-/

namespace HsHVerification.PenningsDopplerIdentifiability

/-- Additive convective-frequency decomposition, abstracting the
    source's mode-dependent intrinsic term. -/
def convectedFrequency
    (freeStreamVelocity axialWavenumber intrinsicModeTerm : ℝ) : ℝ :=
  freeStreamVelocity * axialWavenumber + intrinsicModeTerm

/-- A compensating change in the free-stream term and an unconstrained
    intrinsic term leaves one observed frequency unchanged. -/
theorem compensating_shift_preserves_frequency
    (W kX intrinsicModeTerm delta : ℝ) :
    convectedFrequency (W + delta) kX (intrinsicModeTerm - delta * kX) =
      convectedFrequency W kX intrinsicModeTerm := by
  unfold convectedFrequency
  ring

/-- If the intrinsic mode term is fixed independently and the axial
    wavenumber is nonzero, the additive observation identifies W. -/
theorem free_stream_unique_of_fixed_intrinsic
    (W1 W2 kX intrinsicModeTerm : ℝ)
    (hkX : kX ≠ 0)
    (hObservation :
      convectedFrequency W1 kX intrinsicModeTerm =
        convectedFrequency W2 kX intrinsicModeTerm) :
    W1 = W2 := by
  unfold convectedFrequency at hObservation
  have hProduct : (W1 - W2) * kX = 0 := by
    calc
      (W1 - W2) * kX = W1 * kX - W2 * kX := by ring
      _ = 0 := by linarith
  rcases mul_eq_zero.mp hProduct with hVelocity | hWavenumber
  · linarith
  · exact False.elim (hkX hWavenumber)

/-- With an unconstrained intrinsic term, a nonzero shift in W can be
    exactly compensated. This is a conditional non-identifiability result,
    not a claim that the full physical model leaves its intrinsic term free. -/
theorem free_stream_not_identified_when_intrinsic_free
    (W kX intrinsicModeTerm delta : ℝ)
    (hDelta : delta ≠ 0) :
    convectedFrequency (W + delta) kX (intrinsicModeTerm - delta * kX) =
      convectedFrequency W kX intrinsicModeTerm ∧
    W + delta ≠ W := by
  constructor
  · exact compensating_shift_preserves_frequency W kX intrinsicModeTerm delta
  · intro hEqual
    apply hDelta
    linarith

/-- Two mode observations still do not identify a shared W if each
    intrinsic mode term is allowed to vary independently. -/
def twoModeObservation
    (W kX1 intrinsic1 kX2 intrinsic2 : ℝ) : ℝ × ℝ :=
  (convectedFrequency W kX1 intrinsic1,
   convectedFrequency W kX2 intrinsic2)

/-- The same compensating W-shift preserves both mode observations when
    both intrinsic terms are unconstrained. A source-linked relation between
    the two mode terms is therefore an identifiability requirement. -/
theorem common_shift_preserves_two_mode_observations
    (W delta kX1 intrinsic1 kX2 intrinsic2 : ℝ) :
    twoModeObservation (W + delta) kX1 (intrinsic1 - delta * kX1)
        kX2 (intrinsic2 - delta * kX2) =
      twoModeObservation W kX1 intrinsic1 kX2 intrinsic2 := by
  apply Prod.ext
  · exact compensating_shift_preserves_frequency W kX1 intrinsic1 delta
  · exact compensating_shift_preserves_frequency W kX2 intrinsic2 delta

#print axioms compensating_shift_preserves_frequency
#print axioms free_stream_unique_of_fixed_intrinsic
#print axioms free_stream_not_identified_when_intrinsic_free
#print axioms common_shift_preserves_two_mode_observations

end HsHVerification.PenningsDopplerIdentifiability
