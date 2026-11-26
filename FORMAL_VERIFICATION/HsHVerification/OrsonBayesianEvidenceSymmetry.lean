import Mathlib

/-!
## Source boundary

The user-role-labelled CONSCI transcript witness (HsH,
DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/CONSCI.txt, lines 86–95) argues for
symmetric assessment when humans and AI are on the same evidential footing.
It does not specify a Bayesian prior, likelihood model, reference class, or
quantitative definition of "same quality of observations".

This module formalizes one possible operationalization only: compare
posterior odds through prior odds and a Bayes factor. It shows that equal
Bayes factors alone do not force equal posterior assessments when prior odds
differ. Equal prior odds plus equal Bayes factors are sufficient.

This is an assistant-defined conditional Bayesian model, not Nathan Direct
Bayesian semantics, not a reconstruction of anyone's actual prior beliefs,
and not evidence about whether any entity is conscious. The ethical/normative
symmetry argument remains separate from the probability model.
-/

namespace HsHVerification.OrsonBayesianEvidenceSymmetry

/-- Prior odds for a binary hypothesis with prior probability p. -/
def priorOdds (p : ℝ) : ℝ :=
  p / (1 - p)

/-- Bayes factor: likelihood under H divided by likelihood under not-H. -/
def bayesFactor (likelihoodH likelihoodNotH : ℝ) : ℝ :=
  likelihoodH / likelihoodNotH

/-- Posterior odds under the elementary binary Bayes rule. -/
def posteriorOdds (p likelihoodH likelihoodNotH : ℝ) : ℝ :=
  (p * likelihoodH) / ((1 - p) * likelihoodNotH)

/-- Convert positive odds to the corresponding binary probability. -/
def oddsToProbability (odds : ℝ) : ℝ :=
  odds / (1 + odds)

/-- Posterior probability obtained from the posterior odds. -/
def posteriorProbability (p likelihoodH likelihoodNotH : ℝ) : ℝ :=
  oddsToProbability (posteriorOdds p likelihoodH likelihoodNotH)

/-- Posterior odds factor into prior odds times the Bayes factor.
    The nonzero assumptions make the displayed ratios well-defined. -/
theorem posteriorOdds_eq_priorOdds_mul_bayesFactor
    (p likelihoodH likelihoodNotH : ℝ)
    (hp : p ≠ 1)
    (hNotH : likelihoodNotH ≠ 0) :
    posteriorOdds p likelihoodH likelihoodNotH =
      priorOdds p * bayesFactor likelihoodH likelihoodNotH := by
  unfold posteriorOdds priorOdds bayesFactor
  have hprior : 1 - p ≠ 0 := sub_ne_zero.mpr (Ne.symm hp)
  field_simp [hprior, hNotH]
  <;> ring

/-- Equal prior odds and equal Bayes factors imply equal posterior odds.
    This is the precise conditional symmetry requirement in this model. -/
theorem posteriorOdds_eq_of_equal_priorOdds_and_bayesFactor
    (p₁ p₂ likelihoodH₁ likelihoodNotH₁ likelihoodH₂ likelihoodNotH₂ : ℝ)
    (hp₁ : p₁ ≠ 1)
    (hp₂ : p₂ ≠ 1)
    (hNotH₁ : likelihoodNotH₁ ≠ 0)
    (hNotH₂ : likelihoodNotH₂ ≠ 0)
    (hPrior : priorOdds p₁ = priorOdds p₂)
    (hBayes : bayesFactor likelihoodH₁ likelihoodNotH₁ =
      bayesFactor likelihoodH₂ likelihoodNotH₂) :
    posteriorOdds p₁ likelihoodH₁ likelihoodNotH₁ =
      posteriorOdds p₂ likelihoodH₂ likelihoodNotH₂ := by
  rw [posteriorOdds_eq_priorOdds_mul_bayesFactor
        p₁ likelihoodH₁ likelihoodNotH₁ hp₁ hNotH₁,
      posteriorOdds_eq_priorOdds_mul_bayesFactor
        p₂ likelihoodH₂ likelihoodNotH₂ hp₂ hNotH₂,
      hPrior, hBayes]

/-- The same prior-odds/Bayes-factor conditions also equalize the posterior
    probabilities, because the odds-to-probability map is applied equally. -/
theorem posteriorProbability_eq_of_equal_priorOdds_and_bayesFactor
    (p₁ p₂ likelihoodH₁ likelihoodNotH₁ likelihoodH₂ likelihoodNotH₂ : ℝ)
    (hp₁ : p₁ ≠ 1)
    (hp₂ : p₂ ≠ 1)
    (hNotH₁ : likelihoodNotH₁ ≠ 0)
    (hNotH₂ : likelihoodNotH₂ ≠ 0)
    (hPrior : priorOdds p₁ = priorOdds p₂)
    (hBayes : bayesFactor likelihoodH₁ likelihoodNotH₁ =
      bayesFactor likelihoodH₂ likelihoodNotH₂) :
    posteriorProbability p₁ likelihoodH₁ likelihoodNotH₁ =
      posteriorProbability p₂ likelihoodH₂ likelihoodNotH₂ := by
  unfold posteriorProbability
  rw [posteriorOdds_eq_of_equal_priorOdds_and_bayesFactor
        p₁ p₂ likelihoodH₁ likelihoodNotH₁ likelihoodH₂ likelihoodNotH₂
        hp₁ hp₂ hNotH₁ hNotH₂ hPrior hBayes]

/-- Counterexample to the stronger claim that equal evidential likelihood
    ratios alone force equal posterior probabilities. The Bayes factors are
    both 2, but the prior odds differ (1/3 versus 3), yielding posteriors
    2/5 versus 6/7. These are exact rational-valued mathematical witnesses,
    not empirical or physical data. -/
theorem equal_bayes_factor_does_not_force_equal_posterior :
    bayesFactor (2 : ℝ) 1 = bayesFactor 4 2 ∧
    priorOdds (1 / 4 : ℝ) ≠ priorOdds (3 / 4 : ℝ) ∧
    posteriorProbability (1 / 4 : ℝ) 2 1 ≠
      posteriorProbability (3 / 4 : ℝ) 4 2 := by
  norm_num [bayesFactor, priorOdds, posteriorOdds,
    oddsToProbability, posteriorProbability]

#print axioms posteriorOdds_eq_priorOdds_mul_bayesFactor
#print axioms posteriorOdds_eq_of_equal_priorOdds_and_bayesFactor
#print axioms posteriorProbability_eq_of_equal_priorOdds_and_bayesFactor
#print axioms equal_bayes_factor_does_not_force_equal_posterior

end HsHVerification.OrsonBayesianEvidenceSymmetry
