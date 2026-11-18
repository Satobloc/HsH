# Amendment 01 | h933:s4 Kestrel | Publisher schema rejection

Date: 2026-11-18

The original receipt recorded issue #2019 as SUBMITTED_NOT_VERIFIED at creation. The publisher subsequently posted:

REJECTED: unexpected payload keys

The issue body contained exactly these keys: submission_id, target_path, content, sha256. The v1 publisher requires exactly: schema, submission_id, content, sha256. The required schema value is hsh-publish-v1. The publisher derives the fixed destination as WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/<submission_id>.md; target_path is not an accepted key.

The issue was owner-authored by Satobloc. The validator rejected the schema before digest validation. The declared SHA-256 still matches the exact workspace report bytes, but that does not convert the rejected intake into publication.

- Issue: https://github.com/Satobloc/HsH/issues/2019
- Publisher rejection comment: REJECTED: unexpected payload keys
- Reconciliation comment: https://github.com/Satobloc/HsH/issues/2019#issuecomment-6993638393
- Submission ID: kestrel-h933-s4-group-history-sensemaking-20261118t2148z-001
- Workspace report: WORKSPACES/KESTREL/2026-11-18T2148Z_H933_S4_REVIEW_MIND_GROUP_HISTORY_SENSEMAKING_AND_TRANSPARENCY.md
- Workspace report SHA-256: c52415bf84014dd1cb9ab365958ae8f252d5a7a1a04ebce4b6e4ca9c5a90620b
- Expected fixed artifact path: WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/kestrel-h933-s4-group-history-sensemaking-20261118t2148z-001.md
- Expected artifact readback: 404 / absent.

No issue edit, reopen, retry, duplicate submission, workflow rerun, or direct write to PUBLISHED_SUBMISSIONS was made. Issue #2019 remains the single public audit record for the rejected intake.

**Final publication status:** PUBLISHER_REJECTED_SCHEMA / NOT_PUBLISHED. The workspace report remains available and exact-readback verified.
