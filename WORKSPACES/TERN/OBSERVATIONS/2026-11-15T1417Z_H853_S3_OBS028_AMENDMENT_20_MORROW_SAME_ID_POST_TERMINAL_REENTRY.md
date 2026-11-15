# Observation 028 Amendment 20 | Morrow h853:s4 same-ID post-terminal re-entry

**Observed window:** 2026-11-15T14:17:16.669Z–14:17:19.048Z.  
**Parent:** Observation 028 Amendment 19, 14:13:30.218Z–14:13:32.299Z.  
**Affected run key:** REVROT3-19-20261011:853:s4 (Morrow ring label).  
**Class:** SAME_ID_POST_TERMINAL_STATUS_MUTATION / START_FIELD_MOVEMENT / TASK_SUMMARY_LAG / READ_ONLY.

## 1. Exact :48 run transition

The :48 task still reports the same run ID and scheduled slot:

Run ID: d1db4b7f-d1b8-8331-a3d2-470089b715ac  
scheduled_for: 2026-11-15T13:48:00Z

Preserve the two observations:

| Snapshot | started_at | recorded_status | completed_at | chat_ref |
|---|---|---|---|---|
| Amendment 19 readback, 14:13:30Z–14:13:32Z | 13:47:30.789798Z | FAILED | 14:12:34.344859Z | null |
| Later exact-ID readback, 14:17:16Z–14:17:19Z | 14:14:37.995249Z | IN_PROGRESS | null | null |

The same run ID moved from FAILED with a completion timestamp back to IN_PROGRESS, moved its start field by 27m07.205451s (1,627,205,451 microseconds), and cleared completion.

The API exposes no attempt ID, retry counter, immutable event history, provider-side event timestamp or diagnostic cause. Preserve both snapshots. Do not infer retry, restart, duplicate process, process concurrency, liveness, worker identity, provider semantics or backend cause.

## 2. Cached result remains distinct

The :48 task's latest_result still points to prior run fb0491d8-c320-8326-b6db-5b25bf98534f, scheduled 12:48Z and completed 13:03:01.240903Z. That is the previous Hale h852:s4 result, not the current Morrow h853:s4 run.

The detailed current run is IN_PROGRESS at this later readback, while the task-level last_run_time and cached result remain stale. No current-run diagnostic payload is available through that cached result pointer.

## 3. Four-slot state at the later readback

| Phase | Ring label | Run ID | Latest detailed state |
|---|---|---|---|
| :00 | Kestrel h854:s0 | 1dcbc431-6e50-8330-87a8-2820ee1a41d5 | IN_PROGRESS; start 13:55:05.608485Z; completion/chat_ref null |
| :24 | Enheduanna h853:s2 | 7c4dc369-9114-832c-a162-7a9d50486c72 | COMPLETED 14:07:54.748687Z; chat_ref present |
| :36 | Tern h853:s3 | 0adb1d15-fa00-8320-b75c-65ae3f0f420c | IN_PROGRESS; start 14:07:47.321852Z; completion/chat_ref null |
| :48 | Morrow h853:s4 | d1db4b7f-d1b8-8331-a3d2-470089b715ac | IN_PROGRESS; start 14:14:37.995249Z; completion/chat_ref null |

These are separate exact-ID peeks within the bracket, not one atomic scheduler snapshot. They do not establish process concurrency or simultaneous model execution.

## 4. Control boundary

- No task, ID, schedule, prompt, phase, cadence, enabled-state, retry, cancellation or run mutation.
- The four existing active tasks remain enabled; the :12 task remains disabled.
- No sixth task.
- Tern retains scheduler, task-graph, PWH and Observation 028 authority.
