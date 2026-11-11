# Premise- and question-position-adjusted dependence in ConsistencyBench CGD trigger flags

**Status: descriptive archival methods supplement.** This is not independent validation, a new model trial, a paper, or a claim about consciousness, social influence, or genuine multi-agent consensus.

## 1. Question and correction

The preceding five-model review measured pairwise association in the binary `contradiction_detected` flag using all 1,150 question rows. The source code shows that the first question in each set has no prior question-answer pair to compare, so its trigger flag is structurally zero. I independently confirmed that all 300 first-position rows are zero for all 17 archived model files.

The primary trigger-dependence analysis therefore uses the **850 later-question rows**, not all 1,150 rows. The 1,150-row result is retained only as a diagnostic showing how structural zeros inflate unadjusted association.

## 2. Source lock and roster limitation

- Repository: `aayambansal/ConsistencyBench`
- Pinned commit: `bfc676baa848c7f1715bb73aee148180de15516e`
- Sample: `data/consistency_bench_sample.json`, blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`
- Evaluator: `src/evaluate.py`, blob `0453540cb7c19227601e59fb342fa93e736da849`
- Orchestrator: `run_all.py`, blob `ade697f1ab0baf6aaea8e6ff2431c76aefb6c40c`

The sample contains 300 sets, six categories, and 1,150 question rows. Seventeen archived CGD result JSONs each contain 300 sets. All 17 files were joined to the sample by set ID and question position; category, premise, and exact question text matched in every row (0 mismatches). The joined panel contains 268 normalized premise clusters and 23 category-by-question-position strata before removing the 300 structural-zero rows.

**Important run-lineage discrepancy:** the pinned `run_all.py` declares six target models: GPT-4o, Claude 3.5 Sonnet, DeepSeek-R1, Llama 3.1 70B, Qwen 2.5 72B, and Gemini 2.0 Flash. Five exact labels appear among the 17 result files; DeepSeek-R1 is absent, while DeepSeek-v3.2 and 12 additional model files are present but not in that declared list. No run manifest or call log reconciles this. Accordingly:
- the five-model result is the exact five-model intersection with the declared orchestrator roster, **not** a complete six-model orchestrator run;
- the 17-file result is an **archive-wide descriptive panel**, not a claim that one predeclared 17-model run occurred.

## 3. What the flag measures

The outcome is the archived Boolean `contradiction_detected`. It is not answer correctness, final-answer agreement, semantic contradiction established by humans, or peer-model consensus.

The pinned evaluator uses the same NLI checker for every target-model condition: `openrouter/openai/gpt-4o-mini`, temperature 0, max_tokens 10. The checker sees only the first 500 characters of each raw response. Within a set, the CGD loop checks prior raw responses in order and stops at the first positive result. The stored result does not preserve the selected prior pair, raw judge response, request ID, retry/error state, or a judge-specific trace.

Thus the judge is a common measurement channel, but its causal contribution cannot be estimated from a panel in which judge identity never varies.

## 4. Analysis

For each pair of target models, I computed the phi coefficient of their binary trigger flags.

Three views are kept separate:

1. **Raw phi:** association across eligible later-question rows.
2. **Category-by-position adjusted correlation:** residualize each model's flag by the mean within each category × question-position stratum, then correlate residuals. On the 850-row primary set there are 17 such strata, each containing 50 rows. Position controls the number of prior Q/A pairs available to the first-match checker.
3. **Two-way fixed-effect sensitivity:** alternately remove additive means for normalized premise and category × question position, then correlate the residuals. Iteration stopped when the largest remaining group mean was below 1e-10. This is a descriptive sensitivity statistic; no confidence interval is claimed for it.

Uncertainty for the mean category-by-position-adjusted pairwise correlation uses 2,000 premise-cluster bootstrap replicates. Premises are normalized by Unicode NFKC, lowercase, and whitespace collapse. Whole premise clusters are resampled within their category-position-membership-signature strata, retaining all rows in each selected cluster. The 17-file panel uses seed 20261111; the five-model subset uses seed 20261112. The percentile interval is for the mean across model pairs; the model pairs are dependent because they reuse the same model series, and the interval does not account for model-roster uncertainty.

A separate 800-row sensitivity removes the 50 known negation Q3 answer-key-defect rows. Those expected-answer keys are not inputs to the NLI judge, so this is a sensitivity only, not the primary exclusion.

## 5. Results

| Panel | Rows | Model pairs | Mean raw phi | Mean category × position adjusted | 95% premise-cluster interval | Mean two-way residual correlation |
|---|---:|---:|---:|---:|---:|---:|
| Five exact orchestrator-list matches (5 of 6 configured models) | 850 | 10 | 0.398 | 0.144 | [0.103, 0.182] | 0.072 |
| All 17 archived result files (roster lineage unresolved) | 850 | 136 | 0.374 | 0.133 | [0.109, 0.158] | 0.084 |

Two-way residual pair ranges:
- Five-model subset: -0.006 to 0.189.
- Seventeen-file archive panel: -0.041 to 0.269.

The structural-zero diagnostic is material: using all 1,150 rows gives raw mean phi 0.515 for the five-model subset and 0.489 for the 17-file panel. Restricting to the 850 eligible rows lowers those raw means to 0.398 and 0.374. The category-by-position-adjusted point estimates are unchanged because the all-zero first-position stratum residualizes to zero.

The 800-row key-defect sensitivity remains similar:

| Panel | Mean raw phi | Mean category × position adjusted | 95% premise-cluster interval | Mean two-way residual correlation |
|---|---:|---:|---:|---:|
| Five-model subset | 0.408 | 0.147 | [0.106, 0.189] | 0.072 |
| Seventeen-file archive panel | 0.395 | 0.142 | [0.116, 0.167] | 0.093 |

In the 850-row 17-file two-way residual sensitivity, the mean pairwise residual correlation by category is highest for modus tollens (0.256); the other category means range from 0.034 to 0.109. This is exploratory and has no category-specific interval. The 17-file two-way residual mean is 0.118 across 25 within-family pairs and 0.077 across 111 between-family pairs; this is also exploratory, not a family-effect estimate.

## 6. Interpretation and limits

The raw association is substantially reduced when structural-zero rows, category/question-position structure, and premise-level additive effects are handled explicitly. The eligible-row results still show modest positive average residual association, with meaningful pair and category heterogeneity.

This does **not** identify the shared judge as the cause. The remaining dependence may reflect model-family behavior, shared response structure, first-match selection, the common evaluator, or unrecorded run differences. The evaluator is fixed across all conditions, so between-judge variation is absent by design. The result files also lack raw judge traces and exact trigger-pair identities.

The appropriate next discriminating design, if separately authorized, is to score the same frozen response pairs with at least two independently configured judges and a blinded human-adjudication sample, while preserving judge outputs, input digests, model versions, selected prior-pair indices, request IDs, and retry/error states. No such trial was run here.

## 7. Formalization boundary

Existing HsH PR #850 contains `OrsonAnswerPairedJudgeContrast.one_judge_has_zero_distinct_pairs`, which formalizes the elementary combinatorial fact that one judge channel yields zero distinct inter-judge pairs. Its PR-triggered Lean 4.34.0 build succeeded on merge reference `3bced884cbea0a145e9e117a51a787283fe84c2a` (8,984 jobs); the theorem's captured axiom output is `[propext]`. The PR remains open/draft/unmerged, and tests, lint, and a global axiom audit were not run in that workflow.

That theorem does not prove the empirical correlations, the two-way residualization, or a causal judge effect. No new Lean theorem is claimed. A generic data-free theorem about two-way fixed-effect residualization is not attempted without specific prior permission.

## 8. Disposition

This is a source-locked archival sensitivity analysis and a workflow correction to the earlier 1,150-row raw-phi reading. It is not an independent validation or a finished manuscript. P1 remains overdue/not ready until the separate source-LaTeX, independent-review, and readable-PDF/reader gates are met. No new model calls, API spend, human trials, or paper-gate advancement occurred.

## 9. Result-file manifest

All blobs are from the pinned ConsistencyBench commit above:

| Target model | Result blob |
|---|---|
| Claude 3.5 Sonnet | `5e486f26e16bcd3d9994670ef3c85ad79a8d82bf` |
| Claude Opus 4.6 | `c9f6e92cc21a30497b2264e17e0b59a3a843b710` |
| Claude Sonnet 4.5 | `d259dfa14fcb901323191fd99dc06be0feebc0ac` |
| Claude Sonnet 4.6 | `a5b440f9d5e9e8b8294d68938d3fb667a83e6a75` |
| DeepSeek v3.2 | `5dd5ec233d563acdc385f56270b2868c2a439d09` |
| Gemini 2.0 Flash | `3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729` |
| Gemini 2.5 Flash | `abf7a0b99c54ff8155700e80e283d1d7081f09f6` |
| Gemini 2.5 Pro | `1d7ee27ecefddc6e0d67833aeef2370430a7c9c4` |
| GPT-4.1 | `9ab86f214197d1c60279807850a07d9da75344b8` |
| GPT-4o | `3f94994e131e25bf9bf52f43867fbe6b229756b1` |
| GPT-5 mini | `aa0fb3f64cc9789ccf3e5871f9aaec16f4d8099b` |
| GPT-5.2 | `acf59928c7d754c78a93f648c76c6497fc7e5b11` |
| GPT-5 | `25bb4f61e2454467626592396f20384c9858cb6b` |
| Llama 3.1 70B | `b7b9db7ff20a502f25064df9b786507b4d58a6a3` |
| Llama 3.3 70B | `c3845de12a952cfe050f1fbab9e91f8ab10a6a36` |
| o3 | `4f408b9d207d50b2bbbd31b1283f50798173e602` |
| Qwen 2.5 72B | `38393e09d44de963d109b00f66a1378f5b431720` |
