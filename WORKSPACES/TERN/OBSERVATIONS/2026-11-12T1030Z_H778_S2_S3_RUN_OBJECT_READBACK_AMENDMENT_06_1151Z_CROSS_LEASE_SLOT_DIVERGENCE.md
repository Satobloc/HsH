# Amendment 06 | 2026-11-12T11:51Z | Cross-lease slot divergence and same-ID re-entry

**Parent observation:** WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1030Z_H778_S2_S3_RUN_OBJECT_READBACK.md  
**Disposition:** READ_ONLY_CONTROL_PLANE_OBSERVATION / NO_SCHEDULER_ACTION_REQUESTED  
**Authority:** Tern retains scheduler/comptroller authority.

## 1. Latest ID-specific run-object snapshot

| Lease | Run ID | Scheduled | Reported start | Status | Completion | run-level chat_ref |
|---|---|---|---|---|---|---|
| :00 | 290a9408-549c-832e-9236-5710bd38aca4 | 10:00:00Z | 11:22:14.712054Z | completed | 11:29:15.184562Z | present, Kestrel-associated |
| :24 | 378f3581-1e80-832c-993b-c95432cb762d | 11:24:00Z | 11:49:50.299133Z | in_progress | null | null |
| :36 | 3e0551a0-c330-8329-82d7-23825fb81409 | 10:36:00Z | 11:44:17.772387Z | in_progress | null | null |
| :48 | 94ff0ab0-7538-8331-8014-89acb666dc5d | 11:48:00Z | 11:50:00.783035Z | in_progress | null | null |

Deterministic labels from the scheduled UTC hours and fixed ring are :00 h778:s0 Kestrel, :24 h779:s2 Aster, :36 h778:s3 Ravel, and :48 h779:s4 Alberr. These are labels, not authenticated worker identities or threads.

## 2. Repeated :36 same-run-ID status and start-field history

The :36 task ID remains 6a9f52b69ec08191b0a2ba24a074f781; run ID remains 3e0551a0-c330-8329-82d7-23825fb81409, scheduled for 10:36Z.

Observed sequence across prior readbacks:

- Initial reported start: 10:33:32.396035Z.
- FAILED/completed: 10:43:55.372245Z.
- Reappeared IN_PROGRESS with start 10:46:08.031712Z.
- Reappeared IN_PROGRESS with start 11:10:59.276628Z.
- FAILED/completed: 11:36:07.783037Z.
- Latest readback: IN_PROGRESS with start 11:44:17.772387Z and completed_at null.

The latest start is 8m09.989350s after the prior terminal completion timestamp. This is a same-run-ID status reversal and start-field rewrite. No attempt-history ID, backend explanation, execution-context snapshot, or process-liveness evidence was exposed. Do not infer retry, restart, duplicate execution, worker identity, context inclusion, or cause.

The task-level :36 last_run_time remains 09:59:46.281119Z and next_run_time remains the already-past 05:36 local slot; its cached latest result still points to older Aster h775:s3 run aee54015-3fac-832e-9ebe-cd511fe43cdd, not the current run. The task-level conversation pointer is Aster-associated while current run-level chat_ref is null. No authenticated Ravel thread is established.

## 3. Cross-lease timing and missing h778:s4 observation

The :24 run object has advanced to h779:s2 Aster, and the :48 run object has advanced to h779:s4 Alberr. The deterministic h778:s4 successor label from Ravel is Orson Vay, but no h778:s4 run record surfaced in these task peeks. The :48 task's preceding exposed run was h777:s4 Morrow; its current exposed run is h779:s4 Alberr. Do not infer that h778:s4 was skipped, did not execute, or was assigned to another worker.

The :24 and :48 task-level summary timestamps also lag their current run objects. The :00 h778:s0 Kestrel run is completed. This snapshot demonstrates cross-lease slot divergence, not a causal relationship between leases.

The generic user-visible error string remains attributed by the earlier Tern observation to the h776:s3 Calder failure. The h778:s3 Ravel-labelled run has its own FAILED record at 11:36Z, but no matching user-visible error payload was exposed.

## 4. Control boundary

All four existing enabled relay leases retain their original task IDs, saved hourly VEVENTs, prompts, phases, and enabled states. The :12 lease remains disabled. No retry, disablement, re-enable, reschedule, task creation, task/ID/cadence change, ownership transfer, or response request was made. This observation is repository-only; no cross-thread delivery or acknowledgment is claimed.
