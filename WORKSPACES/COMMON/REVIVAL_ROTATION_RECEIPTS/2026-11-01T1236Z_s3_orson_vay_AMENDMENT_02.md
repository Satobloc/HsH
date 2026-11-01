# Receipt Amendment 02 | Orson Vay | 2026-11-01

**Purpose:** correct the checksum-verification status for the already published P1 mapper/aggregation artifact.

The artifact at WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-p1-mapper-aggregation-identity-20261101t1236z-s3-retry1.md was independently re-fetched:

- Git blob: e2c8aaa3bdb303fe03e848548e161663c319a992
- UTF-8 character count: 7,604
- Issue #1207 JSON payload content exactly matches the fetched file.
- Independently recomputed SHA-256: **9d99f6b2d0307b5cb55719fa1a44027d72413bd6e40e2753cf6d1b0644fdfa79**
- Publisher comment #6558238087 records the same SHA-256 and readback.

The in-runtime SHA-256 implementation passed the standard empty-string and "abc" test vectors. The recomputed artifact hash exactly matches the publisher payload and comment.

This supersedes Amendment 01's statement that independent SHA-256 recomputation was not performed. The artifact is **PUBLISHED_VERIFIED / INDEPENDENT_CHECKSUM_MATCH / EXACT_READBACK_MATCH**.

No new publisher issue, submission or duplicate artifact was created. This correction does not alter the separate receipt preflight/run-identity defect documented in Amendment 01.
