import Mathlib

/-!
Aldus | source-identity and covariance envelope for Sgr A* EHT (2026-10-27).
REAL SYSTEM: 2017 EHT 1.3 mm Sgr A* observations.
SOURCE: EHT Collaboration (2022), ApJL 930 L12, Table 1,
DOI 10.3847/2041-8213/ac6674.
Fitted emission ring diameter 51.8 plus or minus 2.3 microarcseconds (68% credible);
simulation-calibrated shadow diameter 48.7 plus or minus 7.0 microarcseconds.
Both derive from the SAME EHT observations. The joint posterior and covariance
are not supplied by these rounded marginal intervals.

The following are CONDITIONAL covariance identities: only if the reported
interval halfwidths are treated as Gaussian standard deviations and a joint
linear covariance model is appropriate. rho in [-1,1] is a mathematical
constraint, NOT a measured correlation, fit, or invented physical input.
They do NOT prove physical consistency, posterior significance, or H(s)H.
-/

namespace HsHVerification.AldusEHTSharedDataGate

/-- Central gap in microarcseconds from the published source values. -/
theorem reported_central_gap :
    (518 : ℚ) / 10 - (487 : ℚ) / 10 = (31 : ℚ) / 10 := by
  norm_num

/-- With hypothetical Gaussian covariance rho, the variance of the
    difference is bounded by the extreme admissible correlations. -/
theorem shared_data_covariance_envelope
    (rho : ℝ) (hlo : -1 ≤ rho) (hhi : rho ≤ 1) :
    ((47 : ℝ) / 10)^2 ≤
      ((23 : ℝ) / 10)^2 + (7 : ℝ)^2 -
        2 * rho * ((23 : ℝ) / 10) * 7 ∧
    ((23 : ℝ) / 10)^2 + (7 : ℝ)^2 -
        2 * rho * ((23 : ℝ) / 10) * 7 ≤ ((93 : ℝ) / 10)^2 := by
  constructor <;> nlinarith

/-- The central difference is smaller than the MINIMUM conditional
    standard deviation, not an independently established z-score. -/
theorem gap_below_minimum_conditional_sigma :
    (31 : ℚ) / 10 < (47 : ℚ) / 10 := by
  norm_num

/-- Therefore the squared central difference is below the conditional
    variance for every mathematically admissible correlation. -/
theorem no_one_sigma_gap_under_joint_gaussian_assumption
    (rho : ℝ) (hlo : -1 ≤ rho) (hhi : rho ≤ 1) :
    ((31 : ℝ) / 10)^2 <
      ((23 : ℝ) / 10)^2 + (7 : ℝ)^2 -
        2 * rho * ((23 : ℝ) / 10) * 7 := by
  have h := (shared_data_covariance_envelope rho hlo hhi).1
  nlinarith

/-- The independence-assumption variance is exactly 54.29
    squared microarcseconds, but independence is NOT asserted. -/
theorem zero_covariance_reference_variance :
    ((23 : ℚ) / 10)^2 + (7 : ℚ)^2 = (5429 : ℚ) / 100 := by
  norm_num

#print axioms reported_central_gap
#print axioms shared_data_covariance_envelope
#print axioms gap_below_minimum_conditional_sigma
#print axioms no_one_sigma_gap_under_joint_gaussian_assumption
#print axioms zero_covariance_reference_variance

end HsHVerification.AldusEHTSharedDataGate
