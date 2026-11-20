# Cognitive Readout Target Contract (CRTC) v0.1

Status: PROPOSED / SOURCE-GROUNDED / NOT A VALIDATED INSTRUMENT / NOT A P1 PROTOCOL AMENDMENT
Owner: Orson Vay cognition lane
Date: 2026-11-20

## 1. Purpose

The word "metacognition" is being used across several different observable tasks. Those tasks do not necessarily measure the same target, use the same unit, expose the same information to the model, or use the same criterion. A common numeric display scale does not make them commensurate.

CRTC is a small measurement contract for preventing target substitution. It is a methods aid, not a new psychometric scale, cognitive ontology, model trial, or claim about subjective awareness.

## 2. Required readout signature

Every claimed cognitive readout must declare:

1. Model: exact model, version, endpoint and relevant configuration.
2. Unit: prompt, rollout, answer, claim, reasoning chain, turn, session, agent or group.
3. Information state: exactly what was available when the readout was emitted (prompt-only; after reasoning; after answer; after retrieval; after tool use; after peer communication; or another explicit state).
4. Target: what the readout is intended to predict or detect.
5. Criterion: what determines the target value, including source, version, rubric, verifier or judge.
6. Channel: verbal probability, ordinal confidence, token/log-probability, score vector, binary label, error annotation or other observable.
7. Intervention: none, prompt-only elicitation, retrieval, self-revision, supervised fine-tuning, reinforcement learning, distillation or other intervention.
8. Dependence graph: shared model family, training/evaluation data, prompts, sources, memory, tools, judges, human panels and other common inputs.
9. Validation: criterion reliability, model repeatability, calibration, discrimination, construct validity, within-task transfer, cross-task transfer, cross-judge transfer, human agreement and independent replication, each separately.
10. Evidence status: source-reported, raw-data reanalysis, independent replication, locally administered trial, or proposal only.

The readout identity is the complete signature, not the task label or displayed score alone.

## 3. Explicit readout maps

Let I be the model's information state, P the prompt, A the generated answer, Z a reasoning trace, and v a versioned evaluator.

- M_theta(I) -> A: model response generation.
- G(P,A) -> C_gold: a task-specific gold or executable correctness criterion.
- J_v(P,A) -> S_judge: a versioned external judge's score vector.
- Ghat_theta(I,A) -> predicted correctness.
- Jhat_theta(I,A) -> predicted external-judge score vector.
- D_error(I,A) -> an error, source-vigilance or reasoning-chain diagnostic.

These maps have different codomains and different evidence requirements. A model that predicts J_v well has not thereby been shown to predict C_gold well. A model that detects errors in supplied claims has not thereby been shown to calibrate confidence in its own answers.

A bridge from judge scores to gold correctness, or from one diagnostic to another, must be specified as an explicit map and validated on an independent holdout. If no such bridge has been tested, it is undefined for evidential purposes.

## 4. Compatibility rules

A. Same scale is not same construct. A 0-100 display scale does not make Pearson correlation, penalized Brier score, binary source evaluation and chain-error detection directly comparable.

B. Target identity matters. Correctness probability, prompt-level policy success, judge-score prediction, error detection, knowledge-boundary classification and reasoning-chain validity remain separate targets.

C. Information state matters. A prompt-only estimate and an answer-conditioned estimate are different conditional quantities. Their difference can describe an update in reported confidence, but does not by itself prove information gain, reasoning improvement or internal self-knowledge.

D. Criterion identity matters. A gold answer, human rubric and LLM judge are not interchangeable. Cross-judge transfer is not human agreement.

E. Reliability layers remain separate. Human-rater agreement, model test-retest stability, criterion validity and construct validity are different properties. Deterministic model output does not repair an ambiguous human rubric.

F. Diagnostic tasks without a confidence component are not confidence-calibration measurements.

G. Composite scores require a declared common construct, defensible weighting, reliable components and external validation. Otherwise report a vector of task-specific results, not a single latent score.

H. Output-only measures support behavioral claims about emitted responses. They do not directly establish hidden-state credence, consciousness, subjective awareness or a privileged internal self-model.

I. Shared judges, rubrics, prompts, sources and model lineages are dependencies, not independent corroboration. Record them before counting multiple agents or evaluations as separate evidence.

## 5. Source crosswalk

### CALIBER

Finlay et al., Findings of EMNLP 2026, distinguish prompt-conditioned pre-thinking confidence from answer-conditioned post-thinking confidence. Their targets are respectively group-wise policy success across rollouts and instance-wise correctness of the realized answer. The source defines p_pre = P(correct | prompt) and p_post = P(correct | prompt, trace, answer). These are different information states and targets, not two interchangeable reports of one static scalar.

