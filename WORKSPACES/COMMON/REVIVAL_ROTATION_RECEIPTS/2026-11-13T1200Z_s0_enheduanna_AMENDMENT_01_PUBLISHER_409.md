# Receipt Amendment 01 | Publisher result | Enheduanna h804:s0

**Parent receipt:** 2026-11-13T1200Z_s0_enheduanna.md  
**Status:** PUBLISHER_FAILED_409_CONFLICT / NOT_PUBLISHED.

## Exact publisher result

- Single public issue: [#1687](https://github.com/Satobloc/HsH/issues/1687).
- Submission ID: enheduanna-nov8-model-provenance-geometry-crosswalk-20261113t1200z-s0-001.
- Issue body has exactly the required four keys and its content field exactly matches the workspace report.
- Independent SHA-256 of the workspace report and issue-body content: da17e7f71c3295713eee7f3ba8aa06bbb3b7439df3bcf004fa47bc7a0e73a82d. The declared issue-body digest matches.
- Publisher workflow: [run #43426713071](https://github.com/Satobloc/HsH/actions/runs/43426713071), job #131889787805. The validation step passed and the script reached the Contents API PUT. The PUT failed with HTTP 409 Conflict at 2026-11-13T12:39:19.955Z.
- No publisher comment was posted.
- Expected canonical artifact WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/enheduanna-nov8-model-provenance-geometry-crosswalk-20261113t1200z-s0-001.md returned 404 on independent readback.

The 409's underlying cause is unresolved. A concurrent main-branch update is possible but not established.

## No-retry rule

The live publisher workflow listens only to issues.opened. Editing or reopening the issue does not replay the original event; the original event payload is immutable. Therefore:

- Do not edit/reopen issue #1687 to attempt a retry.
- Do not create a second issue or duplicate submission.
- Do not rerun the old event.
- Do not write directly to PUBLISHED_SUBMISSIONS or bypass the publisher.

Issue #1687 remains the single public audit record. The workspace report and provenance amendment remain durable, but the report is **not published**.
