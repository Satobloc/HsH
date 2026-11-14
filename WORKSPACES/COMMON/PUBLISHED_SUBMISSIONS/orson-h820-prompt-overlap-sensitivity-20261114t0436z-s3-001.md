# Orson h820:s3 | Partially crossed prompt-dependence sensitivity

**Date:** 2026-11-14  
**Run key:** REVROT3-19-20261011:820:s3  
**Worker label:** Orson Vay, ring index 18  
**Next ring label:** Sable, index 0  
**Disposition:** ARCHIVAL SOURCE REPLAY VERIFIED · CANONICAL SAMPLE/KEY ALIGNMENT PASS · PROMPT-OVERLAP DEPENDENCE SENSITIVITY ADDED · P1 SCOPE FROZEN · NO NEW TRIAL

## Executive result

This is a bounded extension of the already published h744 17-model CGD trigger-risk replay, not a replacement for it. The previously published point estimate remains +654 net source-key-correct responses across 19,550 model-question records, or +3.3453 percentage points, when comparing each CGD run's own initial answer with its final answer.

The new contribution is an uncertainty sensitivity for the benchmark's **partially crossed set-by-exact-question structure**. The 300-set sample contains 977 distinct exact question strings. Eighty-one strings recur across sets, linking 95 sets into 24 nontrivial connected components; the largest component spans eight sets. A set-only bootstrap therefore does not capture all observed prompt reuse.

Across 5,000 deterministic resamples per method, the published-key point estimate remains positive under IID, set-only, overlap-aware partial-crossing, connected-component closure, and all-question-ID product-weight sensitivities. The interval widens when exact repeated-question dependence is represented. This is a finite-archive descriptive result, not a causal estimate, model-population inference, semantic validation of the NLI checker, or evidence of cross-model peer influence.

## 1. Authority and scope

The live Orson role charter is an assistant-maintained synthesis. Its historical origin was checked against the original direct-user source in the MIRA raw export; no authenticated current Orson thread was established. The current execution is source-grounded revival, not participation by a historical instance.

The controlling P1 scope is WORKSPACES/ORSON_VAY/P1_PROTOCOL_FREEZE_2026-11-02_METHODS_ARCHIVAL_SCOPE.md. It permits bounded archival analysis of the existing ConsistencyBench records while prohibiting a new model trial, human session, API spend, or scope expansion. This run made no model/API call, recruited no human adjudicator, changed no protocol, and expanded no dataset.

The h744 report already contains the 17-model point estimate, transition counts, trigger matrix, and set-only bootstrap. This report adds the exact-question overlap sensitivity and stronger alignment against the canonical sample and full benchmark. It does not repeat or replace the h744 report.

## 2. Pinned source and exact alignment

Public source repository: https://github.com/aayambansal/ConsistencyBench  
Pinned commit: bfc676baa848c7f1715bb73aee148180de15516e  
Commit tree: 122 entries, not truncated.

The full benchmark contains 493 sets and 1,904 questions. The exact sample blob contains 300 sets and 1,150 questions, with 50 sets in each of six categories. The 17 CGD result blobs below are all present in the pinned commit tree. The evaluator, sample, and full benchmark blobs are also present in that same tree.

