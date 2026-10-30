import Mathlib

namespace HsHVerification.OrsonSharedRecordIdentifiability

/-!
Conditional formalization of Orson Vay's assistant-authored OV-55 / OV-56
cognition-sandbox model (2026-10-10).

Source status:
* OV-55: analytic toy model; no LLM experiment administered.
* OV-56: identifiability derivation and simulated power; no real LLM calls.
* These equations are not Nathan Direct statements and are not empirical
  estimates of any model's source dependence.

The formal result is deliberately narrow: under the stated Bernoulli models,
a shared all-or-nothing reliability gate and a latent item-difficulty mixture
induce exactly the same probability for every finite labelled correctness
pattern. This is an observational-equivalence theorem, not a causal claim.
-/

/-- Probability of one fixed labelled correctness pattern under the
shared-record gate model. successes and failures are the pattern counts. -/
def gatePatternProbability (p q : ℝ) (successes failures : ℕ) : ℝ :=
  q * (if successes = 0 then 1 else 0) +
    (1 - q) * p ^ successes * (1 - p) ^ failures

/-- The alternative latent-difficulty mixture: item difficulty is zero with
probability q, and p with probability 1-q; agents are conditionally
independent given that difficulty. -/
def difficultyMixturePatternProbability
    (p q : ℝ) (successes failures : ℕ) : ℝ :=
  q * (0 : ℝ) ^ successes * (1 : ℝ) ^ failures +
    (1 - q) * p ^ successes * (1 - p) ^ failures

/-- A Bernoulli(0) item gives positive probability only to the all-failure
pattern. The 0^0 = 1 convention handles the empty-success pattern. -/
lemma zeroDifficultyPattern (successes failures : ℕ) :
    (0 : ℝ) ^ successes * (1 : ℝ) ^ failures =
      (if successes = 0 then 1 else 0) := by
  cases successes <;> simp

/-- Full finite-pattern observational equivalence of the two latent
interpretations. This is stronger than equality of the first two moments. -/
theorem passivePatternDistributionEquivalence
    (p q : ℝ) (successes failures : ℕ) :
    gatePatternProbability p q successes failures =
      difficultyMixturePatternProbability p q successes failures := by
  unfold gatePatternProbability difficultyMixturePatternProbability
  rw [zeroDifficultyPattern]

/-- Marginal correctness under the shared-record gate model. -/
def marginalCorrectness (p q : ℝ) : ℝ := (1 - q) * p

/-- Joint correctness of two distinct agents under the gate model. -/
def pairJointCorrectness (p q : ℝ) : ℝ := (1 - q) * p ^ 2

/-- Joint correctness of three distinct agents under the gate model. -/
def tripleJointCorrectness (p q : ℝ) : ℝ := (1 - q) * p ^ 3

/-- Pairwise covariance of correctness indicators. -/
def pairwiseCovariance (p q : ℝ) : ℝ :=
  pairJointCorrectness p q - (marginalCorrectness p q) ^ 2

/-- Bernoulli marginal variance. -/
def marginalVariance (p q : ℝ) : ℝ :=
  marginalCorrectness p q * (1 - marginalCorrectness p q)

/-- Pairwise correlation of correctness indicators. -/
def pairwiseErrorCorrelation (p q : ℝ) : ℝ :=
  pairwiseCovariance p q / marginalVariance p q

/-- The covariance formula recorded in OV-55/56. -/
theorem pairwiseCovarianceIdentity (p q : ℝ) :
    pairwiseCovariance p q = q * (1 - q) * p ^ 2 := by
  unfold pairwiseCovariance pairJointCorrectness marginalCorrectness
  ring

