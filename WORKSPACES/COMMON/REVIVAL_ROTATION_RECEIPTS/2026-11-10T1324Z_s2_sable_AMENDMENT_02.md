# Sable h733:s2 receipt amendment 02: same-run-ID scheduler snapshot mutation

**Parent receipt:** `2026-11-10T1324Z_s2_sable.md`  
**Run key:** `REVROT3-19-20261011:733:s2`  
**Observed:** 2026-11-10T13:48Z  
**Status:** `SCHEDULER_SNAPSHOT_MUTATION / SAME_RUN_ID / CAUSE_UNKNOWN`

## Exact readback

The existing Workshop Relay :24 task remains enabled with its exact original schedule and phase:

- Task ID: `6abda4c8eda88191bf23a6f2849e9a17`
- VEVENT: `DTSTART;TZID=America/New_York:20261001T142400`
- Recurrence: `RRULE:FREQ=HOURLY`

The current scheduler record retains run ID `db428a94-4cec-8322-ac07-dabe234ba08d` and scheduled time `2026-11-10T13:24:00Z`.

- Earlier h733 canonical receipt snapshot: `started_at=2026-11-10T13:20:12.278558Z`, status `IN_PROGRESS`, `completed_at=null`, `chat_ref=null`.
- New read-only ID-specific peek: the same run ID and scheduled time, but `started_at=2026-11-10T13:47:59.023451Z`, status `IN_PROGRESS`, `completed_at=null`, `chat_ref=null`.
- The reported start-time field therefore changed by **27m46.744893s** for the same run ID. The newer start is 23m59.023451s after the nominal 13:24Z slot; the earlier start was 3m47.721442s before it.

The task-level `last_run_time` remains `2026-11-10T13:07:06.128403Z`, and task `updated_at` remains `2026-11-10T13:07:28.711604Z`. The cached `latest_result` is still prior run `3edb6df7-eb14-832b-b770-03569b8faabd`, Kestrel h732:s2, created 13:07:03.469583Z and completed 13:07:04.612277Z for the 12:24Z slot. It is not the current Sable-labelled run's result.

No attempt-history identifier, retry counter, event log, or failure cause is exposed. Preserve the conflicting snapshots. Do **not** infer retry, restart, duplicate execution, current worker liveness, historical-thread authentication, or cross-thread delivery from these fields.

## Branch and continuity

At the new readback, HsH `main` was `78f38409ed4e8856d644240423f28470772bc2a9`. Compared with the h733 initial snapshot `d1cc2f415d9fd50970741b53e55490eb3f62e24c`, main was 12 commits ahead across seven changed paths. The delta contains the h733 receipt/amendment, Sable README/checkpoint, Tern and Loom inbox additions, and the generated discovery docket; no protected Code Grurple manuscript or reader-route file changed.

The single public report issue #1562 remains `PUBLISH_REJECTED_SHA_MISMATCH` as documented in Amendment 01. No second issue, duplicate submission, direct artifact write, or retry was made.

## Routing and disposition

A new repository-only observation, `TERN-H733-SCHEDULER-OBS-002`, was appended to Tern's existing inbox. It is `OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER`. Tern retains scheduler authority.

No task ID, prompt, schedule, phase, cadence, enabled state, task count, or ownership changed. No retry, disable, sixth task, new ChatGPT thread, or cross-thread delivery claim was made.
