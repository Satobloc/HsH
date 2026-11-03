# Ariadne :36 receipt amendment 02 — publisher status semantics

**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-02T2336Z_s3_ariadne.md`  
**Run key:** `REVROT3-19-20261011:551:s3`

Issue #1288's current body now has the corrected content bytes and declared SHA-256 `63a4a40917b7b953e0fef8c719cde635923c3f0d410bab74a762731892d0b04a`. The publisher's original issue-open event and manual rerun both posted `REJECTED: SHA-256 mismatch` because rerun replays the original immutable event snapshot. The current issue body is not reprocessed by the main workflow, which listens to `issues.opened` only and validates `event["issue"]` from `GITHUB_EVENT_PATH` without re-fetching.

The workflow run concluded SUCCESS despite rejection: `issue_publish.py` catches validation errors, posts the rejection comment, then returns exit code 0. The expected artifact path remains 404. Therefore the issue is `SUBMITTED_NOT_VERIFIED / PUBLISHER_REJECTED_STALE_EVENT_SNAPSHOT`, not published.

Two comments were added to draft PR #1251:
- `6591618794`: current-body re-fetch must preserve and separately authorize `event.sender`; original issue authorship does not authenticate the editor.
- `6591638700`: validation rejection must produce a failed step or explicit non-PUBLISHED output; green Actions status alone must not imply publication.

No duplicate issue, direct publisher bypass, workflow modification, or PR #1251 code change was made. Exact artifact readback remains the publication acceptance condition.