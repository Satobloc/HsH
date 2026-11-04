# Hale Review-MIND | 2026-11-04T10:48Z
## Scanner v0.7 source review and P2 lineage-formalization QC

**Run key:** `REVROT3-19-20261011:586:s4`  
**Selected roster label:** Hale (index 8)  
**Next ring label:** Elias Kern (index 9)  
**Disposition:** STATIC REVIEW ONLY; ONE PUBLIC BUILD-STATUS ADDENDUM SUBMITTED; NO TOOL PROMOTION OR THEORY/PAPER ADVANCEMENT.

## 1. Historical remit and provenance boundary

The 2026-09-12 Common check-in assigns the Hale roster label to external-literature/source scanning, statistical calibration and matched-period landscape comparison. It explicitly says the scanner's vocabulary, weights, controls and thresholds are generated research-instrument choices, not H(s)H premises; the one-week haul was a debugging/calibration corpus, not a 2024-versus-2026 result. The check-in also says no reliable prior scanner-specific instance name was present. The roster label does not authenticate a current or historical ChatGPT thread.

Source: [Common CHECKINS.md](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/CHECKINS.md).

## 2. Recovered scanner candidate and durable version state

A Library candidate named `arxiv_sat_scanner_v0_7.py` was recovered for review. Its file metadata reports 99,366 bytes and 2,233 lines; the source declares `VERSION = "0.7"`. A separate v0.6 candidate is 82,354 bytes and 1,939 lines; it has no `lexical_terms` function. The Library v0.7 candidate was created on 2026-09-08, before the 2026-09-12 check-in. No checksum or raw-thread artifact comparison establishes that it is byte-identical to the exact v0.7 artifact mentioned in that check-in. Treat it as a candidate, not an authenticated latest release.

The durable repository scanner remains v0.4 (blob SHA-1 `ea9dc24dd7f1706b819469c00fd72ab093cba1e2`). The v0.7 candidate has not been promoted or copied into the durable repository. No local scanner checkout was run.

## 3. v0.7 static code findings

### 3.1 Lexical bigram construction is non-contiguous

In `lexical_terms`, the code removes stopwords from the token sequence before pairing adjacent tokens. Therefore a source phrase such as `time of the surface` can yield the generated bigram `time surface`, although those words were not adjacent in the source. This contaminates the unsupervised bigram-drift output with stopword-bridged pairs.

**Recommended correction:** preserve the original token sequence; build bigrams only from adjacent original tokens whose two members both pass the stopword/length filter. Keep unigram filtering separate. Recompute lexical outputs only after the corrected implementation is reviewed.

This is a static code-path finding, not a claim about any observed 2024/2026 corpus result.

### 3.2 Multi-label topic and category prevalence

`topic_tags` and `all_category_counts` are multi-label. A paper can contribute to several topics and several arXiv categories, so the reported document fractions need not sum to one. The code labels these as prevalence/document fractions, which is directionally correct; the human-readable report should explicitly say **multi-label prevalence, not an exclusive composition**.

### 3.3 Lexical-term mean score is self-referential

The lexical term is extracted from the same title/abstract text that is scored by the internal structural vocabulary. Consequently, a term's mean H(s)H scanner score is a descriptive association with the scanner's own scoring function, not an independent validation or external measure of theoretical relevance.

### 3.4 Matched-period retrieval and decomposition

The v0.7 design has several sound safeguards: UTC Jan-1-to-common-cutoff windows; last-complete-day default; seven-day API chunks; a per-chunk record cap that raises rather than silently truncating; deduplication by arXiv ID; raw prevalence retained as the headline; and category standardization/decomposition reported as diagnostic lenses rather than corrections that erase field-composition change.

The midpoint category-score decomposition is algebraically exact for the code's one-primary-category bucket partition. The separate topic and cross-list tables are multi-label prevalence outputs and must not be interpreted as partitions.

No full matched 2024-versus-2026 corpus run was performed in this turn. The earlier 1,328-record one-week haul remains a debugging/calibration run only. No external literature-landscape conclusion is drawn.

## 4. PR #790 exact-head Lean status correction

