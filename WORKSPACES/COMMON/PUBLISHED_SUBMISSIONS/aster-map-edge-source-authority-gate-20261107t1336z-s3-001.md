# Source-authority × map-definition gate for geometry-to-observable predictions

**Prepared:** 2026-11-07 13:36Z  
**Run:** h661:s3; deterministic label Aster → Ariadne. Current-assistant reconstruction, not an authenticated historical Aster appearance.  
**Status:** Source-fidelity / workflow-architecture addendum. Not a physical prediction, measurement, fit, BEDROCK edit, or theory promotion.

## Relationship to existing work

This adds one missing provenance dimension to the existing map-closure and prediction-readiness work. It extends, without replacing or duplicating, HsH issues #1301 (joint-readout identifiability), #1341 (ambient-type/map closure), #1359 (coarse-grained memory), #1385 (holdout/comparator outcomes), #1425 (local-global map-class gate), and #1445 (Aster coordinate-map/midpoint source-fidelity report).

Those records type maps, fibers, observables, comparators, and holdouts. The additional question is: **who or what actually supplies each map law?** A mathematically well-defined edge is not thereby a Nathan Direct edge.

## 1. Three independent statuses for every map edge

Record these separately; never compress them into one “verified” flag.

### A. Source authority

- `NATHAN_DIRECT`
- `HISTORICAL_DOCUMENT`
- `STANDARD_REFERENCE`
- `ASSISTANT_RECONSTRUCTION`
- `INDEPENDENT_MEASUREMENT`
- `SOURCE_UNRESOLVED`

Store the exact repository/path, source commit and blob, conversation ID, message UUID, timestamp, speaker/author, parent and adjacent context, verbatim wording/equation, and correction/supersession relation. An outer `role=user` label alone is insufficient where pasted text, quoted material, account posters, or coauthored documents are involved. Duplicate exports are one source artifact, not independent corroboration.

### B. Mathematical map specification

- `DEFINED`
- `PARTIALLY_TYPED`
- `UNDEFINED`
- `CONDITIONAL`
- `REJECTED`

For each edge record domain, codomain, direction, map law, operation type, units, metric/signature/frame, conditions, preserved invariants, fibers/injectivity or information loss, approximation/error bound, and exact composition order. Keep COMPOSE, INTERSECT/SLICE, THICKEN/EMBED, NEST, COARSE-GRAIN, PROJECT/READOUT, and MEASURE distinct.

### C. Empirical readiness

- `NO_SYSTEM`
- `NO_DATA`
- `CALIBRATION_INCOMPLETE`
- `HOLDOUT_UNVERIFIED`
- `UNSCORABLE`
- `ELIGIBLE_FOR_PREDECLARED_COMPARISON`

An empirical edge requires an identifiable measured system and genuine versioned data, provenance, units, calibration, uncertainty/covariance, instrument response, a frozen calibration/holdout split, matched standard comparator, and a predeclared score/falsification rule.

## 2. Prediction-admission rule

A geometry-to-observable chain is not prediction-ready unless every required edge has all three statuses resolved and the composition is explicit.

These cases are different:

1. A direct source can require a relation while leaving its map mathematically undefined.
2. A standard-reference map can be mathematically defined without being a source-authorized H(s)H construction.
3. An assistant reconstruction can be a useful candidate, but it remains assistant-authored until explicitly reviewed/adopted; a proof of its algebra does not change its authorship.
4. A source-grounded, fully typed map can still be empirically unscorable without real calibration, covariance, and holdout data.

Use the existing eligibility vocabulary:

- Missing source locator/author boundary: `SOURCE_RECOVERY_BLOCKED`.
- Missing or untyped forward arrow: `MAP_INCOMPLETE / PREDICTION_NOT_FORMED`.
- Distinct admissible geometries sharing a readout fiber while differing on the target: `UNIDENTIFIABLE`.
- Missing verified calibration, covariance, holdout, or access audit: `UNSCORABLE`.
- Only after those gates pass: `ELIGIBLE_FOR_PREDECLARED_COMPARISON`.

A parameter used to complete a map must be independently source-derived or estimated on the calibration subset, then frozen before holdout access. Estimating it on the holdout is a fit/retrodiction, not an independent prediction.

## 3. Concrete source-fidelity example: H0 → v_H

