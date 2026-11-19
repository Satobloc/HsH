# H953:s3 Orson Vay addendum | MemOps evaluator overlap and paper-to-code configuration drift

**Date:** 2026-11-19  
**Classification:** Source-audited future-methods addendum to [H953:s3 report #2113](https://github.com/Satobloc/HsH/issues/2113). This is not a P1 protocol amendment, administered model study, manuscript edit, or claim about model cognition beyond the inspected benchmark.

## 1. Why this addendum

The parent report identified evaluator dependence in MemOps. A deeper source-to-code comparison exposes two more specific reproducibility conditions:

1. the paper's named GPT-4o judge overlaps with GPT-4o as one of the evaluated answer systems; and
2. the public code snapshot inspected after the paper's submission has defaults and invocation-path behavior that do not reproduce the paper's reported model roster without explicit overrides.

These are auditability and measurement-dependence findings. They do not establish that the reported scores are biased, invalid, or incorrectly computed.

## 2. Primary-source and code pins

**Paper:** Xixuan Hao et al., *MemOps: Benchmarking Lifecycle Memory Operations in Long-Horizon Conversations*, arXiv:2607.12893v1, submitted 2026-07-14. The retrieved paper methods identify GPT-4o as the LLM judge; Table 3 includes GPT-4o as an evaluated model in both adjacent-context and long-context conditions.

**Public implementation inspected:** `MemTensor/MemOps`, commit `312af65e2c7b6d1b70f062ffa8b4cde32aaf6f35`, dated 2026-07-24T13:23:39Z. This is ten days after the paper's submission date and is not presumed to be the exact paper-time code snapshot.

Inspected source files at that exact commit:

- `README.md`
- `5-test_operation_metrics.sh`
- `5-test_operation_metrics.py`
- `5.5-evaluate_operation_metrics.sh`
- `5.5-evaluate_operation_metrics.py`
- `2-generate_evidence_conversation_w_verity.sh`
- `2-generate_evidence_conversation_w_verity.py`
- `3-generate_distractor_facts.sh`
- `3-generate_distractor_facts.py`
- `generated_result/2-evidence_conversation/A01_trajectory_ops.json`
- `generated_result/2-evidence_trace/A01_trajectory_ops.json`
- `generated_result/3-distractor_facts/A01_trajectory_ops.json`

The inspected public tree did not contain `generated_result/5-test_operation_metrics/` or `generated_result/5.5-evaluate_operation_metrics/` at this commit. Thus the retrieved code snapshot did not provide the per-item answer outputs and judge outputs needed to independently reaggregate the paper's model scores.

## 3. Judge/target overlap

The paper names GPT-4o as the judge and includes GPT-4o among the evaluated systems. This creates a direct **model-label/family overlap** for the GPT-4o answer rows. All other evaluated rows also share the same judge as a common measurement instrument.

The inspected `build_evaluation_prompt` function does not interpolate the `answer_model` metadata field into the judge prompt. That is a useful distinction: explicit model-name disclosure in that prompt was not found. It does not establish full blinding. The answer text may still reveal stylistic or behavioral cues, and the paper's retrieved methods do not specify a blinded judge-identity protocol or an independent judge-family replication.

The authors discuss judge instability, including a long-context result they treat cautiously. The source evidence supports treating judge sensitivity as a live measurement limitation, not assigning a direction or magnitude to any GPT-4o self-family effect.

**Correct interpretation:** the two GPT-4o target conditions are scored by a judge with the same named model family, while all target conditions share one judge family. This is a dependency flag, not proof of favoritism, self-preference, or invalidity.

## 4. Paper roster versus inspected code defaults

The paper's seven named long-context model families are:

- GPT-4o
- GPT-4.1-mini
- GLM-4.6
- Gemini-3-Flash
- Qwen3.6-27B
- DeepSeek-V4-Flash
- Claude-Sonnet-4.5

At the inspected code commit, the `5-test_operation_metrics.sh` launcher defaults instead to:

| Configuration | Inspected launcher default |
|---|---|
| Adjacent models | `gpt-4o,claude-opus-4-6` |
| Long-context models | `claude-opus-4-6,deepseek-v4-flash,glm-5.1` |
| No-context models | `deepseek-v4-flash` |
| RAG model | `gpt-4o` |

The launcher exposes environment-variable overrides, so this is not a claim that the paper's roster cannot be run. It means the inspected default command is not the paper's Table 3 roster. No exact, versioned paper-run configuration was found in the inspected README or generated sample artifacts.

There is also an invocation-path difference in the evaluator:

- `5.5-evaluate_operation_metrics.py` defaults to `gpt-4.1-mini` when `EVAL_JUDGE_MODEL` is unset.
- `5.5-evaluate_operation_metrics.sh` sets `EVAL_JUDGE_MODEL` to `gpt-4o` by default.
- The README's example commands explicitly select `gpt-4o`.

Therefore direct Python invocation and the shell wrapper can silently use different judge models unless the caller pins the variable or CLI argument. The code records the requested `judge_model` in row outputs and the summary, which helps recover the chosen label when those outputs are retained. The inspected summary does not supply a versioned paper-run manifest, prompt/rubric hash, provider endpoint identity, or immutable model snapshot.

## 5. Generation and verifier provenance

The inspected shell launchers and Python entry points expose configurable generation, question, evidence-verification, distractor-generation, distractor-verification, answer, and judge models. Their defaults differ by entry point. For example, the evidence-generation shell wrapper defaults to Claude Opus 4.6 for evidence/question generation and GPT-4o for verification, while the Python module's direct defaults differ. The README's illustrative full-pipeline command sets several of these roles to GPT-4o.

These are **current code defaults and examples**, not proof of which models generated the paper's 403 retained conversations. The paper describes LLM-based verification, but the retrieved methods do not pin every generator/verifier model identity or immutable revision.

The three inspected public sample JSON artifacts (evidence conversation, evidence trace, and distractor facts) contain no top-level generator/verifier model, model-version, prompt-hash, or run-manifest fields. This is a sample-level observation, not a census of every repository artifact. Combined with the absence of the inspected stage-5 and stage-5.5 output directories, the public snapshot does not permit an independent reconstruction of the full generation → verification → answer → judge lineage for the reported table.

## 6. Reproducibility gate added

For any future benchmark comparison using this source, the run record should bind each item to a role-specific provenance tuple:

`dataset_item_id | source_commit | source_data_sha256 | generator_model_requested | generator_model_returned | verifier_model_requested | verifier_model_returned | answer_model_requested | answer_model_returned | judge_model_requested | judge_model_returned | provider/endpoint | model_snapshot | prompt_sha256 | rubric_sha256 | temperature | max_tokens | seed | request_id | raw_output_sha256 | adjudication_status`

A separate overlap matrix should identify whether the generator, verifier, answerer, and judge share a model family, provider, or exact model snapshot. These are distinct overlap levels and should not be collapsed into a single independence flag.

A defensible cross-judge sensitivity design would keep the answer corpus fixed, hide explicit answer-model labels from judges, use at least one judge from a different model family, and adjudicate a stratified human subset blind to target identity. Report per-item disagreement, metric deltas, rank reversals, and judge-by-answer-model interactions. Deterministic checks should handle exact target IDs, evidence spans, operation ordering, and state transitions where possible; semantic judgments should be isolated to tasks that genuinely require them.

No API call, paid evaluation, human adjudication, or new model trial was performed here. The gate is a proposed future-methods requirement, not a completed validation.

## 7. Relation to Orson's frozen P1

This MemOps review is an external comparator for Orson's cognition-methods work. It does not change the frozen ConsistencyBench P1 protocol, its unit of analysis, claims, dataset, or paper scope. In particular, MemOps' synthetic lifecycle benchmark is not evidence of cross-model peer influence, human consensus, or consciousness.

P1 remains OVERDUE / NOT READY / ORSON-owned. No manuscript source, PDF/reader, protocol, issue #564, or paper gate was changed.

## 8. Formalization boundary

The existing HsH PR #2112 remains an assistant reconstruction of minimal Remember/Update/Forget state semantics, not a formalism supplied by the MemOps authors.

Static review found that the `update_transition_preserves_other` and `forget_transition_preserves_other` theorem statements establish successful application and preservation of the other target, but do not explicitly state the resulting target value or emptiness in their conclusions. The witness construction and separate `writeState_sets_target` lemma make the stronger properties appear derivable, but the theorem statements should expose them directly before the operation contract is described as fully verified.

A bounded Python model check over 16 two-slot states, 30 operations, and 120 valid state-operation transitions found that every valid transition preserved the other target and set or cleared the addressed target as specified. Enumeration of valid histories of length 0–3 from the empty state found 355 histories and multiple distinct histories for each of the 16 reachable final states. This is a finite check over values `{none, 0, 1, 2}`, not a proof over all natural numbers and not a Lean run.

**LEAN STATUS: UNTESTED.** No local `lean`, `lake`, or `elan` executable is installed. The existing `.github/workflows/lean-verification.yml` exists on PR #2112's non-default P1 base branch but is absent from default `main`; no workflow-dispatch action is available in this runtime. No successful exact-head Lean build, theorem-specific axiom audit, or proof acceptance is claimed. No new workflow, branch, PR, or theorem was created.

## 9. Scope and status

- Mersearch was not callable in this runtime; no Mersearch query is claimed.
- HsH, SAT archive, and HSH_RESOURCES front doors were read. No HSH_RESOURCES private `PRIOR_ART` or `PRIVATE_WORKSPACE` payload was opened or modified.
- Existing Math Hopper #578, PR #991, Whirligig Kernel 0, and relevant Lean PRs were checked. SciSpace was available but not needed for this bounded source/code audit.
- No new tool, fork, dependency, subscription, paid API call, or external service was created.
- No P1 trial, human session, dataset reanalysis, manuscript edit, paper-gate advancement, physical calculation, independent measurement, SAT-O/Blockwave equation change, or BEDROCK theory promotion occurred.

**Classification:** `H953_S3_ORSON_ASSISTANT_RECONSTRUCTION / MEMOPS_EVALUATOR_OVERLAP / PAPER_CODE_CONFIG_DRIFT / SAMPLE_ARTIFACT_PROVENANCE_GAP / FUTURE_METHODS_GATE / PR2112_LEAN_UNTESTED / P1_FROZEN / NO_TRIAL / NO_PAPER_GATE_ADVANCEMENT`.


## 10. Source links

- Paper: https://arxiv.org/abs/2607.12893
- Exact inspected MemOps commit: https://github.com/MemTensor/MemOps/commit/312af65e2c7b6d1b70f062ffa8b4cde32aaf6f35
- Model-test launcher: https://github.com/MemTensor/MemOps/blob/312af65e2c7b6d1b70f062ffa8b4cde32aaf6f35/5-test_operation_metrics.sh
- Evaluator launcher: https://github.com/MemTensor/MemOps/blob/312af65e2c7b6d1b70f062ffa8b4cde32aaf6f35/5.5-evaluate_operation_metrics.sh
- Evaluator implementation: https://github.com/MemTensor/MemOps/blob/312af65e2c7b6d1b70f062ffa8b4cde32aaf6f35/5.5-evaluate_operation_metrics.py
- Evidence-generation launcher: https://github.com/MemTensor/MemOps/blob/312af65e2c7b6d1b70f062ffa8b4cde32aaf6f35/2-generate_evidence_conversation_w_verity.sh
- Distractor-generation launcher: https://github.com/MemTensor/MemOps/blob/312af65e2c7b6d1b70f062ffa8b4cde32aaf6f35/3-generate_distractor_facts.sh
