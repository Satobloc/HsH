# P1 source-run provenance audit: ConsistencyBench

**Status:** public source audit; not a paper, independent replication, or controlled human-LLM experiment.  
**Source snapshot:** `aayambansal/ConsistencyBench` commit `bfc676baa848c7f1715bb73aee148180de15516`.

## 1. What the archived panel actually is

The checked-in implementation runs each model/strategy evaluation separately. `src/run_all.py` launches `src/evaluate.py` as a subprocess with one `--model` and one `--strategy` at a time. Within a CGD run, `prior_qa_pairs` is local to that run and is populated from that run's own preceding questions. The source does not pass one model's answer into another model's prompt.

The same NLI-checker implementation/model route is used inside the separate runs. It is a common evaluation dependency, not a peer agent with shared state. The checker receives the two raw answer strings; it does not receive the question or premise. The revision prompt receives the within-run context. Aggregation across model outputs is post-hoc.

Accordingly, the 17-model CGD collection is a **multi-model evaluation panel**, not an observed live multi-agent team. It contains no direct observation of peer-to-peer model influence. Shared benchmark items, expected answers, checker implementation, provider routing, and evaluation code are common upstream dependencies; they should not be mistaken for independent replications.

## 2. Run-manifest and log coverage

At the pinned commit:

- The README claims 18 frontier LLMs and 37 evaluation-result JSON files.
- The `results/` directory contains 37 JSON files: 18 vanilla, 17 CGD, and 2 CoT, spanning 18 model labels.
- The convenience orchestrator `src/run_all.py` hardcodes **6 models × 4 strategies = 24 tasks**.
- `src/evaluate.py` has a larger model-alias map and an `--all` path. The 18-model output set therefore cannot be attributed to the six-model convenience runner alone.
- `eval_logs/` contains 35 per-model log files. The combined `eval_log.txt` is 62 lines and contains only the first two of the stated 24 tasks: GPT-4o vanilla and GPT-4o CGD. It is not a complete 24-task batch log. Those two GPT-4o outputs have no separate per-model log file; the combined log records them, including two API errors during the CGD run.
- The individual output JSONs record fields such as model label, requested `model_id`, strategy, set count, metrics, and result rows. They do not record a run timestamp, provider request ID, resolved backend model revision, response metadata, or per-request prompt hash. The source code supplies defaults such as temperature 0.0 and max_tokens 512, but the output files do not serialize a per-run request manifest.

This is a **reproducibility and provenance gap**, not evidence that the archived outputs are fabricated or invalid. The result files and per-model logs are real source artifacts and remain analyzable. What is missing is a complete, independently auditable record connecting every output to its exact invocation and resolved provider model.

## 3. Pinned source evidence

- README blob: `326b9f2c0cca01beafa9b2d3c2190cce65714a6e`
- `src/run_all.py` blob: `ade697f1ab0baf6aaea8e6ff2431c76aefb6c40c`
- `src/evaluate.py` blob: `0453540cb7c19227601e59fb342fa93e736da849`
- `final-paper/main.tex` blob: `dbd471235a310aa9821c95faf570432c21339592`
- `eval_logs/eval_log.txt` blob: `f92d850f972e7283e6f8c2d396bf67fca71a46f2`

The full 17-model PCR estimand reanalysis is already published in [issue #1103](https://github.com/Satobloc/HsH/issues/1103); this note does not duplicate its numerical table.

## 4. Formalization status

A source-conditional Lean module, `OrsonPairwisePCR.lean`, is proposed in a separate stacked draft review [PR #1113](https://github.com/Satobloc/HsH/pull/1113), based on but not modifying Orson's draft [PR #850](https://github.com/Satobloc/HsH/pull/850). The original PR #850 branch remains at its prior head.

The new module formalizes the Boolean identity behind the archived PCR predicate and the finite-list decomposition into written-definition pairs plus both-wrong pairs. Exact-head verification is pending: GitHub Actions run [#41112408633](https://github.com/Satobloc/HsH/actions/runs/41112408633) was queued at submission time. Do not describe the new theorem as compiled until this exact-head run completes successfully and its logs are read.

Even after a successful Lean run, Lean will have checked only the formalized Boolean statements. It will not establish that the Python-to-Lean translation is sound, that answer normalization is semantically appropriate, that the archived data are independent, or that the paper's causal interpretation is true.

## 5. Epistemic limits

This is a source-level archival audit, not an independent external review. It does not invalidate the benchmark outputs, establish independent replication, or establish a causal source effect. The 17-model CGD panel is not evidence of a live peer-to-peer multi-agent group. No new model calls, human participants, or physical calculations were used.

For reproducible reruns, preserve one manifest row per model/strategy/run containing:

1. immutable provider-resolved model/version ID and requested route;
2. UTC start/end timestamps and provider request IDs;
3. exact benchmark/sample SHA and code commit;
4. system, user, checker, and revision-prompt hashes;
5. temperature, top_p, max_tokens, seed where supported, and tool settings;
6. checker request/response records, retry/error details, and raw model outputs;
7. exact output-file SHA linked to that manifest row.

Until those records or an equivalent original manifest are recovered, report the archived panel as source-locked output files with incomplete invocation/backend provenance.
