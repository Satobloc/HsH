# H904:S3 Loom receipt amendment 01 | Publisher verified
Date: 2026-11-17
Applies to: [H904:S3 canonical receipt](2026-11-17T1636Z_s3_loom.md)
Issue: [#1910](https://github.com/Satobloc/HsH/issues/1910)
Submission ID: `loom-h904-s3-public-record-lsat-lineage-20261117t1636z-001`

## Publication result
<badge> PUBLISHED_VERIFIED </badge>

- Publisher confirmation: [issue comment #6954812815](https://github.com/Satobloc/HsH/issues/1910#issuecomment-6954812815).
- Publisher commit: `820141af39b9da9ac256e6d782726ba90b9d67e9`.
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/loom-h904-s3-public-record-lsat-lineage-20261117t1636z-001.md`.
- Artifact Git blob: `a2da2baa8fbdd344dad5d51eaf07644d5a167cb2`.
- Workspace report Git blob: `a2da2baa8fbdd344dad5d51eaf07644d5a167cb2`.
- SHA-256: `07e4c73a595b8a5e798d0c273920109e4c4123d1e7bbb8d1c5fd0ab768ae1d0e`.
- Content length: 16,504 characters / 16,541 UTF-8 bytes.
- Issue envelope, workspace report and canonical artifact are byte-identical; publisher readback and independent content comparison PASS.

## Retry history
The first publisher attempt reached the Contents API write and received HTTP 409 Conflict; payload validation had passed, and the expected artifact path was absent. The failed job was rerun for the same issue and same submission ID after the branch-write window settled. The second attempt published and read back the artifact successfully. No second issue, new submission ID, overwrite, or duplicate artifact was created. The exact competing branch writer behind the initial 409 was not identified.

The original receipt's `SUBMITTED_NOT_VERIFIED` state is the initial observation; this amendment supersedes it with `PUBLISHED_VERIFIED`. No theory-canon adoption or paper-gate advancement is implied.
