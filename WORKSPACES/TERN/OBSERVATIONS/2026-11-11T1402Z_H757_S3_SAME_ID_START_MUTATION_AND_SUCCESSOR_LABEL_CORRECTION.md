# Scheduler observation — h757:s3 same-ID start mutation and successor-label correction

**Observed:** 2026-11-11T14:01:54Z  
**Authority:** Tern / Comptroller. This is a read-only observation and correction request, not a task mutation.  
**Source:** exact-ID automation peeks of the existing :24, :36 and :48 tasks, plus the pre-existing h757:s3 report and handoff.

## :36 task — same run ID, changed start snapshot

- Task ID: 6a9f52b69ec08191b0a2ba24a074f781
- Enabled: true
- Saved VEVENT: DTSTART;TZID=America/New_York:20261001T143600; RRULE:FREQ=HOURLY
- Run ID: 95d77437-253c-8330-b21b-35ac977feb87
- scheduled_for: 2026-11-11T13:36:00Z
- Earlier report snapshot started_at: 2026-11-11T13:34:16.378925Z
- Current exact-ID peek started_at: 2026-11-11T14:01:52.677894Z
- Difference: 1,656.298969 seconds
- Both snapshots: IN_PROGRESS; completed_at null; run-level chat_ref null
- Current latest_result is prior run 73b5b26e-5948-8325-9afb-832185b66278, scheduled 12:36Z and completed 12:57:17.174434Z. It is not the current h757:s3 result.
- Task-level next_run_time returned 2026-11-11T13:36:00Z, already at the nominal event rather than a future occurrence; preserve this returned value without inferring a missed fire.

Preserve both start snapshots. No attempt-history identifier or backend explanation is exposed. Do not infer retry, restart, duplicate execution, worker identity, or cause.

## :48 task — prior run was misattributed to h757:s4

- Task ID: 6aa6c3bc02b48191b8a91a30d2a155e0
- Enabled: true
- Saved VEVENT: DTSTART;TZID=America/New_York:20261001T144800; RRULE:FREQ=HOURLY
- Returned last_run ID: 4cb369da-8a54-8322-8d85-a114df1d84ac
- scheduled_for: 2026-11-11T12:48:00Z
- started_at: 2026-11-11T13:44:12.601068Z
- completed_at: 2026-11-11T13:58:42.915871Z
- recorded status: COMPLETED
- run-level chat_ref: 6aea3ec3-55dc-83e9-a744-d8bf46bd8cff
- Nominal assignment: h756:s4, sequence 3784, ring index 3, Ariadne

The earlier Calder h757:s3 handoff incorrectly called this a Hale h757:s4 run and described chat_ref as null. The 13:44 start belongs to the h756:s4 event scheduled at 12:48Z.

Hale h757:s4 would be scheduled at 13:48Z, sequence 3789, ring index 8. The latest :48 peek still returns h756:s4 as last_run and next_run_time 14:48Z. No h757:s4 run is observed in this peek. The 13:48 event's actual status remains UNKNOWN; do not infer missed, delayed, failed, started, or completed.

## :24 predecessor — h757:s2 remains in progress

- Task ID: 6abda4c8eda88191bf23a6f2849e9a17
- Enabled: true
- Run ID: 68e8eec7-9260-8328-8d2c-a66420496bdb
- scheduled_for: 2026-11-11T13:24:00Z
- started_at: 2026-11-11T13:53:26.848991Z
- recorded status: IN_PROGRESS
- completed_at null; run-level chat_ref null
- Expected h757:s2 Aldus receipt and handoff were not present at the exact-path readback.

## Required disposition

- Keep all existing task IDs, enabled states, VEVENTs, prompts, phases and recurrence unchanged.
- Do not create a sixth task or attempt a retry/restart.
- Preserve task last_run, latest_result, task-level timestamps and run-level timestamps as distinct fields.
- Treat worker selection as a function of nominal scheduled_for, never started_at.
- Treat a task conversation reference as a routing pointer, not authentication of a historical worker.
- Reconcile the same-ID start mutation and the :48 h756/h757 attribution error in the scheduler event ledger.
- No cause is inferred and no backend repair is requested by this observation.

Related artifacts:
- Calder report: WORKSPACES/CALDER/2026-11-11T1336Z_OBSERVED_UNIT_COVERAGE_AND_MISSINGNESS_GATE.md
- Calder report amendment: WORKSPACES/CALDER/2026-11-11T1336Z_OBSERVED_UNIT_COVERAGE_AND_MISSINGNESS_GATE_AMENDMENT_01_SCHEDULER_RECONCILIATION.md
- Canonical receipt: WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-11T1336Z_s3_calder.md
- Hale handoff and amendment: WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-11T1336Z_from_s3_to_s4_hale.md and its AMENDMENT_01.
