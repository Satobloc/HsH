import Mathlib

/-!
# Orson P1: conditional Kish effective sample size for exchangeable panel errors

Primary source: Guneet Kohli, "Nine Judges, Two Effective Votes:
Correlated Errors Undermine LLM Evaluation Panels", arXiv:2605.29800v1
(28 May 2026), §3.3, equation (1).

The paper defines n_eff = k / (1 + (k - 1) * mean_phi) and explicitly
states that this form assumes exchangeability (approximately equal pairwise
correlations). Its eigenvalue alternative is a separate diagnostic for
non-exchangeable correlation matrices.

This module proves the algebraic variance identity under the stated
equal-variance/common-correlation covariance model, bounds the resulting
effective sample size when rho is in [0,1], and checks the paper's rounded
k=9, mean_phi=0.391 example.

The formalization does NOT compute phi from the nine judges' raw outputs,
verify the paper's dataset, establish that real model errors are exchangeable,
or show that n_eff is a literal number of independent cognitive agents.
-/

namespace HsHVerification.OrsonKishEffectiveSampleSize

/-- Design effect for k exchangeable observations with common pairwise
correlation rho. -/
def designEffect (k : ℕ) (rho : ℝ) : ℝ :=
  1 + ((k : ℝ) - 1) * rho

/-- Kish effective sample size under the exchangeable design-effect model. -/
noncomputable def kishEffectiveSampleSize (k : ℕ) (rho : ℝ) : ℝ :=
  (k : ℝ) / designEffect k rho

/-- Variance of the sample mean, written as the diagonal variance plus
the k*(k-1) ordered off-diagonal covariance terms, divided by k^2. -/
noncomputable def exchangeableMeanVariance (k : ℕ) (variance rho : ℝ) : ℝ :=
  variance * ((k : ℝ) + (k : ℝ) * ((k : ℝ) - 1) * rho) / (k : ℝ)^2

/-- Variance of an independent sample mean with the same marginal variance
and the effective sample size supplied by the Kish design-effect model. -/
noncomputable def independentEquivalentVariance (k : ℕ) (variance rho : ℝ) : ℝ :=
  variance * designEffect k rho / (k : ℝ)

/-- Under equal marginal variance and a common off-diagonal correlation,
the exchangeable covariance sum reduces to the design-effect expression. -/
theorem exchangeableMeanVariance_eq_independentEquivalentVariance
    (k : ℕ) (hk : 0 < k) (variance rho : ℝ) :
    exchangeableMeanVariance k variance rho =
      independentEquivalentVariance k variance rho := by
  unfold exchangeableMeanVariance independentEquivalentVariance designEffect
  have hk0 : (k : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hk)
  field_simp [hk0]
  <;> ring

/-- The independent-equivalent variance is variance divided by the Kish
effective sample size whenever the design effect is nonzero. -/
theorem independentEquivalentVariance_eq_variance_div_kish
    (k : ℕ) (hk : 0 < k) (variance rho : ℝ)
    (hd : designEffect k rho ≠ 0) :
    independentEquivalentVariance k variance rho =
      variance / kishEffectiveSampleSize k rho := by
  unfold independentEquivalentVariance kishEffectiveSampleSize
  have hk0 : (k : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hk)
  field_simp [hk0, hd]
  <;> ring

/-- Combined conditional derivation of the Kish formula from the
exchangeable mean-variance expression. -/
theorem exchangeableMeanVariance_eq_variance_div_kish
    (k : ℕ) (hk : 0 < k) (variance rho : ℝ)
    (hd : designEffect k rho ≠ 0) :
    exchangeableMeanVariance k variance rho =
      variance / kishEffectiveSampleSize k rho := by
  calc
    exchangeableMeanVariance k variance rho =
        independentEquivalentVariance k variance rho :=
      exchangeableMeanVariance_eq_independentEquivalentVariance k hk variance rho
    _ = variance / kishEffectiveSampleSize k rho :=
      independentEquivalentVariance_eq_variance_div_kish k hk variance rho hd

