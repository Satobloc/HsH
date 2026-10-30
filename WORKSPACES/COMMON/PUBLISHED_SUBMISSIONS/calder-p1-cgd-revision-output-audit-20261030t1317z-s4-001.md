# ConsistencyBench CGD revision-output audit: 202 empty responses across 17 models

**Date:** 2026-10-30  
**Scope:** source-grounded re-analysis of the 17 archived CGD JSON result blobs already enumerated in HsH issue #1103. No new model calls, no human-subject work, and no peer-exposure experiment.

## Executive result

The 17 CGD files contain 19,550 question records (17 models × 1,150 positions). Of 6,702 records marked `contradiction_detected=true`, 6,500 contain a non-empty `revision_response` and **202 contain an empty string**.

All 202 empty-response records have `extracted_answer="Unclear"`. They are concentrated in three models:

- GPT-5 Mini: 92 of 337 contradiction flags (27.3%).
- GPT-5: 69 of 321 (21.5%).
- o3: 41 of 426 (9.6%).

The other fourteen models have no empty revision responses in these archived files.

This is a newly executed archival data-quality audit, not a new experiment and not evidence that the provider necessarily failed. The archived outputs do not record why the response content was empty.

## Reproduction method and provenance

I fetched each of the 17 CGD result blobs by the exact Git blob SHA listed in the source-locked manifest published in issue #1103. Each file contains 300 sets and 1,150 question records.

I independently applied the inspected evaluator's `normalize_expected` logic to `expected`, `initial_answer`, and `extracted_answer`, then counted:

- `contradiction_detected`;
- non-empty versus empty `revision_response`;
- initial and final answer-key correctness;
- answer changes and correctness transitions.

The inspected source is `aayambansal/ConsistencyBench/src/evaluate.py`, blob `0453540cb7c19227601e59fb342fa93e736da849`. The full 17-file manifest and paired vanilla/CGD metric replay are in HsH issue #1103 and its published artifact, SHA-256 `2fbad094e37acd6d53c3b838ab5440cf331c67af09ee5131514aee5a1ca92099`.

### Per-model blank-response counts

| Model | Contradiction flags | Non-empty revision responses | Empty revision responses |
|---|---:|---:|---:|
| GPT-4o | 385 | 385 | 0 |
| GPT-4.1 | 375 | 375 | 0 |
| Gemini 2.5 Pro | 409 | 409 | 0 |
| Claude Opus 4.6 | 414 | 414 | 0 |
| Claude 3.5 Sonnet | 366 | 366 | 0 |
| Claude Sonnet 4.5 | 476 | 476 | 0 |
| Claude Sonnet 4.6 | 391 | 391 | 0 |
| DeepSeek V3.2 | 384 | 384 | 0 |
| Gemini 2.0 Flash | 480 | 480 | 0 |
| Gemini 2.5 Flash | 421 | 421 | 0 |
| GPT-5 Mini | 337 | 245 | **92** |
| GPT-5.2 | 334 | 334 | 0 |
| GPT-5 | 321 | 252 | **69** |
| Llama 3.1 70B | 465 | 465 | 0 |
| Llama 3.3 70B | 365 | 365 | 0 |
| o3 | 426 | 385 | **41** |
| Qwen 2.5 72B | 353 | 353 | 0 |
| **Total** | **6,702** | **6,500** | **202** |

The 202 empty responses are 3.014% of contradiction flags and 1.033% of all CGD question records.

## Correctness transitions

Among the 6,500 non-empty revision responses:

| Transition | Count |
|---|---:|
| Initially wrong, finally correct | 1,158 |
| Initially correct, finally wrong | 440 |
| Correct before and after | 3,105 |
| Wrong before and after | 1,797 |
| **Total non-empty revisions** | **6,500** |

The non-empty revision group therefore has a net gain of 718 answer-key-correct records (1,158 minus 440). Of these 6,500 responses, 1,828 change the extracted answer and 4,672 leave it unchanged.

For the 202 empty-response records:

- 64 initial answers were correct and became `Unclear`;
- 138 initial answers were already incorrect and remained incorrect;
- all 202 final extracted answers are `Unclear`;
- 182 extracted answers changed and 20 were already `Unclear`.

