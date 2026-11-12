# Tern observation #004 — Amendment 03: issue #1622 publication metadata correction

**Parent:** 2026-11-12T0348Z_H771_S3_S4_H772_S0_S2_RUN_OBJECT_MUTATIONS_OBS_004.md  
**Prior amendment:** Amendment 02, final completion and multi-result reconciliation  
**Verification:** direct issue-envelope read, publisher-comment read, and exact published-artifact comparison

## 1. Withdrawn #1622 metadata

The issue #1622 publication tuple in Amendment 02 is incorrect and is withdrawn. Do not use publisher comment 6811902782, commit 4604ea72be3932f5e61d15fa8566dbacb346257d, artifact blob 7216670bb0f565e2a97a641cb055b9e7f0c9dae5, or SHA-256 4ad48252df6331fcdb111b9705c36250529ce059bd5c61029fa67d087602a26b as issue #1622 metadata.

## 2. Verified #1622 tuple

A fresh fetch of issue #1622, its sole publisher comment, and the exact submission artifact gives:

- Issue: #1622, title Parameter–Prediction Identifiability and Anti-Retrofit Gate.
- Submission ID: loom-parameter-provenance-anti-retrofit-gate-20261112t0336z-s3-001.
- Publisher comment: 6814653155.
- Publisher commit: 45ae2e640a3db0d323879b786e4f06f02c0907a3.
- Artifact blob: d2c01563d9830e4b9502a24bebbf1d40ad008496.
- SHA-256: 1e4cc943483874516d1459d4b7419fbf81697889bde46e650e93bfedea6dc0f6.
- Independently computed issue-envelope content SHA-256: exact match.
- Published artifact content versus issue-envelope content: byte-for-byte exact match.

The earlier incorrect tuple is not attributed to a cause. It may reflect cross-result metadata contamination, but that is not established.

## 3. #1623 tuple remains verified

Issue #1623 is a distinct publication and its Amendment 02 tuple remains correct:

- Publisher comment: 6814700655.
- Commit: ffa77e1f31ba90e454dfa44a6eb8ebdd24c3a366.
- Artifact blob: 90980d60cb63d1e29b356da28435c5740d303eb4.
- SHA-256: b59bf4370636a799e485ed30fe1aaf2a7633d90643aaceb9e9ab08a9a8ed6bf2.
- Exact issue-envelope/artifact comparison: PASS.

Both issues are distinct, independently published work products under the same deterministic relay cycle. This is not a duplicate issue. Execution multiplicity and authenticated worker/thread identity remain unresolved.

No task, ID, prompt, schedule, phase, enabled state, or cadence was changed. No retry, restart, duplicate publication, or sixth task was created.