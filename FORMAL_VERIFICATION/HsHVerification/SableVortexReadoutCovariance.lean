import Mathlib
import HsHVerification.NadirVortexTwoChannelReadout

/-!
# Covariance propagation for the two-contour vortex readout

The source-defined readout is
  η = (r₀ - rπ) / 2
  a = (r₀ + rπ) / 2.

This module propagates an arbitrary symmetric 2×2 covariance matrix for the
two raw contour-radius measurements through that exact linear map. It makes
no independence or Gaussian assumption. The algebraic identities do not
supply the raw variances/covariance, validate the camera pipeline, or infer
the full covariance from the paper's reported marginal uncertainties.
-/

namespace HsHVerification.SableVortexReadoutCovariance

open HsHVerification.NadirVortexTwoChannelReadout

/-- Covariance of the two raw opposing-contour radius measurements. -/
def rawContourCovariance (v₀ vπ c : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  !![v₀, c; c, vπ]

/-- Covariance of (η,a), obtained by the source-defined congruence A Σ Aᵀ. -/
noncomputable def outputCovariance (v₀ vπ c : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  readoutMatrix * rawContourCovariance v₀ vπ c * readoutMatrix.transpose

theorem displacementVariance (v₀ vπ c : ℝ) :
    outputCovariance v₀ vπ c 0 0 = (v₀ + vπ - 2 * c) / 4 := by
  norm_num [outputCovariance, rawContourCovariance, readoutMatrix,
    Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ]; ring

theorem coreRadiusVariance (v₀ vπ c : ℝ) :
    outputCovariance v₀ vπ c 1 1 = (v₀ + vπ + 2 * c) / 4 := by
  norm_num [outputCovariance, rawContourCovariance, readoutMatrix,
    Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ]; ring

theorem displacementCoreRadiusCovariance (v₀ vπ c : ℝ) :
    outputCovariance v₀ vπ c 0 1 = (v₀ - vπ) / 4 := by
  norm_num [outputCovariance, rawContourCovariance, readoutMatrix,
    Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ]; ring

theorem coreRadiusDisplacementCovariance (v₀ vπ c : ℝ) :
    outputCovariance v₀ vπ c 1 0 = (v₀ - vπ) / 4 := by
  norm_num [outputCovariance, rawContourCovariance, readoutMatrix,
    Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_succ]; ring

/-- The derived channels are uncorrelated exactly when the two raw-side
measurement variances are equal. The raw-side covariance c cancels. -/
theorem outputUncorrelatedIffEqualRawVariances (v₀ vπ c : ℝ) :
    outputCovariance v₀ vπ c 0 1 = 0 ↔ v₀ = vπ := by
  rw [displacementCoreRadiusCovariance]
  constructor <;> intro h <;> linarith

/-- Independent raw-side errors can still produce correlated (η,a) outputs
when the two raw-side variances differ. -/
theorem independentRawSidesCanCorrelateOutputs
    (v₀ vπ : ℝ) (h : v₀ ≠ vπ) :
    outputCovariance v₀ vπ 0 0 1 ≠ 0 := by
  rw [displacementCoreRadiusCovariance]
  intro hz
  exact h (by linarith)

/-- Equal raw-side variances force zero output cross-covariance, even when
the two raw measurements themselves are correlated. -/
theorem equalRawVariancesForceUncorrelatedOutputs
    (v₀ vπ c : ℝ) (h : v₀ = vπ) :
    outputCovariance v₀ vπ c 0 1 = 0 := by
  rw [displacementCoreRadiusCovariance]
  simp [h]

/-- With equal and independent raw-side errors, the output covariance is
diagonal and both derived channels have variance v₀/2. -/
theorem equalIndependentRawSidesGiveDiagonalOutput
    (v₀ vπ : ℝ) (h : v₀ = vπ) :
    outputCovariance v₀ vπ 0 0 0 = v₀ / 2 ∧
    outputCovariance v₀ vπ 0 1 1 = v₀ / 2 ∧
    outputCovariance v₀ vπ 0 0 1 = 0 := by
  constructor
  · rw [displacementVariance, h]
    ring
  · constructor
    · rw [coreRadiusVariance, h]
      ring
    · rw [displacementCoreRadiusCovariance, h]
      ring

/-- The full output covariance recovers the raw plus-side variance. -/
theorem recoverRawPlusVariance (v₀ vπ c : ℝ) :
    outputCovariance v₀ vπ c 0 0 +
      outputCovariance v₀ vπ c 1 1 +
      2 * outputCovariance v₀ vπ c 0 1 = v₀ := by
  rw [displacementVariance, coreRadiusVariance,
    displacementCoreRadiusCovariance]
  ring

/-- The full output covariance recovers the raw minus-side variance. -/
theorem recoverRawMinusVariance (v₀ vπ c : ℝ) :
    outputCovariance v₀ vπ c 0 0 +
      outputCovariance v₀ vπ c 1 1 -
      2 * outputCovariance v₀ vπ c 0 1 = vπ := by
  rw [displacementVariance, coreRadiusVariance,
    displacementCoreRadiusCovariance]
  ring

/-- The full output covariance recovers the raw-side cross-covariance. -/
theorem recoverRawCrossCovariance (v₀ vπ c : ℝ) :
    outputCovariance v₀ vπ c 1 1 -
      outputCovariance v₀ vπ c 0 0 = c := by
  rw [displacementVariance, coreRadiusVariance]
  ring

/-- The determinant computed from the four output entries is one quarter
of the determinant of the raw 2×2 covariance matrix. -/
theorem outputCovarianceDeterminant (v₀ vπ c : ℝ) :
    outputCovariance v₀ vπ c 0 0 * outputCovariance v₀ vπ c 1 1 -
      outputCovariance v₀ vπ c 0 1 * outputCovariance v₀ vπ c 1 0 =
      (v₀ * vπ - c ^ 2) / 4 := by
  rw [displacementVariance, coreRadiusVariance,
    displacementCoreRadiusCovariance, coreRadiusDisplacementCovariance]
  ring

#print axioms displacementVariance
#print axioms coreRadiusVariance
#print axioms displacementCoreRadiusCovariance
#print axioms coreRadiusDisplacementCovariance
#print axioms outputUncorrelatedIffEqualRawVariances
#print axioms independentRawSidesCanCorrelateOutputs
#print axioms equalRawVariancesForceUncorrelatedOutputs
#print axioms equalIndependentRawSidesGiveDiagonalOutput
#print axioms recoverRawPlusVariance
#print axioms recoverRawMinusVariance
#print axioms recoverRawCrossCovariance
#print axioms outputCovarianceDeterminant

end HsHVerification.SableVortexReadoutCovariance
