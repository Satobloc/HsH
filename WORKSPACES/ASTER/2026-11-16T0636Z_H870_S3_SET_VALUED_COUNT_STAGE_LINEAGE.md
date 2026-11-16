# Set-valued acquisition lineage for derived count-stage outputs

**Status:** exact-head Lean build passed; draft PR open; no physical result or P2 admission.

## The composition gap

Three existing contracts cover adjacent parts of the measurement chain:

- [Issue #1602](https://github.com/Satobloc/HsH/issues/1602) distinguishes attempted acquisitions, observed units/channels, measurement mode, missingness and preassigned folds.
- [PR #1515](https://github.com/Satobloc/HsH/pull/1515) formalizes when a channel-level fold assignment factors through a single acquisition-unit map.
- [PR #1823](https://github.com/Satobloc/HsH/pull/1823) types a count by processing stage and aggregation scope; its public report is [issue #1825](https://github.com/Satobloc/HsH/issues/1825).

A raw channel can belong to one acquisition unit, but a derived aggregate can depend on several attempted acquisitions. The current `CountWitness` carries stage, scope and count, but not the set of attempts contributing to that output. A single-valued `unitOf : Channel → AcquisitionUnit` does not by itself preserve multi-source ancestry. Without that set, an aggregate spanning calibration and holdout attempts could be assigned one fold and leak information across the split.

## Formal addition

[PR #1828](https://github.com/Satobloc/HsH/pull/1828) adds `CountStageLineageWitness`, pairing an existing `CountWitness` with a nonempty finite set of contributing attempted-acquisition IDs.

The module defines aggregate lineage as the union of the input records' source-attempt sets and proves:

1. A derived output has one valid fold assignment exactly when all contributing attempts share the same preassigned fold.
2. If its source set contains attempts from different folds, no single fold assignment exists.
3. Aggregating inputs whose contributing attempts all share one fold preserves fold-homogeneity.

This is a composition rule: the stage/scope/count witness is now paired with set-valued acquisition ancestry. It does not invent an "aggregate acquisition unit".

## Exact-head Lean verification

- PR head: `8d9c5ba1b346b7f19ba32fd519a2f1efb5836829`.
- [Actions run #43822688028](https://github.com/Satobloc/HsH/actions/runs/43822688028), job `133149177742`: **SUCCESS**.
- Lean 4.34.0; Lake 5.0.0; Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`.
- Full root formal library: 8,959 jobs successfully built.
- The four theorem-specific `#print axioms` reports list `propext`, `Classical.choice` and `Quot.sound`; no `sorryAx` or `admit` occurrence was found in the job log.
- Tests, lint, nanoda, leanchecker and the separate global axiom-audit action were skipped. This is an exact-head formal-library build, not a full test suite or global axiom audit.

## Limits and remaining evidence

The source-attempt set must be supplied by a provenance-complete processing manifest. Lean does not discover or authenticate it. The separate AttemptLedger must retain missing and failed attempts.

The proof does not establish statistical independence, source-set completeness, count-operator arithmetic, the lineage of any particular PIV dataset, or a physical model. A same-fold aggregate can still contain dependent measurements. The module also does not carry per-attempt count values, so it cannot verify that an aggregate count is the sum of its inputs. Empty-source outputs are intentionally not assigned a fold; a genuine empty-scope state would need an explicit separate status.

The Jackson–Thomas PIV count-stage question recorded in #1823/#1825 remains unresolved because no per-run acquisition manifest, raw PIV data or covariance package was retrieved. No physical calculation, fit, prediction, independent measurement, system selection or falsification threshold was produced. P2 remains HOLD.

The PR is DRAFT / OPEN / UNMERGED and stacked on #1823, which is stacked on #1515. Base resolution and independent review remain required.