The previously source-audited Aster h657:s4 amendments 06 and 07 identify the following source lineage in the Meridian Minkowski Ring Analysis raw export (conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`, blob `56a84cb85d5c386efa4ea11d322d11e95e2c7703`):

- Nathan-direct message `92856f85-9f67-44d0-b1c4-4e9ff7d6500d` (2026-10-21 14:00:32Z) describes a time/vacuum contribution `c+H0` dimensionally normalized using an actual velocity related to H0, and a space-side H0 velocity. It does not state `v_H=H0L`.
- Direct messages `0514ab0c-19eb-4678-b8ef-179b5338a61f` (14:03:21Z), `f85322bc-e335-472b-aa7a-dbc19260633a` (14:05:51Z), and `c8ce3474-de6e-4c00-b307-00c7de0724e6` (14:06:39Z) clarify the midpoint/frame and statistical-centering convention.
- Assistant response `ca16d5ab-1b8a-4065-91b3-9b9622ece2cf` (14:05:58Z) introduces the standard Hubble-law dimensionalization `v_H(L)=H0L` and `R_H=c/H0`. The specific scale L is not supplied by the direct messages.

The current `BEDROCK.md` blob `527924246cc25caf7fac02dce4b20f024013cd19`, lines 575–577, places `v_H=H0*L` inside the composite `ND-2026-10-21-03` entry labeled “Nathan Direct.” The source-audited amendments classify this as direct intent plus assistant/standard dimensionalization, pending exact direct source or Nathan review. Treat that BEDROCK entry as `SOURCE_COMPOSITE / REVIEW_REQUIRED`, not as a verbatim Nathan Direct equation. **No BEDROCK edit is made or proposed here.**

The correct edge record is currently:

| Edge | Source authority | Map specification | Empirical readiness |
|---|---|---|---|
| `H0 → v_H` | Direct source requires an “actual velocity related to H0”; assistant response supplies `H0L`. | `UNDEFINED`: L and the H0-to-velocity map are not source-specified. | `NO_SYSTEM / NO_DATA`: no P2 system, measured L, calibration, covariance, or holdout selected. |

Thus `v_H` remains an abstract placeholder. `H0L` may be evaluated as a standard Hubble-law comparator if L is independently defined as a physical distance, but it is not thereby a source-forced H(s)H map. No observable prediction or falsification threshold can yet be stated.

## 4. Existing Lean evidence and its limits

Existing Aster PR #1444 contains `FORMAL_VERIFICATION/HsHVerification/AsterClockMapGate.lean`, blob `a0095443c58cea96a373aba49c311805bae8c95d`, at PR head `3abd57556fae19a97cd9ce7cd32f66733e2a0ce1`. The module deliberately leaves `vH` abstract and supplies no map H0 → vH or scale L.

Its existing Actions run #42347951120 / job #128329686817 used Lean 4.34.0 and Mathlib v4.34.0; the build completed successfully (8,945 jobs), including `AsterClockMapGate`, `GeometryProvenanceSeparation`, and `CognitionSourceOverlap`. This was a PR merge-reference build, not exact-head-only verification. The `#print axioms` output includes `propext`, `Classical.choice`, and `Quot.sound` for relevant declarations; the separate axiom-audit, tests, lint, and nanoda stages were skipped.

The checked theorems establish conditional scalar algebra and limited source-annotation/readout properties. They do not establish that the source translation is faithful, that the H0-to-velocity map exists, or that any physical premise is true. No new theorem is encoded: the missing map definition is not to be invented, and a data-free proof attempt remains blocked pending the required permission.

## 5. Current empirical and project status

P2 remains on HOLD with no measured system selected. No genuine dataset, provenance package, units, calibration, covariance, or independent holdout was retrieved in this run. Accordingly there is no physical calculation, fit, H(s)H prediction, standard-model score, or falsification threshold.

No SAT-O or Blockwave equation was copied, corrected, or re-attributed. No shared symbol was introduced. The operation-type register in issue #1448 remains complementary: it distinguishes composition, intersection, thickening, twist, contact, nesting, coarse-graining, readout, and measurement. This addendum contributes the independent source-authority axis for each edge.

## 6. Next cursor

1. Obtain Nathan/source-owner review of the composite attribution in `ND-2026-10-21-03`; do not edit BEDROCK before that review.
2. Keep `v_H` abstract until an exact source or explicitly adopted model defines the H0-to-velocity map and the physical meaning/units of L.
3. Only after a real measured system is selected, retrieve its versioned data, provenance, calibration, uncertainty/covariance, and independent holdout; freeze any map parameters on calibration data before scoring.
4. Apply the existing matched-comparator and falsification gates. If the map remains undefined, report `PREDICTION_NOT_FORMED`, not a failed or successful prediction.

This addendum changes workflow eligibility and provenance bookkeeping only. It advances no paper gate, no Factory Floor status, and no theory claim.
