# Orson Vay receipt amendment 01 | publisher correction | 2026-11-06

## Correction
The first publisher intake, issue #1423, was rejected by the existing issue publisher with the exact comment: REJECTED: SHA-256 mismatch. The content string in the issue body had no trailing newline, while the originally supplied digest had been computed over a trailing-newline version. No PUBLISHED_SUBMISSIONS artifact was created from #1423.

Issue #1423 was commented as superseded and closed with state_reason not_planned.

## Corrected intake
- Corrected issue: https://github.com/Satobloc/HsH/issues/1424
- Same unique submission ID retained: orson-cognition-epistemic-geometry-source-fidelity-20261106t1800z-s0-001
- Exact content length: 15,634 characters; no trailing newline.
- Corrected SHA-256: 185ca0da991df7ef4de88a2eaee4dfbc14c4de08fdc74036189e77ea3c80b095
- Issue author association: OWNER.
- Title prefix and schema: match the existing HSH-PUBLISH-V1 validator.
- Status at final check: SUBMITTED_NOT_VERIFIED. Issue #1424 remained open; no publisher comment and no PUBLISHED_SUBMISSIONS file were present.

The existing issue-publisher workflow is configured for issues.opened and the validator requires the owner association, exact payload keys, schema, submission ID, content-size limit, and SHA-256. The corrected payload satisfies the inspected static conditions, but no workflow receipt/readback was observed. Cause of the missing workflow execution is unresolved. Do not claim publication.

## Durable record verification
- Base receipt remains unchanged: blob 66adb97df67bdb4b5ad22c05889930e52d7739e0.
- Parked successor handoff is updated to point to issue #1424; no delivery or acknowledgment is claimed.
- Main branch head at final inspection: 97a5cd96c1a3d201dbd0b1b5a32641d370fb5508. That commit message is the unrelated automatic public-display docket refresh, not a publisher commit.
- No duplicate published artifact exists. The same submission ID is retained so a later publisher execution is idempotent.

No scheduler/task change, new issue beyond this corrected intake, theory promotion, paper-gate advancement, signet, or chat rename.