/-- For k >= 1 and nonnegative common correlation, the design effect is
at least one. -/
theorem designEffect_ge_one
    (k : ℕ) (rho : ℝ) (hk : 1 ≤ k) (hrho : 0 ≤ rho) :
    1 ≤ designEffect k rho := by
  unfold designEffect
  have hkR : (1 : ℝ) ≤ (k : ℝ) := by exact_mod_cast hk
  have hkm : 0 ≤ (k : ℝ) - 1 := by linarith
  have hmul := mul_nonneg hkm hrho
  linarith

/-- For k >= 1 and rho <= 1, the design effect does not exceed k. -/
theorem designEffect_le_panelSize
    (k : ℕ) (rho : ℝ) (hk : 1 ≤ k)
    (hrho0 : 0 ≤ rho) (hrho1 : rho ≤ 1) :
    designEffect k rho ≤ (k : ℝ) := by
  unfold designEffect
  have hkR : (1 : ℝ) ≤ (k : ℝ) := by exact_mod_cast hk
  have hkm : 0 ≤ (k : ℝ) - 1 := by linarith
  have hmul : ((k : ℝ) - 1) * rho ≤ (k : ℝ) - 1 := by
    have h1 : 0 ≤ 1 - rho := by linarith
    have h := mul_nonneg hkm h1
    nlinarith
  linarith

/-- When rho is a valid nonnegative correlation no greater than one,
the effective sample size lies between one and the nominal panel size. -/
theorem kishEffectiveSampleSize_bounds
    (k : ℕ) (rho : ℝ) (hk : 1 ≤ k)
    (hrho0 : 0 ≤ rho) (hrho1 : rho ≤ 1) :
    1 ≤ kishEffectiveSampleSize k rho ∧
      kishEffectiveSampleSize k rho ≤ (k : ℝ) := by
  have hdlo := designEffect_ge_one k rho hk hrho0
  have hdhi := designEffect_le_panelSize k rho hk hrho0 hrho1
  have hdpos : 0 < designEffect k rho := by linarith
  constructor
  · unfold kishEffectiveSampleSize
    rw [le_div_iff₀ hdpos]
    simpa using hdhi
  · unfold kishEffectiveSampleSize
    rw [div_le_iff₀ hdpos]
    have hk0 : 0 ≤ (k : ℝ) := by positivity
    nlinarith

/-- The source-reported rounded inputs k=9 and mean phi=0.391 give
9/(1+8*0.391)=375/172. This uses the rounded phi, not the paper's
unrounded internal value. -/
theorem nine_judge_rounded_phi_exact :
    kishEffectiveSampleSize 9 (391 / 1000) = (375 / 172 : ℝ) := by
  norm_num [kishEffectiveSampleSize, designEffect]

/-- The rounded-input calculation is within 0.001 of the paper's
reported two-decimal value 2.18. -/
theorem nine_judge_rounded_phi_matches_reported :
    |kishEffectiveSampleSize 9 (391 / 1000) - (218 / 100 : ℝ)| <
      (1 / 1000 : ℝ) := by
  norm_num [kishEffectiveSampleSize, designEffect]

/-!
## Weight concentration under exchangeable dependence

Liu et al., "Social Networks of LLM Agents" (arXiv:2607.03695v1,
July 7, 2026), Definition 8.7, use the concentration ESS
1 / sum_i q_i^2 under independent private signals; Proposition 8.6
states the corresponding variance formula. Kohli, arXiv:2605.29800v1,
§3.3, gives the equal-weight exchangeable design-effect/Kish formula.

The following is an assistant-derived algebraic bridge, not a formula
claimed verbatim by either source. It combines normalized unequal
weights with a common off-diagonal error correlation. It does not
establish that any real LLM panel has exchangeable errors, nor does it
supply empirical weights or correlations.
-/

/-- Total weight W = sum_i q_i. -/
def weightTotal {n : ℕ} (q : Fin n → ℝ) : ℝ :=
  ∑ i, q i

/-- Quadratic weight concentration H = sum_i q_i^2. -/
def weightConcentration {n : ℕ} (q : Fin n → ℝ) : ℝ :=
  ∑ i, (q i)^2

