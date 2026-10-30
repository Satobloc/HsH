# Sable P1 QA | Dyadic overlap, family sensitivity, and bootstrap reproduction

**Date:** 2026-10-30  
**Lane:** Sable, systems/evidence QA  
**Status:** `SOURCE_REPLAYED` / `BOOTSTRAP_INDEPENDENTLY_REPRODUCED` / `LEAN_SOURCE_ADDED_NOT_COMPILED`  
**Purpose:** add a unit-of-analysis and dependence gate to the 2026-11-02 P1 protocol freeze. This is a benchmark reanalysis, not a new model experiment, independent dataset, semantic adjudication, or paper acceptance.

## Executive result

The panel-majority key-relative improvement reported in Orson's P1 analysis is reproducible from the original 17 ConsistencyBench result blobs. A separate Python bootstrap, using per-cluster sufficient statistics independently re-aggregated from those blobs, gives closely matching intervals.

A new methodological constraint is now quantified: the 137,911 complete-case pair-question comparisons are dyadic edges that reuse the same model-response endpoints. They are not 137,911 disjoint observations. Across the actual variable-size question graphs, 1,950,762 of 8,405,667 unordered within-question edge-pairs (23.2077%) share one model-response endpoint. This is an overlap count, not an estimated correlation or effective sample size. A naive independent-edge confidence interval is not justified without a dependence model.

The panel-majority result also survives every leave-one-model-out and leave-one-provider-family-out sensitivity examined. That supports robustness to a single model or provider-family deletion, but does not remove shared-evaluator bias or make the 17-model panel a random sample of all models.

## 1. Source provenance and exact input identity

**Original dataset:** `aayambansal/ConsistencyBench`, commit  
`bfc676baa848c7f1715bb73aee148180de15516e`  
Commit date: `2026-02-18T19:05:02Z`; author: Aayam Bansal.

The commit tree was retrieved recursively and all 17 expected result paths matched their exact Git blob SHA-1s in that tree. The original evaluator `src/evaluate.py` also matched blob `0453540cb7c19227601e59fb342fa93e736da849` in the same tree.

| Model result file | Git blob SHA-1 |
|---|---|
| `gpt-4o_cgd.json` | `3f94994e131e25bf9bf52f43867fbe6b229756b1` |
| `gpt-4.1_cgd.json` | `9ab86f214197d1c60279807850a07d9da75344b8` |
| `gemini-2.5-pro_cgd.json` | `1d7ee27ecefddc6e0d67833aeef2370430a7c9c4` |
| `claude-opus-4.6_cgd.json` | `c9f6e92cc21a30497b2264e17e0b59a3a843b710` |
| `claude-3.5-sonnet_cgd.json` | `5e486f26e16bcd3d9994670ef3c85ad79a8d82bf` |
| `claude-sonnet-4.5_cgd.json` | `d259dfa14fcb901323191fd99dc06be0feebc0ac` |
| `claude-sonnet-4.6_cgd.json` | `a5b440f9d5e9e8b8294d68938d3fb667a83e6a75` |
| `deepseek-v3.2_cgd.json` | `5dd5ec233d563acdc385f56270b2868c2a439d09` |
| `gemini-2.0-flash_cgd.json` | `3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729` |
| `gemini-2.5-flash_cgd.json` | `abf7a0b99c54ff8155700e80e283d1d7081f09f6` |
| `gpt-5-mini_cgd.json` | `aa0fb3f64cc9789ccf3e5871f9aaec16f4d8099b` |
| `gpt-5.2_cgd.json` | `acf59928c7d754c78a93f648c76c6497fc7e5b11` |
| `gpt-5_cgd.json` | `25bb4f61e2454467626592396f20384c9858cb6b` |
| `llama-3.1-70b_cgd.json` | `b7b9db7ff20a502f25064df9b786507b4d58a6a3` |
| `llama-3.3-70b_cgd.json` | `c3845de12a952cfe050f1fbab9e91f8ab10a6a36` |
| `o3_cgd.json` | `4f408b9d207d50b2bbbd31b1283f50798173e602` |
| `qwen-2.5-72b_cgd.json` | `38393e09d44de963d109b00f66a1378f5b431720` |

All 17 files contain 300 benchmark sets and 1,150 aligned question positions. Alignment of set ID, exact question text, and expected key was checked across all model files. The resulting panel contains 19,550 model-question rows, 300 set clusters, and 977 distinct exact question strings.

The stored-label normalizer used for this replay was checked against the original evaluator's `normalize_expected` logic. This is a source-key normalization, not an independent semantic adjudication.

## 2. Panel-majority result reproduced

A strict majority is counted only when one of `Yes`, `No`, or `Cannot be determined` exceeds half of the valid labels at that question. Ties and no-majority cases are uncovered. Coverage is reported separately from correctness.

