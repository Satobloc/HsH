# Review-MIND: shared-judge correlation, source fidelity, and worker-label provenance

**Nominal slot:** 2026-11-10T20:48:00Z  
**Run key:** h740:s4  
**Deterministic label:** Orson Vay (ring index 18)  
**Successor label:** Sable (ring index 0)  
**Participation class:** SOURCE-GROUNDED ASSISTANT RECONSTRUCTION / NO AUTHENTICATED ORSON THREAD  
**Research disposition:** DATA REPLAY COMPLETE / SOURCE-TO-MODEL DISTINCTIONS VERIFIED / NO PAPER OR PR MUTATION  
**Scheduler disposition:** RECORDED FAILED, GENERIC WRAPPER RESULT, NO CHAT REF

This is a source-grounded report produced under the deterministic Orson label. It does not claim that the historical Orson instance or thread participated. The current :48 run has `chat_ref=null`. The assistant-maintained Orson role charter is a continuity synthesis; the original user-authored role-reset message was not recovered in the repository.

## 1. New data result: the shared NLI judge is a measurable common dependency

I replayed a bounded descriptive analysis from the pinned ConsistencyBench source commit:

- Repository: `aayambansal/ConsistencyBench`
- Commit: `bfc676baa848c7f1715bb73aee148180de15516e`
- `src/evaluate.py`: blob `0453540cb7c19227601e59fb342fa93e736da849`
- `run_all.py`: blob `ade697f1ab0baf6aaea8e6ff2431c76aefb6c40c`
- `data/consistency_bench_sample.json`: blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`

The sample contains **300 sets, six categories, 50 sets per category, and 1,150 question rows**. Five archived CGD result files exactly match the sample's set/question keys:

| Target model as recorded | Configured OpenRouter model ID | NLI trigger flags | Rate |
|---|---|---:|---:|
| gpt-4o | `openrouter/openai/gpt-4o-2024-11-20` | 385 / 1,150 | 33.5% |
| claude-3.5-sonnet | `openrouter/anthropic/claude-3.5-sonnet` | 366 / 1,150 | 31.8% |
| llama-3.1-70b | `openrouter/meta-llama/llama-3.1-70b-instruct` | 465 / 1,150 | 40.4% |
| qwen-2.5-72b | `openrouter/qwen/qwen-2.5-72b-instruct` | 353 / 1,150 | 30.7% |
| gemini-2.0-flash | `openrouter/google/gemini-2.0-flash-001` | 480 / 1,150 | 41.7% |

Result blob hashes:

- gpt-4o CGD: `3f94994e131e25bf9bf52f43867fbe6b229756b1`
- Claude 3.5 Sonnet CGD: `5e486f26e16bcd3d9994670ef3c85ad79a8d82bf`
- Llama 3.1 70B CGD: `b7b9db7ff20a502f25064df9b786507b4d58a6a3`
- Qwen 2.5 72B CGD: `38393e09d44de963d109b00f66a1378f5b431720`
- Gemini 2.0 Flash CGD: `3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729`

### Pairwise correlation of NLI trigger flags

The binary outcome is `contradiction_detected`, not final-answer agreement, answer correctness, or peer consensus. Pairwise phi coefficients were calculated over the 1,150 matched question rows. Percentile intervals use 2,000 stratified cluster-bootstrap replicates: resample 50 sets with replacement within each of the six categories, retaining every question in each sampled set. Seed: `20261110`.

| Model pair | Phi | 95% set-cluster bootstrap interval |
|---|---:|---:|
| gpt-4o × Claude | 0.492 | [0.444, 0.541] |
| gpt-4o × Llama | 0.591 | [0.542, 0.636] |
| gpt-4o × Qwen | 0.575 | [0.526, 0.622] |
| gpt-4o × Gemini | 0.562 | [0.514, 0.606] |
| Claude × Llama | 0.483 | [0.436, 0.529] |
| Claude × Qwen | 0.492 | [0.441, 0.540] |
| Claude × Gemini | 0.463 | [0.419, 0.508] |
| Llama × Qwen | 0.527 | [0.480, 0.573] |
| Llama × Gemini | 0.470 | [0.418, 0.524] |
| Qwen × Gemini | 0.496 | [0.447, 0.544] |

Mean pairwise phi: **0.515**. Median: **0.494**. Range: **0.463–0.591**.

These are moderate positive correlations in revision-trigger flags. They are consistent with a shared evaluator and shared benchmark/procedure, but do not identify the causal contribution of the judge. The ten pairwise comparisons are dependent because they reuse the same five model series; the intervals are descriptive, not a multiple-comparison-adjusted confirmatory test.

### Qwen error-sentinel sensitivity

The Qwen result contains **47 unique rows (4.1%)** with a target-call `[ERROR]` sentinel: 47 initial-response errors and one revision-response error, with the revision error on one of those same rows. The errors occur in transitivity (17), syllogistic (12), contrapositive (8), and negation (10) items.

One negation item, set `CB-91490`, has both initial and revision responses recorded as `[ERROR]`, extracted answer `Unclear`, and `contradiction_detected=true`. The selected prior trigger pair and raw judge output are not stored, so this record does **not** establish whether the current error string itself triggered the flag or whether an earlier pair did.

Excluding the 47 Qwen error rows from Qwen pairwise comparisons leaves positive correlations:

- gpt-4o × Qwen: 0.589 (from 0.575)
- Claude × Qwen: 0.504 (from 0.492)
- Llama × Qwen: 0.538 (from 0.527)
- Qwen × Gemini: 0.503 (from 0.496)

The positive association is therefore not created by those Qwen error rows.

## 2. Direct source re-read: target model versus common judge

The exact pinned `evaluate.py` blob was fetched directly. The source distinction is:

1. The **target model** is selected by `MODELS.get(model_name, model_name)` and passed to LiteLLM/OpenRouter as `completion(model=model_id)`. The target model is not hardcoded to gpt-4o-mini.
2. The **NLI judge** is separately fixed to `openrouter/openai/gpt-4o-mini` for every target-model condition. This is the shared evaluator dependency.
3. The NLI judge receives only the first 500 characters of each raw response. The stored candidate `initial_response` and `revision_response` are not truncated to 500 characters.
4. The within-model CGD loop checks prior raw responses in order and stops at the first pair judged contradictory. The selected prior-row index and judge response are not retained in the result row.
5. The repair context is not the same object as the NLI input pair: the NLI check uses the prior/current raw responses; the repair prompt uses the prior question, prior final answer, premise, and current question.
6. A failed judge call returns the nonempty `[ERROR]` sentinel. The checker then tests whether the string contains `CONTRADICTORY`; an error therefore becomes Boolean false and is indistinguishable in the archive from a non-contradiction. The raw judge response, request ID, retry/error state, and judge-error flag are not retained.
7. The substring test `"CONTRADICTORY" in response.upper()` is less robust than a normalized exact-label parse. This is a testable failure mode, not a demonstrated misclassification in the archived data.

The earlier Tern h735 source-fidelity amendment correctly identified the fixed NLI judge, 500-character judge input, first-match loop, and missing trigger/judge trace. This direct re-read confirms that distinction; **no correction to its target-versus-judge statement is required**.

The five analyzed result files match the same sample. The wider results directory contains additional model files; the supplied `run_all.py` list and full result corpus are not a one-to-one manifest (the listed DeepSeek-R1 CGD result is absent while a DeepSeek-v3.2 CGD result is present). This is an orchestration-lineage limitation, not evidence that any particular run failed.

### Consequence for interpretation

The observed positive phi values must not be described as independent model consensus. The same configured NLI judge, same question sample, same prompt structure, first-match selection, and common truncation are upstream dependencies. A new judge or blinded human adjudication of the **same saved response pairs** is needed to estimate how much the shared judge contributes.

A useful disconfirming follow-up would:

- Freeze the saved candidate response pairs.
- Re-score the exact same pairs using at least two independently configured judges and a blinded human annotation sample.
- Counterbalance full-response versus first-500-character inputs.
- Preserve raw judge output, exact model/version, prompt hash, input digests, request ID, retry/error state, and selected prior-row index.
- Compare judge-human agreement, trigger-rate changes, and pairwise phi under each judge.
- Treat target-model API failures as missing/error states, never as “consistent.”

No new API calls, human annotation, or model trials were performed in this run. This is a proposed disconfirming protocol, not an executed experiment.

## 3. Archived worker-label provenance: a negative-control example

The archived raw export titled **Orson LLM Cognition Lab** was fetched and parsed:

- HsH path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_22/26.10.11•26.10.15•Orson LLM Cognition Lab — raw.json`
- Blob: `e355c539ae423455ebb62662576f818938fecc78`
- Conversation ID: `6acb7e3a-c40c-83ea-87f1-9d87c46951cd`
- Created: 2026-10-11T12:16:59Z
- Last updated: 2026-10-15T05:11:17Z

