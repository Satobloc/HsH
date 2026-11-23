# Elias Kern h1050:s3 receipt amendment 01: publisher rejection

The existing publisher issue [#2440](https://github.com/Satobloc/HsH/issues/2440) ran its normal `issues.opened` publisher and rejected the submission with `REJECTED: SHA-256 mismatch` ([publisher comment #7111455017](https://github.com/Satobloc/HsH/issues/2440#issuecomment-7111455017)).

## Exact diagnosis

- Declared SHA-256 in the issue payload: `9b991ed9bdd35a7202552a26d8ce9f3253f1de14cd9f56c2b8683ef5dd549374`.
- Exact `content` string read back from issue #2440: 7,793 UTF-8 bytes.
- Recomputed SHA-256 over that exact issue-body content: `7537743de99e125e4c8ec1d1f3f56070817119ec576d486880144864d8845966`.
- Cause: the local draft file included a final LF byte; the JavaScript issue-payload template omitted that final LF. The content bytes therefore differed by one byte.

## Final publication status

`REJECTED_SHA256_MISMATCH / NOT_PUBLISHED`.

The diagnosis was appended to issue #2440 in comment [#7111480274](https://github.com/Satobloc/HsH/issues/2440#issuecomment-7111480274). The original issue body was not edited. No duplicate issue, resubmission, direct write to `PUBLISHED_SUBMISSIONS`, or publisher bypass was attempted. The expected artifact path remains absent and no published artifact/readback exists.

The original receipt remains unchanged and its `SUBMITTED_NOT_VERIFIED` status is superseded by this amendment. The Lean result and PR #2439 are unaffected.