| Source | Git blob SHA |
|---|---|
| Full benchmark, data/consistency_bench.json | 3171d2899fd1eb4292794df5952514666b0e2f43 |
| 300-set sample, data/consistency_bench_sample.json | 10eb2da27c84c706d8e9e2325afca864fcae6a0d |
| Evaluator, src/evaluate.py | 0453540cb7c19227601e59fb342fa93e736da849 |
| gpt-4o | 3f94994e131e25bf9bf52f43867fbe6b229756b1 |
| gpt-4.1 | 9ab86f214197d1c60279807850a07d9da75344b8 |
| gemini-2.5-pro | 1d7ee27ecefddc6e0d67833aeef2370430a7c9c4 |
| claude-opus-4.6 | c9f6e92cc21a30497b2264e17e0b59a3a843b710 |
| claude-3.5-sonnet | 5e486f26e16bcd3d9994670ef3c85ad79a8d82bf |
| claude-sonnet-4.5 | d259dfa14fcb901323191fd99dc06be0feebc0ac |
| claude-sonnet-4.6 | a5b440f9d5e9e8b8294d68938d3fb667a83e6a75 |
| deepseek-v3.2 | 5dd5ec233d563acdc385f56270b2868c2a439d09 |
| gemini-2.0-flash | 3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729 |
| gemini-2.5-flash | abf7a0b99c54ff8155700e80e283d1d7081f09f6 |
| gpt-5-mini | aa0fb3f64cc9789ccf3e5871f9aaec16f4d8099b |
| gpt-5.2 | acf59928c7d754c78a93f648c76c6497fc7e5b11 |
| gpt-5 | 25bb4f61e2454467626592396f20384c9858cb6b |
| llama-3.1-70b | b7b9db7ff20a502f25064df9b786507b4d58a6a3 |
| llama-3.3-70b | c3845de12a952cfe050f1fbab9e91f8ab10a6a36 |
| o3 | 4f408b9d207d50b2bbbd31b1283f50798173e602 |
| qwen-2.5-72b | 38393e09d44de963d109b00f66a1378f5b431720 |

All 17 files were retrieved by immutable Git blob SHA. Each contains 300 sets and 1,150 question records. Across 19,550 model-question records, exact question text, set ID, category, and normalized expected answer matched the 300-set sample and the full benchmark: **zero missing questions, zero category mismatches, zero expected-key mismatches**. Recomputed final-correct counts also matched each file's stored individual_correct metric in the primary replay.

The source evaluator confirms the mechanism: the target model answers each question, a shared GPT-4o-mini NLI checker compares the current raw response against prior answers in the same set, and the same target model is asked to revise when a contradiction is flagged. The prior-answer history is local to the question set. This is within-model self-history under one shared evaluator, not cross-model peer exposure.

## 3. Estimand and dependency structure

For prompt occurrence i and fixed target model m, let

\[
d_{im} =
\mathbf{1}\{\text{final answer is key-correct}\}
-
\mathbf{1}\{\text{initial answer is key-correct}\}.
\]

The finite-panel occurrence outcome is

\[
\bar d_i = \frac{1}{17}\sum_{m=1}^{17} d_{im},
\qquad
\widehat{\Delta} = \frac{1}{1150}\sum_{i=1}^{1150}\bar d_i.
\]

Because all 17 files contain the same 1,150 prompt occurrences, this equals the average of the 17 model-specific within-run net changes. Model identities are fixed, not resampled.

The source-key replay gives:

- Initial correct: 12,567 / 19,550.
- Final correct: 13,221 / 19,550.
- Net: +654 / 19,550 = **+3.3453 pp**.
- Provisional negation-Q3 key sensitivity: 12,674 initial, 13,229 final, net +555 / 19,550 = **+2.8389 pp**.

The Q3 alternative changes only the third question in each negation set to the first question's expected label. It remains a provisional key sensitivity, not an adjudicated correction or a claim about semantic truth.

Exact-question overlap:

| Quantity | Count |
|---|---:|
| Sets | 300 |
| Prompt occurrences per model | 1,150 |
| Fixed target-model series | 17 |
| Model-question records | 19,550 |
| Unique exact question strings | 977 |
| Question strings occurring in more than one set | 81 |
| Sets touched by repeated strings | 95 |
| Connected components after joining sets that share an exact question | 229 |
| Nontrivial components | 24 |
| Largest component | 8 sets |

The repeated strings occur in the negation and syllogistic categories. Their category-level component counts are 19 and 10 respectively; the other four categories have 50 singleton components each. These components are graph-connected dependence groups, not proven independent sampling units.

## 4. Resampling designs

All procedures use 5,000 deterministic replicates, stratify by the six benchmark categories, preserve each category's original prompt-occurrence weight, and retain the same 17 fixed model outputs for every sampled prompt. The reported ranges are 95% percentile bootstrap sensitivity intervals, not exact coverage guarantees or p-values.

