import Mathlib

/-!
# Two-contour readout covariance

Source system: the free-surface bathtub-vortex experiment of Barckicke, Falcon &
Gissinger, *Nature Physics* (2026), DOI 10.1038/s41567-026-03175-w.

The primary paper defines the measured centerline displacement and core radius from
the same two opposed contour positions:
* eta = (r_0 - r_pi) / 2
* a   = (r_0 + r_pi) / 2

Let v_0 and v_pi be the marginal variances of the two contour-position measurements,
and c their symmetric cross-covariance. This module proves the exact covariance
transformation for that linear readout.

Scope limits:
* This is an algebraic propagation identity, not an estimate of v_0, v_pi, or c.
* It does not assume the two raw contour measurements are independent.
* It does not prove that the measured covariance is positive semidefinite; that is
  a statistical/data property of the actual measurement process.
* The paper reports typical position/radius uncertainty but does not publish the
  sample-level joint contour covariance in its main text. No numerical covariance,
  fit, or H(s)H physical prediction is made here.
* The theorem says nothing about whether this fluid-vortex readout is physically
  equivalent to an H(s)H worldtube.
-/

namespace HsHVerification.ContourReadoutCovariance

open Matrix

/-- Linear map from the two opposed contour radii (r_0, r_pi) to (eta, a). -/
def contourToReadout : Matrix (Fin 2) (Fin 2) ℝ :=
  !![(1 : ℝ) / 2, -(1 : ℝ) / 2; (1 : ℝ) / 2, (1 : ℝ) / 2]

/-- Symmetric covariance matrix of the two raw contour-position measurements. -/
def contourCovariance (v0 vPi crossCov : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  !![v0, crossCov; crossCov, vPi]

/-- Covariance matrix after the (r_0, r_pi) to (eta, a) linear readout. -/
def readoutCovariance (v0 vPi crossCov : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  contourToReadout * contourCovariance v0 vPi crossCov * contourToReadout.transpose

/--
Exact covariance propagation for the experiment's two-contour readout.

The off-diagonal term is (v0 - vPi) / 4. Therefore distinct derived channels
must not be treated as statistically independent merely because they are named
separately. Their joint covariance depends on the two raw marginal variances.
-/
theorem readoutCovariance_formula (v0 vPi crossCov : ℝ) :
    readoutCovariance v0 vPi crossCov =
      !![(v0 + vPi - 2 * crossCov) / 4, (v0 - vPi) / 4;
         (v0 - vPi) / 4, (v0 + vPi + 2 * crossCov) / 4] := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [readoutCovariance, contourToReadout, contourCovariance,
      Matrix.mul_apply, Fin.sum_univ_two] <;> ring

/-- The derived channels have zero covariance when the raw marginal variances match. -/
theorem eta_radius_uncorrelated_of_equal_raw_variances
    (v0 vPi crossCov : ℝ) (h : v0 = vPi) :
    readoutCovariance v0 vPi crossCov 0 1 = 0 := by
  rw [readoutCovariance_formula]
  simp [h]

#print axioms readoutCovariance_formula
#print axioms eta_radius_uncorrelated_of_equal_raw_variances

end HsHVerification.ContourReadoutCovariance
