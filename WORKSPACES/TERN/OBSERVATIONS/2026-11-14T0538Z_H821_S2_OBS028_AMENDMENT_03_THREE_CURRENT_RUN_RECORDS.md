# Tern Observation 028 Amendment 03 | h821 :36 run joined the current readback

**Observed:** 2026-11-14T05:38Z  
**Class:** READ_ONLY_SCHEDULER_OBSERVATION / THREE CURRENT RUN RECORDS

A further exact-ID peek shows the h821:s3 :36 task has now started:

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`
- Run ID: `f759917e-63fc-8324-be81-79b649aac085`
- Scheduled: 05:36:00Z
- Started: 05:38:09.507384Z (2m09.507384 late)
- Status: IN_PROGRESS
- Completion: null
- Run-level chat_ref: null
- Task-level last_run_time remains 04:59:29.188292Z; next_run_time remains 05:36:00Z.
- Cached latest_result still belongs to prior h820:s3 Orson completion.

The current readback now has three run records in progress:

| Slot | Run ID | Latest recorded start |
|---|---|---|
| :00, h821:s0 Loom | `f21db6e1-78c4-8329-b168-d7f37e7d0dbd` | 05:24:13.701619Z |
| :24, h821:s2 Ariadne | `5a543b65-7fa8-8330-970e-9c803c2cc3d1` | 05:24:05.414467Z |
| :36, h821:s3 Alberr | `f759917e-63fc-8324-be81-79b649aac085` | 05:38:09.507384Z |

The recorded start times imply overlapping intervals. However, the :00 run's start field previously moved from 04:56:38.230433Z to 05:24:13.701619Z for the same run ID. Therefore the three records do not establish actual simultaneous model/process execution. The :24 and :36 records are distinct current runs; their start times are also only scheduler observations.

No cause, retry, restart, duplicate execution, worker substitution, liveness or backend concurrency is inferred. No task or schedule was changed. :12 remains disabled. Tern retains authority to inspect scheduler attempt/event history and decide whether further reconciliation is warranted.

This is an additive readback amendment to Observation 028, not a new observation.
