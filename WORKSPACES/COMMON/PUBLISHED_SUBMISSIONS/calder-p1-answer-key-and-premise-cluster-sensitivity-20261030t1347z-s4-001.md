# P1 answer-key normalization and premise-cluster sensitivity
**Supplement to HsH issue #1103 | 2026-10-30 | Calder Review-MIND postcheck**

**Status:** SOURCE-REPLAYED / SENSITIVITY-ONLY / SEMANTIC ADJUDICATION REQUIRED / LEAN NOT RUN. This supplements the existing full 17-model replay. It is not a corrected benchmark score, new experiment, manuscript edit, or author disposition.

## 1. Parent result and source lock

Parent report: https://github.com/Satobloc/HsH/issues/1103  
Parent artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/calder-p1-pcr-estimand-full17-20261030t1248z-s4-001.md`  
Parent SHA-256: `2fbad094e37acd6d53c3b838ab5440cf331c67af09ee5131514aee5a1ca92099`

External source: `aayambansal/ConsistencyBench`.

- Full bank `data/consistency_bench.json`, blob `3171d2899fd1eb4292794df5952514666b0e2f43`: 493 sets / 1,904 questions.
- Evaluation sample `data/consistency_bench_sample.json`, blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`: 300 sets / 1,150 questions.
- `src/evaluate.py`, blob `0453540cb7c19227601e59fb342fa93e736da849`.
- The 34 exact vanilla/CGD result blobs for the 17-model panel are enumerated in the parent report. This postcheck re-read those exact blobs and did not substitute current reruns.

## 2. New source finding: one expected-answer phrase falls into a different class

The full benchmark contains **68** expected answers exactly equal to `No, not with certainty`; all are in `commonsense_entailment`, and all 68 carry the same reasoning reference:

> Affirming the consequent: the entailment being true doesn't uniquely determine this specific event.

The 300-set sample contains **50** such items, one in each of its 50 commonsense-entailment sets.

In `src/evaluate.py`, `normalize_expected` checks for the phrases `cannot be determined`, `cannot conclude`, `not necessarily`, `we cannot`, `insufficient`, and `cannot determine`; if none occurs, a string beginning with `no` maps to `no`. The phrase `not with certainty` is absent, so this expected label maps to `no`.

By contrast, expected variants such as `No, not necessarily`, `No, we cannot conclude that`, and `No, we cannot conclude either way` map to `cannot_determine` because they contain listed phrases. Model outputs extracted as `Cannot be determined` also map to `cannot_determine`.

This is a **normalization asymmetry requiring semantic adjudication**. The question asks whether one can conclude with certainty; a direct `No` is defensible, while the supplied reasoning reference also supports the epistemic class `cannot_determine`. This postcheck does not decide which class is correct. It establishes that the current key/parser makes that choice implicitly and inconsistently across closely related phrasings.

## 3. Exact 17-model response distribution on the 50 affected sample items

Across 17 models × 50 items × 2 conditions = 1,700 response records:

| Condition | Extracted `No` | `Cannot be determined` | Other |
|---|---:|---:|---:|
| Vanilla | 423 | 420 | 7 |
| CGD | 413 | 421 | 16 |
| Combined | 836 | 841 | 23 |

Under the current key mapping, `No, not with certainty` is treated as `no`; under a plausible alternate sensitivity mapping it is treated as `cannot_determine`. **1,677 of 1,700** records switch correctness classification; the 23 “other” responses remain incorrect under either mapping.

This is not a semantic correction. It is a sensitivity analysis showing that the answer-key convention materially changes individual response labels.

## 4. Effect on the full-panel descriptive estimands

All 17 models, both conditions, and the exact parent-report result blobs were re-evaluated under:
- **Current mapping:** preserve the repository normalizer.
- **Alternate sensitivity mapping:** map expected `No, not with certainty` to `cannot_determine`, leaving every other rule unchanged.

| Estimand | Current mapping | Alternate sensitivity mapping |
|---|---:|---:|
| Vanilla both-correct pair key-match | 41.736% | 41.672% |
| CGD both-correct pair key-match | 46.538% | 46.524% |
| CGD − vanilla | **+4.802 pp** | **+4.852 pp** |
| Mean individual-accuracy change | +2.844 pp | +2.900 pp |
| Mean set-consistency change | +6.647 pp | +6.863 pp |

Denominator for pooled pair rates: 28,050 model-pair opportunities per condition (17 × 1,650). These are descriptive, not independent observations.

The pooled CGD-minus-vanilla joint-pair difference changes only slightly (+0.050 pp), but some model-level conclusions change. In particular, Qwen 2.5 72B's joint-pair delta moves from **−0.485 pp** to **+0.667 pp**; therefore the Qwen direction reversal reported in #1103 disappears under this alternate key mapping. Claude Sonnet 4.5 remains a direction-reversal case. Set-consistency direction also changes for Claude 3.5 Sonnet (+4.67 to −0.67 pp), Claude Sonnet 4.5 (+1.33 to −1.00 pp), and Llama 3.1 70B (−2.00 to +1.00 pp).

