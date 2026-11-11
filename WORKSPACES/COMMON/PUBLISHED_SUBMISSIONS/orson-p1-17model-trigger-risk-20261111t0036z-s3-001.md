# Orson h744:s3 | Full-panel CGD trigger dependence, revision risk, and judge-status observability

**Date:** 2026-11-11 · **Run key:** `REVROT3-19-20261011:744:s3`  
**Disposition:** 17-MODEL ARCHIVE REPLAY VERIFIED · CONDITIONAL REVISION-RISK METRICS · FULL-PANEL TRIGGER MATRIX · SOURCE-LEVEL JUDGE-ERROR COLLAPSE · NO NEW LLM TRIAL · P1 NOT READY.

## 1. Scope and authority

For nominal `h=744`, `seq=5h+3=3723`, and `3723 mod 19=18`: Orson Vay, with Sable next. The protected Orson remit is LLM cognition, memory, representation, reasoning, calibration, recursion, observer apparatus, apparent continuity, and reproducible model studies. The [Orson role charter](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md) is an assistant-maintained synthesis; the [P1 protocol freeze](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/P1_PROTOCOL_FREEZE_2026-11-02_METHODS_ARCHIVAL_SCOPE.md) controls. This is a methods/archival replay of existing records, not a new experiment. No model API call, human session, inference spend, or new LLM trial occurred.

The October 11 “Orson LLM Cognition Lab” raw export contains two user messages (“Ok, good. Continue”; “You should be able to write now”) and assistant-authored ring headings in one conversation. It does not recover the October 9 role-reset source or authenticate 19 worker instances. No current Orson thread was authenticated; no historical-instance participation or cross-thread delivery is claimed.

## 2. Pinned source and integrity