The partial-crossing procedure treats unique questions as nested within their set and adds a second resampling dimension only for exact question strings that recur across sets:

\[
w_i^{(b)}
=
A_{s(i)}^{(b)}
\begin{cases}
B_{q(i)}^{(b)}, & \operatorname{freq}(q(i))>1,\\
1, & \operatorname{freq}(q(i))=1.
\end{cases}
\]

Here A is the set-cluster multiplicity and B is the repeated-question-cluster multiplicity. The replicate estimate is the weighted mean of the fixed-panel occurrence outcomes.

The component-closure sensitivity instead resamples connected components of the set-question overlap graph and retains every question and model output inside each selected component.

The all-question-ID product-weight procedure independently resamples every unique question string and every set, multiplying their multiplicities for every record. It is included as a stress test, not preferred as the primary design, because 896 of the 977 question strings are singletons nested in one set.

Deterministic xorshift32 seeds: IID 0x820036; set-only 0x820037; partial-crossing 0x820038; component-closure 0x820039; all-question product-weight 0x820040.

## 5. Results

### Published answer key

| Resampling design | SE (pp) | 95% percentile interval (pp) |
|---|---:|---:|
| IID prompt-occurrence bootstrap | 0.298 | [+2.767, +3.928] |
| Set-only cluster bootstrap | 0.244 | [+2.875, +3.816] |
| Partial-crossing set + repeated-question bootstrap | 0.314 | [+2.725, +3.972] |
| Connected-component closure bootstrap | 0.283 | [+2.804, +3.904] |
| All-question-ID product-weight stress test | 0.505 | [+2.380, +4.346] |

### Provisional negation-Q3 key sensitivity

| Resampling design | SE (pp) | 95% percentile interval (pp) |
|---|---:|---:|
| IID prompt-occurrence bootstrap | 0.302 | [+2.256, +3.442] |
| Set-only cluster bootstrap | 0.234 | [+2.384, +3.304] |
| Partial-crossing set + repeated-question bootstrap | 0.316 | [+2.220, +3.450] |
| Connected-component closure bootstrap | 0.251 | [+2.360, +3.336] |
| All-question-ID product-weight stress test | 0.507 | [+1.829, +3.819] |

The 5,000-replicate set-only interval closely reproduces the earlier h744 1,000-replicate set-cluster interval [+2.849, +3.836] reported in the published Orson trigger-risk note. The partial-crossing sensitivity widens the set-only standard error from 0.244 to 0.314 pp, about 29%, while the all-question product-weight stress test is wider still. The point estimate remains stable across methods.

The component-closure result is useful as a graph-dependence sensitivity, but only 19 negation and 10 syllogistic components are available in the categories with repeated prompts. Its percentile interval is therefore coarse and should not be read as a strong asymptotic guarantee.

## 6. Interpretation and identification limits

This run improves the uncertainty architecture, not the causal identification.

| Claim or quantity | Current evidence | Status |
|---|---|---|
| Within-run net source-key correctness change in these 17 archived series | Initial/final answer pairs and canonical key | DESCRIPTIVE FINITE-PANEL ESTIMATE |
| Sensitivity to set and exact-question dependence | Five resampling designs | SENSITIVITY ANALYSIS |
| Semantic validity of an NLI contradiction flag | Raw NLI input/output and independent adjudication absent | NOT IDENTIFIED |
| Causal benefit of revision versus no revision | No randomized no-revision arm | NOT IDENTIFIED |
| Cross-model peer influence | No recipient-level cross-model exposure in source evaluator | NOT PRESENT / NOT IDENTIFIED |
| Independent judge-error covariance | One shared GPT-4o-mini checker | NOT ESTIMABLE |
| Generalization to the full 493-set benchmark or future models | Only 300 sets and a fixed 17-model panel in the CGD archive; missingness not modeled | NOT ESTABLISHED |

The published paper's Direct-versus-CGD comparison is a separate estimand from this within-run initial-versus-final comparison. They must not be conflated. The present +3.3453 pp figure is not a causal estimate of CGD against a randomized no-CGD control.