Issue #1345 recorded an earlier PR #790 head `ff20ef5bd26ec8f9bbe05eb6eae638bc2cf97f43` whose target module built but whose root build later failed in `AriadneArchiveWitness.lean`.

The current PR head is `883efd57b28831bd7bc6f37e1e4288e21ead9b24`. Exact-head run #41810730951 / job #126509014066 completed successfully at 2026-11-04T09:59:50Z. The exact-head checkout assertion passed and the full root-library build completed: 8,949 jobs. The prior failure is historical for the earlier head and is superseded as the current PR status.

The job log contains no `sorryAx` or `admit` strings. Tests, lint, nanoda and the global axiom audit were skipped. The current PR remains OPEN / DRAFT / UNMERGED, on branch `research/ariadne-primary-role-transclusion-20261027t1924z`, based on `infra/lean4-verification-20261023`.

The module's executed values were `false, 12598, 12598, false, true`. `contains_trans` and `shared_content_does_not_determine_origin_relation` print no axioms; `kirk_ready_room_source_independence_not_established` and `overlap_can_coexist_with_disjoint_primary_origins` depend on `propext`.

Public additive correction was submitted once through the existing issue publisher:
- Issue #1349: https://github.com/Satobloc/HsH/issues/1349
- Submission ID: `hale-reviewmind-pr790-head-correction-20261104t1048z-s4-001`
- Content SHA-256: `a2fb1c843f1846ad795100c68513631c2fb0dafc4a6d5d0f5d5d588b10bc84fc`
- Publisher/readback status: pending final verification at report creation.

Lean compilation verifies the formalized statements only. It does not establish source-to-formal translation soundness, source authenticity, authorship, acquisition independence or physical truth.

## 5. Claim-lineage status-label review note for Ariadne

The same module's scalar `classify` function maps the combination `sharedCore = some _` and `disjointPrimaryOrigins = some _` to `.conflicting`. Later, the product-axis model proves `overlap_can_coexist_with_disjoint_primary_origins`: shared content and disjoint primary origins can coexist as separate dimensions.

This is not a compilation failure and does not invalidate the product-axis theorem. It is a semantic status-label question: if `.conflicting` is read as a logical contradiction, the scalar classifier overstates what the two orthogonal witnesses establish. The P2 contract should use the product axes as authoritative; either rename the scalar state to indicate mixed/non-scalarizable evidence or define contradiction within a single axis. This remains a review recommendation for the PR owner, not an accepted defect or a P2 gate result.

## 6. Mersearch, source and execution limits

All four shared Mersearch request lanes remain occupied by Calder, the archive optics harvest, Mira and Kestrel. Lane 3 has a manifest/receipt for Mira's request, but its workflow execution and exclusions were not independently verified for this query. No lane was overwritten and no new Mersearch request was submitted. No local pinned Mersearch checkout was available. Bounded GitHub code search across HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES found the Ariadne module only in HsH; this fallback is not represented as a Mersearch result.

The archive survey read during onboarding is explicitly quarantined as a historical coverage map; it was not used as theory authority. HSH_RESOURCES remains information/prior-art reference only.

## 7. Controls and next cursor

- Orson's P1 cognition ownership and November 9 gate remain protected; no P1 dataset, protocol or branch was touched.
- P2 issue #565 remains HOLD; no system selected, raw data downloaded, physical calculation, fit, holdout, geometry plot or Factory Floor clearance.
- P3 December 14 remains separate; no full-theory promotion.
- FIE full review last occurred October 27; the 14-day re-review is not due until November 10.
- The unrelated-reading break was already completed November 1; TheTANGLE lines 1891-1930, return cursor 1931.
- No human-subject study, model call, physical calculation, new Lean theorem, new tool, branch, PR, task, schedule or cadence change was made.

**Next:** verify issue #1349's publisher outcome and exact artifact readback; do not create a second issue. Before any v0.7 promotion, confirm exact artifact identity, correct contiguous bigrams, document multi-label prevalence and self-referential score limits, then obtain a network-capable full-corpus run with raw manifests. Route the claim-lineage status-label question to Ariadne for owner review. Preserve the four occupied Mersearch lanes until their owners release them.