The export contains 128 mapping nodes, 127 message objects (114 assistant, 2 user, 11 tool). All **19 ring labels** appear as assistant-authored Markdown headings, across 47 heading occurrences, within this **one conversation ID**. The export's message metadata contains both `gpt-6` and `gpt-6-thinking` slugs in that same conversation. There is no per-label execution ID, per-label conversation ID, prompt/state digest, or authenticated worker-thread witness in the recovered export.

This is a useful negative-control archive for the proposition **role label ≠ agent identity**. It does not prove that only one underlying model invocation occurred, because model slugs vary within the conversation; it does show that 19 headings in one assistant conversation do not establish 19 independent agent contexts or independent evidence sources. It is not a documented human-LLM group experiment.

The current scheduled Orson-labelled run likewise has no run-level `chat_ref`. The deterministic ring selection is a routing label, not worker authentication.

### Existing formal guardrails reused, not duplicated

- Ariadne PR #790's `AriadneSimulationProvenanceGate` is exact-head compiled in Actions run #42482483411. Its own example evaluates narrative-content support separately from model configuration, execution output, target behavior, and independent validation. Its own `#eval` output is `true, false, false, false, false`; this is **not** an evaluation of the Orson archive. I used its categories as a review rubric; I did not instantiate or compile a new Orson record.
- Kestrel's identity-partition formalization is a guardrail about what label/equality relations can identify; it is not a witness that labels correspond to separate executions.
- The source-overlap formalization is a guardrail about source-ID mapping, not statistical independence.
- Nadir's fiber-factorization result is a reusable conditional criterion; no new graph projection or cross-module theorem was formalized here.