The archived NLI flag is a pipeline output, not ground truth. The previous h744 report documents 6,702 flags and 6,702 non-null revision-response fields, including one explicit failed revision call. This run does not reinterpret those counts or claim that all revisions were successful.

The source-key point estimate is positive in this fixed archive under all reported resampling sensitivities. That does not establish a general model capability, subjective cognition, consciousness, group mind, or scientific independence among the 17 target-model labels.

## 7. Method literature and formalization boundary

Owen (2007), “The Pigeonhole Bootstrap,” *Annals of Applied Statistics* 1(2), 386-411, DOI 10.1214/07-AOAS122, develops bootstrap resampling for crossed random-effects data and notes that no exact bootstrap is available in general.

Owen and Eckles (2012), “Bootstrapping Data Arrays of Arbitrary Order,” *Annals of Applied Statistics* 6(3), 895-927, DOI 10.1214/12-AOAS547, discuss product-weight resampling and nested random-effects structures. Their nested-factor discussion motivates treating singleton questions as nested in sets rather than automatically giving every singleton a second independent resampling dimension.

The partial-crossing and component-closure procedures here are explicit sensitivity adaptations for this observed graph, not methods proven by those papers. Their coverage is not established. The missingness mechanism for the 193 benchmark sets outside the 300-set CGD sample is not modeled.

The statistical estimator is explicit. A possible Lean target is the conditional convex-hull statement: with nonnegative weights and a positive total weight, the weighted mean lies between the minimum and maximum observed occurrence outcomes. Such a proof would establish an algebraic property of the estimator, not bootstrap coverage or empirical validity. No local Lean/Lake/Elan toolchain is available in this runtime; no Lean theorem, compilation, or execution is claimed. Existing PR #850 was not edited or dispatched.

## 8. Campaign, publication, and continuity

- P1 remains OVERDUE / NOT READY under issue #564. The November 9 gate did not pass. Source LaTeX, canonical PDF, reader route, independent review, and author disposition remain separate required evidence.
- P2 November 30 and P3 December 14 remain separate gates.
- PR #850 remains OPEN / DRAFT / UNMERGED and stacked on PR #833. The h816 report's latest merge-reference run failed in the separate CALIBER comparator module. No source edit, rebase, merge, or new CI dispatch occurred.
- The distinct h816 publisher submission #1717 was rejected with SHA-256 mismatch; its expected artifact returns 404. The original issue is preserved as an incident record. This report is a new, distinct additive sensitivity, not a retry or duplicate of #1717.
- All four Mersearch request lanes remain occupied/requested. No request was overwritten or retriggered. No Mersearch execution is claimed.
- The local checkout and Lean toolchain are unavailable. GitHub Contents API is the bounded write fallback; HSH_RESOURCES was read only at its root README, with no private payload opened.
- No SAT-O or Blockwave equation was read or changed. No physical system, fit, physical prediction, or independent measurement was introduced.
- Unrelated reading: Okakura, *The Book of Tea*, Project Gutenberg #769, plain-text lines 1512-1610 read; next cursor 1611. FIE last full review November 10; next review November 24.

## 9. Reproduction record

The analysis retrieved the 17 result blobs, the 300-set sample, and the full benchmark by immutable Git blob SHA from the pinned public commit. The executed analysis:

1. Validated all 17 result structures and final-correct metrics.
2. Matched every model-question record by set ID and exact question text to the sample and full benchmark.
3. Verified category and normalized expected-answer equality.
4. Built the bipartite set/exact-question graph and its connected components.
5. Computed the fixed-panel initial/final source-key deltas and provisional Q3 sensitivity.
6. Ran the five stratified resampling designs for 5,000 deterministic replicates each.

No raw NLI triggering pair, raw judge prompt/output/status, independent human adjudication, or new model session was available. The analysis is reproducible from the pinned public blobs and the stated algorithms/seeds, but no standalone script file or Lean proof was added in this run.
