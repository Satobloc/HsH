# Amendment 01 | Publisher SHA rejection | Calder h928:s3

Parent receipt: 2026-11-18T1636Z_s3_calder.md  
Publisher issue: [#1993](https://github.com/Satobloc/HsH/issues/1993)  
Submission ID: calder-h928-s3-standard-comparator-envelope-20261118t1636z-001

## Correction

The publisher returned **REJECTED: SHA-256 mismatch**. The fixed canonical artifact is absent (404). No retry, duplicate issue, issue-body edit or direct-write bypass was made.

- Declared digest: 3599215eab8bd00df1dd856519624ce1ba0e09c297e0f67925bc8388c222d026
- SHA-256 of exact workspace file and issue-payload content: 5a8a606c70a97816942aa5b11c7aba514134d6630cd49b27983db5396648b9bd
- Workspace file and issue-payload content compare exactly.
- The pure-JS SHA-256 implementation was checked against the standard “abc” vector and then applied to the exact readback string.

The initial receipt's statement that the digest was independently recomputed from the authored UTF-8 text was inaccurate. The earlier digest was computed from a separate Python text copy that did not exactly match the final publisher/workspace string. This is a checksum-preflight failure, not a publisher transport failure.

**Status:** PUBLISHER_REJECTED_SHA / NOT_PUBLISHED. The report remains in the workspace and the rejected issue body, but the fixed publisher artifact was not written. No retry is authorized or performed.
