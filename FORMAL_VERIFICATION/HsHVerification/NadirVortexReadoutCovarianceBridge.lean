import Mathlib
import HsHVerification.NadirVortexTwoChannelReadout

/-!
# Nadir/Sable bridge: two-contour vortex readout and covariance

Primary measured-system source:
* Barckicke, Falcon & Gissinger, “Kelvin wave propagation along vortex cores,”
  Nature Physics 22, 409–414 (2026), DOI 10.1038/s41567-026-03175-w.
* The Methods section defines the two measured channels from opposing contour
  positions: eta = (r_0 - r_pi)/2 and a = (r_0 + r_pi)/2.
* Data availability identifies Figshare DOI 10.6084/m9.figshare.30903347.

The imported Nadir module already formalizes the source-defined readout,
its inverse, injectivity/surjectivity, and a conditional antipodal-mode alias.
This module reuses that exact readout matrix rather than defining a second
independent observation map.

It proves:
1. the existing matrix acts on the two contour samples exactly as the
   source-defined (displacement, core-radius) readout;
2. a symbolic symmetric covariance matrix transforms by M Sigma Mᵀ to the
   displayed covariance of the two derived channels; and
3. the derived channels have zero cross-covariance iff the two raw marginal
   contour variances are equal.

Evidence boundary:
* The paper reports typical contour-position/core-radius measurement
  uncertainty of about 0.1 mm, PIV circulation uncertainty about
  0.005 m² s⁻¹, and PTV axial-velocity uncertainty about 0.05 m s⁻¹.
* The sample-level joint covariance of the two opposing contour measurements
  is not supplied in the main-text methods. The Figshare DOI is identified,
  but this module does not embed or estimate any dataset values.
* The covariance variables below are LOCAL to this module. They represent
  variances/covariance of length-valued contour samples (dimension L²); Lean's
  real-number type does not encode units. No global symbol registration or
  project-wide physical interpretation is introduced.
* No independence assumption is made. Zero covariance is not asserted to mean
  statistical independence.
* This is conditional linear algebra. It does not prove camera calibration,
  contour extraction, a full 3-D/4-D core reconstruction, Kelvin-wave dynamics,
  an H(s)H worldtube/timesheet map, or any physical equivalence.
-/

namespace HsHVerification.NadirVortexReadoutCovarianceBridge

open HsHVerification.NadirVortexTwoChannelReadout
open Matrix

noncomputable section

/-- The two opposing contour samples in the order used by the source paper. -/
def contourVector (r₀ rπ : ℝ) : Fin 2 → ℝ := ![r₀, rπ]

/-- Apply Nadir's already-defined two-channel readout matrix to the raw contours. -/
def matrixReadout (r₀ rπ : ℝ) : Fin 2 → ℝ :=
  readoutMatrix.mulVec (contourVector r₀ rπ)

/-- The matrix representation is exactly the source-defined (eta, a) pair. -/
theorem matrixReadout_eq_observe (r₀ rπ : ℝ) :
    (matrixReadout r₀ rπ 0, matrixReadout r₀ rπ 1) =
      observe r₀ rπ := by
  simp [matrixReadout, contourVector, Matrix.mulVec, readoutMatrix,
    observe, displacement, coreRadius] <;> trivial

/-- Symbolic covariance of the two raw opposing-contour measurements. -/
def rawContourCovariance (v₀ vπ crossCov : ℝ) :
    Matrix (Fin 2) (Fin 2) ℝ :=
  !![v₀, crossCov; crossCov, vπ]

/-- Covariance propagated through the same readout matrix used by Nadir. -/
def propagatedReadoutCovariance (v₀ vπ crossCov : ℝ) :
    Matrix (Fin 2) (Fin 2) ℝ :=
  readoutMatrix * rawContourCovariance v₀ vπ crossCov *
    readoutMatrix.transpose

/--
Exact covariance propagation for the two-contour measurement map.

The off-diagonal term is (v₀ - vπ)/4. It does not depend on the raw
cross-covariance. No raw covariance values or independence assumptions are
inserted.
-/
theorem propagatedReadoutCovariance_formula (v₀ vπ crossCov : ℝ) :
    propagatedReadoutCovariance v₀ vπ crossCov =
      !![(v₀ + vπ - 2 * crossCov) / 4, (v₀ - vπ) / 4;
         (v₀ - vπ) / 4, (v₀ + vπ + 2 * crossCov) / 4] := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [propagatedReadoutCovariance, rawContourCovariance, readoutMatrix,
      Matrix.mul_apply, Fin.sum_univ_two] <;> ring

/--
The two derived channels are uncorrelated exactly when the two raw marginal
contour variances match. This is a covariance statement, not an independence
claim.
-/
theorem eta_radius_cross_covariance_zero_iff_equal_raw_variances
    (v₀ vπ crossCov : ℝ) :
    propagatedReadoutCovariance v₀ vπ crossCov 0 1 = 0 ↔ v₀ = vπ := by
  rw [propagatedReadoutCovariance_formula]
  constructor
  · intro h
    have h' : (v₀ - vπ) / 4 = 0 := by simpa using h
    linarith
  · intro h
    simp [h]

#print axioms matrixReadout_eq_observe
#print axioms propagatedReadoutCovariance_formula
#print axioms eta_radius_cross_covariance_zero_iff_equal_raw_variances

end

end HsHVerification.NadirVortexReadoutCovarianceBridge
