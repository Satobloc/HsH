import Mathlib

/-!
Mira | Sgr A* published-source uncertainty lineage (2026-10-27).

Real system: Galactic-center Sgr A* stellar-orbit astrometry (GRAVITY/VLTI).
Source: GRAVITY Collaboration, A&A 657 L12 (2022),
DOI 10.1051/0004-6361/202142465; EHT Collaboration,
ApJL 930 L17 (2022), DOI 10.3847/2041-8213/ac6756.

EHT Paper VI quotes VLTI M = (4.297 ± 0.012(stat) ± 0.040(sys)) 10^6 M_sun,
D = 8277 ± 9(stat) ± 33(sys) pc, and
theta_g = 5.125 ± 0.009(stat) ± 0.020(sys) microarcseconds,
derived from correlated orbital posteriors and systematic analysis.

These theorems apply ONLY to the first-order two-variable covariance model
for the ratio M/D, with a,b nonnegative fractional marginal uncertainties,
rho a correlation in [-1,1]. The published systematic error budget need not
be representable by that simplified covariance model. No physical
inconsistency or H(s)H prediction is inferred.
-/

namespace HsHVerification.MiraSgrACovarianceGate

/-- The minimum possible first-order ratio variance under correlation <= 1. -/
theorem variance_lower_bound
    (a b rho : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) (hr : rho ≤ 1) :
    (a - b)^2 ≤ a^2 + b^2 - 2 * rho * a * b := by
  have hab : 0 ≤ a * b := mul_nonneg ha hb
  have hfac : 0 ≤ 1 - rho := sub_nonneg.mpr hr
  have hprod : 0 ≤ (1 - rho) * (a * b) := mul_nonneg hfac hab
  nlinarith

/-- The maximum possible first-order ratio variance under correlation >= -1. -/
theorem variance_upper_bound
    (a b rho : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) (hr : -1 ≤ rho) :
    a^2 + b^2 - 2 * rho * a * b ≤ (a + b)^2 := by
  have hab : 0 ≤ a * b := mul_nonneg ha hb
  have hfac : 0 ≤ 1 + rho := by linarith
  have hprod : 0 ≤ (1 + rho) * (a * b) := mul_nonneg hfac hab
  nlinarith

/-- An alleged variance smaller than the squared difference of positive
    marginal fractional errors cannot come from this covariance model. -/
theorem no_correlation_for_too_small_variance
    (a b rho v : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b)
    (hr : rho ≤ 1) (hv : v = a^2 + b^2 - 2 * rho * a * b)
    (hsmall : v < (a - b)^2) : False := by
  have hbound := variance_lower_bound a b rho ha hb hr
  linarith

/-- With the published rounded VLTI systematic marginals, the smallest
    possible linearized M/D angular systematic under |rho|<=1 exceeds
    the separately published 0.020 microarcsecond systematic. This
    excludes only a *naive* shared two-marginal Gaussian covariance
    interpretation, not the actual GRAVITY error-budget procedure. -/
theorem published_systematics_not_naive_two_marginal_covariance :
    ((5125 : ℚ) / 1000) *
      ((40 : ℚ) / 4297 - (33 : ℚ) / 8277) >
      (20 : ℚ) / 1000 := by
  norm_num

#print axioms variance_lower_bound
#print axioms variance_upper_bound
#print axioms no_correlation_for_too_small_variance
#print axioms published_systematics_not_naive_two_marginal_covariance

end HsHVerification.MiraSgrACovarianceGate