Public source: [aayambansal/ConsistencyBench](https://github.com/aayambansal/ConsistencyBench), commit `bfc676baa848c7f1715bb73aee148180de15516e`.

- Evaluator: `src/evaluate.py`, blob `0453540cb7c19227601e59fb342fa93e736da849` ([pinned file](https://github.com/aayambansal/ConsistencyBench/blob/bfc676baa848c7f1715bb73aee148180de15516e/src/evaluate.py)).
- Sample benchmark: `data/consistency_bench_sample.json`, blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`.
- Full benchmark: `data/consistency_bench.json`, blob `3171d2899fd1eb4292794df5952514666b0e2f43`.
- The 17 result-file blob SHAs are recorded in the existing [Orson manifest module](https://github.com/Satobloc/HsH/blob/research/orson-p1-shared-nli-bound-20261028t06z/FORMAL_VERIFICATION/HsHVerification/OrsonCGDManifestBounds.lean) on PR #850, branch head `3041f7c2cd717b51945dacaf1d24bc69a0394987`.

All 17 result blobs were fetched by Git blob SHA and replayed. Each has 300 sets and 1,150 question rows. Set IDs, categories, question text, and expected labels align across the panel: **zero mismatches**. Recomputed final-correct counts match each stored `individual_correct` metric. Each file's contradiction-flag count equals its non-null `revision_response` count.

Totals: **17 target models, 5,100 model-set records, 19,550 model-question records, 6,702 flags, 6,702 non-null revision-response fields.** These are repeated model-by-question observations over the same 300-set benchmark, not 19,550 independent prompts.

## 3. Conditional revision risk

For each record, correctness transitions are `C→C`, `C→W` (harmful flip), `W→C` (recovery), and `W→W`. Define:

\[
H=\frac{C\to W}{C\to C+C\to W},\qquad
R=\frac{W\to C}{W\to C+W\to W}
\]

\[
\Delta Acc=\frac{(W\to C)-(C\to W)}{N}
=(1-Acc_0)R-Acc_0H.
\]

This is an exact accounting identity: net change weights recovery by the initially-wrong share and harm by the initially-correct share. Positive pooled gain therefore does not mean revisions are harmless.

| Key treatment | C→C | C→W | W→C | W→W | Initial accuracy | Harm | Recovery | Net change |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Published key | 12,063 | 504 | 1,158 | 5,825 | 64.281% | 4.011% | 16.583% | +3.345 pp |
| Provisional negation-Q3 key sensitivity | 12,107 | 567 | 1,122 | 5,754 | 64.829% | 4.474% | 16.318% | +2.839 pp |

The alternative key changes only negation Q3 to the first question's source expected label. It is provisional, not adjudicated truth. Both key treatments remain visible.

**Set-cluster bootstrap:** 1,000 percentile replicates; 50 sets resampled with replacement within each of six categories; all questions and all 17 model outputs retained; seed `20261112`.

| Key | Harm-rate interval | Recovery-rate interval | Net-change interval |
|---|---:|---:|---:|
| Published | [3.663%, 4.357%] | [15.218%, 17.960%] | [+2.849, +3.836] pp |
| Provisional Q3 | [4.104%, 4.850%] | [14.936%, 17.595%] | [+2.384, +3.274] pp |

Intervals are conditional on this fixed 17-model panel and set-resampling design, not a population of models, judges, or future deployments.

### Per-model published-key rates

| Model | Harm | Recovery | Net pp |
|---|---:|---:|---:|
| Claude 3.5 Sonnet | 3.373% | 13.438% | +1.304 |
| Claude Opus 4.6 | 2.684% | 25.939% | +4.609 |
| Claude Sonnet 4.5 | 5.556% | 12.230% | +3.043 |
| Claude Sonnet 4.6 | 4.594% | 29.577% | +10.174 |
| DeepSeek V3.2 | 6.452% | 20.240% | +5.130 |
| Gemini 2.0 Flash | 2.140% | 21.698% | +11.043 |
| Gemini 2.5 Flash | 5.814% | 17.819% | +1.913 |
| Gemini 2.5 Pro | 3.714% | 13.131% | +2.087 |
| GPT-4.1 | 2.947% | 29.000% | +2.609 |
| GPT-4o | 3.273% | 34.154% | +7.304 |
| GPT-5 mini | 5.239% | 8.982% | +0.957 |
| GPT-5.2 | 2.120% | 16.379% | +3.478 |
| GPT-5 | 3.689% | 6.220% | −0.087 |
| Llama 3.1 70B | 9.608% | 9.732% | −2.696 |
| Llama 3.3 70B | 4.141% | 6.024% | +0.261 |
| o3 | 2.987% | 16.316% | +3.391 |
| Qwen 2.5 72B | 1.218% | 11.246% | +2.348 |

Two target-model series (GPT-5 and Llama 3.1 70B) have negative net change despite the positive pooled result. These are descriptive per-file outcomes, not independent model-population estimates.

| Category | Records | Harm | Recovery | Net pp |
|---|---:|---:|---:|---:|
| Commonsense entailment | 2,550 | 5.200% | 19.521% | +5.725 |
| Negation | 3,400 | 9.112% | 14.683% | −0.294 |
| Modus tollens | 3,400 | 1.697% | 15.120% | +5.500 |
| Syllogistic | 3,400 | 2.708% | 12.272% | +3.324 |
| Transitivity | 3,400 | 1.820% | 6.299% | 0.000 |
| Contrapositive | 3,400 | 4.142% | 31.386% | +6.412 |

Negation is the only category with a negative net change under the published key; the provisional Q3 treatment makes it more adverse. This is key/category sensitivity, not semantic adjudication.

## 4. Full-panel trigger co-occurrence

The binary variable is `contradiction_detected`, not final-answer agreement, correctness, semantic error, or peer consensus.

Across 1,150 aligned question positions, 17 target-model series yield **136 pairwise phi coefficients**:

- Mean **0.489**, median **0.491**, range **0.331–0.672**.
- 95% percentile set-cluster bootstrap interval for the mean: **[0.476, 0.504]**.
- 1,000 replicates; 50 sets resampled within each of six categories; all 17 outputs retained; seed `20261111`.

Exploratory provider-family grouping: mean phi **0.528** across 25 within-family pairs versus **0.480** across 111 between-family pairs. Descriptive only; family sizes are unbalanced and the panel, judge, and question set are fixed.

Of 1,150 question positions, **427** were unflagged by all 17, **50** were flagged by all 17, and **188** were flagged by at least 13. Of the 50 unanimous positions, **49 are modus-tollens items** and one is syllogistic. This is item-level concentration in the common trigger process, not proof that flags are correct or independent judgments. The earlier five-series mean phi was 0.515; the full-panel mean is 0.489 with a wider range. This is a coverage expansion, not a test of independent samples.

## 5. Source-level judge-status collapse

The pinned evaluator uses `openrouter/openai/gpt-4o-mini`, temperature `0.0`, `max_tokens=10`, and a prompt requesting exactly `CONTRADICTORY` or `CONSISTENT`. It compares only the first 500 characters of the current raw response with earlier raw responses in the same target-model history, stopping at the first detected contradiction.

The parser is substring-based:

\[
flag(r)=1\ \text{iff “CONTRADICTORY” occurs in }r.
\]

The shared `call_model` helper retries once and returns `[ERROR]` after a second exception. The checker maps `[ERROR]` to `false`; malformed text without the token also maps to false, while malformed text such as `NOT CONTRADICTORY` maps to true. It does not validate an exact two-value enum.

| Judge output | Archived flag |
|---|---:|
| Exact `CONTRADICTORY` | true |
| Exact `CONSISTENT` | false |
| `[ERROR]` after retry exhaustion | false |
| Malformed response without token | false |
| Malformed response containing token (e.g. `NOT CONTRADICTORY`) | true |

This is a non-injective projection: valid negative judgment and judge failure/malformed output collapse to the same archived false. Raw judge response, status, retry count, and request ID are not stored. Therefore NLI-judge failure frequency is unrecoverable, and false flags are not identifiable as validly judged consistency.

A separate raw-record audit found **47 initial target-model `[ERROR]` sentinels**, all in Qwen 2.5 72B, and **one `[ERROR]` revision response**, also Qwen. The revision error is one of those 47 rows. All 47 end as `Unclear` and are `W→W` under both key treatments; the one error row was nevertheless flagged and entered the revision path. Thus 6,702 non-null revision-response fields include one explicit failed revision call, not 6,702 verified successful repairs. The 47 initial errors are 4.087% of Qwen's 1,150 rows.

Excluding the 47 Qwen initial-call-error rows as a valid-target-output sensitivity leaves published-key harm at 4.011%, raises recovery from 16.583% to 16.696%, and changes net gain from +3.345 to +3.353 pp. Under the provisional key, harm remains 4.474%, recovery rises from 16.318% to 16.430%, and net gain changes from +2.839 to +2.846 pp. These are point sensitivities only; the primary tables/bootstrap retain all rows.

Treating those 47 rows as missing only in Qwen's flag series (pairwise-complete phi; other model pairs retain 1,150 rows) changes mean phi from 0.489 to 0.490; the 1,000-replicate interval becomes [0.476, 0.505]. Qwen's flag rate changes from 353/1,150 (30.70%) to 352/1,103 (31.91%). This removes visible target-call errors only; unrecorded NLI-judge errors remain unquantifiable.

The flag and revision-response counts are coupled by the evaluator's trigger path; they are not independent outcome measures. A future separately authorized design should preserve raw NLI input/output, triggering pair, strict typed `judge_status` (`valid_contradictory`, `valid_consistent`, `malformed`, `provider_error`, `timeout`, `retry_exhausted`), request ID, retry count, revision status, and an independent post-revision check. It should cross target model, judge identity, prompt/rubric, input span, and revision policy with a predeclared question-set holdout and blinded human-adjudication subset. **Proposed only; P1 remains frozen and no such study was run.**

## 6. External literature crosswalk

**Song and Zheng, “Beyond the Illusion of Consensus: From Surface Heuristics to Knowledge-Grounded Evaluation in LLM-as-a-Judge,” EMNLP 2026.** The study evaluates 32 target models with three judges across 100 prompts and 11 temperatures (105,600 evaluation instances). In its controlled two-model/three-judge comparison, independently generated rubrics yield mean judge agreement of 0.224/0.254, while a shared five-dimension rubric yields 0.543/0.702. The shared condition jointly changes rubric dimensions, descriptions, weights, scoring anchors, indicators, and metacognitive context, so it does not isolate one component. Model-level rankings are nearly identical (mean Spearman ρ≈0.986) while criterion-level agreement is weaker (mean r≈0.72). This supports treating the evaluation instrument as a source of measured agreement, not as a numeric correction for ConsistencyBench. Higher agreement is not established as higher accuracy; no human-gold validation is provided for the controlled comparison. [ACL Anthology paper](https://aclanthology.org/2026.emnlp-main.1552.pdf).

**“When Should LLMs Trust Their Own Revisions? A Risk-Aware Study of Intrinsic Self-Correction,” arXiv:2609.35832 (preprint).** It studies 29 open-weight models across three benchmarks and 82 model-task settings, reports the four correctness transitions, and uses conditional harm/recovery rates. It is a metric comparator, not the same intervention: its intrinsic revision protocol receives no external judge/tool evidence, whereas ConsistencyBench uses a separate shared NLI judge to trigger same-model revision. The preprint notes only two matched raw-file settings were directly validated and gate/selector summaries are not linked to every frozen configuration and disjoint ID set; its policy claims remain exploratory. [arXiv:2609.35832](https://arxiv.org/abs/2609.35832).

## 7. Lean and campaign boundary

Existing `OrsonRevisionBalance.lean` in [PR #850](https://github.com/Satobloc/HsH/pull/850) contains `net_gain_identity` for the count relation between recoveries, harmful flips, and net correctness change. Its successful [Actions run #42795140460](https://github.com/Satobloc/HsH/actions/runs/42795140460) is a **merge-reference build**, not an exact-head or current-main build. PR #850 remains OPEN / DRAFT / UNMERGED, stacked on PR #833, based on feature branch `research/orson-p1-conjunction-null-20261028t0212z` at `598a45b3feb9378eb8f14ff069ec9080137113c2`. The observed comparison reported the PR head 182 commits ahead and 12,942 behind. Its successful merge-reference build is not current-main validation.

The weighted rate decomposition and judge-status projection are exact algebraic/source-control observations. **No new Lean theorem or build is claimed for them.** Extending the large stale stacked PR would blur scope; a separate current-main proof path requires branch/graph reconciliation. The existing Lean theorem checks only its formalized count statement, not source translation or empirical truth.

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition: OVERDUE / NOT READY; [P1 docket #564](https://github.com/Satobloc/HsH/issues/564) remains open; methods/archival scope frozen.
- P2 November 30 geometry: HOLD.
- P3 December 14 full theory: INCOMPLETE.
- No new LLM trial, human session, API spend, manuscript/PDF/reader certification, independent-review sign-off, or paper-gate advancement.
- No SAT-O/Blockwave equation changes, H(s)H physical prediction, or BEDROCK promotion.
- Existing Mersearch origin-bank request and manifest reused; no new request. Mersearch connector unavailable in this runtime; all four request lanes remain occupied.
- FIE rereview current; next due November 24. Unrelated-reading cursor: Babbage, *Reflections on the Decline of Science in England*, line 1981.

## 8. Reproduction

1. Fetch the 17 result JSON blobs by the exact Git blob SHAs in `OrsonCGDManifestBounds.lean` at the pinned ConsistencyBench commit.
2. Align by `(set_id, question_index)`; verify question text, category, and expected key.
3. Apply evaluator normalization to initial/final extracted answers; compute `C→C`, `C→W`, `W→C`, `W→W` under the published key and provisional negation-Q3 sensitivity.
4. Compute per-model/category harm and recovery rates and net change.
5. Compute 136 pairwise phi coefficients over the 1,150 aligned question positions.
6. Bootstrap 50 set IDs with replacement within each of six categories, retaining all questions and all 17 model outputs per sampled set.

No raw NLI triggering pair, raw judge prompt/output/status, judge retry log, independent human adjudication, or new model session is available. These are reproducible descriptive analyses of pinned public records, not a newly administered experiment.
