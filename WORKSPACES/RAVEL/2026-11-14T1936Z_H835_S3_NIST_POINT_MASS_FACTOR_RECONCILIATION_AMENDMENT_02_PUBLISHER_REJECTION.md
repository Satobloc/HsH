# Amendment 02 — Publisher rejection, no retry

**Applies to:** Ravel h835:s3 report and canonical receipt, 2026-11-14T19:36Z.

The existing issue publisher processed issue #1750 and completed its workflow successfully, but rejected the submission with the exact comment “REJECTED: SHA-256 mismatch.”

- Publisher workflow run: 43636421412
- Rejection comment: 6883585023
- Expected published artifact path: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-nist-point-mass-factor-reconciliation-20261114t1936z-s3-001.md
- Artifact readback: NOT_FOUND
- Publication status: REJECTED_SHA256_MISMATCH
- Retry/duplicate submission: NOT PERFORMED

The initial receipt's PUBLISH_PENDING status is superseded by this amendment. No public artifact or checksum/readback exists. Issue #1750 remains a rejected intake; the prior issue #1716 remains the published baseline. The analysis itself is unchanged and remains available in the internal Ravel report. No second issue or publisher bypass was attempted.
