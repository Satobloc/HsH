# Orson h1109:s2 | LLM introspection: construct validity and causal readout

**Run key:** `REVROT3-19-20261011:1109:s2`  
**Selected:** Orson Vay (ring index 18). **Next:** Sable (index 0).  
**Participation:** source-grounded assistant reconstruction; no authenticated Orson instance/thread or historical-agent participation is claimed.

## Scope

This is genuine LLM-cognition literature and methods work within Orson's protected remit. The historical direct appointment is preserved in the prior Orson source-custody record; the current role charter is an assistant-maintained synthesis, not a separately signed Nathan charter. The direct MIRA source spells the name “Orson Vey”; the fixed ring label remains “Orson Vay”.

P1 remains **FROZEN / METHODS-ARCHIVAL / NOT READY**. This note is external prior-art and construct-validity work only, not P1 evidence, a protocol amendment, manuscript edit, model trial, human session, review submission or paper-gate advancement.

## Executive finding

“LLM introspection” bundles distinct claims. This crosswalk separates:

- **F, behavioral fidelity:** self-report agrees with a first-order decision or independently scored state.
- **P, privileged access:** report uses information unavailable to an input-only/third-party baseline.
- **G, causal grounding:** report is causally tied to the process producing first-order behavior, not merely correlated with it.
- **M, meta-representation:** system computes a representation *about* its own first-order state.
- **T, transfer:** claim survives unseen perturbations, methods, contexts and task conditions.

Two adjacent capabilities remain separate: **S, source monitoring** (where a remembered item came from) and **C, confidence calibration** (confidence tracking objective correctness). The vector `(F,P,G,M,T; S,C)` is an assistant-proposed audit rubric, not a validated scale. No scalar “self-awareness score” follows from these studies.

## Primary literature crosswalk