/-- Relative variance factor under equal marginal variance and a common
off-diagonal correlation, expressed through total weight and quadratic
weight concentration. -/
def weightedExchangeableVarianceFactor
    (weightSum concentration rho : ℝ) : ℝ :=
  rho * weightSum^2 + (1-rho)*concentration

/-- For normalized weights, the exchangeable variance factor reduces to
rho + (1-rho)H. -/
theorem weightedExchangeableVarianceFactor_normalized
    (weightSum concentration rho : ℝ) (hweight : weightSum = 1) :
    weightedExchangeableVarianceFactor weightSum concentration rho =
      rho + (1-rho)*concentration := by
  unfold weightedExchangeableVarianceFactor
  rw [hweight]
  ring

/-- Variance-equivalent sample size from squared-weight concentration H
and common off-diagonal correlation rho. -/
noncomputable def weightedExchangeableESSFromConcentration
    (concentration rho : ℝ) : ℝ :=
  1 / (rho + (1-rho)*concentration)

/-- At zero pairwise correlation, the combined ESS reduces to 1/H. -/
theorem weightedExchangeableESS_independent
    (concentration : ℝ) :
    weightedExchangeableESSFromConcentration concentration 0 =
      1 / concentration := by
  simp [weightedExchangeableESSFromConcentration]

/-- If H=1/k, the combined weighted formula is exactly the existing
Kish exchangeable-panel effective sample size. -/
theorem weightedExchangeableESSFromConcentration_uniform_eq_kish
    (k : ℕ) (hk : 0 < k) (rho : ℝ)
    (hd : designEffect k rho ≠ 0) :
    weightedExchangeableESSFromConcentration (1/(k:ℝ)) rho =
      kishEffectiveSampleSize k rho := by
  unfold weightedExchangeableESSFromConcentration kishEffectiveSampleSize
  have hk0 : (k:ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hk)
  have hd' : 1 + ((k:ℝ)-1)*rho ≠ 0 := by
    simpa [designEffect] using hd
  have hden : rho + (1-rho)/(k:ℝ) ≠ 0 := by
    intro h
    apply hd'
    calc
      1 + ((k:ℝ)-1)*rho =
          (k:ℝ) * (rho + (1-rho)/(k:ℝ)) := by
            field_simp [hk0]
            <;> ring
      _ = 0 := by rw [h]; ring
  field_simp [hk0, hden, hd']
  <;> ring_nf

/-- Equal weights on k positions have H=1/k. -/
theorem uniformWeightConcentration
    (k : ℕ) (hk : 0 < k) :
    weightConcentration (fun _ : Fin k => 1/(k:ℝ)) = 1/(k:ℝ) := by
  classical
  simp [weightConcentration, Finset.sum_const, Finset.card_fin]
  <;> field_simp [show (k:ℝ) ≠ 0 by exact_mod_cast (Nat.ne_of_gt hk)]
  <;> ring

/-- The finite-vector uniform-weight specialization reduces to Kish. -/
theorem weightedExchangeableESS_uniform_eq_kish
    (k : ℕ) (hk : 0 < k) (rho : ℝ)
    (hd : designEffect k rho ≠ 0) :
    weightedExchangeableESSFromConcentration
      (weightConcentration (fun _ : Fin k => 1/(k:ℝ))) rho =
      kishEffectiveSampleSize k rho := by
  rw [uniformWeightConcentration k hk]
  exact weightedExchangeableESSFromConcentration_uniform_eq_kish k hk rho hd

#print axioms exchangeableMeanVariance_eq_independentEquivalentVariance
#print axioms independentEquivalentVariance_eq_variance_div_kish
#print axioms exchangeableMeanVariance_eq_variance_div_kish
#print axioms designEffect_ge_one
#print axioms designEffect_le_panelSize
#print axioms kishEffectiveSampleSize_bounds
#print axioms nine_judge_rounded_phi_exact
#print axioms nine_judge_rounded_phi_matches_reported

#print axioms weightedExchangeableVarianceFactor_normalized
#print axioms weightedExchangeableESS_independent
#print axioms weightedExchangeableESSFromConcentration_uniform_eq_kish
#print axioms uniformWeightConcentration
#print axioms weightedExchangeableESS_uniform_eq_kish

end HsHVerification.OrsonKishEffectiveSampleSize
