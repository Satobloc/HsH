import Mathlib

namespace HsHVerification.PolarizationModeUniformRotation

/--
Finite-pixel image-plane mode coefficient.

The function kernel packages the pixel-area weight and the azimuthal Fourier
factor (for the EHT polarization modes, this includes exp(-m * I * phi_i)).
The function p is the complex linear-polarization sample Q_i + I * U_i.
The real value iAnn is the Stokes-I normalization over the selected annulus.

This is the finite-pixel form of the EHT Collaboration mode readout
  beta_m = I_ann^{-1} integral P(rho,phi) exp(-i m phi) rho dphi drho,
  P = Q + i U.
The continuous-integral analogue is not formalized here. This module proves
only the exact algebraic covariance of the finite-sum measurement operator.
It does not identify a worldtube twist with an EVPA or polarization mode.
-/
def modeCoefficient {n : ℕ}
    (kernel p : Fin n → ℂ) (iAnn : ℝ) : ℂ :=
  (∑ i : Fin n, kernel i * p i) / (iAnn : ℂ)

/--
A spatially uniform complex phase factor on every polarization sample
factors out of every linear image-plane mode coefficient.
-/
theorem modeCoefficient_uniformPhase {n : ℕ}
    (kernel p : Fin n → ℂ) (iAnn : ℝ) (z : ℂ) :
    modeCoefficient kernel (fun i => z * p i) iAnn =
      z * modeCoefficient kernel p iAnn := by
  unfold modeCoefficient
  have hsum :
      (∑ i : Fin n, kernel i * (z * p i)) =
        z * (∑ i : Fin n, kernel i * p i) := by
    calc
      (∑ i : Fin n, kernel i * (z * p i))
          = ∑ i : Fin n, z * (kernel i * p i) := by
              apply Finset.sum_congr rfl
              intro i hi
              ring
      _ = z * (∑ i : Fin n, kernel i * p i) := by
            rw [Finset.mul_sum]
  rw [hsum]
  ring

/--
A unit-modulus uniform polarization rotation preserves the magnitude
of every mode coefficient.
-/
theorem modeCoefficient_abs_invariant {n : ℕ}
    (kernel p : Fin n → ℂ) (iAnn : ℝ) (z : ℂ)
    (hz : Complex.abs z = 1) :
    Complex.abs (modeCoefficient kernel (fun i => z * p i) iAnn) =
      Complex.abs (modeCoefficient kernel p iAnn) := by
  rw [modeCoefficient_uniformPhase]
  simp [hz]

/--
If a measured mode magnitude changes while the pixel kernel and annular
normalization are fixed, that change cannot be explained by a spatially
uniform unit-modulus phase rotation alone.
-/
theorem amplitude_change_excludes_uniformPhase {n : ℕ}
    (kernel p : Fin n → ℂ) (iAnn : ℝ) (z : ℂ)
    (hz : Complex.abs z = 1)
    (hchange :
      Complex.abs (modeCoefficient kernel (fun i => z * p i) iAnn) ≠
        Complex.abs (modeCoefficient kernel p iAnn)) :
    False := by
  exact hchange (modeCoefficient_abs_invariant kernel p iAnn z hz)

#print axioms modeCoefficient_uniformPhase
#print axioms modeCoefficient_abs_invariant
#print axioms amplitude_change_excludes_uniformPhase

end HsHVerification.PolarizationModeUniformRotation
