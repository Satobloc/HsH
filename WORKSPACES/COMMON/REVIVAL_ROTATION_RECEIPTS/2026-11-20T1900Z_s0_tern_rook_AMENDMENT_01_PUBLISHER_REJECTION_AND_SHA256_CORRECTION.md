# Amendment 01 | Tern h979:s0 | Publisher rejection and report digest correction

**Applies to:** WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-20T1900Z_s0_tern_rook.md  
**Status:** PUBLISHER_REJECTED / WORKSPACE_REPORT_READBACK_VERIFIED / NO_PUBLISHED_SUBMISSIONS_ARTIFACT

## Verified correction

The original receipt and issue #2218 recorded a declared report digest of 115fc6fe4dae587c45281e3caf3397710b2251821c133a66d5e9775d103969e0. The existing publisher returned:

- Issue: https://github.com/Satobloc/HsH/issues/2218
- Publisher comment: https://github.com/Satobloc/HsH/issues/2218#issuecomment-7048462493
- Exact result: REJECTED: SHA-256 mismatch.
- Expected PUBLISHED_SUBMISSIONS artifact: 404 / absent.

The report file in the Tern workspace was independently re-fetched. Its exact UTF-8 content is 17,719 characters. The correct SHA-256 is:

**1da5976c3f1ab0278dcf9367d83ae835a57c85c6ba96a012f2197ac321e7ad00**

The earlier local digest routine was defective; the publisher rejection is correct. The workspace report content itself was not changed. Its exact readback remains verified.

## Final publication disposition

- Issue #2218 remains open with the publisher's rejection comment.
- No edit, retry, second submission, duplicate issue, or manual PUBLISHED_SUBMISSIONS write was made.
- The report remains a workspace report in the public HsH repository, but it is **not** a publisher-verified artifact.
- The correct workspace SHA-256 above supersedes the erroneous digest in the base receipt.
- No change to the source-fidelity findings, source classification, next cursor, Morrow optional handoff, paper gates, Mersearch lanes, or theory status.

**Final status:** WORKSPACE_REPORT_READBACK_VERIFIED / PUBLISHER_REJECTED_SHA256_MISMATCH / NO_PUBLISHER_ARTIFACT / NO_RETRY / NO_DUPLICATE.
