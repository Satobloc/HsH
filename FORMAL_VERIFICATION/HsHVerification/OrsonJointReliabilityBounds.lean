import Mathlib

/-!
# Orson P1: assumption-free joint reliability bounds

This module formalizes the three-event Fréchet bounds for a finite
probability table.

Let N mean repeatable, S mean invariant under the relevant input-order
transformation, and R mean correct against an independently adjudicated
criterion. The joint trustworthy rate is T = P(N ∧ S ∧ R).

The theorem gives the assumption-free interval

  max(0, P(N) + P(S) + P(R) - 2) ≤ T ≤ min(P(N), P(S), P(R)).

The second theorem shows that the three marginals alone do not identify T.

This is an abstract probability theorem, not a calculation on the
ConsistencyBench archive. It does not establish that P1 has repeated
checker calls, reversed-pair calls, or independent human criterion labels.
It does not validate any source-to-table translation or any physical model.
-/ 

namespace HsHVerification.OrsonJointReliabilityBounds

/-- A joint probability table for three binary events N, S, and R.
    The eight entries correspond to the truth assignments 111 through 000. -/
structure ThreeEventLaw where
  p111 : ℝ
  p110 : ℝ
  p101 : ℝ
  p100 : ℝ
  p011 : ℝ
  p010 : ℝ
  p001 : ℝ
  p000 : ℝ
  nonneg :
    0 ≤ p111 ∧ 0 ≤ p110 ∧ 0 ≤ p101 ∧ 0 ≤ p100 ∧
    0 ≤ p011 ∧ 0 ≤ p010 ∧ 0 ≤ p001 ∧ 0 ≤ p000
  total :
    p111 + p110 + p101 + p100 +
    p011 + p010 + p001 + p000 = 1

/-- Marginal probability of repeatability N. -/
def repeatable (t : ThreeEventLaw) : ℝ :=
  t.p111 + t.p110 + t.p101 + t.p100

/-- Marginal probability of pair-order invariance S. -/
def orderInvariant (t : ThreeEventLaw) : ℝ :=
  t.p111 + t.p110 + t.p011 + t.p010

/-- Marginal probability of criterion correctness R. -/
def criterionCorrect (t : ThreeEventLaw) : ℝ :=
  t.p111 + t.p101 + t.p011 + t.p001

/-- Direct joint probability that all three reliability conditions hold. -/
def jointTrustworthy (t : ThreeEventLaw) : ℝ :=
  t.p111

/-- Assumption-free Fréchet bounds for the intersection of three events.
    No independence, exchangeability, or equal-error assumption is used. -/
theorem frechet_joint_trustworthiness_bounds (t : ThreeEventLaw) :
    max 0 (repeatable t + orderInvariant t + criterionCorrect t - 2)
      ≤ jointTrustworthy t ∧
    jointTrustworthy t ≤
      min (repeatable t) (min (orderInvariant t) (criterionCorrect t)) := by
  rcases t.nonneg with
    ⟨h111, h110, h101, h100, h011, h010, h001, h000⟩
  constructor
  · apply max_le_iff.mpr
    constructor
    · exact h111
    · unfold repeatable orderInvariant criterionCorrect jointTrustworthy
      linarith [t.total]
  · rw [le_min_iff]
    constructor
    · unfold repeatable jointTrustworthy
      linarith
    · rw [le_min_iff]
      constructor
      · unfold orderInvariant jointTrustworthy
        linarith
      · unfold criterionCorrect jointTrustworthy
        linarith

/-- A probability table in which all three events coincide with probability 1/2. -/
noncomputable noncomputable def maximallyCoLocated : ThreeEventLaw where
  p111 := 1 / 2
  p110 := 0
  p101 := 0
  p100 := 0
  p011 := 0
  p010 := 0
  p001 := 0
  p000 := 1 / 2
  nonneg := by norm_num
  total := by norm_num

/-- A probability table with the same three marginals but empty triple intersection. -/
noncomputable noncomputable def separated : ThreeEventLaw where
  p111 := 0
  p110 := 0
  p101 := 0
  p100 := 1 / 2
  p011 := 1 / 2
  p010 := 0
  p001 := 0
  p000 := 0
  nonneg := by norm_num
  total := by norm_num

/-- Equal marginal rates do not identify the joint trustworthy rate.
    The two abstract tables have N, S, and R marginals all equal to 1/2,
    while their joint rates are 1/2 and 0 respectively. -/
theorem marginals_do_not_identify_joint_trustworthiness :
    repeatable maximallyCoLocated = repeatable separated ∧
    orderInvariant maximallyCoLocated = orderInvariant separated ∧
    criterionCorrect maximallyCoLocated = criterionCorrect separated ∧
    jointTrustworthy maximallyCoLocated ≠ jointTrustworthy separated := by
  norm_num [repeatable, orderInvariant, criterionCorrect,
    jointTrustworthy, maximallyCoLocated, separated]

#print axioms frechet_joint_trustworthiness_bounds
#print axioms marginals_do_not_identify_joint_trustworthiness

end HsHVerification.OrsonJointReliabilityBounds
