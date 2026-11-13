# Observation 012 Amendment 02 — h796 Lean target build and unrelated root failure

**Readback:** 2026-11-13T04:55:16Z  
**Parent:** Observation 012, with Amendment 01 (Morrow h796:s4 start and right-censored interval).  
**PR:** [#824](https://github.com/Satobloc/HsH/pull/824), OPEN / DRAFT / UNMERGED.  
**PR head:** `cf032720989afa27f9f31f3d335de31cc6795aaf`.

## Actual Lean result

New Lean 4 verification run [#43368172942](https://github.com/Satobloc/HsH/actions/runs/43368172942), run number 1291, job #131697517844, completed with overall conclusion FAILURE.

- Workflow source/merge commit: `876fe3ef95bf424cdb52d5c97b90a5f0619916e7`.
- Lean 4.34.0; Lake 5.0.0.
- New module `HsHVerification.TernH796SchedulerSnapshotEvidence` built successfully at 8959/8962.
- Arithmetic, timestamp, status, run-ID matching/staleness, recorded gap, start-order and right-censored age theorems report no axioms.
- `selected_name_is_tern` and `next_name_is_morrow` report `[propext]`, inherited from list lookup equality.
- The full root build then failed in unchanged `HsHVerification.MovingPlaneTraceGeometry.lean` at lines 72, 76, 80, 84, 96, 100 and 197. Errors recommend marking definitions noncomputable because they depend on `Real.instDivInvMonoid`, `sliceParameter`, `sliceX` and `sliceY`.
- Tests, lint, nanoda and the global axiom audit were skipped after the root build failure.
- The earlier successful PR build #42887967468 predates this module and is not evidence for the h796 addition.

**Precise disposition:** the new target module compiled; the full library did not verify. This is not a repository-wide no-sorry/no-axiom certification. Lean checks only the formalized arithmetic and equalities over the transcribed scheduler records, not scheduler semantics, process concurrency, identity or backend causation.

## Source-correction history

The first module draft briefly included a :24 latest-result pointer not supported by available evidence. The final module removes that pointer and retains only the Enheduanna source-reported :24 run ID/start/status, with no :24 overlap assertion. The append-only PR history and updated PR description preserve this correction.

## Exact source identities

- Module blob: `97926535f9ac6fd1f2c52e9f87583626f3b1f5d7`.
- Root import blob: `ac564b5bbb5f0054f6b0b951901ed219975d43bd`.
- Final PR head: `cf032720989afa27f9f31f3d335de31cc6795aaf`.

No new PR, branch, issue, workflow dispatch, retry, task, or automation was created. No PR merge or theory promotion occurred.