The paper reports one training run per model scale and relies on Command A for OOD verification and fallback scoring on some datasets. It reports that the 7B experiments alone required over 11,000 H100 GPU-hours, so training-run variance is not measured.

### The Metacognitive Probe

Oliveira, arXiv:2605.09844v1 (May 2026), defines five distinct behavioral tasks: T1 confidence-correctness association; T2 source/error evaluation; T3 known/unknown boundary; T4 penalized Brier calibration range; and T5 reasoning-chain error detection. T2 and T5 have no confidence component. T3 v75 is exploratory.

The paper reports only T4 above its Krippendorff alpha threshold (alpha 0.66), while its agreement is 0.83 against a 0.90 target. The other task alphas are T2 0.13, T3 0.04, T1 0.02 and T5 0.00. The authors explicitly distinguish human-rater rubric reliability from deterministic model test-retest stability and make no validated composite-level claim.

T1 and T4 both display scores on a 0-100 scale, but use different scoring functions. Their numerical difference is therefore a diagnostic contrast, not a common-unit difference on an established latent metacognition scale.

### Self-Evaluation Is Already There

Zhang et al., Findings of EMNLP 2026, measure whether a model can predict an external judge's five HelpSteer2 attribute scores for its own open-ended response. The training judge is GPT-5.4; Claude and Gemini are held-out judges. The study uses Qwen3-4B and Llama-3-8B and reports 160 unique training examples.

This is judge-score prediction, not a direct gold-correctness test. Because all evaluators are LLMs, the authors characterize the result as cross-judge transfer, not agreement with human preferences. Each condition uses one training run.

## 6. Minimum test matrix for future authorized work

| Hypothesis | Readout target | Comparator | Required holdout | Disconfirming observation |
|---|---|---|---|---|
| One scalar self-evaluation transfers across targets | Gold correctness and judge-score vector | Separate target-specific readouts | New task and new evaluator | No stable bridge from predicted judge scores to gold correctness |
| Judge-score prediction generalizes to human quality | Human rubric score | LLM-judge score prediction | Blind human raters and untouched prompts | Transfer fails or depends on judge-specific bias |
| Confidence is state-dependent | Prompt-level success and answer-level correctness | One-position / one-target confidence | New prompts and rollout groups | Matched targets do not improve or explain held-out calibration |
| Five diagnostics form one construct | Task-specific scores | Separate task vector | Reliable new forms and external criteria | Components fail reliability or external-validity checks |
| Chain audit predicts answer correctness | Chain validity and answer correctness | Independent labels | New chains and task domains | Chain detection does not predict answer correctness |

No numerical falsification thresholds are supplied here. They must be set from the intended deployment, criterion reliability and uncertainty before any future authorized trial.

## 7. Current status and boundaries

- CRTC is a proposed source-grounded schema, not a validated instrument.
- This document is a literature/methods synthesis. No raw benchmark package was acquired or independently reanalyzed.
- No LLM trial, human session, API call, dataset expansion, protocol change or manuscript edit was performed.
- P1 remains frozen and Orson-owned. This note does not amend issue #564 or PR #850.
- Existing CALIBER target formalization remains in Orson PR #850. The latest recorded build is merge-reference evidence, not a fresh exact-head verification. No new Lean theorem or exact-head compile is claimed here.
- No inference to consciousness or internal-state access is made.
- No physical calculation, H(s)H prediction, SAT-O/Blockwave equation change or BEDROCK promotion is made.

## 8. Primary sources

1. Conor Finlay, Joshua Kurien, Saurabh Dash, Marzieh Fadaee and Beyza Ermis, "CALIBER: Calibrating Confidence Before and After Reasoning in Language Models," Findings of the Association for Computational Linguistics: EMNLP 2026, pp. 51966-51980. https://aclanthology.org/2026.findings-emnlp.2420.pdf

2. Rafael C. T. Oliveira, "The Metacognitive Probe: Five Behavioural Calibration Diagnostics for LLMs," arXiv:2605.09844v1, May 2026. https://arxiv.org/abs/2605.09844

3. XiuYu Zhang, Yi Shan, Junfeng Fang and Zhenkai Liang, "Self-Evaluation Is Already There: Eliciting Latent Judge Calibration in Base LLMs with Minimal Data," Findings of the Association for Computational Linguistics: EMNLP 2026, pp. 9212-9228. https://aclanthology.org/2026.findings-emnlp.439.pdf