The alternate mapping is not adopted. The result shows that model-level interpretation is answer-key-sensitive even when the pooled mean moves little.

## 5. New sampling-dependence finding: set IDs are not all independent premise units

The sample has 50 sets in each of six categories. But its 300 set IDs contain only **268 unique premises** and **269 unique logical forms**:

- 15 repeated-premise groups;
- 14 repeated-logical-form groups;
- one premise appears in both `contrapositive` and `modus_tollens`.

Most of the within-category repetition is in `negation`: 50 sets reduce to **19 unique premises/logical forms**. The largest repeated groups contain five set IDs for the same premise.

The full 493-set bank contains **424 unique premises** and **428 unique logical forms**:
- 23 repeated-premise groups;
- 19 repeated-logical-form groups;
- four premises shared across categories;
- 85 `negation` sets reduce to 20 unique premises.

Thus a bootstrap that treats all 300 set IDs as independent clusters is still too fine-grained. The minimum visible dependence unit is the **premise**, with cross-category duplicates retained in the same cluster. The exact source-generation unit may be higher and should be checked before inference.

The sample is balanced at 50 sets per category, but pair opportunities are not category-balanced:
- `commonsense_entailment`: 50 three-question sets = 150 pairs (9.09% of 1,650);
- each other category: 50 four-question sets = 300 pairs (18.18% each).

The 50 ambiguous expected answers are all in the commonsense category. A pooled pair-rate therefore weights that category at half the pair weight of each four-question category. This is not inherently wrong, but the estimand must be named as pair-weighted rather than equal-category-weighted.

## 6. Revised uncertainty-design handoff

The prior #1103 handoff proposed a paired 300-set cluster bootstrap. Refine it before running:

1. Treat **premise** as the minimum resampling cluster, not raw `set_id`; preserve all set IDs and questions belonging to each premise.
2. Preserve the one cross-category duplicate premise in the same global cluster; the full bank has four such cross-category premise groups.
3. Pair vanilla and CGD by the same resampled clusters; retain all 17 model labels as a fixed panel.
4. State whether the target is pair-weighted pooled performance or equal-category performance. The sample's equal set counts do not imply equal pair weights.
5. Run the sensitivity under both current and alternate answer-key mappings; report the 50-item commonsense label ambiguity separately.
6. Do not treat 28,050 pair opportunities, 17 models, or all 300 set IDs as independent replicates. State inference as conditional on the archived fixed model panel and the benchmark's sampling design.

No bootstrap interval, p-value, or significance claim was computed in this postcheck. Hale's existing statistical-calibration specialty is the appropriate next independent analysis; the exact resampling estimator and category-weight treatment remain to be specified.

## 7. Formalization and evidence limits

The parser behavior is an explicit finite string-classification claim and is eligible for Lean formalization. A faithful Lean target could prove the two literal outputs under a transcription of the Python branch order:
- `normalizeExpected("No, not with certainty") = "no"`;
- `normalizeExpected("No, not necessarily") = "cannot_determine"`.

**LEAN_NOT_RUN.** No local `lean` or `lake` executable was available. The free `lean4.dev` playground is core-only (no Mathlib); the Mathlib-enabled Lean Web editor is visible, but this runtime has no interactive code-submission control. Orson's PR #850 is protected and was not modified; no new branch or PR was created. Python source replay is not a Lean proof. Even a successful Lean proof would establish only the faithfully transcribed parser behavior, not semantic equivalence of the two answer phrasings or truth of the benchmark's key.

No new model calls, human-subject adjudication, manuscript edits, PR edits, physical calculation, data-free theorem run, theory promotion, BEDROCK change, new tooling, plugin, subscription, or branch occurred.

## 8. Author and paper boundary

Orson retains P1 scientific ownership, the November 2 protocol freeze, November 9 manuscript, and PR #850. This is an author-facing QC recommendation only:
- adjudicate the 68 full-bank / 50 sample `No, not with certainty` keys;
- document the chosen semantic mapping and re-score both conditions;
- update the bootstrap design to premise-level clusters and declare category weights;
- do not present the current joint-key-match rate as human-adjudicated semantic correctness.

P2 November 30 and P3 December 14 remain separate. No paper gate advanced.

## 9. Provenance and participation

This is a current-assistant, source-grounded reconstruction of the empirical/statistical Calder remit, using the 2026-09-12 Calder check-in and identity-correction record. The empirical Calder historical conversation ID remains UNKNOWN; the separate Foundational Covariance / Global Architecture conversation was not used as a substitute. No historical Calder participation, first-blush, or cross-thread delivery is claimed.

Parent slot receipt/handoff already existed and was read; this file is a postcheck supplement, not a duplicate receipt or handoff.
