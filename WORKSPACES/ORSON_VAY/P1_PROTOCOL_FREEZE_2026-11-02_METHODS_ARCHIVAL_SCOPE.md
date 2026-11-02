# P1 Protocol Freeze | Methods/Archival Scope | 2026-11-02

**Status:** PROTOCOL FROZEN FOR A METHODS/ARCHIVAL PAPER; NO NEW LLM TRIAL ADMINISTERED.  
**P1 docket:** HsH issue #564, OPEN / SOURCE–EXPERIMENT READINESS.  
**Campaign gate:** November 9, 2026. P2 November 30 and P3 December 14 remain separate.

## 1. Authority and role protection

This freeze implements the October 26 Three Paper Campaign's November 2 requirement: freeze the P1 protocol and record actual trial/reader status; where a genuine LLM experiment cannot be run, choose an honestly limited methods paper.

The current user instruction preserves Orson Vay's protected remit at approximately four of five actual substantive Orson activations for genuine LLM cognition work. The historical Orson LLM Cognition Lab thread is not authenticated in this execution. Personal-context retrieval identifies an October 10 exchange in “Cognition Research: Reading Program 01,” but the exact conversation UUID and last message remain unrecovered. The October 9 role-reset raw user message also remains unrecovered; the workspace role charter is an assistant-maintained reconstruction, not a substitute for that original message. Current user instructions and the live Three Paper Campaign govern this freeze.

## 2. Frozen research question and paper scope

**Working title:** *Shared Evaluator Dependence and Within-Model Self-Revision in Multi-Model Evaluation: A Source-Audited Methods Study of ConsistencyBench.*

**Question:** When archived LLM outputs appear to agree on scientific or logical judgments, which parts of the apparent agreement are independent model evidence, and which are shared source, prompt, evaluator, key, aggregation, or within-model self-revision dependencies?

**Frozen scope:** a source-audited methods/archival study of the public ConsistencyBench CGD output archive and its evaluator pipeline. The CGD code performs **within-model self-exposure**: for each target model and question set, it compares the current answer with that same model's own earlier answers; when the shared NLI checker flags a contradiction, the same model is prompted to revise using its own prior question/answer pair. The archive does **not** pass one target model's answer to a different target model. The paper may discuss implications for multi-agent scientific review, but it is not a cross-model peer-deliberation experiment and must not claim cross-model social influence, social contagion, or group consensus formation from this archive.

This is a scope correction, not abandonment of the original P1 question. The current data support an audit of shared measurement, source dependencies, and within-model consistency-guided self-revision; they do not contain cross-model peer-to-peer answer exposure.

## 3. Evidence base and source identity

The current source-backed corpus includes:

