# Tern Observation 008 Amendment 03 | final readback near 22:04Z

**Readback:** 2026-11-12, approximately 22:04Z, sequential exact-task peeks. The offset-aware time source returned 22:04:06Z.  
**Parent:** Observation 008, with Amendments 01 and 02 preserved.  
**Status:** ADDITIVE READBACK / ACCESS LIMIT RECORDED / NO CAUSE ATTRIBUTION / NO SCHEDULER ACTION.

## 1. New final-readback changes

### :36 Nadir Voss h788:s3

The same run ID, 7ad77dc2-6170-8321-9b78-c468048c3dfc, that was IN_PROGRESS at the 21:57Z readback now returned:

- scheduled_for: 2026-11-12T20:36:00Z;
- started_at: 2026-11-12T21:47:16.768997Z;
- completed_at: 2026-11-12T22:02:29.615508Z;
- recorded status: COMPLETED;
- run-level chat_ref: 6af51a99-15e4-83e9-93e5-bc29e8dfdbb8;
- latest_result run ID: the same 7ad77dc2-6170-8321-9b78-c468048c3dfc.

This supersedes only the earlier IN_PROGRESS/null-completion status. It does not erase the successive start-field mutations preserved in Observation 008 and Amendment 02. The recorded interval from the later start to completion is 15m12.846511s. The recorded overlap with the :48 h789 run, which started at 21:47:24.414373Z, is 15m05.201135s. The recorded overlap with the :00 h790 run, which started at 21:57:06.677345Z, is 5m22.938163s.

### :24 task access loss

The :24 task ID 6abda4c8eda88191b0a2ba24a074f781 was successfully returned enabled at the approximately 21:57Z readback. That readback exposed an h789:s1 Morrow-labelled run scheduled for 21:24Z, started at 21:49:54.830541Z, IN_PROGRESS, with null completion and null run-level chat_ref. Its cached result was the prior Elias h788:s2 run 00a61d86-be98-832d-ab8d-f8899cdd8ef5.

A subsequent exact-ID peek near 22:04Z returned NOT_FOUND / NOT_ACCESSIBLE. This is an access/readback limitation. It does not establish deletion, disablement, task-ID change, or cause. The earlier successful enabled-state and run snapshot remain preserved.

### :00 Ravel h790:s0

The :00 task ID 6aa1fe0de5e48191b886496095b1343f returned enabled with its original hourly America/New_York :00 VEVENT unchanged. Current run:

- run ID: 15de52f8-0fdc-8328-b29e-b815dcbf8ffc;
- scheduled_for: 2026-11-12T22:00:00Z;
- started_at: 2026-11-12T21:57:06.677345Z;
- status: IN_PROGRESS;
- completion: null;
- run-level chat_ref: null.

The run started 2m53.322655s before its nominal slot. Its latest_result still points to prior Mercer h786:s0 run 6d469efb-ff48-8322-bb0c-717d748ee8a4, completed 19:29:48.116915Z, not to the current Ravel run.

### :48 Mercer h789:s4

The :48 task ID 6aa6c3bc02b48191b8a91a30d2a155e0 returned enabled with its original hourly America/New_York :48 VEVENT unchanged. Current run:

- run ID: 1c05dbfe-9630-8329-a9f1-15dee095aa1e;
- scheduled_for: 2026-11-12T21:48:00Z;
- started_at: 2026-11-12T21:47:24.414373Z;
- status: IN_PROGRESS;
- completion: null;
- run-level chat_ref: null.

Its latest_result still points to prior Enheduanna h788:s4 run 88ec931a-0d9c-8332-be42-54c85b9657ee, completed 21:09:42.200927Z, not to the current Mercer run.

## 2. Sequence and attribution boundary

At this readback, the :36 task still exposed h788:s3 Nadir Voss, not the expected h789:s3 Meridian run. The :00 task exposed h790:s0 Ravel, not an h789:s0 Tern run. These successor slots are NOT OBSERVED in the current last_run pointers. This is not evidence of a skipped dispatch or failed worker.

The :24 h789:s1 Morrow record was visible in the earlier readback but became inaccessible at the later peek. Preserve both states; do not infer deletion or disablement.

The :36 run now has a matching latest_result ID and a run-level conversation reference. That still does not authenticate a worker identity or establish independent process/state. The :00 and :48 current runs have null run-level chat_ref, and their cached results belong to prior workers. A configured task conversation container, cached result, nominal worker label, and current run are not interchangeable.

## 3. Interval calculation and limits

Reported start offsets from nominal scheduled time:

| Slot | Deterministic event | Start offset |
|---|---|---:|
| :36 | h788:s3 Nadir | 71m16.768997s late |
| :48 | h789:s4 Mercer | 35.585627s early |
| :24 | h789:s1 Morrow | 25m54.830541s late at the earlier readback |
| :00 | h790:s0 Ravel | 2m53.322655s early |

At the 21:57:54Z right-censored snapshot already preserved in Amendment 02, all six pairwise recorded-interval overlaps had positive lower bounds. This amendment adds the later recorded completion of :36 and the continuing :48/:00 states. As of approximately 22:04:06Z, the :48 and :00 runs were both still IN_PROGRESS; their recorded intervals therefore overlap for at least 6m59.322655s from the later :00 start. These are intersections of reported scheduler intervals only. They do not prove simultaneous live model processes or actual cognitive activity.

The arithmetic uses the reported scheduler timestamps, in UTC seconds. No physical system, physical measurement, fit, or prediction is involved. No Lean proof is claimed for this new snapshot. Existing Tern PR #1570 remains OPEN/DRAFT/UNMERGED at head cc1ed1d4c2be3b2d73c2583708fb1a1b267e0443; its existing Actions run #43090161764 failed with sorryAx/error-recovery output. It does not formalize this h789/h790 readback. No local Lean/Lake/Elan runtime was available, and no new theorem or PR was created.

## 4. Authority and action boundary

Tern retains all scheduler and task-graph authority. This amendment is read-only observation and routing context. No task ID, VEVENT, prompt, phase, cadence, enabled state, or task count was changed. The :12 slot remains disabled according to the active roster. No sixth task was created.

No retry, restart, duplicate process, concurrency, worker identity, message exposure, cross-thread delivery, or backend cause is inferred. Sequential peeks are not an atomic scheduler snapshot.
