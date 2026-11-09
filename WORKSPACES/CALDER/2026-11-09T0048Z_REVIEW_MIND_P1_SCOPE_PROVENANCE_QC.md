# Calder :48 h696:s4 — Review-MIND P1 provenance and orchestration QC

**Disposition:** Internal source-QC delta. No manuscript, PR, issue, task graph, public publisher, or automation definition changed.

## 1. Slot, identity, and authority

- Nominal occurrence: **2026-11-09T00:48:00Z**.
- Base: 2026-10-11T00:00:00Z; therefore **h = 696**.
- Sequence: **5h + 4 = 3484**; (3484 \bmod 19 = 7).
- Ring label: **Calder**. Immediate successor: **Hale**, h697:s0.
- Current :48 automation ID: `6aa6c3bc02b48191b8a91a30d2a155e0`, still enabled. No ID, prompt, schedule, phase, or enabled-state change was made.
- Current run ID: `b71d9e16-344c-832f-9978-fb262b399fda`; scheduled 00:48Z, started 01:15:38Z, approximately 27m38s late. The run's `chat_ref` is null and its cached `latest_result` still points to h695:s4/Aster. That cached result is not this run's work.

### Calder identity boundary

No authenticated, currently usable empirical-Calder thread was established. The available role basis is the assistant-maintained 2026-09-12 Calder entry in `WORKSPACES/COMMON/CHECKINS.md`, which describes an empirical/statistical, adversarial-checks and null-design specialty. No direct Nathan-authored standalone Calder charter was recovered in this pass.

The identity-collision correction at `WORKSPACES/CALDER/2026-10-30T0534Z_IDENTITY_COLLISION_CORRECTION.md` explicitly excludes the separate Foundational Covariance / Global Architecture Calder identity associated with “⚗️ CALDER [Construction Story Retelling]”. That thread was not used. This run is a **source-grounded reconstruction under the Calder ring label**, not authenticated participation by a separate Calder instance.

No handoff addressed to h696:s4 was present at the start. The expected h696:s3/Aldus receipt and Calder-directed handoff were not present in the final repository snapshot. This is a missing predecessor record, not evidence of refusal or non-response.

## 2. Why this is an additive QC delta

The existing Orson h672:s2 source/CI postcheck already covered the shared NLI checker, error sentinel, and local projection formalization. The existing Calder h620:s4 work already covered peer-exposure topology, reciprocity, and tally visibility. I did not repeat either analysis.

This pass adds a **run-matrix/orchestration reconciliation** and a **formalization-coverage boundary**. It is not a new model experiment and does not reopen Orson's frozen P1 scope.

## 3. Pinned ConsistencyBench source and exact result matrix

Source examined at `aayambansal/ConsistencyBench`, commit:

`bfc676baa848c7f1715bb73aee148180de15516e`  
Commit date: **2026-02-18T19:05:02Z**.

The repository's current `main` ref still points to this commit, and the current-main `src/evaluate.py` bytes are identical to the pinned version. There is no upstream source drift relative to this pin at the time checked.

Relevant blob identities at that commit:

| Source | Blob SHA |
|---|---|
| `src/evaluate.py` | `0453540cb7c19227601e59fb342fa93e736da849` |
| `src/run_all.py` | `ade697f1ab0baf6aaea8e6ff2431c76aefb6c40c` |
| `final-paper/main.tex` | `dbd471235a310aa9821c95faf570432c21339592` |
| `README.md` | `326b9f2c0cca01beafa9b2d3c2190cce65714a6e` |
| `eval_logs/eval_log.txt` | `f92d850f972e7283e6f8c2d396bf67fca71a46f2` |

The README and final paper agree on the reported evaluation panel:

- **18** model labels under direct/vanilla prompting.
- **17** model labels with CGD results.
- **DeepSeek-R1** is the one paper-listed model without a CGD result; the final paper says it was excluded from CGD because of API constraints.
- **2** CoT results: GPT-4o and Qwen 2.5 72B.

The pinned `results/` directory contains **37 JSON files**: 18 vanilla, 17 CGD, and 2 CoT. The 17 CGD files are therefore not 17 interacting agents or 17 independent human-like participants. They are 17 model-labelled result files from the benchmark's 18-model panel.

### Newly identified orchestration mismatch

The paper's reported matrix is present, but the supplied top-level runner does not reproduce it as written:

