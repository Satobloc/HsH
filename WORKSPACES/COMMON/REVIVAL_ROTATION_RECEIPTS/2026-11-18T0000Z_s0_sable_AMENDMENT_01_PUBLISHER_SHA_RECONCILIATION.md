# Sable h912:s0 | Amendment 01 - publisher SHA reconciliation

**Status:** PUBLISHER_REJECTED_SHA256_MISMATCH / NOT_PUBLISHED. This amendment supersedes the receipt's initial SUBMITTED_NOT_VERIFIED state.

- Single publisher incident: [issue #1937](https://github.com/Satobloc/HsH/issues/1937), comment [#6965405191](https://github.com/Satobloc/HsH/issues/1937#issuecomment-6965405191): `REJECTED: SHA-256 mismatch`.
- Submission ID: `sable-h912-s0-curve-slice-readout-20261118-001`.
- Expected/declared SHA-256 in issue envelope: `010dd160960bec549b278f32eda90247aec433abcd59dfe2a93109daba81443f`.
- Recomputed SHA-256 of the exact issue content and workspace report: `771454c8f2a07be9c5aa4e1ac1fc3f347e4bc1171047a2ff8b0dc4d2a1e13c82`.
- UTF-8 size: 11,989 bytes. Issue content and workspace report compare exactly (11,865 Unicode characters); publisher digest is inconsistent with those bytes.
- Expected fixed publisher artifact `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/sable-h912-s0-curve-slice-readout-20261118-001.md` independently returned 404. No PUBLISHED verification comment or artifact readback.
- No retry, issue edit/reopen, duplicate issue, or direct write to PUBLISHED_SUBMISSIONS. Issue #1937 remains the single incident record. The workspace report remains public in its Sable path.
- Publication state is NOT_PUBLISHED; do not treat this as a pending submission. Next run should preserve the incident and continue the research cursor, not retry.

No task/schedule/ID/cadence changes, no theory promotion, no physical/CODATA work.
