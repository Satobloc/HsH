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
noncomputable def modeCoefficient {n : ℕ}
    (kernel p : Fin n → ℂ) (iAnn : ℝ) : ℂ :=
  (∑ i : Fin n, kernel i * p i) / (iAnn : ℂ)

/--
A positive annular Stokes-I normalization is required for the physically
admissible normalized readout. This structure records the condition; it does
not establish that any particular dataset satisfies it.
-/
structure PositiveAnnularNormalization where
  value : ℝ
  positive : 0 < value

/-- The normalized readout with an explicitly positive annular intensity. -/
noncomputable def normalizedModeCoefficient {n : ℕ}
    (kernel p : Fin n → ℂ) (iAnn : PositiveAnnularNormalization) : ℂ :=
  modeCoefficient kernel p iAnn.value

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
A unit-modulus uniform polarization rotation preserves the norm
of every finite-pixel mode coefficient.
-/
theorem modeCoefficient_norm_invariant {n : ℕ}
    (kernel p : Fin n → ℂ) (iAnn : ℝ) (z : ℂ)
    (hz : ‖z‖ = 1) :
    ‖modeCoefficient kernel (fun i => z * p i) iAnn‖ =
      ‖modeCoefficient kernel p iAnn‖ := by
  rw [modeCoefficient_uniformPhase, norm_mul, hz, one_mul]

/--
The same invariance is available on the physically admissible domain where
the annular Stokes-I normalization is explicitly positive.
-/
theorem normalizedModeCoefficient_norm_invariant {n : ℕ}
    (kernel p : Fin n → ℂ) (iAnn : PositiveAnnularNormalization) (z : ℂ)
    (hz : ‖z‖ = 1) :
    ‖normalizedModeCoefficient kernel (fun i => z * p i) iAnn‖ =
      ‖normalizedModeCoefficient kernel p iAnn‖ := by
  simpa [normalizedModeCoefficient] using
    modeCoefficient_norm_invariant kernel p iAnn.value z hz

/--
If a measured normalized mode norm changes while the pixel kernel and
positive annular normalization are fixed, that change cannot be explained by
a spatially uniform unit-modulus phase rotation alone.
-/
theorem amplitude_change_excludes_uniformPhase {n : ℕ}
    (kernel p : Fin n → ℂ) (iAnn : PositiveAnnularNormalization) (z : ℂ)
    (hz : ‖z‖ = 1)
    (hchange :
      ‖normalizedModeCoefficient kernel (fun i => z * p i) iAnn‖ ≠
        ‖normalizedModeCoefficient kernel p iAnn‖) :
    False := by
  exact hchange
    (normalizedModeCoefficient_norm_invariant kernel p iAnn z hz)

#print axioms modeCoefficient_uniformPhase
#print axioms modeCoefficient_norm_invariant
#print axioms normalizedModeCoefficient_norm_invariant
#print axioms amplitude_change_excludes_uniformPhase

end HsHVerification.PolarizationModeUniformRotation
