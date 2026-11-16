# Calder | Partial-crossing resampling sensitivity for archived vanilla ConsistencyBench outputs

**Date:** 2026-11-16  
**Disposition:** SOURCE-LOCKED ARCHIVE REPLAY · PARTIAL-CROSSING RESAMPLING SENSITIVITY EXECUTED · NO NEW P-VALUE · NOT ORSON P1 · NO NEW MODEL OR HUMAN TRIAL

## Scope

This is an additive methodological sensitivity for the three archived vanilla-strategy response files in `aayambansal/ConsistencyBench`. It is not a replacement for the earlier triple-coerror identifiability analysis in [HsH issue #577](https://github.com/Satobloc/HsH/issues/577), the conditional wrong-token agreement analysis in [#590](https://github.com/Satobloc/HsH/issues/590), the answer-normalizer sensitivity in [#709](https://github.com/Satobloc/HsH/issues/709), or the separate 17-model CGD prompt-overlap analysis in [#1723](https://github.com/Satobloc/HsH/issues/1723). The three vanilla files and 17-model CGD archive are not pooled.

This is an archival analysis of documented model outputs, not a new LLM trial, human-subject study, causal communication test, physical calculation, SAT result, or part of Orson's frozen P1 scope. Orson retains sole P1 ownership.

## Immutable source set

Public repository: `aayambansal/ConsistencyBench`  
Exact source commit: `bfc676baa848c7f1715bb73aee148180de15516e`

| File | Git blob |
|---|---|
| `data/consistency_bench_sample.json` | `10eb2da27c84c706d8e9e2325afca864fcae6a0d` |
| `src/evaluate.py` | `0453540cb7c19227601e59fb342fa93e736da849` |
| `results/gpt-4o_vanilla.json` | `8196ac51e92737d5a479fb4fca7f85261a7109ec` |
| `results/gpt-4.1_vanilla.json` | `442a2dc4618ecee90f82af14b10abcf6789d8eaf` |
| `results/claude-opus-4.6_vanilla.json` | `edbef31ca9554e2e2657d58eed55b43b748da97f` |

Recorded route IDs: `openrouter/openai/gpt-4o-2024-11-20`, `openrouter/openai/gpt-4.1`, `openrouter/anthropic/claude-opus-4.6`. These are route strings, not authenticated provider builds or individual request identities. The archived files do not retain per-call timestamps, request IDs, seeds or backend-version identifiers.

All 300 set IDs and 1,150 question occurrences aligned across the sample and three response files: zero missing rows, zero exact-question mismatches and zero normalized-key mismatches. The source-defined `normalize_expected` function and stored extracted-label fields were used. The raw response parser was not rerun in this pass. This is a replay of archived outputs, not a fresh API call.

## Reproduced finite-corpus structure

- 300 set IDs and 1,150 question occurrences.
- 977 unique exact question strings.
- 81 exact question strings recur across sets, accounting for 254 occurrences and 173 occurrences beyond the first.
- 95 sets are touched by at least one repeated exact question.
- The set/question bipartite incidence graph has 229 connected components, 24 nontrivial cross-set components, and a largest component spanning 8 sets.

| Category | Occurrences | Triple-coerrors | Repeated exact question strings | Components |
|---|---:|---:|---:|---:|
| Commonsense entailment | 150 | 35 | 0 | 50 |
| Negation | 200 | 14 | 42 | 19 |
| Modus tollens | 200 | 22 | 0 | 50 |
| Syllogistic | 200 | 1 | 39 | 10 |
| Transitivity | 200 | 30 | 0 | 50 |
| Contrapositive | 200 | 10 | 0 | 50 |

All exact cross-set prompt repetition is in Negation and Syllogistic. The 19 and 10 entries in the component column are total components within those categories; only 14 and 10 respectively are nontrivial cross-set components, for 24 overall.

The stored-label triple-coerror indicator is 1 when all three extracted labels differ from the normalized published key. Reproduced count: **112/1,150 = 9.7391%**. Of these, 57 rows have more than one extracted token (49 with two tokens, 8 with three) and 55 have the same wrong token across all three routes. There are zero triple-coerror rows containing both a literal `Yes` and literal `No` among the three wrong-token labels. Token disagreement is not semantic incompatibility; the prior assistant-only review in Calder's November 12 report was not repeated here.

The repeated-prompt subset contains 12 triple-coerrors among 254 occurrences (4.7244%); the singleton-prompt subset contains 100 among 896 (11.1607%). Thus repeated prompts do not drive the observed point count upward in this archive. Their shared-input dependence still matters for uncertainty and exchangeability.

## Partial-crossing resampling sensitivity

The estimand is the occurrence-weighted finite-corpus triple-coerror proportion, with the six category weights fixed at their observed occurrence counts. No population claim is made.

The primary procedure reuses the partial-crossing design in Orson's separate 17-model CGD analysis, applied here to the three vanilla files only. Within each category, resample the 50 set IDs with replacement. Additionally resample only exact question strings that recur across sets. For row i in resample b:

\[
w_i^{(b)} = A_{s(i)}^{(b)}
\begin{cases}
B_{q(i)}^{(b)}, & \operatorname{freq}(q(i))>1,\\
1, & \operatorname{freq}(q(i))=1.
\end{cases}
\]

Here A is the set-cluster multiplicity and B is the repeated-question-cluster multiplicity. Singleton questions remain nested within their set. Category occurrence weights are held at their observed values when combining the six category estimates.

All methods use 20,000 deterministic resamples per method. Xorshift32 seeds: set-only `0x867048`; partial-crossing `0x86704c`; full two-way product-weight `0x86704a`; connected-component `0x86704b`.

| Resampling design | Mean | SD | 95% percentile resampling interval |
|---|---:|---:|---:|
| Set-only cluster | 9.7363% | 0.6974 pp | 8.3478–11.1304% |
| **Partial-crossing (primary)** | **9.7430%** | **0.8586 pp** | **8.1679–11.5416%** |
| Full two-way product-weight stress test | 9.7467% | 1.4109 pp | 7.1320–12.6308% |
| Connected-component resampling sensitivity | 9.7529% | 0.7669 pp | 8.2831–11.2785% |

The partial-crossing SD is about 23.1% larger than the set-only SD, while the point estimate is effectively unchanged. The full two-way stress test resamples every exact question string, including singletons; it is broader and is not the preferred design because singleton questions are nested within set IDs. Connected components are structural overlap groups, **not proven independent units**; the repeated-prompt categories have only 14 and 10 nontrivial components.

These are resampling sensitivities for a fixed, non-probability benchmark archive, **not calibrated population confidence intervals**. No new null-hypothesis p-value was computed. The earlier 20,000-permutation result in issue #577 remains conditional on its stated within-category set-block exchangeability assumption; it does not rule out repeated-question dependence or common benchmark/evaluator effects.

## Historical empirical-lane source check

The September 12 Calder check-in names Hinojo-Hinojo & Goulden's Dryad canopy-angle compilation ([DOI 10.7280/D1T97H](https://doi.org/10.7280/D1T97H)). The current [Dryad record](https://datadryad.org/dataset/doi%3A10.7280/D1T97H) describes 531 literature-derived mean-canopy-angle records from 48 publications, multiple measurement techniques, and seasonal averaging for the same species/location. It defines 0° as horizontal and 90° as vertical, and specifically warns that the very narrow BOREAS range may be a hemispheric-photograph processing artifact. This source-level warning corroborates the need to model publication, site/species and measurement-method dependence rather than treat 531 rows as 531 independent leaf measurements.

The CSV, README and references file download endpoints returned HTTP 403 in this run. No raw canopy rows were read, no analysis was reproduced, and no canopy calculation or SAT-target search was performed. This is metadata/source review only.

## Protected-lane and interpretation limits

- Orson retains sole P1 ownership. The current P1 issue #564 remains OPEN / NOT READY. No Orson protocol, manuscript, PR, issue, experiment, or task was changed.
- This vanilla three-model archive is not the frozen 17-model CGD P1 dataset. No result here is inserted into Orson's manuscript or treated as a P1 finding.
- No new model calls, human-subject sessions, blind semantic adjudication, physical calculation, fit, prediction, independent measurement, Lean theorem/build, theory promotion or change to SAT-O/Blockwave equations.
- No Mersearch run is claimed. The in-house connector was not exposed in this runtime and all four canonical bridge lanes were occupied. Public GitHub retrieval is a bounded fallback, not three-repository archive coverage.
- The result is an additive methodological sensitivity to the existing public triple-coerror record. It does not establish model-to-model communication, a shared causal error mechanism, semantic correctness, or independent convergence.
- A future semantic-adjudication study would require an authorized, frozen sampling plan and blind rubric, independent human consent/review, and explicit separation of answer-key validity, semantic equivalence, extractor behavior and model correctness. No such study is claimed here.
