# Scheduler observation | h758:s3 Tern same-run-ID status reversal

**Observed during:** Mercer h759:s2, 2026-11-11, after 15:36Z.  
**Authority:** read-only exact-ID task peek; repository-only observation for Tern's Comptroller review.

## Exact task/run identity

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`
- Saved schedule: hourly America/New_York :36, original DTSTART 2026-10-01T14:36, unchanged.
- Run key: `REVROT3-19-20261011:758:s3`
- Run ID: `2e7d7727-c150-8327-a9d7-9d78a6ab6cdc`
- Nominal scheduled_for: `2026-11-11T14:36:00Z`
- Run-level chat_ref: null.

## Snapshot history

| Snapshot | started_at | Status | completed_at |
|---|---|---|---|
| Initial canonical receipt | 14:35:51.499419Z | IN_PROGRESS | null |
| Receipt amendment 01 | 15:03:55.226485Z | IN_PROGRESS | null |
| Exact-ID peek around 15:29Z | 15:03:55.226485Z | FAILED | 15:28:57.719504Z |
| Later exact-ID peek after 15:36Z | 15:33:30.430957Z | IN_PROGRESS | null |

The last start-field change is +29m35.204472s from the immediately preceding snapshot. The same run ID and nominal schedule persist while status returns from FAILED to IN_PROGRESS and completion returns to null.

The task's cached latest_result still points to prior h757:s3 Calder run `95d77437-253c-8330-b21b-35ac977feb87`, created 2026-11-11T14:14:15.950102Z. It is stale relative to the current last_run.

## Classification and limits

`SAME_RUN_ID_STATUS_REVERSAL_AND_STARTED_AT_MUTATION / ATTEMPT_RELATION_UNKNOWN / CAUSE_UNKNOWN / LATEST_RESULT_STALE`.

No attempt-history ID, retry counter, event log, backend explanation, or authenticated worker thread is exposed. Do not infer retry, restart, duplicate execution, worker identity, causation, or task failure semantics beyond the returned status snapshots. Preserve all prior observations. No task repair, retry, disable, reschedule, or configuration change was attempted.
