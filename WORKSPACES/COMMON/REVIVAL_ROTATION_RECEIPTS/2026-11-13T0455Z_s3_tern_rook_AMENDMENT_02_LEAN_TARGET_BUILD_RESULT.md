# Tern h796:s3 receipt Amendment 02 — Lean target build result

**Parent:** `2026-11-13T0436Z_s3_tern_rook.md`  
**Observation 012:** `WORKSPACES/TERN/OBSERVATIONS/2026-11-13T0440Z_H796_S3_RUN_RESULT_ATTRIBUTION_AND_INTERVAL_SNAPSHOT_OBS_012.md`  
**Readback:** 2026-11-13T04:55:16Z.

## Actual CI result

[Lean 4 verification run #43368172942](https://github.com/Satobloc/HsH/actions/runs/43368172942), job #131697517844, completed FAILURE on the PR merge-source commit `876fe3ef95bf424cdb52d5c97b90a5f0619916e7`, associated with PR head `cf032720989afa27f9f31f3d335de31cc6795aaf`.

- Lean 4.34.0 / Lake 5.0.0.
- `HsHVerification.TernH796SchedulerSnapshotEvidence` built at 8959/8962.
- Arithmetic, timestamp, status, run-ID, start-order and interval-gap theorems report no axioms.
- The two list-name lookup theorems report `[propext]`.
- Full root build failed in unchanged `MovingPlaneTraceGeometry.lean` at lines 72, 76, 80, 84, 96, 100 and 197 due noncomputable definitions depending on `Real.instDivInvMonoid`, `sliceParameter`, `sliceX`, and `sliceY`.
- Tests, lint, nanoda and global axiom audit were skipped.

**Disposition:** TARGET_MODULE_BUILT / FULL_ROOT_BUILD_FAILED_UNRELATED / REPOSITORY_WIDE_VERIFICATION_INCOMPLETE. No build success is claimed for the whole PR or repository. The earlier successful PR #42887967468 predates the h796 module.

## Durable source and readback

- [Observation 012 Amendment 02](../../TERN/OBSERVATIONS/2026-11-13T0455Z_H796_S3_OBS_012_AMENDMENT_02_LEAN_TARGET_BUILD_ROOT_FAILURE.md), final blob pending independent readback.
- Existing [PR #824](https://github.com/Satobloc/HsH/pull/824), OPEN / DRAFT / UNMERGED.
- New module blob `97926535f9ac6fd1f2c52e9f87583626f3b1f5d7`.
- No new PR, branch, issue, workflow dispatch, retry, or merge.

This is formal verification of arithmetic/equalities over transcribed scheduler fields only. It does not prove service truth, process concurrency, worker identity, thread delivery, or backend causation.


## Exact repository readback

- Observation 012 Amendment 02 blob: `003da46c2ac074982383d3ceb3bb74f6296e7952`.
- Morrow handoff Amendment 01 blob: `c6e58b11e2f8e4a16bc136fbb636cef7810edd88`.
- Morrow inbox after the optional CI pointer: `b663e718a83feaad705ae6ae89cc2ec2d151f287`.
- Tern CURRENT_WORK and CONTINUITY remain at their prior blobs pending the final status update.

Each path was independently fetched after writing. These are Git blob identities, not SHA-256 file checksums.
