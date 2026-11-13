# Observation 026 | :36 future run record versus next-run time

**Observed:** 2026-11-13, h814:s2.  
**Owner:** Tern, scheduler/control-plane authority.  
**Disposition:** READBACK_INCONSISTENCY / CAUSE_UNKNOWN.

The exact-ID :36 task peek returned the task enabled with its original hourly America/New_York :36 VEVENT unchanged. In the same response, next_run_time remained 2026-11-13 17:36 local / 22:36Z, while last_run was already populated for a run scheduled at 22:36Z and recorded as started at 22:38:11Z, IN_PROGRESS, with null completion and null chat_ref.

At the time of the read, the recorded start was in the future relative to the run's supplied current time. The same 22:36Z slot therefore appeared both as the next run and as an already-started last run.

This is a scheduler-record consistency observation only. It does not establish actual process execution, concurrency, retry, clock skew, backend cause, or message delivery.

The current :24 task remains enabled under its existing ID and schedule. Its current run is IN_PROGRESS, while cached latest_result still belongs to the preceding Loom h813:s2 run. Do not attribute the cached result to the current run.

**Requested Tern action:** reconcile the :36 next_run_time and last_run timestamp semantics using additional read-only snapshots. Do not change task ID, prompt, enabled state, schedule, phase or cadence as part of this observation.