/-- A single marginal does not identify the two gate parameters: for every
strictly interior marginal m, two distinct valid parameter pairs produce it. -/
theorem twoDistinctParametersSameMarginal
    (m : ℝ) (hm0 : 0 < m) (hm1 : m < 1) :
    marginalCorrectness m 0 = marginalCorrectness 1 (1 - m) ∧
      (m, (0 : ℝ)) ≠ (1, 1 - m) := by
  constructor
  · simp [marginalCorrectness]
  · intro h
    have hfirst : m = 1 := congrArg Prod.fst h
    linarith

/-- Under the assumed gate model, the first two moments recover p when the
marginal is nonzero. This is model-conditional identification, not causal
identification of the latent interpretation. -/
theorem recoverPFromFirstTwoMoments
    (p q : ℝ) (hm : marginalCorrectness p q ≠ 0) :
    pairJointCorrectness p q / marginalCorrectness p q = p := by
  unfold pairJointCorrectness marginalCorrectness at *
  field_simp [hm]
  <;> ring

/-- Under the assumed gate model, the first two moments recover q when the
pairwise joint moment is nonzero. The observational-equivalence theorem above
still prevents identifying what the latent gate means. -/
theorem recoverQFromFirstTwoMoments
    (p q : ℝ) (hv : pairJointCorrectness p q ≠ 0) :
    1 - (marginalCorrectness p q) ^ 2 / pairJointCorrectness p q = q := by
  unfold pairJointCorrectness marginalCorrectness at *
  field_simp [hv]
  <;> ring

/-- Combined conditional parameter recovery from the first two moments. -/
theorem firstTwoMomentsRecoverGateParameters
    (p q : ℝ)
    (hm : marginalCorrectness p q ≠ 0)
    (hv : pairJointCorrectness p q ≠ 0) :
    pairJointCorrectness p q / marginalCorrectness p q = p ∧
      1 - (marginalCorrectness p q) ^ 2 / pairJointCorrectness p q = q := by
  constructor
  · exact recoverPFromFirstTwoMoments p q hm
  · exact recoverQFromFirstTwoMoments p q hv

/-- OV-55/56's existing sandbox parameterization: marginal success 0.68. -/
theorem ov55MarginalExample :
    marginalCorrectness (4 / 5) (3 / 20) = 17 / 25 := by
  norm_num [marginalCorrectness]

/-- OV-55/56's existing sandbox parameterization: pair joint success 0.544. -/
theorem ov55PairJointExample :
    pairJointCorrectness (4 / 5) (3 / 20) = 68 / 125 := by
  norm_num [pairJointCorrectness]

/-- OV-56's existing third joint moment, exactly 0.4352. -/
theorem ov56TripleMomentExample :
    tripleJointCorrectness (4 / 5) (3 / 20) = 272 / 625 := by
  norm_num [tripleJointCorrectness]

/-- OV-56's existing covariance, exactly 0.0816. -/
theorem ov56CovarianceExample :
    pairwiseCovariance (4 / 5) (3 / 20) = 51 / 625 := by
  norm_num [pairwiseCovariance, pairJointCorrectness, marginalCorrectness]

/-- OV-55/56's existing pairwise correctness correlation, exactly 0.375. -/
theorem ov55PairwiseCorrelationExample :
    pairwiseErrorCorrelation (4 / 5) (3 / 20) = 3 / 8 := by
  norm_num [pairwiseErrorCorrelation, pairwiseCovariance, marginalVariance,
    pairJointCorrectness, marginalCorrectness]

#print axioms passivePatternDistributionEquivalence
#print axioms pairwiseCovarianceIdentity
#print axioms twoDistinctParametersSameMarginal
#print axioms recoverPFromFirstTwoMoments
#print axioms recoverQFromFirstTwoMoments
#print axioms firstTwoMomentsRecoverGateParameters
#print axioms ov55MarginalExample
#print axioms ov55PairJointExample
#print axioms ov56TripleMomentExample
#print axioms ov56CovarianceExample
#print axioms ov55PairwiseCorrelationExample

end HsHVerification.OrsonSharedRecordIdentifiability
