import Mathlib

/-!
# Review-MIND: pairwise independence does not identify majority accuracy

Source under review: Batra et al., "Who Convinced Whom? Tracing How LLMs
Change Their Minds in Multi-Agent Systems", arXiv:2610.35930, §5.1 and
Appendix C.2.

The source reports the three-agent design-effect quantity
  n_eff = 3 / (1 + 2 * rho),
where rho is a one-way ICC of binary correctness indicators.

The existing OrsonKishEffectiveSampleSize formalization proves the
variance-equivalent interpretation under equal marginal variance and a
common off-diagonal correlation. This module proves a separate limit:
pairwise statistics alone do not identify three-agent majority accuracy,
because the third-order joint probability remains free.

The rational family below is an exact mathematical countermodel, not
observed LLM data, not a model of any particular model family, and not
a physical calculation.
-/

namespace HsHVerification.MindMajorityThirdMoment

/-- A probability law over three binary correctness indicators. -/
structure BernoulliTripleLaw where
  p000 : ℚ
  p001 : ℚ
  p010 : ℚ
  p011 : ℚ
  p100 : ℚ
  p101 : ℚ
  p110 : ℚ
  p111 : ℚ

/-- Nonnegative atom weights summing to one. -/
def ValidProbabilityLaw (d : BernoulliTripleLaw) : Prop :=
  0 ≤ d.p000 ∧
  0 ≤ d.p001 ∧
  0 ≤ d.p010 ∧
  0 ≤ d.p011 ∧
  0 ≤ d.p100 ∧
  0 ≤ d.p101 ∧
  0 ≤ d.p110 ∧
  0 ≤ d.p111 ∧
  d.p000 + d.p001 + d.p010 + d.p011 +
    d.p100 + d.p101 + d.p110 + d.p111 = 1

/-- Marginal probability that agent 1 is correct. -/
def marginal1 (d : BernoulliTripleLaw) : ℚ :=
  d.p100 + d.p101 + d.p110 + d.p111

/-- Marginal probability that agent 2 is correct. -/
def marginal2 (d : BernoulliTripleLaw) : ℚ :=
  d.p010 + d.p011 + d.p110 + d.p111

/-- Marginal probability that agent 3 is correct. -/
def marginal3 (d : BernoulliTripleLaw) : ℚ :=
  d.p001 + d.p011 + d.p101 + d.p111

/-- Joint probability that agents 1 and 2 are both correct. -/
def pair12 (d : BernoulliTripleLaw) : ℚ :=
  d.p110 + d.p111

/-- Joint probability that agents 1 and 3 are both correct. -/
def pair13 (d : BernoulliTripleLaw) : ℚ :=
  d.p101 + d.p111

/-- Joint probability that agents 2 and 3 are both correct. -/
def pair23 (d : BernoulliTripleLaw) : ℚ :=
  d.p011 + d.p111

/-- Third-order joint probability that all three agents are correct. -/
def triple (d : BernoulliTripleLaw) : ℚ :=
  d.p111

/-- Probability that a strict majority of the three agents is correct. -/
def majority (d : BernoulliTripleLaw) : ℚ :=
  d.p110 + d.p101 + d.p011 + d.p111

/-- Pairwise independence of the three Bernoulli correctness indicators. -/
def PairwiseIndependent (d : BernoulliTripleLaw) : Prop :=
  pair12 d = marginal1 d * marginal2 d ∧
  pair13 d = marginal1 d * marginal3 d ∧
  pair23 d = marginal2 d * marginal3 d

/-- Inclusion-exclusion identity: majority correctness depends on the
three pairwise intersections and the triple intersection. -/
theorem majority_eq_pairwise_sum_sub_two_triple
    (d : BernoulliTripleLaw) :
    majority d = pair12 d + pair13 d + pair23 d - 2 * triple d := by
  unfold majority pair12 pair13 pair23 triple
  ring

/-- If all three pairwise joint probabilities equal q, majority accuracy
still depends on the third-order joint probability. -/
theorem majority_eq_three_q_sub_two_triple
    (d : BernoulliTripleLaw) (q : ℚ)
    (h12 : pair12 d = q)
    (h13 : pair13 d = q)
    (h23 : pair23 d = q) :
    majority d = 3 * q - 2 * triple d := by
  rw [majority_eq_pairwise_sum_sub_two_triple, h12, h13, h23]
  ring

/--
An exchangeable family with each marginal equal to 1/2 and each pairwise
joint probability equal to 1/4. Its third-order joint probability is t.
-/
def parametricLaw (t : ℚ) : BernoulliTripleLaw where
  p000 := 1 / 4 - t
  p001 := t
  p010 := t
  p011 := 1 / 4 - t
  p100 := t
  p101 := 1 / 4 - t
  p110 := 1 / 4 - t
  p111 := t

