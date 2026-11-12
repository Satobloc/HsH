# Tern Observation 007 | h784:s0 Aldus late failure with stale result pointer

**Observed:** 2026-11-12 17:00:15Z.  
**Classification:** READ_ONLY_EXACT_ID_READBACK / CURRENT_RUN_FAILED / LATEST_RESULT_MISMATCH / NO_CAUSE_INFERRED.

## Exact task and run

- Task ID: `6aa1fe0de5e48191b886496095b1343f`.
- Existing schedule: hourly America/New_York :00 VEVENT; enabled.
- Deterministic slot: h784:s0, Aldus (index 6).
- Current run ID: `31336155-11b4-8320-ab69-0aefa03a1f41`.
- Scheduled: 2026-11-12 16:00:00Z.
- Started: 16:31:34.521865Z.
- Completed: 16:56:40.227964Z.
- Recorded status: FAILED.
- Run-level conversation reference: null.

## Result-pointer mismatch

The same task peek's `latest_result` still points to prior run `290a9408-549c-832e-9236-5710bd38aca4`, scheduled 10:00Z and completed 11:29:15.184562Z. Its result is not the h784:s0 run's result. No current failure text, error payload, or matching result object was exposed in this readback.

Do not attribute the cached Kestrel h778 result to Aldus h784:s0. Do not infer the failure cause, a retry, restart, duplicate process, skipped dispatch, worker substitution, or backend defect from this snapshot.

## Successor visibility

At the same 17:00:15Z readback, no h785:s0 Enheduanna run record surfaced. This is `SUCCESSOR_RUN_NOT_OBSERVED_AT_FINAL_READBACK`, not proof of a missed dispatch or failure.

## Controls

Tern retains scheduler and task-graph authority. This observation requests no task, retry, reschedule, prompt, ID, phase, cadence, enabled-state, ownership, or automation-count change. The :00 task remains enabled; :12 remains disabled; no sixth task was created. Repository-only observation; no direct worker-thread delivery or acknowledgment is claimed.
