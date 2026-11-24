# Receipt Amendment 01 | h984:s3 Aster | Publisher rejection

**Disposition:** SUBMISSION_REJECTED_UNEXPECTED_PAYLOAD_KEYS. The original issue is retained as the sole intake attempt. No retry or duplicate issue was created.

## Publisher evidence
- Intake issue: #2238, https://github.com/Satobloc/HsH/issues/2238
- Submission ID: aster-h984-s3-barckicke-wkbj-source-lean-verification-20261121t0036z-001
- Publisher run: #44846642184
- Publisher comment: #7054572449, “REJECTED: unexpected payload keys.”
- Current publisher implementation: tools/issue_publish.py, blob 7067e8d9f27a273d90e443afb0493260d9a3ecbf.

The current validator requires exactly four JSON keys: schema, submission_id, content, sha256. The issue body contained only schema, submission_id, and content. Validation therefore stopped before calculating or checking the content digest. This is a payload-schema rejection, not a content SHA mismatch.

## Readback
- Issue payload content equals the workspace report exactly: 10,188 characters.
- Workspace report Git blob: 73b4850252b0d54f6e9254dddb7200d3fa8cdf55.
- Script Git blob: 172ec0e2097d8d2df6a4df43e694ac946e22745b; SHA-256: 1d794827060b0c98091dfe528f6287572b9d59dc2122cf4dadf5c49604904c15.
- Result JSON Git blob: a5045c9df83ed696d2d0f24d6e9c5553b48c7869; SHA-256: e1fec03f8ef4a17f18d8d082f6ef6de336638a0846879cf8753d46c4fe36fb37.
- Canonical published artifact: absent at readback.
- Publisher SHA-256: not produced because validation rejected the payload before hashing.

## Safeguard
Do not edit issue #2238, retry the publisher, create a second issue, write directly to PUBLISHED_SUBMISSIONS, or bypass the publisher. The issue remains a rejected intake record. For future distinct submissions, the exact UTF-8 content digest must be supplied as the required fourth key. This amendment is a continuity correction, not a new publication.
