/-!
# Orson VEY-032: answer-paired judge contrasts and identifiability

External comparator sources (source depth checked 2026-11-07):

- Sriram Selvam and Anneswa Ghosh, "Eval-Pair Matrix: Answer-Paired Meta-Evaluation
  of LLM Judges for Grounded RAG," in *Proceedings of the 1st Workshop on Grounding
  Language Models: Learning Faithfully and Efficiently (GroundLM 2026)*, pp. 550–565,
  Budapest, Association for Computational Linguistics, October 2026. ACL Anthology
  2026.groundlm-1.43; DOI 10.18653/2026.groundlm-1.43. The full 16-page proceedings
  PDF was read. The study reports 300 core records, 275 validated records, 897
  labeled outputs, and 2,683 verdicts in a crossed 3×3 matrix (GPT-5.4, Grok 4.3,
  Gemini 3.5 Flash). The primary same-answer paired recall contrast is −0.5 pp
  (95% cluster-bootstrap CI [−2.7,+1.7]); this interval includes zero but does not
  establish equivalence. A single GPT-5.4 label-evaluator assigns behavior/adoption
  labels from perturbation metadata and generator answers; the GPT-5.4 endpoint is
  also one of the matrix judges, whose prompt is blind to that metadata. This is a
  shared endpoint across distinct labeler/judge roles, not an independent human
  reference. The paper acknowledges the single label-evaluator; its targeted
  single-adjudicator review covers 88 of 153 cases and is not a double-annotated
  population estimate. The −4.3 pp avoided-claim flag contrast is not a false-alarm
  rate because the judge task is any source-relative error.

- Elias Hossain, Niloofar Yousefi, and Ser-Nam Lim, "Agreement Overstates Evidence:
  Error Dependence in LLM Judge Consensus," arXiv:2609.22512 (2026-09-18).
  The full PDF was not independently retrieved here; the author-maintained project
  page and public code README were inspected. The primary ten-judge open-weight
  bank reports mean pairwise error correlation 0.206 and effective size 3.51;
  the author page reports 0.56 error correlation for its frontier bank and up to
  28% significance-verdict changes under item-level dependence. Controlled
  co-failure regimes identify possible mechanisms but do not estimate natural
  prevalence. The authors report no universal best filter.

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
