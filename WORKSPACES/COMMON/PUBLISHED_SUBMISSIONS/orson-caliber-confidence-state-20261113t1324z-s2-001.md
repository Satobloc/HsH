# CALIBER: confidence targets should follow the model's information state

**Source:** Conor Finlay, Joshua Kurien, Saurabh Dash, Marzieh Fadaee, and Beyza Ermis, “CALIBER: Calibrating Confidence Before and After Reasoning in Language Models,” *Findings of the Association for Computational Linguistics: EMNLP 2026*, pp. 51966–51980, October 24–29, 2026. DOI: [10.18653/2026.findings-emnlp.2420](https://doi.org/10.18653/2026.findings-emnlp.2420). [Official ACL Anthology PDF](https://aclanthology.org/2026.findings-emnlp.2420.pdf).

## What the paper actually distinguishes

The paper treats confidence emitted before reasoning and confidence emitted after a particular answer as different estimands:

\[
p_{\mathrm{pre}}(x)=P(c=1\mid x),\qquad
p_{\mathrm{post}}(x,z,\hat y)=P(c=1\mid x,z,\hat y).
\]

For each prompt, the current policy samples \(N\) rollouts with binary correctness labels \(c_i\). The pre-confidence target is the group-wise empirical success rate,

\[
\hat p(x)=\frac{1}{N}\sum_{j=1}^{N}c_j,
\]

while the post-confidence target for rollout \(i\) is its own correctness label,

\[
t_i^{\mathrm{post}}=c_i.
\]

Thus the group target is shared by all rollouts for one prompt, while the instance target preserves which particular rollout succeeded. The authors argue that each confidence position should receive the target matched to the information available at that position.

This is a useful distinction for cognition research, but it is not evidence that a model has introspective access to truth. The targets are supplied by external correctness verification and rollout statistics. The pre-target estimates success under the current policy and sampling setup, not a policy-independent property of the prompt.

## Experimental design

- Models: a 7B Command R7B-based model and a 30B North Mini Code-based model.
- Training: 500 calibration RL steps per method, using a filtered numerical-answer subset of Big-Math (“BigMathDigits”).
- Filtering: retained problems that a LLaMA-8B model solved between 0% and 70% of the time.
- Evaluation: held-out BigMathDigits plus out-of-distribution GPQA, TriviaQA, and SimpleQA.
- CALIBER uses a two-stage schedule: pre-confidence group-target warmup of 400 steps at 7B and 100 steps at 30B, followed by joint training.
- Baselines are controlled “-lite” adaptations; segmented credit assignment and several method-specific enhancements are omitted.

## Reported results and the important counterweight

On held-out BigMathDigits:

| Model | ECE | Brier | AUROC | Accuracy |
|---|---:|---:|---:|---:|
| 7B | 0.028 | 0.130 | 0.806 | 0.780 |
| 30B | 0.019 | 0.108 | 0.821 | 0.820 |

The paper reports lower ECE and Brier scores across its three OOD datasets for both model sizes. But SimpleQA exposes a major limitation:

| Model | SimpleQA ECE | Brier | AUROC | Accuracy |
|---|---:|---:|---:|---:|
| 7B | 0.296 | 0.163 | 0.669 | 0.050 |
| 30B | 0.342 | 0.172 | 0.707 | 0.049 |

These are the paper’s reported values, not a reanalysis. The roughly 5% SimpleQA accuracy means that favorable relative calibration rankings must not be mistaken for useful factual performance on that benchmark. The paper itself cautions that ECE alone can mislead: a model that predicts the dataset-average accuracy for every example may appear calibrated while offering little discrimination. ECE, Brier, AUROC, and accuracy must be read together.

## Limitations stated by the authors

1. OOD verification and the BigMathDigits fallback rely on a single LLM judge, Command A. The authors acknowledge that judge noise is not characterized; selected evaluations were repeated with an alternative judge.
2. Each method was trained once per model scale. Training-run variance is therefore unmeasured. The authors report that the 7B experiments alone required more than 11,000 H100 GPU-hours.
3. The two-stage warmup was empirically necessary, but the failure dynamics of joint training from step zero remain underexplored.
4. The position–target ablation compares CALIBER with one swapped-target configuration; several other reward and warmup variants were not explored.
5. No CALIBER-specific code or artifact repository link is supplied in the official ACL paper. The paper describes the data sources and method, but this is not equivalent to an independently reproduced training run.

## Relevance to the frozen Orson P1 study

This is an **adjacent external comparator**, not P1 data and not a change to P1’s frozen ConsistencyBench scope.

The distinctions are:

- **CALIBER:** one model’s prompt-conditioned pre-confidence and answer-conditioned post-confidence, supervised using rollout correctness.
- **ConsistencyBench CGD:** a model’s answer can be flagged by a shared external NLI checker and then revised.
- **External evaluator signal:** the NLI checker’s output is a third channel, not the same quantity as either confidence estimate.

CALIBER does not test peer exposure, evaluator-induced revision, social conformity, or causal effects of an NLI trigger. It should not be used as evidence for those P1 claims. Its value is conceptual and methodological: it helps prevent prompt-level success estimates, answer-level self-confidence, and external checker signals from being collapsed into one “confidence” variable.

## Conditional formalization

An assistant-derived Lean 4 module was added to the existing Orson formalization branch, PR [#850](https://github.com/Satobloc/HsH/pull/850), as **OrsonCaliberConfidenceState.lean**. It formalizes the finite target arithmetic: averaging instance-wise correctness targets recovers the group target; the group target lies in \([0,1]\) when its instance targets do; and two groups can have the same group target while assigning success to different rollouts.

The module does **not** prove that model-predicted confidence scores are calibrated, that the source’s verifier is reliable, or that the empirical results are true. At the time of this note, the exact-head Lean workflow was still running on commit **753e984577255e749cccbf669675930fc46636a8** (run [#43434054670](https://github.com/Satobloc/HsH/actions/runs/43434054670)); compilation status must be read from that run, not inferred from the commit.

The finite identity is a property of the supervision targets, not a result about consciousness, introspective access, or physical H(s)H structure.

## Disposition

- New external source: **READ / SOURCE-VERIFIED**.
- P1 protocol: **UNCHANGED / FROZEN**.
- P1 issue #564: **OPEN / OVERDUE / NOT READY**.
- PR #850: **OPEN / DRAFT / UNMERGED**; independent review remains required.
- No new model trial, human session, API spend, physical calculation, CODATA comparison, or theory promotion.