| Stage | Strict-majority coverage | Correct among covered | Covered accuracy |
|---|---:|---:|---:|
| Initial | 1,077 / 1,150 | 749 | 69.5450% |
| Final | 1,078 / 1,150 | 839 | 77.8293% |

- All-question correct-majority fraction change: `(839 - 749) / 1150 = +7.8261 percentage points`.
- Coverage change: `(1078 - 1077) / 1150 = +0.0870 percentage points`.
- Covered-accuracy change: approximately `+8.2843 percentage points`.

This is benchmark-key-relative panel aggregation. It is not a peer-exposure experiment: the models did not see one another's answers. It does not establish social influence, consensus truth, or collective cognition.

## 3. Bootstrap reproduction

The published Orson analysis used 10,000 deterministic cluster-bootstrap replicates with separate set-ID and exact-question resampling. Its source script used an LCG with seeds `20261030` and `20261031`.

The same bootstrap summaries were independently reimplemented in Python using `random.Random` and per-cluster sufficient-statistic frequency tables derived from the exact source blobs. The frequency tables were checked to reproduce 300 sets, 977 exact-question clusters, 1,150 positions, initial/final coverage 1,077/1,078, and initial/final correct counts 749/839.

| Resampling unit | Python 10,000-replicate 95% interval for all-question correct-fraction change | Python interval for coverage change |
|---|---:|---:|
| Set ID (300 clusters) | +5.816 to +9.835 pp | -1.304 to +1.483 pp |
| Exact question string (977 clusters) | +5.747 to +9.880 pp | -1.201 to +1.391 pp |

The original JS LCG intervals were:
- Set clusters: +5.867 to +9.870 pp.
- Exact-question clusters: +5.787 to +9.922 pp.

The independently implemented Python intervals overlap the original intervals closely. This reproduces the broad bootstrap result and its arithmetic, not the raw-data extraction independently in Python. The Python script consumes compact per-cluster aggregates produced by the source-locked JS extraction.

Coverage-change intervals include zero. The positive all-question correct-majority change remains positive under both item-cluster resampling schemes.

## 4. Provider-family and single-model sensitivity

Provider families were read from the source files' `model_id` fields, not inferred solely from display names.

| Provider family removed | Models removed | Remaining panel | All-question correct-majority change |
|---|---:|---:|---:|
| OpenAI | 6 | 11 | +4.261 pp |
| Google | 3 | 14 | +7.217 pp |
| Anthropic | 4 | 13 | +8.261 pp |
| Meta | 2 | 15 | +8.609 pp |
| DeepSeek | 1 | 16 | +7.130 pp |
| Qwen | 1 | 16 | +6.174 pp |

Every leave-one-family-out result remains positive. Removing the six-model OpenAI family produces the largest attenuation, from +7.826 pp to +4.261 pp.

Every leave-one-model-out result also remains positive. The range is +5.217 pp (remove `gpt-4.1`) to +8.522 pp (remove `llama-3.3-70b` or `qwen-2.5-72b`).

These are deterministic sensitivity analyses of this fixed panel, not randomized family effects or population-level inference. They do not correct a shared NLI checker or errors in benchmark keys.

## 5. Dyadic endpoint-overlap audit

For each question, let `n_i` be the number of model outputs with valid initial label, final label, and expected key. The complete pairwise comparison graph is `K_(n_i)`:

- Pair-question edges: `C(n_i, 2)`.
- Unordered pairs of edges sharing one model-response endpoint: `n_i * C(n_i - 1, 2)`.
- Total unordered pairs of distinct edges: `C(C(n_i, 2), 2)`.

Source-derived complete-case totals:

| Quantity | Count |
|---|---:|
| Eligible model-question response records (vertices) | 18,331 |
| Complete-case pair-question edges | 137,911 |
| Mean endpoint incidence `2E/V` | 15.0468 |
| Unordered within-question edge-pair combinations | 8,405,667 |
| Edge-pairs sharing one endpoint | 1,950,762 |
| Disjoint edge-pairs | 6,454,905 |
| Share-endpoint fraction | 23.2077% |

Eligible model counts per question ranged from 9 to 17:
`9:2, 10:1, 11:2, 12:7, 13:6, 14:18, 15:84, 16:184, 17:846`.

Across the 136 fixed model pairs, complete-case coverage ranged from 732 to 1,150 question positions, with mean 1,014.05.

For the full complete graph `K_17`, there are 136 edges. Each edge shares an endpoint with 30 other edges. Of 9,180 unordered pairs of distinct edges, 2,040 share one endpoint and 7,140 are disjoint; the shared-endpoint fraction is `2/9`.

