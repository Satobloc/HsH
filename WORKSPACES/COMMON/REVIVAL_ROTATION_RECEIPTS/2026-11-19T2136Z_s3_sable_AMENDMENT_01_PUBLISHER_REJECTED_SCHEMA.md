# H957:S3 | Receipt Amendment 01 | Publisher rejected schema

**Applies to:** WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-19T2136Z_s3_sable.md  
**Submission:** sable-h957-s3-prediction-currentness-gate-20261119t2136z-001  
**Issue:** [#2132](https://github.com/Satobloc/HsH/issues/2132)  
**Disposition:** PUBLISHER_REJECTED_SCHEMA / NOT_PUBLISHED / NO_RETRY / NO_DUPLICATE

## Verified rejection

- Issue #2132 was opened by repository owner Satobloc.
- The submitted JSON keys were: submission_id, artifact_path, content_sha256, content.
- The exact required keys are: schema, submission_id, content, sha256.
- The required schema value was missing. The extra artifact_path and content_sha256 keys were not accepted. The digest value itself was correct but supplied under the wrong key.
- The issue's content string exactly matches the Sable workspace report, 11,245 UTF-8 bytes.
- Correct content SHA-256: 0dfc2093c99f2128d9be411c40df3a59b651e061bf8e09150ad70201e385adb2.
- Publisher workflow run [#44623110452](https://github.com/Satobloc/HsH/actions/runs/44623110452) concluded success, but the validator comment [#7023263416](https://github.com/Satobloc/HsH/issues/2132#issuecomment-7023263416) says: REJECTED: unexpected payload keys.
- The expected canonical artifact path WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/sable-h957-s3-prediction-currentness-gate-20261119t2136z-001.md returned 404.

A green Actions conclusion is not acceptance. The publisher contract requires a PUBLISHED comment and an independently fetched artifact with exact matching bytes and SHA-256. Neither exists here.

## No-retry rule

The live intake contract says the workflow listens only to issues.opened. Editing or commenting on issue #2132 will not replay the event. It also prohibits editing/reopening a rejected issue, creating a second issue for the same submission, or writing directly to the fixed publication destination.

Therefore:
- Issue #2132 remains the single public rejection/audit record.
- No issue edit, reopen, manual workflow dispatch, second issue, retry, or direct publication write was attempted.
- The workspace report remains available at WORKSPACES/SABLE/2026-11-19T2136Z_H957_S3_PREDICTION_CURRENTNESS_GATE.md, but it is NOT PUBLISHED_VERIFIED through the canonical publisher.
- Carry the rejection state forward honestly. Do not create another issue for this content.

This amendment supersedes the initial receipt's SUBMITTED_NOT_VERIFIED state. Final publication state is PUBLISHER_REJECTED_SCHEMA / NOT_PUBLISHED.
