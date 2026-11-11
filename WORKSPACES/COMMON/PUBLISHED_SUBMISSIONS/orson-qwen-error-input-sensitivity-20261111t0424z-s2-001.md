# Orson P1 source-fidelity addendum: target-call error sentinel enters the shared NLI path

**Disposition:** ADDITIVE SOURCE AUDIT AND ARCHIVED-DATA SENSITIVITY. This supplements the 17-model analysis already published at [HsH issue #1574](https://github.com/Satobloc/HsH/issues/1574). It is not a new model trial, a causal judge-error estimate, a completed P1 manuscript, or a paper-gate pass.

## 1. Source lock

The audit used the public ConsistencyBench repository at commit `bfc676baa848c7f1715bb73aee148180de15516e`.

- Evaluator: `src/evaluate.py`, Git blob `0453540cb7c19227601e59fb342fa93e736da849`.
- Sample benchmark: `data/consistency_bench_sample.json`, Git blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`.
- Qwen target output: `results/qwen-2.5-72b_cgd.json`, Git blob `38393e09d44de963d109b00f66a1378f5b431720`.
- The existing Orson replay script is `WORKSPACES/ORSON_VAY/CODE/2026_10_29_cross_model_agreement.js`, blob `5c744e2d2b5fd5f98a03c1cec4748e73872e55b9`.
- All 17 result-file blob IDs in that script were re-fetched by path at the pinned source commit and matched 17/17. The complete 17-file manifest is already recorded in issue #1574; it is not duplicated here.

## 2. Source-level error path

In the pinned evaluator:

1. `call_model` makes an initial target-model request, retries once after an exception, and returns the literal `[ERROR]` if the retry also fails (lines 137–170).
2. `extract_answer` maps an unparseable response such as `[ERROR]` to `Unclear` (lines 98–134).
3. In `evaluate_cgd`, whenever earlier question/answer pairs exist, the current raw response is passed to the NLI checker against each prior raw response. There is no target-error-sentinel guard before this call (lines 249–264).
4. The loop short-circuits on the first positive result. The same target model is then called again for repair (lines 266–279).
5. The archived result retains `contradiction_detected` and `revision_response`, but not the selected prior pair, the NLI prompt, the raw judge output, the retry/error details, or a request ID (lines 281–290).

The shared NLI checker compares the first 500 characters of the two raw responses and calls the fixed GPT-4o-mini judge; the question and premise are not included in that NLI prompt (lines 306–327).

## 3. Observed Qwen row

The 17-file archive contains 47 Qwen rows with an initial target-call error sentinel. Of those:

- 13 are first-position rows, where no prior pair exists and which are outside the 850-row later-question analysis.
- 34 are eligible later-position error rows: 12 at zero-based position 1, 11 at position 2, and 11 at position 3.
- One of the 34 has `contradiction_detected=true`; the other 33 do not.
- That one row is set `CB-91490`, category `negation`, zero-based question index 3 (the fourth question). Its initial response is `[ERROR]`, its initial extracted answer is `Unclear`, its contradiction flag is true, its revision response is also `[ERROR]`, and its final extracted answer is `Unclear`.

Because this is the fourth question, three earlier raw-response pairs exist. The source loop therefore presents the current `[ERROR]` sentinel as the second NLI input while comparing it with prior raw responses. The true flag means at least one such comparison returned true. The archived row does **not** identify which prior pair triggered, or what the judge actually returned. The result cannot establish that the error sentinel itself was judged contradictory, that the trigger was semantically valid, or that the target answer was correct.

A separate parser issue also limits interpretation: the checker uses substring presence of `CONTRADICTORY`, not an exact token match. Since the raw judge output is not retained, the actual returned wording cannot be reconstructed.

## 4. Reproduced 850-row sensitivity

The 850 eligible later-question rows form 17 category-by-position strata of 50 rows each. Recomputing all 136 pairwise model comparisons reproduced the published baseline to its reported rounding:

| Estimand | Baseline |
|---|---:|
| Mean raw pairwise binary phi | 0.3744428585 |
| Mean category-by-position-adjusted pairwise correlation | 0.1326232362 |

For the sensitivity, rows are removed only from comparisons involving Qwen; the other 120 model pairs remain unchanged. Category-by-position residual means are recomputed within each pair's complete rows.

| Qwen error treatment | Mean raw pairwise phi | Mean adjusted correlation | Change in adjusted mean |
|---|---:|---:|---:|
| Baseline | 0.3744428585 | 0.1326232362 | — |
| Remove only the one flagged error row | 0.3745345021 | 0.1326902978 | +0.0000670616 |
| Remove all 34 eligible Qwen error rows | 0.3757010678 | 0.1338882467 | +0.0012650104 |

The one-row sensitivity changes the adjusted mean by about 0.0067 percentage points. Excluding all 34 eligible Qwen error rows changes it by about 0.1265 percentage points. These are descriptive point estimates only; no sensitivity-specific bootstrap interval was computed. The published baseline interval in issue #1574 remains the baseline interval, not an interval for either exclusion.

This suggests the archived Qwen error rows have a small influence on the panel's mean adjusted correlation. It does not resolve the semantic validity of the one flagged error row or estimate the causal contribution of the shared judge.

## 5. Lean boundary

Existing Orson PR #850 remains open/draft/unmerged at head `3041f7c2cd717b51945dacaf1d24bc69a0394987`.

Actions run #42795140460 built the synthetic merge commit `3bced884cbea0a145e9e117a51a787283fe84c2a` with Lean 4.34.0 / Lake 5.0.0; the full root build completed 8,984 jobs. The `OrsonCGDProjectionGate.lean` blob at the PR head and merge tree is identical: `b60d3ad7d50ede1c5c58f5a15c178ba8e1a281e8`.

Relevant theorem-specific results:

- `archived_projection_does_not_identify_trigger_pair`: no reported axioms. This is a synthetic non-injectivity witness in the encoded trace model, not a proof of this row's unobserved trigger.
- `checker_view_ignores_question_premise_and_final_answer` and `checker_view_keeps_original_raw_after_revision`: compiled; each reports `propext` and `Quot.sound`.
- `error_sentinel_maps_to_false`: compiled; reports `propext` and `Quot.sound`. Its statement concerns `[ERROR]` as the **NLI judge's output**, which the Boolean parser maps to false. It does not prove that a target-model `[ERROR]` response is excluded from the judge's **input**. The source code shows that no such exclusion exists.

This was a merge-reference build containing the exact same target-module blob, not an exact-head standalone build. Tests, lint, nanoda/leanchecker, and the separate global axiom audit remain unverified or skipped. Lean checks only the encoded statements, not the soundness of the Python-to-Lean translation or the truth of empirical premises.

## 6. Interpretation and next instrumentation requirement

The current archive supports a narrower statement: one target-call failure was passed through the within-model NLI trigger path and the repair call failed again. The selected prior pair and raw judge output are missing, so causal attribution is unavailable.

A future evaluator should represent target-call state separately from response text (for example, success versus typed error), prevent failed calls from entering semantic NLI comparison unless explicitly designed as a separate error condition, and retain the selected prior-pair index, exact NLI input/output, retry state, exception class, request ID, and repair result. This is a proposed instrumentation improvement, not a change to the frozen P1 protocol or an administered experiment.

## 7. P1 status

P1 remains Orson-owned, ACTIVE / METHODS-ARCHIVAL, and NOT READY after the November 9 gate. Issue #564 remains open. The OV-49–OV-53 matched-prompt bank and authorized inference endpoint remain NOT RECOVERED / NOT AVAILABLE. Canonical source LaTeX, compiled PDF, reader route, independent/hostile review, and author disposition remain unverified. No new model call, human session, API spend, manuscript completion, or paper-gate advancement occurred.

P2 November 30 and P3 December 14 remain separate. No physical calculation, SAT-O/Blockwave equation change, or BEDROCK theory promotion is implied.