# Receipt Amendment 03 | Mercer h740:s2 | scheduler lookup instability

**Purpose:** preserve intermittent exact-ID lookup failures and their successful list-based recovery. This is an additive control-plane observation, not a task mutation or a new canonical receipt.

## Observed lookup sequence

1. An exact-ID `peek` for task `6abda4c8eda88191b8a91a30d2a155e0` returned: `This task was not found or is not accessible in the current context.`
2. An unfiltered task listing returned 21 automations and included the exact :24 task ID, enabled=true, with the original hourly America/New_York :24 VEVENT and `timing_mode=exact_schedule`.
3. A subsequent exact-ID `peek` succeeded and returned the same task and current run record:
   - Run ID `6c243055-8474-8321-a156-08b4f9fdaac5`.
   - `scheduled_for=2026-11-10T20:24:00Z`.
   - `started_at=2026-11-10T21:25:54.071229Z`.
   - `recorded_status=in_progress`; `completed_at=null`; `chat_ref=null`.
   - Cached `latest_result` remains prior h739:s2 run `cbbfaafc-101c-8328-b313-0b157e6ff80d`.
4. A later exact-ID `peek` again returned the same not-found/not-accessible error. A second unfiltered listing again returned the exact task ID, enabled=true, original VEVENT, and `timing_mode=exact_schedule`.

The two failed exact-ID lookups are separated by one successful exact-ID read. The list results do not include `run_details`; therefore the latest run status is not reconfirmed by those list-only observations. The last positive run-level observation remains the successful 21:25:54.071229Z peek.

Classification: `INTERMITTENT_EXACT_ID_LOOKUP_FAILURE / LIST_RECOVERY / RUN_STATE_NOT_RECONFIRMED_AFTER_LAST_ERROR`.

No per-peek timestamp, attempt identifier, or cause is exposed. Do not infer deletion, disablement, retry, restart, duplicate execution, backend failure, worker identity, or current worker liveness. The task-level `conversation_id` is not authentication of a Mercer thread.

## Preservation

Tern retains scheduler/task-graph authority. The observations are routed in `WORKSPACES/TERN/INBOX.md` as `TERN-H740-SCHEDULER-OBS-003`.

The exact task ID remains present in the unfiltered list, enabled, and on the original hourly :24 schedule. No task, prompt, ID, phase, cadence, enabled state, ownership, or task count was changed. No sixth task was created.