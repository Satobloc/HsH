import Mathlib

/-!
# CODATA covariance scaling

Source-linked scope:
* CODATA 2022 G evaluation, Table XXX: 16 published determinations, three
  nonzero pair correlations, and a common uncertainty expansion factor of 3.9.
* The NIST 2026 BIPM-torsion-balance remeasurement writes its hierarchical
  covariance in the form Σᵢⱼ = τᵢ τⱼ Rᵢⱼ.

This module proves only the algebraic identities below:
1. a covariance factorization Cᵢⱼ = uᵢ uⱼ ρᵢⱼ recovers the correlation;
2. a common positive expansion of every standard uncertainty by k, with
   covariance expanded by k², leaves the correlation coefficient unchanged.

The rational checks use the three published CODATA 2022 G correlations:
NIST-82/LANL-97 = 0.351, HUST-05/HUST-09 = 0.134, and
HUST-09/HUSTT-18 = 0.068, with the table's rounded standard uncertainties.
They are exact arithmetic checks of the published rounded inputs, not a
reanalysis of laboratory raw data.

No theorem here validates the measurements, the CODATA evaluation choice,
the NIST Bayesian prior, source independence, or any H(s)H physical mapping.
-/

namespace HsHVerification.CODATACovarianceScaling

/-- Correlation coefficient computed from a covariance and two standard uncertainties. -/
def correlationCoefficient (cov u₁ u₂ : ℚ) : ℚ :=
  cov / (u₁ * u₂)

/-- Covariance reconstructed from a correlation coefficient and standard uncertainties. -/
def covarianceFromCorrelation (ρ u₁ u₂ : ℚ) : ℚ :=
  ρ * u₁ * u₂

/-- Common positive expansion of one standard uncertainty. -/
def expandUncertainty (u k : ℚ) : ℚ :=
  k * u

/-- The corresponding covariance expansion is quadratic in the common factor. -/
def expandCovariance (cov k : ℚ) : ℚ :=
  k ^ 2 * cov

/-- The covariance factorization used in a correlation-matrix parameterization recovers ρ. -/
theorem correlationCoefficient_recovers_factorization
    (ρ u₁ u₂ : ℚ)
    (hu₁ : u₁ ≠ 0) (hu₂ : u₂ ≠ 0) :
    correlationCoefficient (covarianceFromCorrelation ρ u₁ u₂) u₁ u₂ = ρ := by
  unfold correlationCoefficient covarianceFromCorrelation
  field_simp [hu₁, hu₂]

/-- A uniform positive uncertainty expansion changes covariance by k² and preserves correlation. -/
theorem correlationCoefficient_invariant_under_uniform_expansion
    (cov u₁ u₂ k : ℚ)
    (hu₁ : u₁ ≠ 0) (hu₂ : u₂ ≠ 0) (hk : 0 < k) :
    correlationCoefficient
        (expandCovariance cov k)
        (expandUncertainty u₁ k)
        (expandUncertainty u₂ k)
      = correlationCoefficient cov u₁ u₂ := by
  unfold correlationCoefficient expandCovariance expandUncertainty
  have hk0 : k ≠ 0 := ne_of_gt hk
  field_simp [hu₁, hu₂, hk0]

/-- CODATA 2022 G table's common uncertainty expansion factor. -/
def scaleFactor : ℚ := 39 / 10

/-- Rounded standard uncertainties from CODATA 2022 Table XXX, in units of 10⁻¹¹. -/
def nist82Uncertainty : ℚ := 43 / 100000
def lanl97Uncertainty : ℚ := 7 / 10000
def hust05Uncertainty : ℚ := 87 / 100000
def hust09Uncertainty : ℚ := 18 / 100000
def hustt18Uncertainty : ℚ := 78 / 1000000

/-- The three nonzero CODATA 2022 G input correlations. -/
def rhoNist82Lanl97 : ℚ := 351 / 1000
def rhoHust05Hust09 : ℚ := 134 / 1000
def rhoHust09Hustt18 : ℚ := 68 / 1000

/-- Recompute one published correlation after the CODATA common expansion. -/
def expandedCorrelation (ρ u₁ u₂ : ℚ) : ℚ :=
  correlationCoefficient
    (expandCovariance (covarianceFromCorrelation ρ u₁ u₂) scaleFactor)
    (expandUncertainty u₁ scaleFactor)
    (expandUncertainty u₂ scaleFactor)

#eval expandedCorrelation rhoNist82Lanl97 nist82Uncertainty lanl97Uncertainty
#eval expandedCorrelation rhoHust05Hust09 hust05Uncertainty hust09Uncertainty
#eval expandedCorrelation rhoHust09Hustt18 hust09Uncertainty hustt18Uncertainty

example :
    expandedCorrelation rhoNist82Lanl97 nist82Uncertainty lanl97Uncertainty
      = rhoNist82Lanl97 := by
  norm_num [expandedCorrelation, correlationCoefficient, covarianceFromCorrelation,
    expandCovariance, expandUncertainty, scaleFactor, rhoNist82Lanl97,
    nist82Uncertainty, lanl97Uncertainty]

example :
    expandedCorrelation rhoHust05Hust09 hust05Uncertainty hust09Uncertainty
      = rhoHust05Hust09 := by
  norm_num [expandedCorrelation, correlationCoefficient, covarianceFromCorrelation,
    expandCovariance, expandUncertainty, scaleFactor, rhoHust05Hust09,
    hust05Uncertainty, hust09Uncertainty]

example :
    expandedCorrelation rhoHust09Hustt18 hust09Uncertainty hustt18Uncertainty
      = rhoHust09Hustt18 := by
  norm_num [expandedCorrelation, correlationCoefficient, covarianceFromCorrelation,
    expandCovariance, expandUncertainty, scaleFactor, rhoHust09Hustt18,
    hust09Uncertainty, hustt18Uncertainty]

#print axioms correlationCoefficient_recovers_factorization
#print axioms correlationCoefficient_invariant_under_uniform_expansion

end HsHVerification.CODATACovarianceScaling