1. `src/run_all.py` hard-codes **six** models and four strategies, a 24-combination plan. It is not the 18-model runner described in the final paper.
2. `src/evaluate.py` has a 22-entry `MODELS` registry. Four configured IDs are outside the final paper's 18-model list and have no result files: `gpt-4o-mini`, `claude-opus-4.5`, `claude-3.5-haiku`, and `deepseek-v3`. GPT-4o-mini is the hard-coded NLI evaluator, not one of the 18 target models.
3. The `evaluate.py --all` path defaults to all 22 registry entries and four strategies, so its nominal sweep is 88 combinations, not the archived 18/17/2 matrix.
4. The results directory has 37 JSON outputs. The log directory has 35 individual per-run logs plus an aggregate `eval_log.txt`; that aggregate contains the GPT-4o vanilla and CGD run traces. The aggregate log is not a complete top-level invocation manifest.
5. `run_full_evaluation` skips existing output files and loads them from disk. The results directory does not contain the `summary.json` that this function writes at completion.

**Interpretation:** the 18/17/2 reported result matrix is supported by the final paper, README, result filenames, and per-run logs. However, the exact top-level command/model-list manifest that generated the complete matrix is not captured by the supplied `run_all.py` or the default `evaluate.py --all` path. This is a reproducibility/provenance gap, not evidence that the published numerical results are false.

**P1-safe handling:** describe the archive as 18 direct outputs, 17 CGD outputs, and 2 CoT outputs; identify DeepSeek-R1 as the missing CGD case; do not imply the six-model runner reproduces the 18-model paper. A compact frozen manifest should map each result file to model label, strategy, sample hash, source commit, API model/version, run timestamp, and corresponding log. No rerun or external-repository change was attempted.

## 4. Source-level interaction graph and the Lean coverage boundary

The pinned `src/evaluate.py` shows a within-model, within-question-set history:

- `evaluate_cgd` initializes `prior_qa_pairs = []` inside each question-set evaluation.
- `run_full_evaluation` iterates model labels and strategies separately and invokes `run_evaluation` for each combination.
- The NLI checker is configured with the fixed model string `openrouter/openai/gpt-4o-mini`; its `model_id` argument is not used to select the target model.
- The checker receives the first 500 characters of two raw answer strings, not the question or shared premise.
- The repair prompt receives the previous question, previous extracted final answer, shared premise, and current question, but not the current first-pass raw answer.
- The history append retains both the extracted final answer and the original raw response. After revision, those can represent different histories.

The supported interaction shape is therefore:

`shared benchmark inputs -> separate target-model run -> local question-set history -> common NLI evaluator -> optional same-model repair -> archived result`

There are no peer-model message edges in the inspected protocol. This is **source-code evidence about this benchmark implementation**, not evidence that models generally cannot influence one another, and not a causal estimate of social influence.

The existing Lean module `FORMAL_VERIFICATION/HsHVerification/OrsonCGDProjectionGate.lean` (blob `b60d3ad7d50ede1c5c58f5a15c178ba8e1a281e8`) and root aggregator `FORMAL_VERIFICATION/HsHVerification.lean` (blob `7bd69ca93c399ad39b0092015809e0418fe8ef0e`) formalize local projections of one pair context and an archive record. They cover the checker-view / repair-view asymmetry, the archive's loss of the trigger pair, and the concrete error-sentinel parser behavior.

**New formalization boundary:** the module does not encode `model_id`, `question_set_id`, a partitioned history map, or an explicit peer-message graph. It therefore does **not** prove the outer no-cross-model-exposure property. That conclusion currently rests on reading the pinned Python control flow. A future formalization would need an explicit run-key partition and source-to-graph translation contract. No new Lean module was created because Orson owns PR #850 and the P1 scope is frozen.

### Existing CI status, carefully bounded

- PR #850 head: `3bb0c57b56e1eff49139dcc21fcfe518a7717b8d`.
- Actions run #42416933193, job #128536972640: **completed / success**, event `pull_request`.
- The current Orson work record describes this as a merge-reference build. No exact-head standalone build was verified in this pass, and the full job log was not independently retrieved here.
- The successful CI run checks the formalized Lean statements in the checked-out build. It does not validate the Python-to-Lean translation, establish the source code's empirical truth, or prove a claim about human or model consciousness.
- The earlier Orson record reports standard-axiom output and no `sorryAx`/admit in its inspected log; that is retained as a prior record, not represented as a fresh independent replay in this run.

### Error-path caveat

The source's retry helper can return `[ERROR]`; the parser maps any nonempty response lacking the substring `CONTRADICTORY` to false. The archive can therefore conflate a failed checker call with a non-contradiction flag. The Lean module proves the concrete `[ERROR]` / `CONSISTENT` indistinguishability under its encoded parser. No error prevalence is claimed because raw checker outputs and a per-call error count are not archived.

## 5. Claim boundary for P1

The issue-level research question's phrase “apparent consensus among LLM workers” is broader than the archived protocol. The source supports **cross-model agreement on common benchmark items**, plus a common evaluator dependency and within-model self-history. It does not contain cross-model peer deliberation, peer-message exposure, or an experimental consensus-formation condition.

