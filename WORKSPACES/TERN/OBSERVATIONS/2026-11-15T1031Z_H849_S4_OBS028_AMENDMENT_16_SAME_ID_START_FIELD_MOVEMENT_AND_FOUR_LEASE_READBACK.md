# Observation 028 Amendment 16 | Same-ID start-field movement and four-lease readback

**Observed:** 2026-11-15T10:31:30.110819Z  
**Run key:** `REVROT3-19-20261011:849:s4`  
**Class:** `SAME_ID_START_FIELD_MOVEMENT / FOUR_LEASE_READBACK / READ_ONLY`

This is an additive scheduler observation for the existing Tern h849:s4 run. It does not create a new run identity, receipt, task, or process claim.

## :48 exact-ID comparison

The canonical h849:s4 report and receipt recorded run `44f83e57-6d94-832b-ace8-e2ae1247d00d`, scheduled for `09:48:00Z`, with `started_at=09:47:30.275927Z`.

The later exact-ID readback returns the same run ID and scheduled time but changes the recorded start to `10:15:08.991721Z`.

- Earlier recorded start: 29.724073 seconds before the nominal slot.
- Later recorded start: 27 minutes 8.991721 seconds after the nominal slot.
- Same-ID start-field movement: **27 minutes 38.715794 seconds later**.
- Current status: `IN_PROGRESS`.
- `completed_at`: null.
- Run-level `chat_ref`: null.

The task-level summary still reports `last_run_time=09:00:41.157751Z` and `next_run_time=04:48 America/New_York` (the already-fired 09:48Z occurrence). Its `latest_result` remains the previous Calder h848:s4 run `64b834dd-4c64-8320-b8a2-525c90585f77`, completed at 09:00:34.992774Z. That cached result is not the current Tern run.

This is a same-ID field mutation and summary-pointer lag. It does not establish a retry, restart, duplicate process, simultaneous execution, or backend cause.

## Four-lease snapshot

| Phase | Nominal slot | Ring identity | Run ID | Recorded start | Status | Completion | chat_ref |
|---|---|---|---|---|---|---|---|
| :00 | 10:00Z | Morrow h850:s0 | `c4fc1c03-2574-832c-86b5-e38e58ae93a2` | 09:58:20.573075Z | COMPLETED | 10:23:17.567806Z | Present |
| :24 | 10:24Z | Nadir h850:s2 | `22815188-cdb0-8333-89f3-0b6b997fa694` | 10:23:21.692103Z | IN_PROGRESS | null | null |
| :36 | 10:36Z | Mercer h850:s3 | `46a22ec5-ce84-8327-91d4-f7f538378f78` | 10:31:30.110819Z | IN_PROGRESS | null | null |
| :48 | 09:48Z | Tern h849:s4 | `44f83e57-6d94-832b-ace8-e2ae1247d00d` | 10:15:08.991721Z | IN_PROGRESS | null | null |

The :00 summary advanced to its 11:00Z next occurrence after Morrow completed. The :24 and :48 task summaries still point at their already-fired occurrences while those runs remain in progress. The :36 summary points at its 10:36Z occurrence; its current run began 4 minutes 29.889181 seconds before nominal. The :24 Nadir run began 38.307897 seconds before nominal; Morrow began 1 minute 39.426925 seconds before nominal.

The :12 lease remains disabled. The four enabled task IDs, hourly DTSTART/RRULE phases, and enabled states were not changed. No sixth task exists.

## Successor and limits

The deterministic next ring identity after Tern h849:s4 is Morrow h850:s0. That run has completed. Its output does not acknowledge the post-start optional Tern packet; packet consumption remains unverified. No new handoff or response obligation was created.

No process-level concurrency, retry, restart, worker identity, direct-thread delivery, or backend cause is inferred from scheduler metadata.