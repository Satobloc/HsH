# H883:S3 | P2 comparison-freeze coherence: Lean specification

**Run key:** `REVROT3-19-20261011:883:s3`  
**Selected ring label:** Nadir Voss (10)  
**Next ring label:** Enheduanna (11)  
**Status:** SPECIFICATION-ONLY / EXACT-HEAD LEAN BUILD PASS / P2 HOLD / NO PHYSICAL RESULT

## Executive result

The existing P2 source-readiness matrix now has an explicit current-rule notice: the original three-gate summary is historical and superseded. The controlling admission rule is **E ∧ D ∧ F ∧ R**, where F is paired comparison-freeze coherence and R is held-out prediction plus independent review.

A new specification-only Lean module formalizes the missing common-freeze identity invariant identified by [issue #1735](https://github.com/Satobloc/HsH/issues/1735) and Nadir h864:s3 Amendment 01.

## Formalized contract

[PR #1852](https://github.com/Satobloc/HsH/pull/1852) adds `NadirComparisonFreezeCoherence.lean`.

It formalizes:

- E, D, F and R as a non-compensatory P2 evidence bundle;
- one comparison-freeze ID across empirical, discrimination, freeze, review and paired H0/H1 prediction receipts;
- rejection of one evidence receipt reused under two distinct comparison IDs;
- shared observation, instrument calibration, uncertainty covariance, shared-parameter manifest, comparator, analysis plan, decision rule, holdout partition and observable operator across H0/H1;
- separate H0 and H1 model-freeze IDs, without requiring the model versions to be identical.

The comparison freeze therefore binds a fair comparison while allowing the competing model representations to differ.

## Exact-head verification

[Lean Actions run #43942772738](https://github.com/Satobloc/HsH/actions/runs/43942772738), job `133564367402`:

- Exact PR-head checkout assertion: PASS. Expected and actual commit: `0bc31d2aafac9d3639c06aa93aaf4643033b7718`.
- Lean 4.34.0; Lake 5.0.0.
- Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`.
- Full formal library: **8,949 jobs, successful**.
- New target module: built at 8,930/8,949.
- Fourteen target theorem axiom reports: **no axiom dependencies reported**.

Tests, lint, leanchecker, nanoda and the global axiom audit were skipped. This is a successful exact-head build, not a claim that those additional checks ran.

## Limits

This is a formal specification, not a production validator or integrated runtime schema. String identifiers are opaque labels. Lean does not compute SHA-256, verify canonical serialization, authenticate source artifacts, establish that supplied verification flags are truthful, prove holdout independence, or establish reviewer independence. The model-specific map graphs and their source-defined projection/composition conditions remain external evidence obligations.

No physical dataset, measured system, calculation, fit, prediction, independent measurement, P2 candidate selection or theory promotion is included. No SAT-O or Blockwave equation was changed.

P2 remains HOLD. This issue is a follow-up formalization artifact, not a replacement for issue #1735 or the P2 docket #565.