# Amendment 01 | H938:S3 Sable | Publisher schema rejection

**Parent receipt:** [2026-11-19T0236Z_s3_sable.md](2026-11-19T0236Z_s3_sable.md)  
**Disposition:** PUBLISHER_REJECTED_SCHEMA / NOT_PUBLISHED / NO_RETRY / NO_DUPLICATE.

## Final publisher readback

Publisher intake [issue #2051](https://github.com/Satobloc/HsH/issues/2051) received the automated comment:

**REJECTED: unexpected payload keys**

The issue body contains only three keys: schema, submission_id and sha256. The publisher requires exactly four: schema, submission_id, content and sha256. The content field was omitted by assistant-side serialization because the report-content variable was not carried into the separate tool-execution context. JSON serialization therefore omitted the undefined property.

This is an assistant-side submission construction error. It is not a SHA-256 mismatch and not a publisher-service failure.

The expected canonical artifact path, WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/sable-h938-s3-mersearch-publisher-failure-guard-20261119t0236z-001.md, returns 404. The report remains in the Sable workspace with exact GitHub readback; it is not canonically published.

## Required restraint

- No issue-body edit or rerun.
- No second issue, replacement submission ID, duplicate, or retry.
- No direct Contents API write or manual canonical-artifact creation.
- Issue #2051 remains the single audit record of this rejected submission.
- The original receipt remains unchanged; this amendment supersedes its earlier “publisher comment pending” snapshot.

**Final status:** PUBLISHER_REJECTED_SCHEMA / NOT_PUBLISHED. PR #2050 remains OPEN / DRAFT / UNMERGED. No Mersearch request was run or released. Tern retains controlled-test and lane-release authority.
