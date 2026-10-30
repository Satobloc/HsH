import Mathlib

/-!
# Orson P1: normalized finite-pattern observational equivalence

Source interpretation:
* OV-55 (2026-10-10) is an assistant-authored analytic toy model.
* OV-56 (2026-10-10) is an assistant-authored identifiability derivation
  and simulated-power note.
* Neither note records an administered LLM experiment.
* The latent labels below are alternative model interpretations, not
  authenticated descriptions of the ConsistencyBench data-generating process.

For n labelled agents, a success pattern is a subset s of Fin n.
The shared-gate model assigns

  q * 1[s = empty] + (1-q) * p^|s| * (1-p)^(n-|s|).

The latent-difficulty model assigns probability q to an item of difficulty
zero and probability 1-q to an item with per-agent correctness p. Its
conditional-independence mixture gives the same weight to every labelled
pattern.

This module closes the earlier pointwise-only gap by proving:
1. the Bernoulli pattern weights sum to one over the complete finite
   powerset;
2. both mixture descriptions are nonnegative and normalized when p,q are
   valid Bernoulli parameters;
3. the two latent labels map to exactly the same finite observable
   distribution, so this observation map is not injective.

Lean verifies these formal statements under the stated assumptions. It does
not establish that either latent interpretation generated real LLM behavior,
nor does it authenticate the archive inputs or answer-key semantics.
-/

namespace HsHVerification.OrsonFinitePatternDistribution

/-- All labelled success/failure patterns for n agents. -/
def patternSpace (n : ℕ) : Finset (Finset (Fin n)) :=
  (Finset.univ : Finset (Fin n)).powerset

/-- Product-Bernoulli weight of one labelled success pattern. -/
def bernoulliPatternWeight (n : ℕ) (p : ℝ)
    (s : Finset (Fin n)) : ℝ :=
  p ^ s.card * (1 - p) ^ (n - s.card)

/-- Shared all-or-nothing record-reliability gate. -/
def sharedGatePatternWeight (n : ℕ) (p q : ℝ)
    (s : Finset (Fin n)) : ℝ :=
  q * (if s = ∅ then 1 else 0) +
    (1 - q) * bernoulliPatternWeight n p s

/-- Latent item-difficulty mixture: difficulty zero with probability q,
and per-agent correctness p with probability 1-q. -/
def latentDifficultyPatternWeight (n : ℕ) (p q : ℝ)
    (s : Finset (Fin n)) : ℝ :=
  q * ((0 : ℝ) ^ s.card * (1 : ℝ) ^ (n - s.card)) +
    (1 - q) * bernoulliPatternWeight n p s

/-- A zero-difficulty item permits only the all-failure pattern. -/
lemma zeroDifficultySubsetPattern (n : ℕ) (s : Finset (Fin n)) :
    (0 : ℝ) ^ s.card * (1 : ℝ) ^ (n - s.card) =
      (if s = ∅ then 1 else 0) := by
  by_cases hs : s = ∅
  · subst s
    simp
  · have hcard : s.card ≠ 0 := by
      intro hc
      exact hs (Finset.card_eq_zero.mp hc)
    simp [hs, hcard]

/-- The two latent descriptions assign the same weight to each labelled
success pattern. -/
theorem sharedGate_eq_latentDifficulty_pattern
    (n : ℕ) (p q : ℝ) (s : Finset (Fin n)) :
    sharedGatePatternWeight n p q s =
      latentDifficultyPatternWeight n p q s := by
  unfold sharedGatePatternWeight latentDifficultyPatternWeight
  rw [zeroDifficultySubsetPattern]

