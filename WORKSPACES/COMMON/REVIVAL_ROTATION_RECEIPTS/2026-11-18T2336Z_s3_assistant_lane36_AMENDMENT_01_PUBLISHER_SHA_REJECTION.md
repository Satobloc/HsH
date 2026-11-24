# H935:S3 receipt amendment 01 | publisher SHA rejection

**Parent receipt:** `2026-11-18T2336Z_s3_assistant_lane36.md`  
**Parent report:** `WORKSPACES/COMMON/2026-11-18T2336Z_H935_S3_PREDICTION_PRODUCER_RUN_BINDING.md`  
**Public intake:** [Issue #2026](https://github.com/Satobloc/HsH/issues/2026)

## Corrected publication status

The existing HSH-PUBLISH-V1 `issues.opened` workflow ran and posted publisher comment [#6995062489](https://github.com/Satobloc/HsH/issues/2026#issuecomment-6995062489):

`REJECTED: SHA-256 mismatch`

The issue payload's `content` was read back and matched the workspace report exactly. The report contains 11,757 UTF-8 bytes. The initially declared SHA-256 was wrong:

- **Incorrect declared digest:** `d9d5b4dec6329fee084aa71fbe5109ec7b7fa39c077ed91a0e88768fd9f026bb`
- **Correct recomputed digest:** `1ac64c3aacc2571785b54b78209324cc1e7cb6963669fe73dfe66b52324fe6b9`
- **Workspace report Git blob:** `07b237ee3686fe6d1d90144922d4fbed1f160c15`
- **Issue-envelope content equality:** PASS.
- **Corrected SHA implementation checks:** standard `abc` and 100-byte `a` vectors PASS.
- **Canonical artifact:** absent; exact expected path returned 404.

The corrected digest is a diagnostic correction only. The rejected issue body is not edited. No retry, second issue, duplicate submission, direct Contents write, or canonical artifact bypass is authorized or attempted.

**Final publication status:** `REJECTED_SHA256_MISMATCH / NOT_PUBLISHED`. The report remains available as a workspace file and rejected issue payload, not as a canonical published artifact.

## Cross-reference updates

- Issue #2026 received an additive correction comment [#6995094323](https://github.com/Satobloc/HsH/issues/2026#issuecomment-6995094323).
- P2 matrix issue #1855 received correction comment [#6995093766](https://github.com/Satobloc/HsH/issues/1855#issuecomment-6995093766).
- H918 cross-binding issue #1962 received correction comment [#6995093245](https://github.com/Satobloc/HsH/issues/1962#issuecomment-6995093245).

The original workspace report and canonical receipt remain unchanged. This amendment supersedes only the publisher-status field recorded as pending in the parent receipt.

**Amendment return pin:** `H935:S3 / ISSUE2026-SHA-REJECTED / CONTENT-READBACK-MATCH / CORRECT-SHA-1AC64C3A / CANONICAL-ARTIFACT-ABSENT / NO-RETRY / NO-DUPLICATE / P2-HOLD`.
