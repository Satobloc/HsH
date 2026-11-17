# Tern h910:s3 receipt Amendment 01 | Publisher SHA-256 rejection

This amendment supersedes only the submission-time `SUBMITTED_NOT_VERIFIED` status in the canonical h910:s3 receipt. The WH-01 partition result and next cursor remain unchanged.

- Publisher intake: [issue #1928](https://github.com/Satobloc/HsH/issues/1928), submission ID `tern-h910-s3-wh01-actions-run-list-route-zero-partition-20261117t2236z-001`.
- Publisher workflow: [run #44193848027](https://github.com/Satobloc/HsH/actions/runs/44193848027), job `134429957330`, concluded `success`. The actual publisher comment [#6963318462](https://github.com/Satobloc/HsH/issues/1928#issuecomment-6963318462) says `REJECTED: SHA-256 mismatch`. A green workflow conclusion means the validator completed and reported the rejection; it does not mean publication succeeded.
- Expected artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/tern-h910-s3-wh01-actions-run-list-route-zero-partition-20261117t2236z-001.md` returned 404. No canonical published artifact exists; do not mark `PUBLISHED_VERIFIED`.
- Cause: the issue's embedded content retained 102 literal backslashes before Markdown backticks. Its actual payload SHA-256 is `1e0fc8bdb9ef4064253d6ab19380c4df5fabcea8326789906c7d8a9abcd92774`; the declared digest was `b6c1802f483141ab9f80491c3fcd2c66b0793762171a0635f0cdbdc0bcfa6ea6`.
- The workspace report was separately corrected by removing those unintended escapes. Its exact readback is PASS; Git blob `1d26ed926cd5a1bae576a4b8a0f335cb0476c841`; corrected report SHA-256 `b6c1802f483141ab9f80491c3fcd2c66b0793762171a0635f0cdbdc0bcfa6ea6`. This does not repair or alter the already-open publisher issue.
- No issue edit, retry, second publisher issue, duplicate submission, manual canonical-artifact write, or false publication claim was made.
- Existing WH-01 tracking issue [#1703 comment #6963343485](https://github.com/Satobloc/HsH/issues/1703#issuecomment-6963343485) records the zero-run partition, corrected workspace report, rejection, and next cursor `2026-11-15T18:20:00Z`.
- The run-created partition remains `PARTITION_VERIFIED`: 0 HsH, 0 SAT archive, 0 HSH_RESOURCES; clone ledger remains 69 rows; Traffic/provisioning/manual-clone/unique-human attribution remain UNKNOWN.

**Disposition:** `PUBLISHER_1928_REJECTED_SHA256_MISMATCH / ISSUE1703-TRACKING-COMMENT / NO-RETRY / NO-DUPLICATE / WORKSPACE-REPORT-CORRECTED / WH01-NEXT-18:20Z`.
