import Mathlib

/-!
# Counterexample to the strict-outranker step in a type-blindness argument

External source audited:
O. Abeke, R. Mohammad, H. Mahmoud, "Beyond similarity retrieval:
governance fidelity, consistency, and minimality in long-term conversational
memory", International Journal of Data Science and Analytics 22, article 328
(2026), DOI 10.1007/s41060-026-01290-8, Theorem 1 and its proof.

The paper's type-blindness assumption says that for every δ > 0 there is a
noise item whose score is greater than the governing score minus δ. Its
proof then selects δ below a presumed positive gap to the noise-score
supremum and concludes that some noise item strictly outranks the governing
item.

The sequence below is a counterexample to that inference: its scores approach
the governing score from below, satisfying the stated approximation condition,
but no noise item ever strictly outranks the governing item.

This formalizes only the real-number counterexample. It does not prove that
any deployed retriever has this score sequence, does not refute a stronger
theorem that separately assumes a positive strict-outranking probability, and
does not assess the paper's empirical benchmark.
-/

namespace HsHVerification.OrsonSimilarityTypeBlindnessCounterexample

def governingScore : ℝ := 1

/-- Noise scores approach the governing score from below. -/
def noiseScore (n : ℕ) : ℝ := 1 - 1 / ((n : ℝ) + 1)

/-- Every noise score remains strictly below the governing score. -/
theorem noise_score_below_governing (n : ℕ) :
    noiseScore n < governingScore := by
  unfold noiseScore governingScore
  have hpos : (0 : ℝ) < 1 / ((n : ℝ) + 1) := by positivity
  linarith

/-- For every positive tolerance, some noise score lies within that
tolerance below the governing score. -/
theorem arbitrarily_close_from_below (δ : ℝ) (hδ : 0 < δ) :
    ∃ n : ℕ, noiseScore n > governingScore - δ := by
  obtain ⟨n, hn⟩ := exists_nat_one_div_lt hδ
  refine ⟨n, ?_⟩
  unfold noiseScore governingScore
  linarith

/-- The stated approximation condition can hold while no strict outranker
exists; hence that condition alone does not justify the proof step. -/
theorem type_blindness_does_not_force_strict_outranker :
    (∀ δ : ℝ, 0 < δ → ∃ n : ℕ,
      noiseScore n > governingScore - δ) ∧
    (∀ n : ℕ, noiseScore n < governingScore) := by
  constructor
  · intro δ hδ
    exact arbitrarily_close_from_below δ hδ
  · exact noise_score_below_governing

#eval governingScore
#eval noiseScore 0
#eval noiseScore 9

#print axioms noise_score_below_governing
#print axioms arbitrarily_close_from_below
#print axioms type_blindness_does_not_force_strict_outranker

end HsHVerification.OrsonSimilarityTypeBlindnessCounterexample
