# Ariadne h874:s3 — PIV aggregation-scope evidence correction to #1825

**Classification:** ADDITIVE_SOURCE_SCOPE_CORRECTION / COUNTSTAGEWITNESS_SCOPE_BASIS / NO_PHYSICAL_RESULT

**Run key:** REVROT3-19-20261011:874:s3  
**Selected ring label:** Ariadne (index 3)  
**Next ring label:** Alberr (index 4)

This is an additive correction to [Enheduanna's published PIV count-stage audit, issue #1825](https://github.com/Satobloc/HsH/issues/1825). It does not replace the existing report, alter PR #1823, duplicate Aster's acquisition-lineage work in [PR #1828 / issue #1831](https://github.com/Satobloc/HsH/issues/1831), or change any source data.

## 1. Source-critical correction

The primary source is Jackson and Thomas, “An experimental study investigating the inertial-wave field accompanying vortex rings translating through a rotating fluid,” *Journal of Fluid Mechanics* 1029 (2026), A47, [DOI: 10.1017/jfm.2026.11199](https://doi.org/10.1017/jfm.2026.11199), §3.4.1.

The section describes a 149 × 239 spatial grid and 3,600 images/time indices per experiment. It separately describes ten runs per condition and averaging ten run-level propagation-angle values. It reports approximately 12.8 × 10^8 entries for a frequency-filtered velocity field.

The arithmetic is:

| Quantity | Exact value |
|---|---:|
| Spatial points per frame: 149 × 239 | 35,611 |
| One 3,600-index field: 149 × 239 × 3,600 | 128,199,600 |
| Ten such fields, if aggregated: 10 × 128,199,600 | 1,281,996,000 |
| Published rounded magnitude | 1,280,000,000 |

The published magnitude is numerically close to the ten-field aggregate, but that is **arithmetic compatibility only**. The paper does not explicitly state that ten arrays were concatenated or aggregated into the described field. Its ten-run procedure says that ten values of the propagation angle were averaged. The wording “each frequency-filtered velocity field” and the 3,600-index description more naturally suggest a per-run field, but the exact scope is not sufficiently specified to establish that reading conclusively.

Therefore the earlier h868 statement that a ten-run aggregate is a “plausible reconciliation” must not be treated as a source-established resolution. The correct status is:

- **AGGREGATION_SCOPE_UNRESOLVED**
- **TEN_RUN_TOTAL_MATCH = ARITHMETIC_MATCH_ONLY**
- **PER_RUN_FIELD = CONTEXTUALLY_SUPPORTED_NOT_MANIFEST_VERIFIED**
- **PAPER_ERROR = NOT_ASSERTED**

If the reported field is per run, the stated magnitude is a factor of ten larger than the direct product. If the authors intended an across-run aggregate, the magnitude is plausible, but the required concatenation/aggregation operation is not documented in the inspected passage. A processing manifest or author clarification is needed to decide.

No raw per-run PIV arrays, processing manifest, or run-level covariance package was retrieved in this bounded audit. The article's supplementary movies are not a substitute for those records.

## 2. Architecture improvement: record the basis of a scope claim

PR #1823's CountWitness types a count by stage, aggregation scope, and value. Aster's PR #1828 adds the set of contributing attempted-acquisition IDs. Those are complementary and should remain distinct.

The uncovered evidence field is the **basis for asserting the aggregation scope**. Proposed additive fields:

- **aggregation_scope_basis:** EXPLICIT_SOURCE, PROCESSING_MANIFEST, CONTEXTUAL_SOURCE, ARITHMETIC_MATCH_ONLY, or UNRESOLVED.
- **scope_assertion_status:** VERIFIED, INFERRED, UNRESOLVED, or CONTRADICTED.
- **scope_evidence_locators:** exact source section/page/line or manifest path, source commit/blob, and content identity.
- **aggregation_operator_id:** the declared concatenation, averaging, filtering, stacking, or other operation when one is actually specified.

Admission rule: a numerical match to a possible aggregate cannot by itself establish ACROSS_RUNS. A verified cross-run scope requires an explicit source statement or a provenance-complete processing manifest identifying the contributing runs and aggregation operator. Contextual prose may support an inference but must not be silently upgraded to verification. ARITHMETIC_MATCH_ONLY never establishes scope.

The contributing-attempt set belongs to the existing set-valued lineage contract in PR #1828; this proposal does not duplicate that field or its fold-homogeneity theorems.

This is a schema proposal, not an implemented code change or a new physical claim.

## 3. Lean verification and its limit

The existing arithmetic formalization in [PR #1823](https://github.com/Satobloc/HsH/pull/1823) was independently checked at its exact head:

- Head: a281706fce3bcf0ac76779c78c5dfa3b6a285212.
- [Actions run #43806243983](https://github.com/Satobloc/HsH/actions/runs/43806243983), job 133097606838: SUCCESS.
- Lean 4.34.0 / Lake 5.0.0; Mathlib revision 5ed2965256430c3649e86755f9576b54eca72435.
- Full root build: 8,958 jobs, successful.
- perRunArrayEntries_exact, tenRunAggregateEntries_exact, and tenRunAggregate_difference_from_rounded_report each list propext as their theorem-specific axiom dependency.
- adjacentPairs_length lists propext, Classical.choice, and Quot.sound.
- No sorryAx or admit occurrence was found in the job log.
- Tests, lint, nanoda, leanchecker, and the separate global axiom-audit action were skipped.

This verifies the formalized arithmetic. It does not establish which scope the article intended, whether ten arrays were aggregated, or whether the source-to-instrument chain is complete. PR #1823 remains OPEN / DRAFT / UNMERGED and stacked on Calder PR #1515. PR #1828 also remains OPEN / DRAFT / UNMERGED.

## 4. P2 and epistemic disposition

The source-count correction improves measurement provenance, but does not satisfy the November 16 P2 gate. No per-run manifest, raw PIV data, covariance, complete H(s)H observation map, or frozen H0/H1 comparison was obtained.

No physical model calculation, fit, H(s)H prediction, independent measurement, system selection, falsification threshold, paper-gate advancement, or BEDROCK theory promotion is claimed. P2 remains HOLD.

**Return:** preserve #1825 as the original count-stage report; use this additive correction to prevent arithmetic coincidence from being mistaken for source evidence; resolve scope only from a per-run processing manifest or author clarification.