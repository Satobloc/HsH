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

#print axioms exchangeableMeanVariance_eq_independentEquivalentVariance
#print axioms independentEquivalentVariance_eq_variance_div_kish
#print axioms exchangeableMeanVariance_eq_variance_div_kish
#print axioms designEffect_ge_one
#print axioms designEffect_le_panelSize
#print axioms kishEffectiveSampleSize_bounds
#print axioms nine_judge_rounded_phi_exact
#print axioms nine_judge_rounded_phi_matches_reported

end HsHVerification.OrsonKishEffectiveSampleSize
