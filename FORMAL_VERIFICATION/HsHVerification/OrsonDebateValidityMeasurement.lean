import Mathlib

/-!
# Orson P1: debate accuracy under invalid-response scoring

Primary source:
Leonardo Ferreira, Gardenia Liu, and Kaden Zheng, "Beyond Symmetric Agents:
Cognitive Diversity and Multi-Agent Debate in Small Language Models",
arXiv:2609.35875 (2026-09-26), §§3.1, 4.2, 5.5, Appendix F.

Source-reported measurement facts:
- Debate and self-consistency controls are paired at equal generation counts.
- Empty final-round responses caused by transcript/context overflow are scored
  incorrect by the study's task scorer.
- Five long-form models had 16-32K serving windows; some final-round cells
  were 93-100% empty.
- The temperature-matched debate-vs-sampling delta moved from -1.84 pp as run,
  to -0.30 pp after excluding bound cells, to -0.06 pp after affected cells
  were rerun at 131K (276 paired cells).

This module formalizes an assistant-derived measurement abstraction:
observed accuracy = valid-response rate * accuracy conditional on a valid
response, when invalid responses are scored incorrect. It proves that unequal
validity rates can reverse a ranking of conditional accuracy. The numerical
profiles below are mathematical witnesses, not values from the paper.

The module does NOT reproduce the paper's data, estimate its response-validity
rates, prove that its serving artifacts caused the full observed effect, or
establish a universal result about debate. It is conditional arithmetic only.
-/

namespace HsHVerification
namespace OrsonDebateValidityMeasurement

/-- A condition's response-validity rate and accuracy among valid responses. -/
structure OutcomeProfile where
  validRate : ℝ
  conditionalAccuracy : ℝ

/-- Both components are interpreted as probabilities. -/
def admissible (p : OutcomeProfile) : Prop :=
  0 ≤ p.validRate ∧ p.validRate ≤ 1 ∧
  0 ≤ p.conditionalAccuracy ∧ p.conditionalAccuracy ≤ 1

/-- Scored accuracy when invalid/empty responses count as incorrect. -/
def observedAccuracy (p : OutcomeProfile) : ℝ :=
  p.validRate * p.conditionalAccuracy

theorem observed_accuracy_bounded
    (p : OutcomeProfile) (hp : admissible p) :
    0 ≤ observedAccuracy p ∧ observedAccuracy p ≤ 1 := by
  rcases hp with ⟨hv0, hv1, ha0, ha1⟩
  constructor
  · unfold observedAccuracy
    exact mul_nonneg hv0 ha0
  · unfold observedAccuracy
    calc
      p.validRate * p.conditionalAccuracy ≤ 1 * 1 :=
        mul_le_mul hv1 ha1 ha0 (by norm_num)
      _ = 1 := by norm_num

/-- Exact decomposition of an observed accuracy difference into a
    conditional-accuracy component and a response-validity component. -/
theorem observed_accuracy_difference_decomposition
    (debate sampling : OutcomeProfile) :
    observedAccuracy debate - observedAccuracy sampling =
      debate.validRate *
        (debate.conditionalAccuracy - sampling.conditionalAccuracy) +
      sampling.conditionalAccuracy *
        (debate.validRate - sampling.validRate) := by
  simp [observedAccuracy]
  ring

/-- If validity rates are equal and positive, the observed-accuracy ranking
    preserves the conditional-accuracy ranking. -/
theorem equal_validity_preserves_order
    (debate sampling : OutcomeProfile)
    (hvalid : debate.validRate = sampling.validRate)
    (hvalidPos : 0 < debate.validRate)
    (haccuracy : sampling.conditionalAccuracy < debate.conditionalAccuracy) :
    observedAccuracy sampling < observedAccuracy debate := by
  unfold observedAccuracy
  calc
    sampling.validRate * sampling.conditionalAccuracy <
        sampling.validRate * debate.conditionalAccuracy :=
      mul_lt_mul_of_pos_left haccuracy (by simpa [hvalid] using hvalidPos)
    _ = debate.validRate * debate.conditionalAccuracy := by rw [hvalid]

/-- A lower response-validity rate can overturn a higher conditional
    accuracy when its penalty exceeds the conditional-accuracy gain.
    This is a conditional algebraic statement; no numerical witness is
    supplied. -/
theorem lower_validity_can_overturn_higher_conditional_accuracy
    (debate sampling : OutcomeProfile)
    (hAccuracy : sampling.conditionalAccuracy < debate.conditionalAccuracy)
    (hValidity : debate.validRate < sampling.validRate)
    (hPenalty :
      debate.validRate *
          (debate.conditionalAccuracy - sampling.conditionalAccuracy) <
        sampling.conditionalAccuracy *
          (sampling.validRate - debate.validRate)) :
    observedAccuracy debate < observedAccuracy sampling := by
  apply (sub_lt_zero).mp
  rw [observed_accuracy_difference_decomposition]
  nlinarith

#print axioms observed_accuracy_bounded
#print axioms observed_accuracy_difference_decomposition
#print axioms equal_validity_preserves_order
#print axioms lower_validity_can_overturn_higher_conditional_accuracy

end OrsonDebateValidityMeasurement
end HsHVerification