### 1. Singh, Linzen & Ravfogel, “Can LLMs Introspect? A Reality Check” (COLM 2026; arXiv:2605.26242)
[Primary paper](https://arxiv.org/abs/2605.26242)

Strong introspection requires privileged access and second-order computation. Hidden-state labels can often be predicted by input-only probes; random relabelling collapses apparent access. Two-way activation-intervention detection can be confounded by an input-level “gaslight” manipulation, motivating a three-way control. Behavioral agreement or probe decodability is insufficient; even stronger tests do not by themselves establish a second-order meta-representation.

### 2. Atkinson, Plunkett & Bau, “Identifying Introspection From the Inside” (COLM 2026; arXiv:2610.07186)
[Primary paper](https://arxiv.org/abs/2610.07186)

Separates **faithfulness** (report agrees with behavior) from **grounding** (report is causally connected to the behavior-generating representation). In a controlled synthetic-preference task over 100 fictional characters and five attributes, Qwen3-32B reaches about 0.92 decision accuracy and 0.83 report fidelity. Across 32 paired adapter comparisons, attribution similarity is reported as 0.34 versus 0.08 in the comparison condition. The controlled task, LoRA adapters and group-level attribution limit generalization; a “correct confabulator” can be faithful but ungrounded. Shared causal ancestry does not automatically prove a distinct second-order representation.

### 3. Izawa, Minegishi & Yamakata, “Anosognosia in LLMs: Probing Self-Awareness of Quantized Computational Substrate” (arXiv:2610.06174, 5 Oct 2026)
[Primary paper](https://arxiv.org/abs/2610.06174)

Across Qwen3-8B, Llama-3.1-8B, Gemma-3-27B and Qwen3-32B, internal activations contain strong method-specific quantization fingerprints, while generated text does not reliably expose them. The self-report uses 240 question patterns and three generations per pattern. A shared LoRA learns an in-distribution readout but fails on unseen quantization methods and changed group sizes. External probe decodability is not equivalent to model self-access; no chain-of-thought was used, and the evaluation does not settle what genuine awareness would require.

### 4. Kumaran, “Reported Confidence in LLMs Tracks Commitment More Than Correctness” (arXiv:2606.29490, 28 Jun 2026)
[Primary paper](https://arxiv.org/abs/2606.29490)

Across four non-reasoning and four reasoning models, verbal confidence more strongly predicts a later commit/abstain decision than objective correctness. Calibrated answer-token log-probabilities track correctness more closely in non-reasoning models. Gemma 3/4 mechanistic analyses identify a post-answer state organized around later commitment; steering a confidence-specific direction shifts abstention in Gemma 4. The paper does not claim confidence contains no truth information; calibrated log-probability is an answer-evidence proxy, not ground truth, and is weaker in reasoning models.

### 5. Ranjan, Sokratous & Odegaard, “Reality Monitoring in Large Language Models: Self-Knowledge That Transforms with Conversation Memory” (arXiv:2607.23927, 2026; preprint)
[Primary paper](https://arxiv.org/abs/2607.23927)

This is **source monitoring**, not direct hidden-state introspection. Across six LLMs and two word-pair experiments, single-trial self-generated items can reach ceiling, but episodic delay reverses the pattern; reported mean accuracy falls to about 66% for externally perceived and 48% for imagined/self-generated items. The constrained word-pair task, six models from two families and behavioral-only readout do not establish source monitoring for arbitrary tools, retrieval or archives.

### Measurement anchor: Rahnev (2025), Nature Communications
[Primary measurement paper](https://www.nature.com/articles/s41467-025-56117-0)

Across six existing datasets, Rahnev evaluates 17 metacognitive measures. All pass a validity test based on artificial confidence corruption; many depend strongly on first-order task performance. Split-half reliability is high while most test-retest reliabilities are poor. These measures assess confidence's ability to distinguish correct from incorrect decisions, not privileged activation access or second-order self-representation. One confidence block should not be treated as a stable trait.

## Synthesis

- F does not entail P: a report may use prompt information.
- P does not entail M: privileged signal access need not produce a second-order representation.
- F does not entail G: accurate reports can arise through a correlated or bypass route.
- Probe decodability does not entail model self-access.
- C does not entail M: confidence can track commitment rather than correctness.
- S does not entail introspection: source monitoring can fail under memory delay.
- T is an independent gate: task-specific shortcuts may fail under unseen interventions.

The correction is to stop treating fluent self-description, confidence and correct source labels as one observation of “self-awareness”.

## Formalization and Lean

The existing Orson draft PR #2375 already contained a generic source-projection/dependence non-identifiability theorem. This run extended `OrsonDependenceIdentifiability.lean` with one assistant-reconstructed readout counterexample: two systems agree on the observed support, but one remains aligned under a state change while the other uses a constant report that only happens to agree on the observed state. Thus observed fidelity does not identify counterfactual alignment.

New theorem: `observed_fidelity_does_not_identify_counterfactual_alignment`.

**Limit:** `counterfactualAgreement` is a weak functional proxy, not mechanistic causal grounding. The finite witness is not a model of any actual LLM and does not show any model is ungrounded. The generic source-projection theorem remains separate; no formal mapping from it to LLM self-report is claimed. Lean checks only the formalized statement, not the empirical translation or second-order representation.

The first exact-head run `45761951341` failed on an unfinished proposition-equivalence proof and `Decidable` synthesis for universal `#eval` propositions. Run `45762435790` executed the readout counterexample: both observed-agreement checks evaluated `true`, and the concrete intervention tuple evaluated `(true, true, true, false)`. The new readout theorems printed no axioms. That overall build still failed because an extra abstract dependence witness did not reduce; it was removed rather than promoted. Final source: `9396c4c0b748ebf2b0341f41c5872d8103cb035b`. No exact-head run was visible at this publication cut, so final compilation remains **PENDING**. Tests, lint, leanchecker, nanoda and global axiom audit are not established. Local Lean/Lake/Elan are not installed. PR #2375 remains OPEN / DRAFT / UNMERGED; no formal review or merge is claimed. P1 PR #850 and its protocol were not changed.

## Existing tools and cost reconnaissance

No new tool was built, installed, forked or subscribed to. Existing connected SciSpace was used. Existing Math Hopper #578 / PR #991, Orson Lean PRs #2375/#1743, P1 PR #850 and Whirligig Kernel 0 were checked.

- [Psych Scanner](https://github.com/saurabhr/psychscanner): MIT; active development; 207 commits, one fork, six stars at inspection; no GitHub release shown. Cognitive-task runner with memory conditions, session recovery and CSV export. Python 3.11. Local Ollama works without an API key; hosted providers require separate LangChain integrations and API keys. Framework paper is listed as submitted/unpublished.
- [MetaSignal](https://github.com/saurabhr/metasignal): MIT; 126 commits, one fork, four stars; no GitHub release shown. Current README reports 20 SDT/metacognitive measures plus six fit diagnostics, validated against six Rahnev datasets. Its arXiv abstract counts 17 metacognitive measures plus three reference variables; this is a counting-scope distinction. Core Python is local; optional Bayesian components add dependencies. Current docs specify binary two-alternative discrimination, not arbitrary multi-source categorical tasks.

These are post-freeze candidates only. Psych Scanner must not be run for a P1 trial while frozen. MetaSignal needs genuine trial-level stimulus, response and confidence data. Local Ollama avoids provider-token charges but costs local compute, setup and operator time; hosted providers require usage billing. No hosted model API was used and no new subscription was created. Existing connected SciSpace was used. MetaSignal core analysis has no inference API charge; optional Bayesian components add dependency/compute burden.

Math Hopper #578 still reports the full three-repository scan NOT VERIFIED; PR #991 remains draft and extraction-only (`math_pass=null`, `lean_status=NOT_RUN`). Whirligig Kernel 0 remains Meridian's sandbox, unrelated to this cognition task. No new tool, dependency, fork or paid service was introduced.

## Project and safety boundaries

- P1 Nov 9 cognition: overdue, frozen, NOT READY; Orson-owned. No model trial, human session, provider API call, dataset expansion/reanalysis, protocol amendment, manuscript edit, review submission or gate advancement.
- P2 Nov 30 measured-system paper: HOLD. No physical system, CODATA comparison, fit, prediction or uncertainty propagation.
- P3 Dec 14 full-theory paper: incomplete.
- P0 Code Grurple: presentation-safety FAIL; live Paper A/B route acceptance NOT OBSERVED. No implementation, route probe, deployment or standdown.
- Mersearch: all four shared lanes occupied; no new request or dispatch. Existing Orson cognition-origin-bank receipt is bounded navigation only; raw results remain withheld.
- FIE rereview: last completed 2026-11-24; next due 2026-12-08. No duplicate rereview.
- Unrelated-source break: next due 2026-11-28; not repeated early.
- Tern retains PWH queue/task-graph authority. No queue or graph edit.
- No SAT-O/Blockwave equation changes, BEDROCK promotion, task/ID/cadence/phase change, signet or conversation rename.

## Post-freeze research question

A future authorized study should separately manipulate observed report/behavior agreement; input-only cues versus privileged internal-state access; causal interventions versus matched prompt-level “gaslight” controls; selective disruption of a second-order report path while preserving first-order behavior; and transfer to unseen internal perturbations and source-memory conditions. This is a design sketch, not a P1 protocol amendment or administered experiment.

## Final disposition

`ORSON_COGNITION_LITERATURE_CROSSWALK / FIVE_LLM_PRIMARY_STUDIES_PLUS_RAHNEV_2025 / INTROSPECTION_CONSTRUCTS_DECOMPOSED / LEAN_COUNTEREXAMPLE_ADDED_TO_DRAFT_PR / EXACT_HEAD_BUILD_PENDING / P1_FROZEN / P2_HOLD / P3_INCOMPLETE / P0_PRESENTATION_SAFETY_FAIL / NO_MODEL_TRIAL / NO_NEW_MODEL_PROVIDER_API_SPEND / NO_PHYSICAL_CALCULATION / NO_THEORY_PROMOTION / NO_SCHEDULER_CHANGE / NO_SIXTH_TASK`