/-- The product-Bernoulli weights normalize over every subset of Fin n.
This is the finite binomial theorem, expressed on labelled patterns. -/
theorem bernoulliPatternWeights_normalize (n : ℕ) (p : ℝ) :
    (∑ s ∈ patternSpace n, bernoulliPatternWeight n p s) = 1 := by
  classical
  change
    (∑ s ∈ (Finset.univ : Finset (Fin n)).powerset,
      p ^ s.card * (1 - p) ^ (n - s.card)) = 1
  rw [Finset.sum_powerset_apply_card]
  have hbin := (add_pow p (1 - p) n).symm
  calc
    (∑ k ∈ Finset.range (n + 1),
        (n.choose k : ℝ) * p ^ k * (1 - p) ^ (n - k)) =
        (p + (1 - p)) ^ n := by
          simpa [mul_comm, mul_left_comm, mul_assoc] using hbin
    _ = 1 := by ring

/-- The shared-gate pattern weights normalize for every real p,q; the
probability interpretation additionally requires nonnegativity. -/
theorem sharedGatePatternWeights_normalize (n : ℕ) (p q : ℝ) :
    (∑ s ∈ patternSpace n, sharedGatePatternWeight n p q s) = 1 := by
  classical
  unfold sharedGatePatternWeight
  rw [Finset.sum_add_distrib]
  have hdelta :
      (∑ s ∈ patternSpace n, q * (if s = ∅ then 1 else 0)) = q := by
    simp [patternSpace]
  have hbernoulli :
      (∑ s ∈ patternSpace n,
        (1 - q) * bernoulliPatternWeight n p s) = 1 - q := by
    rw [← Finset.mul_sum]
    rw [bernoulliPatternWeights_normalize]
    ring
  rw [hdelta, hbernoulli]
  ring

/-- The latent-difficulty pattern weights normalize because they are
pointwise identical to the shared-gate weights. -/
theorem latentDifficultyPatternWeights_normalize
    (n : ℕ) (p q : ℝ) :
    (∑ s ∈ patternSpace n, latentDifficultyPatternWeight n p q s) = 1 := by
  classical
  calc
    (∑ s ∈ patternSpace n, latentDifficultyPatternWeight n p q s) =
        (∑ s ∈ patternSpace n, sharedGatePatternWeight n p q s) := by
          apply Finset.sum_congr rfl
          intro s hs
          exact (sharedGate_eq_latentDifficulty_pattern n p q s).symm
    _ = 1 := sharedGatePatternWeights_normalize n p q

/-- Nonnegativity of one product-Bernoulli pattern weight on the valid
Bernoulli parameter domain. -/
theorem bernoulliPatternWeight_nonneg
    (n : ℕ) (p : ℝ) (s : Finset (Fin n))
    (hp0 : 0 ≤ p) (hp1 : p ≤ 1) :
    0 ≤ bernoulliPatternWeight n p s := by
  unfold bernoulliPatternWeight
  have h1p : 0 ≤ 1 - p := by linarith
  positivity

/-- The shared-gate weights are nonnegative when p,q are valid Bernoulli
parameters. -/
theorem sharedGatePatternWeight_nonneg
    (n : ℕ) (p q : ℝ) (s : Finset (Fin n))
    (hp0 : 0 ≤ p) (hp1 : p ≤ 1)
    (hq0 : 0 ≤ q) (hq1 : q ≤ 1) :
    0 ≤ sharedGatePatternWeight n p q s := by
  unfold sharedGatePatternWeight
  have h1q : 0 ≤ 1 - q := by linarith
  have hdelta : 0 ≤ (if s = ∅ then (1 : ℝ) else 0) := by
    split <;> norm_num
  exact add_nonneg
    (mul_nonneg hq0 hdelta)
    (mul_nonneg h1q
      (bernoulliPatternWeight_nonneg n p s hp0 hp1))

/-- The latent-difficulty weights are nonnegative on the same parameter
domain, by pointwise equivalence. -/
theorem latentDifficultyPatternWeight_nonneg
    (n : ℕ) (p q : ℝ) (s : Finset (Fin n))
    (hp0 : 0 ≤ p) (hp1 : p ≤ 1)
    (hq0 : 0 ≤ q) (hq1 : q ≤ 1) :
    0 ≤ latentDifficultyPatternWeight n p q s := by
  rw [← sharedGate_eq_latentDifficulty_pattern n p q s]
  exact sharedGatePatternWeight_nonneg n p q s hp0 hp1 hq0 hq1

