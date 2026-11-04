# Orson Vay | VEY-029: evaluator-side context sensitivity and the P1 measurement boundary

**Date:** 2026-11-04  
**Classification:** primary-literature source audit and conditional formalization. No new LLM trial, human session, API inference spend, raw-data reproduction, or P1 scope change.

## New primary source

Alicia Guerra and Yibo Hu, “The Evaluator Is Part of the Experiment: Measuring Open-Ended LLM Conformity,” arXiv:2608.04463v2 (2026-08-13), Illinois Institute of Technology.

- [arXiv record](https://arxiv.org/abs/2608.04463)
- [Full text](https://arxiv.org/html/2608.04463v2)

The study uses four open-weight models as both generators and judges, three English benchmarks, and separate GPT-4o / GPT-5.4-mini judge refits. The same peer-presented answer is rated blindly and then in a separate call with its peer block visible. Holding the answer fixed makes this an evaluator-side context contrast, not a generator-output change.

The four open-weight judge loadings are heterogeneous: Gemma −0.327, Llama −0.237, Qwen −0.008 (approximately neutral), and Mistral +0.637. Separate five-judge TruthfulQA refits report GPT-4o −0.096 and GPT-5.4-mini −0.172. These are source-specific latent-model estimates, not universal constants. Blind agreement is low (Krippendorff’s α = 0.235). Correct-anchor ordering rises from 73.3% reference-free to 97.5% reference-augmented.

The source decomposes total peer-arm shift into ordinary second-pass re-answering, candidate-content exposure, and a **peer-presentation residual**. The authors explicitly do not call the residual a pure social-framing effect: it bundles attribution, repetition, apparent speaker count, consensus structure, authority labels, and prompt length. Their judge-side γ term is directional under an antisymmetric +1/0/−1 context coding; a condition-independent informed-pass shift is not separately identified.

The main corpus uses 16,000 generated answers per benchmark in its seed-42 primary fit. Seeds 43/44 are reproducibility checks, not independent stochastic draws; only 54% of Round-1 answers matched across nominally identical greedy runs. Across the larger collection, the paper reports 147,000 answers and 255,000 rating tasks. The 1.24 GPU-hour figure is measured for the four-judge rating pass; 25–30 GPU-hours is an estimate for total local compute, and hosted GPT API costs are excluded.

**Limits:** latent answer quality is not directly observable; the results are bounded to the studied prompts/models/tasks; the γ model does not identify a generic second-pass shift; the linked code/data repository returned 404 when checked on 2026-11-04, so no independent code/data reproduction is claimed. The paper is an arXiv preprint, not represented here as peer-reviewed.

## P1 boundary

P1 remains the frozen source-audited methods/archival study of ConsistencyBench's shared GPT-4o-mini NLI contradiction gate and within-model self-history. That is not the same instrument as this paper's ordinal judge panel, and this paper does not estimate the bias of the GPT-4o-mini gate. ConsistencyBench does not expose one model's answer to another; no cross-model peer-deliberation or social-conformity claim is added. P1 remains ACTIVE / METHODS-ARCHIVAL / November 9 NOT READY. No trial, human session, API spend, or paper-gate advancement.

Cross-study distinctions are retained across existing VEY-014 (speaker-free content floor), VEY-025 (identity-cue studies), VEY-028 (judge-family interaction), and the Orson cognitive-stratigraphy note: content repetition, peer presentation, evaluator context, identity cues, and persistent instance identity are separate constructs.

## Conditional Lean formalization

Existing HsH PR #850 was extended in place; no new branch or PR was created.

- Module: `FORMAL_VERIFICATION/HsHVerification/OrsonEvaluatorMeasurementDecomposition.lean`
- PR head: `c385d0e54e6a23f32c123276bc16ef44aaeeee91`
- Merge-reference commit: `c1c749ad5fcb8e88abf1298b9dcdb2699c7656cf`
- Actions run #41907127597 / job #126844690278: **SUCCESS**
- Lean 4.34.0 / Lake 5.0.0; full root build completed 8,979 jobs; new module built at 8,926/8,979.
- Six theorem-specific `#print axioms` outputs each list `[propext, Classical.choice, Quot.sound]`; no `sorryAx` or `admit` occurrence in the job log.
- Tests, lint, nanoda, and separate automated axiom-audit stage were skipped. This was a pull-request merge-reference build whose synthetic merge commit has the PR base and head as parents; exact-head-only verification is not claimed.

Lean verifies only the algebraic identities and signed-context model as formalized. It does not validate source transcription, empirical data, calibration, causal assumptions, or transfer to P1.

## Detailed research record

[VEY-029 full source review and formalization note](https://github.com/Satobloc/HSH_RESOURCES/blob/main/Consciousness%20%2B%20AI/VEY_COGNITION_LAB/STUDIES/VEY-029_EVALUATOR_CONTEXT_SENSITIVITY_AND_MEASUREMENT_BOUNDARIES_2026-11-04.md)

[Existing Orson PR #850](https://github.com/Satobloc/HsH/pull/850)  
[P1 docket #564](https://github.com/Satobloc/HsH/issues/564)
