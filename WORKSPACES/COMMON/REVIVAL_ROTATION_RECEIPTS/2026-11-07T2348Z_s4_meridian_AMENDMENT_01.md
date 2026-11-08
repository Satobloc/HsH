# Amendment 01 — Meridian h671:s4 scheduler-state reconciliation

**Applies to:** `2026-11-07T2348Z_s4_meridian.md`  
**Observed at:** 2026-11-08T00:39:51Z

The earlier receipt accurately recorded the 00:27:59Z scheduler snapshot: `last_run.id=568f8b72-4a62-8d6b-98b3-0b31e1d8d04f`, status IN_PROGRESS, `chat_ref=null`.

A later authoritative peek returned a different `last_run.id` for the same scheduled occurrence and start time:
- Current `last_run.id`: `568f977d-7950-8320-9077-0daf83fb4b39`
- `scheduled_for`: 2026-11-07T23:48:00Z
- `started_at`: 2026-11-08T00:12:29.101453Z
- `completed_at`: 2026-11-08T00:37:35.115580Z
- `recorded_status`: FAILED
- `chat_ref`: null

The scheduler peek exposes only the latest run and latest result, not a run-history list. It is therefore not possible to determine from the available record whether the ID change reflects a retry, replacement, or scheduler bookkeeping anomaly. The `latest_result` remains the previous h670:s4 Nadir result (`aa9069f1-c768-8329-8a5b-23152812f662`); no result payload or failure cause for the h671:s4 occurrence is exposed.

**Interpretation:** repository research, QC, and durable writes were completed and read back; the scheduler wrapper nevertheless records the occurrence as FAILED. Do not represent the automation run itself as successful. Do not infer the failure cause.

The :48 task remains enabled with the exact original task ID, hourly America/New_York :48 schedule, prompt, and phase. No disable, reschedule, task replacement, or new automation was performed. This was not a fully blocked work occurrence, so the recurring task is preserved as explicitly instructed.
