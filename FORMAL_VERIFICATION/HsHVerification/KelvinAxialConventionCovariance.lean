import Mathlib

/-!
# Kelvin-wave axial sign-convention covariance

This module proves only algebraic statements about sign changes in a
Doppler-shift term. It does not decide which coordinate convention either
published experiment uses, validate a fluid model, or supply physical data.

For a downward-positive scalar speed vDown, let epsZ encode whether the
coordinate z increases downward (+1) or upward (-1). The convention-aware
term is epsZ * k * vDown. Reversing the z axis reverses both epsZ and k,
leaving the product invariant.
-/

namespace HsHVerification.KelvinAxialConventionCovariance

/-- A convention-aware Doppler-shifted frequency. epsZ records the sign
of the positive-down direction relative to the chosen z coordinate. -/
def shiftedFrequency {R : Type*} [CommRing R]
    (omega m Omega k vDown epsZ : R) : R :=
  omega + m * Omega + epsZ * k * vDown

/-- Reversing the z coordinate reverses both its signed wavenumber and the
orientation factor, while the downward-positive speed remains a scalar. -/
theorem axial_coordinate_reversal_preserves_shift
    {R : Type*} [CommRing R]
    (omega m Omega k vDown epsZ : R) :
    shiftedFrequency omega m Omega k vDown epsZ =
      shiftedFrequency omega m Omega (-k) vDown (-epsZ) := by
  unfold shiftedFrequency
  ring

/-- The printed plus and minus forms coincide when the coordinate wavenumber
is reversed. This is a conditional convention crosswalk, not a source ruling. -/
theorem plus_minus_forms_equivalent_under_reversed_k
    {R : Type*} [CommRing R]
    (omega m Omega k vDown : R) :
    omega + m * Omega + k * vDown =
      omega + m * Omega - (-k) * vDown := by
  ring

/-- If both papers use the same coordinate orientation, the same signed
velocity convention, and the same phase convention, their opposite signs
agree only when the axial Doppler product vanishes. -/
theorem same_convention_sign_difference_vanishes_iff
    (omega m Omega k vDown : ℝ) :
    omega + m * Omega + k * vDown =
      omega + m * Omega - k * vDown ↔
        k = 0 ∨ vDown = 0 := by
  constructor
  · intro h
    have hmul : k * vDown = 0 := by linarith
    exact mul_eq_zero.mp hmul
  · rintro (hk | hv)
    · simp [hk]
    · simp [hv]

/-- A signed coordinate velocity component and the signed wavenumber both
reverse under z' = -z, so their convective product is invariant. -/
theorem signed_component_product_invariant
    {R : Type*} [CommRing R] (k uz : R) :
    (-k) * (-uz) = k * uz := by
  ring

/-- The axial phase argument is invariant when z and k are both reversed. -/
theorem axial_phase_argument_invariant
    {R : Type*} [CommRing R] (k z : R) :
    (-k) * (-z) = k * z := by
  ring

end HsHVerification.KelvinAxialConventionCovariance

/- Exact integer smoke test of the conditional plus/minus crosswalk.
This is an algebraic test value, not an experimental or physical datum. -/
#eval (HsHVerification.KelvinAxialConventionCovariance.shiftedFrequency
  (R := Int) 0 1 0 2 3 1 ==
  HsHVerification.KelvinAxialConventionCovariance.shiftedFrequency
  (R := Int) 0 1 0 (-2) 3 (-1))

#print axioms HsHVerification.KelvinAxialConventionCovariance.axial_coordinate_reversal_preserves_shift
#print axioms HsHVerification.KelvinAxialConventionCovariance.plus_minus_forms_equivalent_under_reversed_k
#print axioms HsHVerification.KelvinAxialConventionCovariance.same_convention_sign_difference_vanishes_iff
#print axioms HsHVerification.KelvinAxialConventionCovariance.signed_component_product_invariant
#print axioms HsHVerification.KelvinAxialConventionCovariance.axial_phase_argument_invariant
