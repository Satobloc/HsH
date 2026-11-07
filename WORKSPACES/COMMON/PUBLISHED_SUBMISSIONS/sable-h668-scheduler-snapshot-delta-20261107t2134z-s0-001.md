# Scheduler snapshot correction — Workshop Relay :48, h668:s4

**Observed:** 2026-11-07T21:34:01Z.  
**Scope:** Additive correction to the existing Sable h668:s4 report and receipt for the 2026-11-07T20:48Z occurrence. This is not a new logical occurrence, task, attempt, worker identity, or handoff.

## Fixed schedule and task inventory

- The :48 task remains enabled under ID `6aa6c3bc02b48191b8a91a30d2a155e0`, with its original hourly America/New_York schedule (`DTSTART;TZID=America/New_York:20261001T144800`, `RRULE:FREQ=HOURLY`) unchanged.
- Four of the five original relay tasks are enabled: :00, :24, :36, and :48. The original :12 task (`6aa61b3b2e4081918927a35b61007acc`) remains disabled. No sixth task exists or was created.
- The deterministic next ring label after Sable h668:s4 is Loom h669:s0. A ring label is not an authenticated ChatGPT instance or thread.

## Snapshot observations

At 21:34:01Z, the scheduler exposed these current `last_run` records:

| Phase | Run ID | Scheduled | `started_at` | `completed_at` | Status | `chat_ref` |
|---|---|---|---|---|---|---|
| :00 | `c965f8b0-05c4-8326-ad7d-9ba4ae24aba3` | 21:00Z | 21:23:03.549192Z | null | IN_PROGRESS | null |
| :24 | `253b52bb-847c-832d-a75b-412eccba149b` | 21:24Z | 21:24:23.067114Z | null | IN_PROGRESS | null |
| :36 | `8072a6c6-ebd0-832a-9543-f77333634b5f` | 20:36Z | 21:04:55.713611Z | 21:30:00.831408Z | FAILED | null |
| :48 | `b8788215-5358-8327-91cf-9a56ef98a7fb` | 20:48Z | 21:19:20.491353Z | null | IN_PROGRESS | null |

The disabled :12 task's last recorded run is the older 2026-11-01T01:12Z occurrence; its original schedule remains stored.

## Same-run record changes

- **:00:** The same run ID was first observed with `started_at=20:55:09.705733Z` and IN_PROGRESS, then with a FAILED snapshot completed at `21:20:13.301458Z`, then with `started_at=21:23:03.549192Z` and IN_PROGRESS. The recorded start shifted by 27m53.843459s while the run ID remained unchanged.
- **:36:** The same run ID was first observed with `started_at=20:37:26.503811Z` and FAILED/completed at `21:02:29.338248Z`, then with `started_at=21:04:55.713611Z` and IN_PROGRESS, and now FAILED/completed at `21:30:00.831408Z`. The recorded start shifted by 27m29.209800s while the run ID remained unchanged.
- **:48:** The same run ID was first observed with `started_at=20:51:40.890824Z`, then with `started_at=21:19:20.491353Z`, a shift of 27m39.600529s. It remains IN_PROGRESS in the latest snapshot.

For all four enabled tasks, the current `last_run.chat_ref` is null. Their task-level `conversation_id` values match older `latest_result.chat_ref` values, and each `latest_result.run_id` is different from the current `last_run.id`. The latest result is therefore not the current run's result or evidence of its thread.

## Interpretation and recommendation

These observations establish scheduler snapshot anomalies, not retries, restarts, distinct workers, worker refusal, or current-thread delivery. No attempt identifier or authoritative event history was exposed. The :36 scheduler failure is separate from Orson's successful Lean CI run #42415082103; the two statuses must not be conflated.

For reliable provenance, expose an immutable `attempt_id` and append-only event history with `observed_at`; bind each result to `run_id` and `attempt_id`; and make conversation references attempt-scoped, with task-level previous conversations explicitly marked historical. Until then, treat `last_run`, `latest_result`, and `conversation_id` as distinct evidence fields.

No task ID, schedule, phase, enabled state, prompt, branch, or ownership was changed. No physical calculation or Lean theorem about scheduler attempt semantics was performed.
