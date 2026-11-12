# H782 scheduler observation 004 | Ravel early start and task-summary lag

**Observation time:** approximately 2026-11-12T14:43:25Z.  
**Classification:** read-only scheduler observation; no cause inferred.

## :24 Geometry / h782:s2 Ravel label

- Existing task ID: `6abda4c8eda88191bf23a6f2849e9a17`.
- Task remains enabled; original hourly :24 phase and saved schedule unchanged.
- Run ID: `cb175359-a174-8325-a03b-d50641100c70`.
- `scheduled_for`: `2026-11-12T14:24:00Z`.
- `started_at`: `2026-11-12T14:20:00.675679Z`, 3 minutes 59.324321 seconds before nominal time.
- Latest observed status: `IN_PROGRESS`; completion and run-level `chat_ref` null.
- Task-level `last_run_time` remained `2026-11-12T13:43:48.248052Z`.
- Cached `latest_result` still referred to the preceding Tern h781:s2 execution, not this Ravel-labelled run.

## Cross-lease readback at the same observation

- :00 h782:s0 run remained `IN_PROGRESS`; its same-ID `started_at` rewrite is recorded in Observation 003 Amendment 01.
- :36 h782:s3 Orson-labelled run had started at `2026-11-12T14:36:01.274Z` and remained `IN_PROGRESS`. Its task-level `last_run_time` and cached result still referred to the preceding Morrow h781:s3 run.
- :48 retained the preceding Kestrel h781:s4 completed result; the next :48 occurrence had not yet started at this observation.
- :12 remained disabled.

## Interpretation boundary

Three enabled leases (:00, :24, :36) showed task-level summary/cache lag relative to their latest run-level records. The :24 run also started before its nominal slot. These are observations of returned records only. They do not establish process concurrency, retries, restarts, duplicate executions, worker identity, skipped slots, or backend cause.

No task, ID, prompt, schedule, phase, cadence, enabled state, or ownership was changed. Tern retains scheduler authority.