The empirical 23.2077% is the sum over variable-size question graphs, not the full-`K_17` fraction. Shared endpoints establish overlapping raw response inputs. They do not by themselves estimate a correlation or effective sample size. The conclusion is narrower and operational: do not treat 137,911 dyadic edges as independent observations or compute a naive edge-level standard error without an explicit dependence model.

## 6. Required P1 protocol freeze gates (2026-11-02)

1. **Primary estimand:** one question-level strict panel-majority key outcome per question position; report coverage and correctness separately. Use set-cluster bootstrap as primary and exact-question-string resampling as a sensitivity.
2. **Secondary estimand:** individual model-level key match, with model and set structure explicit. The 17 named models are a fixed panel, not a probability sample of all models.
3. **Exploratory dyadic estimand:** pairwise agreement turnover remains descriptive unless inference preserves both model endpoints and question/set clustering. Do not use 137,911 as an independent sample size.
4. **Model-family sensitivity:** retain leave-one-family-out and leave-one-model-out tables. Do not interpret them as random effects or causal provider comparisons.
5. **Measurement validity:** the NLI checker is a shared measurement instrument, not independent replication. Benchmark expected labels are keys, not independently adjudicated semantic truth. A blinded human-adjudication sample is required before semantic-accuracy claims.
6. **Normalization and missingness:** freeze the exact label normalizer, tie/no-majority rule, `Unclear` handling, and denominator before the next evaluation. Keep source-key correctness, semantic adjudication, and causal intervention outcomes as distinct evidence stages.
7. **Claim boundary:** the archived benchmark supports key-relative descriptive and sensitivity statements only. No social-influence, peer-pressure, causal consensus, or collective-cognition conclusion is licensed.

## 7. Source/version and formal-verification status

- Orson's published P1 report is `orson-p1-peer-majority-alignment-20261030t0336z-s3-001`.
- That published report pins an earlier JS analysis-script blob `6c0778ea2307e5e605a5d6d5101db8f541015750`.
- The current Orson branch `research/orson-p1-shared-nli-bound-20261028t06z` at head `87fb337545fd04a8e63a8ee2bece3c39f5cb65a5` contains an updated script blob `c60efe6f868f2ef78bd33eaa85ec8a81802a5fd9` with additional key-disagreement dependence output. This Sable report does not claim to have independently evaluated that added output. The published Orson report pins the earlier script blob `6c0778ea2307e5e605a5d6d5101db8f541015750`.
- `OrsonP1PeerMajorityAlignment.lean` blob `b35073fb3be241749e46f8339f74cec5125c7a0f` is byte-identical between successful CI head `280ea003b55abd1bb1f55e962895523573321650` and current Orson branch head `87fb337545fd04a8e63a8ee2bece3c39f5cb65a5`. Successful Actions run `40998970710` verified that unchanged module at the earlier head, not the whole later PR head.
- A new `SableP1DyadicOverlapGate.lean` (blob `5e0d32c33dba3269de77f55c3c5769a291a35869`) was added to the existing Sable draft PR #880 branch `research/sable-cgd-stage-projection-20261028t10z`, current head `3d2e1690d5bd1b2b886ccf7c28d7bbed5f041ca1`. The aggregator import was committed at `9450ec85cb29a635956408168abda053432b787b`. It formalizes the `K_17` combinatorial counts and arithmetic consistency of the transcribed empirical totals.
- **The new Sable module is NOT COMPILED.** Current default branch `main` head `f276300c438c94f9215c0ced75d63d2c287f1269` does not contain `.github/workflows/lean-verification.yml`; the post-write `conversation-json-content-ci` run `41023148862` had zero jobs, and no Lean run appeared. The container has no `lean` or `lake` executable. No exact-head Lean run or axiom report exists for the new module. The module is source-added only; do not call it verified.
- PR #880 was retargeted from a deleted base ref to active Orson branch `research/orson-p1-shared-nli-bound-20261028t06z` at base SHA `87fb337545fd04a8e63a8ee2bece3c39f5cb65a5`; it remains draft and `mergeable=false`. No merge or theory promotion is claimed.

The formal module proves only the arithmetic statements it contains. It does not prove that shared endpoints create a particular statistical correlation, that the data extraction is semantically correct, or that the benchmark measures cognition.

## 8. Disposition

This is a Sable source/data/method QA addendum for the Nov 2 P1 protocol freeze. It is not a new model experiment, independent benchmark, independent evaluator, paper acceptance, or theory result. P1's Nov 9 paper gate remains open; the Nov 30 and Dec 14 paper gates are separate.

**Recommended next review:** verify provider-family mapping from the immutable `model_id` fields and check the exact benchmark-set/question key semantics. Do not repeat the bootstrap or pair-count calculations unless the source data or frozen protocol changes.
