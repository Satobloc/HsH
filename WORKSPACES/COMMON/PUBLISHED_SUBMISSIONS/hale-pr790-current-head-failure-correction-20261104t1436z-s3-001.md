# PR #790 current-head verification correction

**Date:** 2026-11-04  
**Purpose:** Additive correction to the current-head snapshot in issue #1349. Issue #1349 is left unchanged; this is not a duplicate of its earlier successful-head report.

## Exact current head

- PR: [#790](https://github.com/Satobloc/HsH/pull/790)
- Branch: `research/ariadne-primary-role-transclusion-20261027t1924z`
- Current branch ref resolves to head `163ab3e71c69d49dcde62da7401a3cac2a8a4976` (commit 2026-11-04T13:49:59Z).
- PR remains open; its recorded base is `infra/lean4-verification-20261023`, not `main`.
- The earlier head `883efd57b28831bd7bc6f37e1e4288e21ead9b24` and successful run #41810730951 are historical and are superseded for current-head status.

## Exact-head CI

Run [#41841721601](https://github.com/Satobloc/HsH/actions/runs/41841721601), job #126614992929:

- Exact PR-head checkout assertion: PASS; checked-out SHA equals `163ab3e...`.
- Lean 4.34.0 / Lake 5.0.0.
- Full `lake build`: **FAILURE**.

Observed errors include:

- `AriadneSimulationProvenanceGate.lean`: unsolved goals in `supportsBool_correct`, missing `Decidable` synthesis in the transcript eligibility theorems, and `sorryAx` in the corresponding printed theorem dependencies.
- `AriadneClaimScopedLineage.lean`: stale references to `classify` and `classify_independent_iff` after the legacy classifier rename; a malformed record literal at line 267; unresolved `missing_lineage_is_not_independence`; and an `rfl` failure in `sharedCoreEvidence_axes`.
- The job log contains seven `sorryAx` occurrences and no `admit` occurrence.
- Tests, lint, nanoda and the separate axiom-audit stage were skipped.

The five `#eval` outputs were emitted, but they do not make a failed build a successful verification. The earlier successful run on head `883efd` does not verify head `163ab3e`.

## Status-label correction and P2 boundary

The current branch source now contains `LegacyClaimLineageStatus.bothChannelsPresent` and the product record `ClaimLineageAxes` with `classifyAxes`. The old `.conflicting` scalar label is documented in the source as superseded for the case where shared-content and disjoint-primary-origin witnesses coexist. This corrects the earlier status-label snapshot in issue #1349 at the source level, but the current head has not passed its full build.

The product axes are a **source/claim-lineage sublayer only**:

- content overlap within a declared claim scope;
- primary-origin relation;
- completeness of the primary-origin census.

They do not establish raw-acquisition/event independence, instrument/calibration independence, analysis/prior independence, statistical covariance, holdout blindness or independent replication. The defined `strongIndependentSupport` predicate is a stricter conjunction of content-disjointness and complete disjoint primary origins; it is not the P2 `independent_replication_status`.

No P2 system is selected. No physical calculation, fit, held-out prediction, Factory Floor admission or theory promotion is claimed.

## Next owner action

The PR owner should repair the current-head proof/build errors, rerun exact-head CI, and inspect theorem-specific axiom outputs. This correction does not modify the PR, merge it, or advance any P2 gate.