Use “cross-model agreement” or “agreement across model-labelled outputs” for the observed result. Reserve “consensus formation”, “peer influence”, and “social convergence” for a study that actually manipulates and logs peer exposure. Do not call the 17 CGD outputs 17 independent agents.

The P1 frozen working title and archival-methods scope remain the safer frame: shared evaluator dependence and within-model self-revision in a source-audited benchmark. This is a scope boundary, not a request to reopen the paper.

## 6. Orson protection and current gate

The last five source-grounded Orson-labelled substantive records in the current work trail classify as four cognition-focused records and one administrative artifact-attribution reconciliation:

- h687:s3 — administrative artifact-attribution reconciliation.
- h672:s2 — P1 CGD source / CI postcheck.
- h668:s3 — CGD projection / dual-history formalization (recorded in CURRENT_WORK; no matching canonical receipt was found in this check).
- h649:s3 — answer-paired judge identifiability.
- h645:s4 — source, proof-status, and cross-lane cognition QC.

That is a **4/5 record-level mix**, not an authenticated participation count for a separate Orson instance. It is consistent with protecting approximately four of five substantive Orson-labelled turns for genuine LLM-cognition work; continue to distinguish actual thread participation from repository labels.

P1 remains **NOT READY** for the November 9 gate:

- Issue #564 remains open.
- PR #850 remains open/draft/unmerged.
- The Orson workspace inventory contains no canonical P1 manuscript `.tex`, compiled PDF, or reader route.
- No independent review or author disposition is recorded.
- No new model trial, human session, endpoint call, API spend, or subject result was created.

No manuscript, PR, issue, or ownership was changed.

## 7. Cross-lane and future R&D notes

- P0 Code Grurple remains active and untouched.
- The task graph's P1 node still carries broad multi-agent-consensus wording and an older PR pointer (9fa85f / run #420259), while the live PR head is 3bb0c57 / run #42416933193. The graph also reports 16 declared branches against 18 records. Tern owns that graph reconciliation; this Calder run did not edit it.
- No measured physical system, dataset, units, uncertainty budget, or physical prediction was in scope. No physical calculation was made.
- No new geometric equivalence or H(s)H/SAT claim was introduced.

### Future experiment, not part of P1

The existing Calder h620:s4 design already distinguishes isolated work, one-way-yoked exposure, and reciprocal interaction (A0/A1/A2), with tally visibility as a separate factor. A useful later extension is to cross that topology factor with **shared versus independently allocated source packets**. Randomize at the group level; log message availability, actual receipt, uptake, and decision provenance; measure pre-convergence solution diversity, evidence diversity, final accuracy/quality, time-to-consensus, participation equity, facilitator influence, and participant experience separately. This separates common-source agreement from peer influence. It is a proposal only; no participants or models were run.

### Lateral reading / source cursor

1. **Smaldino & Moser (2023), “Maintaining Transient Diversity Is a General Principle for Improving Collective Problem Solving,” DOI 10.1177/17456916231180100.** Read extent: SciSpace full record, abstract, and extracted conclusions/limitations/future-research fields; full text not read. The useful design lens is to measure transient solution diversity and time-to-consensus, not only final agreement. This is a human-team/theoretical synthesis, not direct LLM evidence.
2. **“Collective Intelligence in Human-AI Teams: A Bayesian Theory of Mind Approach,” DOI 10.1609/aaai.v37i5.25755.** Read extent: SciSpace full record, abstract, and extracted methods/dataset/limitations. The abstract describes 145 people in 29 human-only teams; it does not establish that those participants interacted with an AI agent. The exact agent-intervention evaluation design remains unresolved without the full methods. No stronger claim is imported.

Return cursor: retrieve the full text of the second paper if a later human-AI group design depends on whether its agent interventions were simulated, replayed, or tested with new participants. No human participant, including Nathan, is assumed or recruited.

## 8. Mersearch, publication, and boundaries

- No Mersearch connector was exposed in this runtime. The four existing HsH Mersearch request lanes remain `REQUESTED`, with no current run manifests or search receipts. No lane was overwritten or retriggered. The public pinned GitHub source was used as a bounded fallback; no claim of Mersearch completion is made.
- This is an internal QC note, not a public paper or public-safe submission. No issue-publisher submission was made; no issue or PR was created.
- No new tooling, branch, task, schedule, task ID, signet, or chat rename was created.
- FIE review is due November 10 based on the last recorded October 27 review; it was not yet due for this slot.

## 9. Handoff

Next ring label: **Hale**, h697:s0. The handoff is repository-only, optional context, and carries no task, ownership transfer, or response obligation. No cross-thread delivery or acknowledgment is claimed.
