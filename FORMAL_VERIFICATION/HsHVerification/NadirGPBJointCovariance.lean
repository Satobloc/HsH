import Mathlib

/-!
Nadir Voss role, source-grounded current assistant, 2026-10-27 13:12Z.
Gravity Probe B, Everitt et al., Phys. Rev. Lett. 106, 221101 (2011),
DOI 10.1103/PhysRevLett.106.221101, Table II, 2004-2005 observations.
Published joint drift rates: NS -6601.8 +/-18.3 mas/yr,
WE -37.2 +/-7.2 mas/yr. GR comparators: -6606.1 and -39.2 mas/yr.

This file encodes a CONDITIONAL two-dimensional Gaussian covariance model
with unknown correlation rho. It does not reconstruct the experiment's
covariance, systematic errors or joint likelihood, and makes NO H(s)H prediction.
The optimizer rho below is derived mathematically from measured residuals;
it is NOT an observed or fitted correlation. No invented physical inputs.
-/

namespace HsHVerification.NadirGPBJointCovariance

def geodeticZ : ℚ := 43 / 183
def frameZ : ℚ := 5 / 18

def jointChiSq (rho : ℚ) : ℚ :=
  (geodeticZ^2 + frameZ^2 - 2 * rho * geodeticZ * frameZ) /
  (1 - rho^2)

/-- Exact algebraic decomposition for any nonsingular 2x2 correlation. -/
theorem chi_square_identity (a b rho : ℚ) (hden : 1 - rho^2 ≠ 0) :
    (a^2 + b^2 - 2 * rho * a * b) / (1 - rho^2) - b^2 =
    (a - rho * b)^2 / (1 - rho^2) := by
  field_simp
  ring

/-- A positive definite two-channel correlation matrix implies that
    its conditional joint chi-square cannot fall below either marginal z². -/
theorem chi_square_ge_second (a b rho : ℚ)
    (hlo : -1 < rho) (hhi : rho < 1) :
    b^2 ≤ (a^2 + b^2 - 2 * rho * a * b) / (1 - rho^2) := by
  have hprod : 0 < (1 - rho) * (1 + rho) :=
    mul_pos (sub_pos.mpr hhi) (by linarith)
  have hden : 0 < (1 : ℚ) - rho^2 := by nlinarith
  have hid := chi_square_identity a b rho (ne_of_gt hden)
  have hs : 0 ≤ (a - rho * b)^2 / (1 - rho^2) :=
    div_nonneg (sq_nonneg _) (le_of_lt hden)
  linarith

/-- The published GP-B standardized frame-dragging residual supplies
    a correlation-independent lower bound in this restricted model. -/
theorem measured_joint_lower (rho : ℚ)
    (hlo : -1 < rho) (hhi : rho < 1) :
    frameZ^2 ≤ jointChiSq rho := by
  exact chi_square_ge_second geodeticZ frameZ rho hlo hhi

/-- Derived nuisance-parameter optimizer, not an observed correlation. -/
theorem mathematical_optimizer_ratio :
    geodeticZ / frameZ = (258 : ℚ) / 305 := by
  norm_num [geodeticZ, frameZ]

/-- Exact attainment of the model-only minimum at the derived optimizer. -/
theorem mathematical_minimum_attained :
    jointChiSq ((258 : ℚ) / 305) = (25 : ℚ) / 324 := by
  norm_num [jointChiSq, geodeticZ, frameZ]

/-- Independence as a reference assumption gives a different score,
    demonstrating why marginal uncertainties do not fix the joint score. -/
theorem independence_reference_differs :
    jointChiSq 0 > jointChiSq ((258 : ℚ) / 305) := by
  norm_num [jointChiSq, geodeticZ, frameZ]

#print axioms chi_square_identity
#print axioms chi_square_ge_second
#print axioms measured_joint_lower
#print axioms mathematical_optimizer_ratio
#print axioms mathematical_minimum_attained
#print axioms independence_reference_differs

end HsHVerification.NadirGPBJointCovariance
