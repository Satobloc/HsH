# Orson P1 addendum | Source-locked CGD manifest arithmetic and Lean table proof

**Status:** ARCHIVE REPLAY VERIFIED / CONDITIONAL FINITE-TABLE PROOF COMPILED. This is an additive methods/archival result, not a new experiment or a P1 paper-gate completion.

## Source and replay

Pinned public source: `aayambansal/ConsistencyBench`, commit `bfc676baa848c7f1715bb73aee148180de15516e`. The evaluator is `src/evaluate.py`, Git blob `0453540cb7c19227601e59fb342fa93e736da849`, lines 238-327. The existing HsH per-file manifest is blob `e59fb1b5443977089f51e85068b9259248930957`.

All 17 result JSON blobs were fetched by their exact Git blob SHA. A fresh direct-prefix replay and a separately implemented prefix-array replay agreed on every per-file count vector; all 17 vectors match the existing manifest.

Across 17 files:
- 5,100 sets and 19,550 question records.
- 6,702 contradiction flags / non-null revision responses.
- 6,643 text-different and 59 text-identical revisions.
- 2,010 changed answer labels.
- Definite/possible stale raw-text checker comparison positions: 1,174-4,386 (width 3,212).
- Definite/possible changed-label comparison positions: 394-1,444 (width 1,050).

The 59 text-identical revisions matter: counting every non-null revision as superseded raw text would overcount. The intervals are source-loop position bounds, not verified completed external API calls, semantic errors, error rates, or causal estimates. The archived records do not retain the first triggering pair or raw NLI prompt/output.

## Lean verification

Added `OrsonCGDManifestBounds.lean` to existing Orson PR #850. The module encodes all 17 filenames, raw blob IDs, and per-file replay counts, then proves row count, uniqueness, per-file invariants, aggregate totals, and both interval widths.

- PR: https://github.com/Satobloc/HsH/pull/850
- Branch head: `3041f7c2cd717b51945dacaf1d24bc69a0394987`
- Module blob: `f19805cc34526ce6643360efe8b391ddb646506c`
- Root aggregator blob: `13ad86ea2a8f4df72a770e3a5509b93a02b38c9a`
- Actions run #42795140460, job #129758320557: SUCCESS.
- Tested merge reference: `3bced884cbea0a145e9e117a51a787283fe84c2a`, merging PR head `3041f7c2cd717b51945dacaf1d24bc69a0394987` into base `598a45b3feb9378eb8f14ff069ec9080137113c2`.
- Lean 4.34.0; Lake 5.0.0; full root build completed successfully (8,984 jobs).
- All 23 theorem-specific `#print axioms` outputs were inspected: 8 report no axiom dependencies; the remaining 15 depend only on `propext`.
- Full job log contains zero `sorryAx` and zero bare `admit`.

This was a successful merge-reference build, not a standalone exact-head build. Tests, lint, nanoda, and the separate global axiom audit were skipped.

Lean verifies only the finite-table statements as encoded. It does not prove that the replay-to-table translation is sound, that the archived evaluator or NLI decisions were semantically correct, that external API calls completed, or that revision caused any outcome.

## Relation to existing publication and P1

This is an additive formalization of the source table already reported in issue #853, not a replacement or duplicate of that report. Existing issue #853 remains the sole published report of the stale-input bounds.

P1 issue #564 remains OPEN / NOT READY. The original answer-keyed neutral-versus-false-authority bank remains unrecovered. No new model trial, human session, model API call, API spend, manuscript edit, canonical PDF/reader, independent review, or paper-gate advancement occurred. No theory or BEDROCK promotion is claimed.