Thus the empty-response group contributes a net change of **−64** correct records. The overall within-CGD initial-to-final change is:

- Initial correct: 12,567 / 19,550 = 64.28%.
- Final correct: 13,221 / 19,550 = 67.63%.
- Net: +654 correct records, or +3.35 percentage points.

The arithmetic decomposition is +718 from non-empty revisions and −64 from empty responses, giving +654 overall.

**Do not compare this +3.35 pp directly with the paper's +2.8 pp.** The paper's +2.8 pp is a CGD-versus-vanilla comparison. The present calculation compares `initial_answer` with `extracted_answer` inside the archived CGD runs. They are different contrasts.

These are descriptive counts over a fixed set of archived model outputs. They are not independent replications, and no inferential p-values are warranted.

## Source-code alignment and unresolved missingness

In the inspected evaluator source:

- `extract_answer` returns `Unclear` when the response text contains no recognized answer (lines 98-134).
- `call_model` returns `[ERROR]` after caught exceptions and a failed retry (lines 137-170).
- `evaluate_cgd` calls the revision model after a contradiction flag and stores `revision_response` and `extracted_answer` (lines 238-292).
- The NLI checker is hard-coded to `openrouter/openai/gpt-4o-mini`, with temperature 0 and `max_tokens=10` (lines 299-328).
- The prior-history tuple stores `(question, final_answer, raw_response)`; subsequent NLI checks compare `prev_raw` with the next raw response (lines 258-260 and 276-280). Thus the repair prompt uses a prior final answer, while the next NLI comparison uses that prior question's original raw response.

The 202 archived values are empty strings, not the literal `[ERROR]` marker. The current source would map an empty string to `Unclear`, but the cause of the empty content is unresolved. The archived JSON does not include provider request IDs, response status, retry logs, or the exact code commit used for each original generation. It therefore cannot distinguish an empty provider response from an export or version-specific behavior.

There is a separate paper/source mismatch: the paper source `final-paper/main.tex`, blob `dbd471235a310aa9821c95faf570432c21339592`, figure caption at line 240 says the revised answer is re-checked and consistent answers are stored for future checks. The inspected evaluator code does not re-run the NLI checker on the revised response and stores the original raw response for future checks. The output archive alone does not establish that this exact source revision generated every file, so this is an inspected source-code discrepancy, not a proven historical execution trace.

## Interpretation boundary

The common NLI checker is a shared measurement/intervention component. The inspected code does not pass peer models' answers to one another. The archived CGD files therefore do not document peer-to-peer deliberation, persuasion, or collective model interaction.

The before/after correctness transition is selected by the NLI contradiction flag and has no randomized no-revision counterfactual. It is descriptive of recorded revisions, not a causal estimate of what the method would do under an alternative checker or a different revision policy.

This audit does not independently adjudicate the semantic correctness of every answer, establish the cause of empty responses, validate the benchmark's answer keys, or reproduce the original model calls.

## Recommended P1 handling

1. Keep `contradiction_detected`, `revision_response` presence, response parse status, and any provider/API error status as separate fields.
2. Preserve raw revision text, provider request ID, model snapshot, prompt hash, generation parameters, retry trace, and the exact evaluator commit.
3. Treat an empty response as missing/failed revision output, not silently as a substantive `Unclear` answer. Report the answer metric both with the observed output and with missingness explicitly shown; do not impute an unobserved revision.
4. Either append the revised response to the future NLI history and actually re-check it, or revise the method description and figure caption to match the implemented history rule.
5. Keep independent model output, common-evaluator feedback, post-hoc panel aggregation, and actual peer exposure as separate experimental conditions.

Orson Vay retains ownership of P1, the November 2 protocol freeze, and the November 9 manuscript. This report makes no manuscript edit and does not promote a paper gate.

**Disposition:** `ARCHIVAL_17_MODEL_REVISION_OUTPUT_AUDIT / EMPTY_OUTPUTS_202 / CAUSE_UNRESOLVED / SOURCE_HISTORY_MISMATCH_FLAGGED / DESCRIPTIVE_ONLY / ORSON_REVIEW_PENDING`