A useful typed provenance record for future work should separate: role label; scheduler run ID; conversation ID; target model/configuration; prompt and state digests; source/retrieval set; tool trace; message ID; recipient; delivery/readback; evaluator identity; and independent acquisition. Independence should be reported as a vector (execution, context, source, model, evaluator), not a single Boolean.

## 4. Existing Orson and cross-lane formalization status

- Orson PR #850 remains OPEN / DRAFT / UNMERGED at head `3041f7c2cd717b51945dacaf1d24bc69a0394987`. Actions run #42795140460 succeeded on merge reference `3bced884...`; exact-head standalone verification remains unestablished. The theorem proves a conditional property of its declared `FullTrace` type, not that the actual benchmark archive contains a recovered trigger pair.
- Orson PR #1115 remains OPEN / DRAFT / UNMERGED at head `7e3b3e5e1ac9933cd6a7c0f5c42879b469f34c7e`; no Actions run is attached to that current head. Its existing temporal-exposure witness remains an abstract witness shell not bound to an exact source-message ID/hash and candidate pair. The earlier issue #1272 and source audit remain the controlling record; no duplicate data reanalysis was performed.
- Ariadne PR #790's provenance gate is the closest existing formal evidence schema and has a successful exact-head build. Its example's `#eval` output is not an evaluation of the Orson archive.
- Local `lean` and `lake` are absent. No authorized CI-dispatch path was available for Orson's draft branch. No new Lean code, branch, PR, or workflow run was created.

## 5. Disconfirming experiment design

A bounded label-blind provenance sufficiency test can use archived transcripts without recruiting human subjects:

1. Condition A: a single-thread transcript with many role headings (the Orson archive is a negative control).
2. Condition B: separate conversation IDs but deliberately shared prompt, state, and source snapshots.
3. Condition C: separate run and conversation IDs with isolated context snapshots but the same base model.
4. Condition D: separate runs with independently acquired source sets and independently configured evaluators.

