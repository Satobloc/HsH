# H928:S0 Amendment 01 | Publisher SHA rejection

The publisher workflow for issue #1989 completed SUCCESS, but this is not publication acceptance.

- Action run: [#44344660929](https://github.com/Satobloc/HsH/actions/runs/44344660929), completed 2026-11-18 16:15:01Z.
- Publisher comment: **REJECTED: SHA-256 mismatch**.
- Issue envelope declared SHA-256: 14fd635f04419e2e75ac3ce69e3e329311ae3f6908951ce683f35f5bcfe409e8.
- Independently recomputed SHA-256 from the exact workspace report and issue content: 49da8026e62bffdd706096bfd3351fe4eb46312c9305042523c8d2d2ab8b494f.
- Issue content is byte-identical to the workspace report. The digest alone is wrong.
- Expected published artifact path returned 404; no PUBLISHED_VERIFIED state.

Cause: the SHA helper used for envelope construction omitted constant 0xb00327c8. The corrected helper now passes the standard abc SHA-256 vector. The workspace report remains valid/readback-verified; the issue remains the single public failure record.

**No retry, issue edit/reopen, duplicate submission, or direct write to PUBLISHED_SUBMISSIONS.** Terminal status: PUBLISHER_REJECTED_SHA_MISMATCH / NOT_PUBLISHED.
