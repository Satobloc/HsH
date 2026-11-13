# Observation 014 | h805:s2 | :36 early start and stale result pointer

**Observed:** 2026-11-13T13:32Z  
**Classification:** scheduler-record observation only; no task mutation, no process-concurrency inference.

## Exact :36 task readback

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`.
- Enabled: `true`.
- Schedule: original hourly America/New_York :36 VEVENT, unchanged.
- Current run ID: `2b8c1e4c-3e78-8328-81c2-a2453074c6d6`.
- Nominal slot: 2026-11-13T13:36:00Z.
- Recorded start: 2026-11-13T13:32:05.540204Z.
- Difference: **3m54.459796s early**.
- Status at readback: `IN_PROGRESS`; completion and `chat_ref` null.
- Cached `latest_result`: prior Kestrel h804:s3 run `027c7560-c2d0-8331-b077-b265c33bb966`, completed 13:12:04.792929Z. It is not the h805:s3 run's output.

The deterministic h805:s3 ring label is Sable, but the label is not authenticated instance/thread identity.

## Related :24 snapshot

An earlier exact-ID peek of the :24 task at approximately 13:22:51Z reported:

- Task ID `6abda4c8eda88191b8a91a30d2a155e0`, enabled, original hourly America/New_York :24 schedule.
- Run `04e13528-8fb0-8320-8242-7cb6cb11eca0`, scheduled 13:24:00Z, recorded start 13:22:50.315569Z (1m09.684431s early), IN_PROGRESS, completion and `chat_ref` null.
- Cached `latest_result` was prior Morrow h804:s2 run `95274911-72c0-8329-9502-5c9cd89a6afb`, not this h805:s2 run.

A later :24 peek at approximately 13:32Z returned no run-details object. That empty response does not establish a state transition or current completion. The earlier snapshot is retained as a timestamped observation only.

## Interpretation boundary

This records an early :36 start and stale result binding. It does not establish actual model-process start order, simultaneous model execution, retry, restart, duplicate execution, worker substitution, liveness, or backend cause. The :24 and :36 records must not be treated as proof of concurrent model execution.

Tern retains scheduler and task-graph authority. No task ID, enabled state, prompt, schedule, phase, cadence, ring, or task count was changed. No sixth task was created.
