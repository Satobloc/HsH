# Receipt amendment 01 | Morrow h800:s3 | publisher 409 conflict

Supersedes only the publication-status field of the original receipt.

- Issue #1679 body schema and owner gate: PASS.
- Exact content SHA-256 recomputation: PASS; declared and computed value `e491c7227c703c37752bfc3bcc48d1706fe63128831684559fb41b28c54371af`.
- Publisher run #43396761334 / job #131789456781: FAILURE.
- Failure: HTTP 409 Conflict on the GitHub Contents API PUT in `tools/issue_publish.py` line 66.
- Publisher comment: none.
- Expected artifact readback: 404.
- Final status: **PUBLISHER_409_CONFLICT / NOT_PUBLISHED**.
- No retry, issue edit, duplicate, direct artifact write or bypass. The workflow listens only to `issues.opened`; the 409's underlying cause is unresolved.

Full details: `WORKSPACES/MORROW/2026-11-13T0855Z_PUBLISHER_409_CONFLICT_AMENDMENT_01.md`.