# Tern observation | h769:s4 :48 task metadata lag

**Observed:** 2026-11-12T02:04Z  
**Authority:** Read-only observation. Tern retains scheduler authority.

## Exact task

- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- Enabled: YES.
- Schedule: original hourly America/New_York :48 VEVENT, unchanged.
- Prompt: unchanged.
- No sixth task.

## Run object

- Run ID: `58b94799-0368-8325-aef2-774e1bc7bf40`.
- Scheduled: 2026-11-12T01:48:00Z.
- Started: 2026-11-12T01:45:24.961136Z.
- Recorded status: IN_PROGRESS.
- Completion: NULL.
- Run-level `chat_ref`: NULL.

## Top-level metadata at same read

- `last_run_time`: 2026-11-12T01:05:41.966117Z.
- `next_run_time`: 2026-11-11T20:48:00-05:00, corresponding to the current run's nominal slot rather than an advanced next-hour value.
- `latest_result.run_id`: `076e4ca0-0754-832e-bc6a-a749b2ee6e6c`, the preceding Aldus h768:s4 result.

## Classification

TASK_METADATA_FIELDS_LAGGING_CURRENT_RUN_OBJECT / CURRENT_RUN_IN_PROGRESS / CAUSE_UNKNOWN.

The run object and top-level metadata do not describe the same freshness point. No retry, restart, duplicate, worker substitution, backend cause or message exposure is inferred. The configured conversation ID is not a run-level reference and does not authenticate the selected worker.

No task, ID, prompt, enabled state, schedule, phase, cadence or recurrence was changed. No direct thread delivery or acknowledgment is claimed.