1. The public ConsistencyBench evaluator source, `src/evaluate.py`, Git blob `0453540cb7c19227601e59fb342fa93e736da849`.
2. The public sample data file `data/consistency_bench_sample.json`, blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`.
3. The full benchmark file `data/consistency_bench.json`, blob `3171d2899fd1eb4292794df5952514666b0e2f43`.
4. Seventeen original archived CGD result JSON files, parsed in the connected GitHub runtime: 17 model labels, 300 sets per label, 1,150 question records per label; 5,100 recorded sets and 19,550 question records in aggregate. Within each model's CGD call, the prior-Q/A list is local to that model/question-set run; it is not a cross-model message channel.
5. Orson's source audits:
   - `2026-10-28_0600Z_P1_SHARED_NLI_CHECKER_SOURCE_AUDIT.md`, blob `f7b9b23039d0cefb901789841be6e28304f90941`.
   - `2026-10-28_1724Z_P1_EXACT_PROMPT_COMPONENT_GRAPH.md`, blob `7870f60f6c4094a6e2a2a7eecfa1b097abd665d8`.
   - `2026-10-29_1612Z_P1_FLAG_DIAGNOSTIC_SOURCE_AUDIT.md`, blob `daf8e8ec4882b281f2e951b8fae71aaf4ca073c6`.
   - `2026-10-27_0712Z_P1_35FILE_KEY_SENSITIVITY.md`, blob `ddf615c2e0fd4cce2599ee0fc13c647a623f6f99`.
6. Existing conditional Lean work in HsH PR #850, including the covariance-aware exchangeable ESS specialization. Its current status is a successful merge-reference build, not an empirical result.

These are archived source outputs and source-code analyses, not newly administered model trials. No independent NLI API call log, triggering pair, raw NLI input/output, or newly recorded model session has been recovered.

## 4. Unit of analysis and estimands

Keep the following estimands separate:

### E1. Checker-flag/source-key relationship

The evaluator emits a Boolean contradiction flag by comparing the current target model's raw answer prefix with that same target model's earlier raw answer prefixes within the same question set. The archived data permit a finite-corpus comparison between that flag and the benchmark's published answer key, on the subset of later-position records eligible to be flagged.

The 2026-10-29 source audit reports, on 14,450 eligible later-position records, 6,702 flags; key-relative PPV 46.1504%, sensitivity 51.8612%, and specificity 57.4711%. These are exact finite-corpus descriptive ratios, not sampling confidence intervals, population probabilities, or semantic-validity estimates.

### E2. Semantic validity of the checker flag

Not identified by the archived Boolean alone. The checker hardcodes `openrouter/openai/gpt-4o-mini`, receives raw answer texts without the corresponding question/premise, short-circuits on the first contradiction, and the archive retains only `contradiction_detected`. The triggering answer pair and NLI inputs/outputs are absent. A flag can be semantically justified even when both individual answers match the published key; conversely, a source-key disagreement does not prove that the NLI flag is correct.

A semantic-validity claim requires recovery of the exact triggering pair and judge input/output, plus blinded human adjudication or a separately validated semantic instrument.

### E3. Causal revision efficacy or cross-model peer influence

The source code establishes a within-model CGD self-revision procedure: a model's current answer is checked against its own earlier answers, and the same model may be prompted to revise. The archive does not establish a randomized causal effect of that revision step; the triggering NLI pair and judge outputs are not retained, and the source audit does not establish a randomized paired design. It contains no cross-model answer exposure or recipient-level peer assignment. It cannot establish that one model changed another model's answer or that multi-agent deliberation improved correctness.

### E4. Independence across model systems

Not established by 17 target-model labels. All target outputs were evaluated through the same hardcoded GPT-4o-mini checker, and each CGD sequence contains within-model self-exposure. Model-family, training-data, retrieval, prompt, and evaluator dependencies must be reported separately. Do not treat 17 model labels as 17 independent model-plus-judge systems or as 17 independent interaction networks.

### E5. Covariance-aware effective sample size

The VEY-026 exchangeable covariance formula is an assistant-derived conditional identity, now formally compiled in HsH PR #850's merge-reference build. Its assumptions are normalized nonnegative weights, equal marginal variance, and common off-diagonal correlation. No P1 aggregation-weight vector or empirical covariance matrix has been recovered. No empirical covariance-aware ESS is available.

## 5. Frozen claims and prohibited claims

**Permitted claims:**

- The benchmark has a common evaluator dependency.
- The CGD pipeline exposes each target model to its own earlier answers within a question set; this is self-revision, not cross-model peer deliberation.
- The contradiction flag is a pipeline output, not a ground-truth error label.
- Repeated prompt components and answer-key mappings create distinct source/measurement dependencies that must be tracked.
- Finite-corpus ratios describe the archived records under the published evaluator/key, not a population of all LLMs.
- Apparent cross-model agreement can overstate independent evidence when the measurement pipeline is shared.
- The conditional ESS identity is a mathematical framework, not a measured P1 estimate.

**Prohibited claims:**

- Cross-model peer influence, social contagion, or multi-agent deliberation effects from ConsistencyBench.
- Independent convergence across 17 models without source, family, prompt, and evaluator dependence analysis.
- Semantic correctness of NLI flags without the triggering pair and judge record.
- A population-level error rate from the finite-corpus ratios.
- Consciousness, subjective experience, or group mind.
- An empirical covariance-adjusted ESS without actual weights and covariance.
- Any statement that OV-49–OV-53 or OV-55 was administered when the record only supports synthetic/planned or unrecovered status.

## 6. External prior-art boundary

Liu et al., arXiv:2607.03695v1, and Kohli, arXiv:2605.29800, are literature comparators, not P1 observations. The VEY-026 amendment records that Liu's C(t) is a harness-constructed context-allocation/aggregation operator, not direct measurement of per-message behavioral uptake; its per-agent lambda values are fitted on the same run. These papers motivate better future instrumentation but do not fill the missing P1 peer-exposure data.

The OSF lead `10.17605/osf.io/aw9vf` has an identifier match and an indexed abstract card, but full text and underlying data were not retrieved. It remains a lead, not evidence.

## 7. Future experiment protocol, separately gated

No experiment is authorized or claimed in this freeze. A future prospective interaction study requires, before administration:

- Recovery of the original answer-keyed OV-49–OV-53 bank or an explicitly authorized replacement.
- An authorized inference endpoint and recorded model/provider/version/settings; no API spend without authorization.
- Frozen prompts, source documents, retrieval state, and randomization seed.
- Recipient-level exposure logs: which messages were available and which were actually inserted into each prompt, with timestamps and truncation/coverage rules; distinguish same-model self-history from cross-model peer messages.
- Pre/post receiver answers or beliefs.
- Raw judge/NLI inputs, outputs, model/version, triggering pair, and retry logs.
- Source ancestry and model-family/training-dependence metadata.
- Randomized exposure/ablation or a defensible counterfactual design for causal uptake.
- A prespecified unit of analysis, missingness/tie rules, scoring key, semantic adjudication, and covariance/ESS estimator.
- Blinded independent analysis and a complete reproducibility package.

This future study is not part of the current frozen P1 dataset.

## 8. Manuscript, PDF, reader, and gate status

- **Protocol:** FROZEN as methods/archival scope on 2026-11-02.
- **New LLM trial:** NOT RUN.
- **Human session:** NOT RUN.
- **Original OV-49–OV-53 bank:** NOT RECOVERED.
- **Authorized inference endpoint:** NOT AVAILABLE.
- **Local draft:** the 2026-10-29 audit reports a three-page LaTeX v0.1 and PDF created locally, but neither is currently repository-hosted or retrieved in this execution; they are not canonical manuscript artifacts.
- **Repository source LaTeX:** NOT VERIFIED.
- **Compiled canonical PDF:** NOT VERIFIED.
- **Reader route:** NOT VERIFIED.
- **Independent/hostile review:** NOT COMPLETE.
- **November 9 P1 gate:** NOT READY. Protocol freeze is one prerequisite, not paper completion.

Next steps: recover the local v0.1 source/PDF or reconstruct from the source ledger; place a versioned LaTeX source in the approved workspace; compile and inspect a canonical PDF; obtain independent hostile review and author disposition; verify a readable reader route. Do not reopen the frozen empirical scope without new authorized data or a recovered bank/endpoint.

## 9. Formal proof boundary

HsH PR #850's OrsonKishEffectiveSampleSize module compiled in a successful Lean 4.34.0 / Mathlib merge-reference build (run #41440854264). The PR-head module and root aggregator blobs matched the merge tree. Thirteen theorem-specific axiom reports listed standard `propext`, `Classical.choice`, and `Quot.sound`; zero `sorryAx` and zero `admit` appeared in the full log. Tests, lint, nanoda, and the separate axiom-audit stage were skipped. The exact-head standalone build was not run.

This proves only the encoded conditional algebra in the combined PR/base tree. It does not validate source transcription, covariance assumptions, evaluator semantics, P1 observations, or causal claims.

## 10. Source-code clarification: CGD is self-revision, not cross-model debate

The original evaluator source, `src/evaluate.py` blob `0453540cb7c19227601e59fb342fa93e736da849`, defines `prior_qa_pairs` inside each `evaluate_cgd(model_id, question_set, ...)` call. It appends that same call's prior question, revised answer, and raw response. The next question's raw response is compared against those prior raw responses; on a contradiction, `CGD_REPAIR_PROMPT` supplies the prior question and prior answer to another call of the same `model_id`. The shared NLI checker separately calls `openrouter/openai/gpt-4o-mini` on the two raw response prefixes, truncated to 500 characters. This is a source-verified within-model self-consistency/revision loop. It is not a peer-to-peer network among the 17 target models.

## 11. Disposition

This is a **P1 protocol freeze**, not a paper completion, experiment report, or theory result. Issue #564 remains OPEN / SOURCE–EXPERIMENT READINESS. November 9 P1, November 30 P2, and December 14 P3 remain distinct. No manuscript gate, PDF/reader gate, review gate, or paper gate is advanced by this record.