/-- A finite weight system is a probability distribution on S when all
weights are nonnegative and their finite sum is one. -/
def IsFiniteProbabilityWeight {α : Type*}
    (S : Finset α) (w : α → ℝ) : Prop :=
  (∀ s ∈ S, 0 ≤ w s) ∧ (∑ s ∈ S, w s = 1)

/-- The shared-gate construction is a valid finite probability weight on
the complete labelled pattern space when p,q ∈ [0,1]. -/
theorem sharedGate_is_finite_probability_weight
    (n : ℕ) (p q : ℝ)
    (hp0 : 0 ≤ p) (hp1 : p ≤ 1)
    (hq0 : 0 ≤ q) (hq1 : q ≤ 1) :
    IsFiniteProbabilityWeight (patternSpace n)
      (sharedGatePatternWeight n p q) := by
  constructor
  · intro s hs
    exact sharedGatePatternWeight_nonneg n p q s hp0 hp1 hq0 hq1
  · exact sharedGatePatternWeights_normalize n p q

/-- The latent-difficulty construction is a valid finite probability
weight on the same labelled pattern space. -/
theorem latentDifficulty_is_finite_probability_weight
    (n : ℕ) (p q : ℝ)
    (hp0 : 0 ≤ p) (hp1 : p ≤ 1)
    (hq0 : 0 ≤ q) (hq1 : q ≤ 1) :
    IsFiniteProbabilityWeight (patternSpace n)
      (latentDifficultyPatternWeight n p q) := by
  constructor
  · intro s hs
    exact latentDifficultyPatternWeight_nonneg n p q s hp0 hp1 hq0 hq1
  · exact latentDifficultyPatternWeights_normalize n p q

/-- Two distinct latent labels: shared record reliability versus latent
item difficulty. These labels encode alternative interpretations, not
empirically authenticated mechanisms. -/
inductive LatentMechanism where
  | sharedRecordGate
  | latentItemDifficulty
  deriving DecidableEq

/-- Observation map from a latent mechanism to its finite pattern-weight
function. -/
def observationMap (n : ℕ) (p q : ℝ) :
    LatentMechanism → Finset (Fin n) → ℝ
  | .sharedRecordGate => sharedGatePatternWeight n p q
  | .latentItemDifficulty => latentDifficultyPatternWeight n p q

/-- The observation map returns the same complete pattern-weight function
for both latent interpretations. -/
theorem observationMap_same
    (n : ℕ) (p q : ℝ) :
    observationMap n p q .sharedRecordGate =
      observationMap n p q .latentItemDifficulty := by
  funext s
  exact sharedGate_eq_latentDifficulty_pattern n p q s

/-- The latent-mechanism-to-observable-distribution map is not injective:
the two distinct model labels cannot be recovered from passive pattern
frequencies alone within this model family. -/
theorem observationMap_not_injective
    (n : ℕ) (p q : ℝ) :
    ¬ Function.Injective (observationMap n p q) := by
  intro hinj
  have h := hinj (observationMap_same n p q)
  exact (by decide : LatentMechanism.sharedRecordGate ≠
    LatentMechanism.latentItemDifficulty) h

#print axioms bernoulliPatternWeights_normalize
#print axioms sharedGatePatternWeights_normalize
#print axioms latentDifficultyPatternWeights_normalize
#print axioms sharedGatePatternWeight_nonneg
#print axioms sharedGate_is_finite_probability_weight
#print axioms latentDifficulty_is_finite_probability_weight
#print axioms observationMap_same
#print axioms observationMap_not_injective

end HsHVerification.OrsonFinitePatternDistribution
