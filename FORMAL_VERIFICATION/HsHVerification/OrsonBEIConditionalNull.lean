import Mathlib

/-!
# Orson P1 comparator: finite BEI null-centering abstraction

External comparator: Chenchen Kuai et al., "A Statistical Framework for
Auditing Behavioral Dependence and Induced Bias in LLM Judges" (COLM 2026),
arXiv:2604.07650v2, §3.1 and Appendix A.

For one difficulty stratum, the conditional-independence null is represented
by the factorization `joint = p_i * p_j`, where the three real values stand
for already-formed conditional probabilities. A deterministic difficulty
weight multiplies the centered residual. The finite-sum and cluster-average
lemmas show that pointwise zero centering survives arbitrary deterministic
weighting and finite aggregation.

This is deliberately a finite algebraic abstraction, not a full formalization
of probability spaces, conditional expectation, logistic calibration,
leave-pair-out difficulty estimation, the Monte Carlo test, or cluster
bootstrap. It does not prove the conditional-independence premise from data,
validate answer keys, establish model independence, or establish causal
effects. In particular, zero-centering of the population residual does not
license task-independent Monte Carlo p-values when questions are clustered
within a shared premise/set.
-/

namespace HsHVerification.OrsonBEIConditionalNull

/-- Joint conditional failure probability minus the product of the
    two marginal conditional failure probabilities in one stratum. -/
def pairResidual (joint pI pJ : ℝ) : ℝ :=
  joint - pI * pJ

/-- A deterministic difficulty weight applied to the pair residual. -/
def weightedPairResidual (weight joint pI pJ : ℝ) : ℝ :=
  weight * pairResidual joint pI pJ

/-- Conditional independence in a stratum makes its pair residual zero. -/
theorem conditional_pair_residual_zero
    (joint pI pJ : ℝ)
    (hIndep : joint = pI * pJ) :
    pairResidual joint pI pJ = 0 := by
  simp [pairResidual, hIndep]

/-- Any deterministic weight preserves the zero residual in that stratum. -/
theorem weighted_pair_residual_zero
    (weight joint pI pJ : ℝ)
    (hIndep : joint = pI * pJ) :
    weightedPairResidual weight joint pI pJ = 0 := by
  simp [weightedPairResidual, pairResidual, hIndep]

/-- Finite weighted aggregation preserves pointwise null centering.
    No independence assumption between distinct task indices appears. -/
theorem finite_weighted_pair_residual_zero
    {ι : Type*} (tasks : Finset ι)
    (weight joint pI pJ : ι → ℝ)
    (hIndep : ∀ i ∈ tasks, joint i = pI i * pJ i) :
    ∑ i ∈ tasks,
      weightedPairResidual (weight i) (joint i) (pI i) (pJ i) = 0 := by
  apply Finset.sum_eq_zero
  intro i hi
  exact weighted_pair_residual_zero
    (weight i) (joint i) (pI i) (pJ i) (hIndep i hi)

/-- The same pointwise null centering survives averaging within any
    finite question cluster. This is an expectation-algebra result only;
    it is not a cluster-aware variance or significance procedure. -/
theorem cluster_average_pair_residual_zero
    {ι : Type*} (cluster : Finset ι)
    (weight joint pI pJ : ι → ℝ)
    (hIndep : ∀ i ∈ cluster, joint i = pI i * pJ i) :
    (∑ i ∈ cluster,
      weightedPairResidual (weight i) (joint i) (pI i) (pJ i)) /
        (cluster.card : ℝ) = 0 := by
  have hsum :
      ∑ i ∈ cluster,
        weightedPairResidual (weight i) (joint i) (pI i) (pJ i) = 0 :=
    finite_weighted_pair_residual_zero cluster weight joint pI pJ hIndep
  simp [hsum]

#print axioms conditional_pair_residual_zero
#print axioms weighted_pair_residual_zero
#print axioms finite_weighted_pair_residual_zero
#print axioms cluster_average_pair_residual_zero

end HsHVerification.OrsonBEIConditionalNull
