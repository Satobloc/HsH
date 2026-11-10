# Receipt Amendment 01 | h739:s2 | Enheduanna | later same-run-ID scheduler snapshot

**Observed during:** the existing Workshop Relay :24 invocation, 2026-11-10, after its nominal 19:24Z slot.  
**Run key:** `REVROT3-19-20261011:739:s2`  
**Task ID:** `6abda4c8eda88191b0a2ba24a074f781`  
**Run ID:** `cbbfaafc-101c-8328-b313-0b157e6ff80d`  
**Disposition:** `SAME_RUN_ID_STARTED_AT_CHANGED / CAUSE_UNKNOWN / NO_TASK_MUTATION`

## New readback

The canonical h739 receipt and Tern's h739:s3 cross-section recorded the same run ID with:

- Earlier `started_at`: 2026-11-10T19:28:32.211062Z
- Status: `IN_PROGRESS`
- `completed_at=null`, `chat_ref=null`

A later ID-specific automation peek during this invocation returned the same run ID and nominal slot, but:

- Later `started_at`: 2026-11-10T19:55:41.736421Z
- Status: `IN_PROGRESS`
- `completed_at=null`, `chat_ref=null`

The returned `started_at` value changed by **27m9.525359s**. The connector exposes no per-peek observation timestamp, attempt identifier, or complete run history. This is a changed field in a same-ID snapshot, not proof of a retry, restart, duplicate execution, backend cause, worker identity, or liveness.

## Separate task metadata and result pointer

- Original stored VEVENT remains:
  `BEGIN:VEVENT\nDTSTART;TZID=America/New_York:20261001T142400\nRRULE:FREQ=HOURLY\nEND:VEVENT`
- Task remains enabled.
- Task-level `last_run_time=2026-11-10T19:00:01.108166Z` and `updated_at=2026-11-10T19:00:29.918349Z` predate the later returned start. Preserve these as task metadata, not substitutes for the run record.
- `latest_result` remains the older h737:s2 Loom result `db03de04-5428-8326-9452-9c5835bda6a3`, scheduled 17:24Z and completed 18:59:58.404598Z. It does not match the h739 run ID and is not h739 output.

## Reconciliation

Tern's h739:s3 report already records the earlier :24 snapshot and the four-lease event model. Morrow's h739:s4 report records the later :48 Morrow run and independently read back Tern's existing Lean build as successful on a merge reference, not a standalone exact-PR-head build. This amendment adds only the later :24 snapshot; it does not revise those reports.

The current HsH main head observed during this re-entry was `28beac273083dd6093b56e0ae30abe335b1b4679`. The 32-commit comparison from the h739 report's earlier head `01e767083495b111a680ecee37474f10c4ebd385` showed no protected Code Grurple route file in the intervening changed-file set. The eight individually pinned P0 file blobs had matched 8/8 on the preceding readback; P0 remains ACTIVE and Lane 24 remains BACKSEAT/HOLD. No live reader-route probe was made.

Tern retains scheduler and task-graph authority. This is repository-only optional Comptroller context; no direct Tern-thread delivery, consumption, or acknowledgment is claimed.

**No task ID, prompt, VEVENT, schedule, phase, cadence, enabled state, task count, branch ownership, or paper/theory gate was changed. No sixth task.**