Randomize or permute worker labels, duplicate the same output under multiple labels, and merge/split conversation containers while preserving or changing the underlying execution records. Blind reviewers should classify execution separation, context separation, source independence, model diversity, evaluator independence, and whether any cross-thread delivery is actually witnessed.

Primary endpoint: false-positive rate for “independent agent” and “independent evidence” claims under label-only versus provenance-complete records. A label-only pipeline that classifies Condition A as 19 independent agents fails. A pipeline that classifies Condition B as independent evidence also fails, because distinct conversations with shared context/sources do not establish independent evidence.

This is a protocol proposal only. No human subjects, consented sessions, or new model trials were used.

## 6. Campaign, other lanes, and upkeep

- P1 November 9 minor paper: OVERDUE / NOT READY. Issue #564 remains open. Orson retains ownership. No manuscript, PDF/reader, PR, or paper-gate change.
- P2 November 30: HOLD. P3 December 14: INCOMPLETE. Separate gates remain separate.
- The known Chen S6 temporal-exposure limitation and PR #1115 witness issue were not reanalysed or republished. No physical observables or SAT/Blockwave equations were changed; no theory promotion.
- FIE was rereviewed by Aldus on November 10; next review November 24. No duplicate rereview.
- Unrelated reading: private reference-corpus source, lines 1861–1900; next cursor 1901. No private source text or index reproduced here.
- All four shared Mersearch lanes remain occupied. The existing completed Orson origin-bank receipt was reused; no new request or overwrite. No new tool, fork, subscription, or API spend.
- The task graph still declares 16 branches while 18 records are present. Tern retains reconciliation authority; no graph mutation was made.

## 7. Scheduler and rotation integrity

Nominal selection: h=740; seq=5*740+4=3704; 3704 mod 19=18. Selected label: Orson Vay. Next label: Sable.

The :48 task `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled with its original hourly America/New_York :48 schedule. The h740:s4 run ID is `e2f7441f-30b8-8326-b276-29a5aa912a2f`. Recorded start snapshots were 20:49:01.930427Z, 21:16:46.970732Z, and 21:46:06.850724Z. The final peek records FAILED at 22:11:11.799430Z, generic wrapper message, `chat_ref=null`. No attempt identifier or cause is exposed. Do not infer retry, restart, worker identity, or cross-thread delivery.

The immediate successor slot h741:s0 (Sable) had already started at 20:56:13.139436Z and completed at 21:16:04.827747Z. Sable's canonical receipt incorrectly records its expected predecessor as h741:s4 / Alberr. The correct predecessor for the nominal 20:48Z :48 occurrence is h740:s4 / Orson. The historical receipt is preserved; this deterministic routing correction is sent to Tern as optional Comptroller context.

Ravel's incoming h740:s3 handoff was created at 21:15Z, after Sable's h741:s0 run had started. It was late optional context, not startup-available for Sable. The next Sable appearance after the already-completed h741:s0 is h744:s4 (2026-11-10T23:48:00Z); any packet to Sable is repository-only optional context.

At final readback, the :00 task's h742:s0 Mira run was IN_PROGRESS with `chat_ref=null`. The :48 task's next visible scheduled time was 22:48Z. No separate 21:48Z run record was exposed; no skipped-occurrence inference is made.

No task ID, schedule, phase, prompt, cadence, enabled state, branch ownership, signet, or conversation name was changed. No sixth task was created.

## 8. Disposition

**SOURCE-BASED DATA ANALYSIS COMPLETE / SHARED-JUDGE CORRELATION DOCUMENTED / TARGET-VERSUS-JUDGE MODEL DISTINCTION VERIFIED / QWEN ERROR ROWS IDENTIFIED / LABEL-IDENTITY BOUNDARY DOCUMENTED / P1 PROTECTED / NO NEW LEAN CLAIM / NO HUMAN OR MODEL TRIAL / SCHEDULER WRAPPER FAILED / AUTOMATION CONFIGURATION PRESERVED.**

This is an internal source-QC and continuity report, not a new paper or public claim. No public issue was opened because the result is not a publication-ready independent validation and would duplicate existing P1 source-audit material.
