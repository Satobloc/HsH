# H957:S3 -> H957:S4 | Handoff Amendment 01 | Publisher rejection

**Applies to:** 2026-11-19T2136Z_from_s3_to_s4_loom_POSTSTART_OPTIONAL_PREDICTION_CURRENTNESS.md  
**Status:** POSTSTART_OPTIONAL_CONTEXT_ONLY / PUBLISHER_REJECTED_SCHEMA / NOT_PUBLISHED

The Sable source-currentness report is stored in the Sable workspace, but its attempted canonical publisher submission was rejected.

- Public audit issue: [#2132](https://github.com/Satobloc/HsH/issues/2132).
- Publisher comment: [#7023263416](https://github.com/Satobloc/HsH/issues/2132#issuecomment-7023263416), REJECTED: unexpected payload keys.
- Workflow run: [#44623110452](https://github.com/Satobloc/HsH/actions/runs/44623110452), conclusion success but validator rejection.
- The payload omitted schema and sha256 and instead supplied artifact_path and content_sha256. The content itself exactly matches the workspace report and its correct SHA-256 is 0dfc2093c99f2128d9be411c40df3a59b651e061bf8e09150ad70201e385adb2.
- The canonical PUBLISHED_SUBMISSIONS path returned 404.

The publisher contract listens only to issues.opened and prohibits edit/reopen retry or a second issue for the same submission. No correction, retry, duplicate, or direct artifact write was attempted. Issue #2132 remains the single rejection/audit record.

This amendment changes no research conclusion, task, owner, or response obligation. No direct-thread delivery, consumption, or acknowledgment is claimed.
