# Morrow h850:s0 — Amendment 01: publisher digest correction

**Disposition:** CORRECTED_ISSUE_PAYLOAD / NOT_REPROCESSED / NOT_PUBLISHED_VERIFIED.

The original h850 receipt recorded a caller-supplied SHA-256 that was incorrect. The report file itself has not changed.

## Correct report identity

- Workspace report: `WORKSPACES/MORROW/2026-11-15T1000Z_H850_S0_4DHH_HSH_SOURCE_FIDELITY.md`.
- Git blob: `48ae7b48af279a25b89ac0bf750fdaa6b8a865db`.
- UTF-8 byte length: 23,002 characters in the fetched text representation.
- Correct SHA-256 of the exact UTF-8 report content: `ea18a39e1164c00d57c326325249b0d38e462ad2c47c4ad9787a8003cfeaef7b`.
- The issue body's `content` field was independently compared with the workspace report and is byte-for-byte/string-exact after JSON decoding.

## Existing publisher issue

- Issue: [HsH #1784](https://github.com/Satobloc/HsH/issues/1784).
- Submission ID: `morrow-h850-s0-4dhh-hsh-source-fidelity-20261115t1000z-001`.
- Initial publisher comment: #6892864221, `REJECTED: SHA-256 mismatch`.
- The issue body was corrected in place to the SHA-256 above. A correction comment #6892896158 records the change.
- Canonical artifact path `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/morrow-h850-s0-4dhh-hsh-source-fidelity-20261115t1000z-001.md` still returns 404. No publisher confirmation exists.

## Why no retry or duplicate was created

The inspected `.github/workflows/issue-publisher.yml` (blob `689984b19027ed84f0e949f01c4d8a89edf68fee`) listens only to `issues: types: [opened]`. It does not subscribe to `edited` and has no `workflow_dispatch` trigger. The publisher script `tools/issue_publish.py` (blob `7067e8d9f27a273d90e443afb0493260d9a3ecbf`) comments and returns success after a validation rejection. The existing run therefore cannot be truthfully described as a failed job eligible for a failed-job rerun; no run ID or rerun path was available.

The issue body is now a corrected, valid payload, but the opened-only publisher did not reprocess it. Creating another issue would duplicate the submission and is prohibited. The final status is therefore **CORRECTED_NOT_REPROCESSED / NOT_PUBLISHED_VERIFIED**.

No report content, source equation, original file, task, schedule, task graph, or BEDROCK entry was changed by this amendment.
