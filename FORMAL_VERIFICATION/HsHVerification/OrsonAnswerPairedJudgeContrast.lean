import Mathlib

/-!
# Orson VEY-032: answer-paired judge contrasts and identifiability

External comparator sources:
- Sriram Selvam and Anneswa Ghosh, "Eval-Pair Matrix: Answer-Paired
  Meta-Evaluation of LLM Judges for Grounded RAG", arXiv:2607.10626
  (first posted 2026-07-12). This run inspected the arXiv abstract,
  SciSpace bibliographic record, and structured method/result/limitation
  extraction; the full PDF was not independently retrieved here.
- Elias Hossain, Niloofar Yousefi, and Ser-Nam Lim, "Agreement Overstates
  Evidence: Error Dependence in LLM Judge Consensus", arXiv:2609.22512
  (2026-09-18). The abstract and structured extraction describe a ten-judge
  same-item error-correlation study.

This module formalizes an assistant-derived additive measurement abstraction:
a score contains an answer-specific component plus a judge-specific component.
Pairing judges on the exact same answer cancels the common answer term;
unpaired diagonal/off-diagonal comparisons retain the difference in answer
composition. This is an algebraic explanation of why answer-pairing can improve
identifiability, not a transcription of either paper's empirical estimator.

The singleton-pair theorem formalizes the combinatorial fact that one judge
channel supplies no distinct judge pairs. It does not establish statistical
independence, error covariance, evaluator validity, or any empirical property
of ConsistencyBench. Lean checks only these formalized statements.
-/

namespace HsHVerification
namespace OrsonAnswerPairedJudgeContrast

/-- Same-answer contrast under an additive answer-plus-judge score model. -/
def pairedContrast
    (answerEffect matchingJudgeEffect nonmatchingJudgeMean : ℝ) : ℝ :=
  (answerEffect + matchingJudgeEffect) -
    (answerEffect + nonmatchingJudgeMean)

/-- Diagonal/off-diagonal contrast when the answer populations may differ. -/
def unpairedContrast
    (matchingAnswerMean nonmatchingAnswerMean
      matchingJudgeEffect nonmatchingJudgeMean : ℝ) : ℝ :=
  (matchingAnswerMean + matchingJudgeEffect) -
    (nonmatchingAnswerMean + nonmatchingJudgeMean)

/-- Pairing on the exact same answer cancels its common additive component. -/
theorem paired_contrast_cancels_answer_component
    (answerEffect matchingJudgeEffect nonmatchingJudgeMean : ℝ) :
    pairedContrast answerEffect matchingJudgeEffect nonmatchingJudgeMean =
      matchingJudgeEffect - nonmatchingJudgeMean := by
  unfold pairedContrast
  ring

/-- An unpaired contrast contains both the judge contrast and the
answer-composition contrast. -/
theorem unpaired_contrast_decomposes
    (matchingAnswerMean nonmatchingAnswerMean
      matchingJudgeEffect nonmatchingJudgeMean : ℝ) :
    unpairedContrast matchingAnswerMean nonmatchingAnswerMean
      matchingJudgeEffect nonmatchingJudgeMean =
      (matchingJudgeEffect - nonmatchingJudgeMean) +
        (matchingAnswerMean - nonmatchingAnswerMean) := by
  unfold unpairedContrast
  ring

/-- Under this additive model, an unpaired contrast equals the judge effect
alone if and only if the two answer populations have equal means. -/
theorem unpaired_contrast_identifies_judge_effect_iff_equal_answer_means
    (matchingAnswerMean nonmatchingAnswerMean
      matchingJudgeEffect nonmatchingJudgeMean : ℝ) :
    unpairedContrast matchingAnswerMean nonmatchingAnswerMean
      matchingJudgeEffect nonmatchingJudgeMean =
      matchingJudgeEffect - nonmatchingJudgeMean ↔
      matchingAnswerMean = nonmatchingAnswerMean := by
  unfold unpairedContrast
  constructor
  · intro h
    linarith
  · intro h
    rw [h]
    ring

/-- Number of unordered pairs among a panel of distinct judge channels. -/
def distinctJudgePairCount (judgeCount : ℕ) : ℕ :=
  Nat.choose judgeCount 2

/-- A single shared judge channel yields no distinct inter-judge pairs. -/
theorem one_judge_has_zero_distinct_pairs :
    distinctJudgePairCount 1 = 0 := by
  norm_num [distinctJudgePairCount]

/-- Two distinct judge channels create exactly one inter-judge pair. -/
theorem two_judges_have_one_distinct_pair :
    distinctJudgePairCount 2 = 1 := by
  norm_num [distinctJudgePairCount]

#print axioms paired_contrast_cancels_answer_component
#print axioms unpaired_contrast_decomposes
#print axioms unpaired_contrast_identifies_judge_effect_iff_equal_answer_means
#print axioms one_judge_has_zero_distinct_pairs
#print axioms two_judges_have_one_distinct_pair

end OrsonAnswerPairedJudgeContrast
end HsHVerification