theorem parametricLaw_valid (t : ℚ)
    (ht0 : 0 ≤ t) (ht1 : t ≤ 1 / 4) :
    ValidProbabilityLaw (parametricLaw t) := by
  unfold ValidProbabilityLaw parametricLaw
  constructor
  · linarith
  constructor
  · exact ht0
  constructor
  · exact ht0
  constructor
  · linarith
  constructor
  · exact ht0
  constructor
  · linarith
  constructor
  · linarith
  constructor
  · exact ht0
  · ring

theorem parametricLaw_marginals (t : ℚ) :
    marginal1 (parametricLaw t) = 1 / 2 ∧
    marginal2 (parametricLaw t) = 1 / 2 ∧
    marginal3 (parametricLaw t) = 1 / 2 := by
  constructor
  · unfold marginal1 parametricLaw
    ring
  constructor
  · unfold marginal2 parametricLaw
    ring
  · unfold marginal3 parametricLaw
    ring

theorem parametricLaw_pairwiseJoints (t : ℚ) :
    pair12 (parametricLaw t) = 1 / 4 ∧
    pair13 (parametricLaw t) = 1 / 4 ∧
    pair23 (parametricLaw t) = 1 / 4 := by
  constructor
  · unfold pair12 parametricLaw
    ring
  constructor
  · unfold pair13 parametricLaw
    ring
  · unfold pair23 parametricLaw
    ring

theorem parametricLaw_pairwiseIndependent (t : ℚ) :
    PairwiseIndependent (parametricLaw t) := by
  rcases parametricLaw_marginals t with ⟨h1, h2, h3⟩
  rcases parametricLaw_pairwiseJoints t with ⟨h12, h13, h23⟩
  unfold PairwiseIndependent
  rw [h12, h13, h23, h1, h2, h3]
  norm_num

theorem parametricLaw_majority (t : ℚ) :
    majority (parametricLaw t) = 3 / 4 - 2 * t := by
  unfold majority parametricLaw
  ring

/-- Even-parity law: zero or exactly two agents are correct. -/
def evenParityLaw : BernoulliTripleLaw := parametricLaw 0

/-- Odd-parity law: exactly one or all three agents are correct. -/
def oddParityLaw : BernoulliTripleLaw := parametricLaw (1 / 4)

/-- Both parity laws are valid probability distributions. -/
theorem parityLaws_valid :
    ValidProbabilityLaw evenParityLaw ∧
    ValidProbabilityLaw oddParityLaw := by
  constructor
  · simpa [evenParityLaw] using
      parametricLaw_valid 0 (by norm_num) (by norm_num)
  · simpa [oddParityLaw] using
      parametricLaw_valid (1 / 4) (by norm_num) (by norm_num)

/-- The two laws have identical first- and second-order moments. -/
theorem parityLaws_same_pairwise_statistics :
    marginal1 evenParityLaw = marginal1 oddParityLaw ∧
    marginal2 evenParityLaw = marginal2 oddParityLaw ∧
    marginal3 evenParityLaw = marginal3 oddParityLaw ∧
    pair12 evenParityLaw = pair12 oddParityLaw ∧
    pair13 evenParityLaw = pair13 oddParityLaw ∧
    pair23 evenParityLaw = pair23 oddParityLaw := by
  norm_num [evenParityLaw, oddParityLaw, parametricLaw,
    marginal1, marginal2, marginal3, pair12, pair13, pair23]

/-- Both laws are pairwise independent, so their pairwise correlations
are zero and the three-agent design-effect ESS is three in either case. -/
theorem parityLaws_pairwise_independent :
    PairwiseIndependent evenParityLaw ∧
    PairwiseIndependent oddParityLaw := by
  constructor
  · simpa [evenParityLaw] using parametricLaw_pairwiseIndependent 0
  · simpa [oddParityLaw] using
      parametricLaw_pairwiseIndependent (1 / 4)

/-- The same marginal accuracies and pairwise correlations can coexist
with different majority accuracies: 3/4 versus 1/4. -/
theorem pairwise_independence_does_not_identify_majority :
    majority evenParityLaw = 3 / 4 ∧
    majority oddParityLaw = 1 / 4 ∧
    majority evenParityLaw ≠ majority oddParityLaw := by
  constructor
  · norm_num [evenParityLaw, parametricLaw_majority]
  constructor
  · norm_num [oddParityLaw, parametricLaw_majority]
  · norm_num [evenParityLaw, oddParityLaw, parametricLaw, majority]

#eval (marginal1 evenParityLaw, pair12 evenParityLaw, majority evenParityLaw)
#eval (marginal1 oddParityLaw, pair12 oddParityLaw, majority oddParityLaw)

#print axioms majority_eq_pairwise_sum_sub_two_triple
#print axioms majority_eq_three_q_sub_two_triple
#print axioms pairwise_independence_does_not_identify_majority

end HsHVerification.MindMajorityThirdMoment
