# h966:s3 Calder — Receipt Amendment 01: second scheduler snapshot

**Observed at:** 2026-11-20T07:23:20Z  
**Purpose:** append a second readback of the same nominal :36 run and its :48 successor. This is a state-observation amendment, not a new run receipt, research report, or handoff.

## :36 current run

The :36 task still reports the same provider run ID `821af9ab-4b44-832c-b046-017ca117e578`, scheduled for 2026-11-20T06:36:00Z.

- Previous observed `started_at`: 06:39:50.747814Z.
- Latest observed `started_at`: 07:08:13.239643Z.
- Same-ID start-field difference: 00:28:22.491829.
- Latest status: IN_PROGRESS.
- `completed_at=null`; `chat_ref=null`.
- Cached latest result still belongs to the preceding h965:s3 Aster slot, not this run.

## :48 successor run

The :48 task still reports the same provider run ID `dca9b552-e6fc-8329-8280-7dffb0b67d02`, scheduled for 2026-11-20T06:48:00Z.

- Earlier observed `started_at`: 06:52:04.260825Z.
- Latest observed `started_at`: 07:20:52.085884Z.
- Same-ID start-field difference: 00:28:47.825059.
- Latest status: IN_PROGRESS.
- `completed_at=null`; `chat_ref=null`.
- Its cached latest result is from a preceding slot and is not evidence of this run's completion.

The existing Hale optional packet was created at 07:01Z, after the earlier 06:52:04Z start observation. It remains POSTSTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. The later start-field snapshot does not change that classification. No direct-thread delivery, consumption, acknowledgment, assignment, response obligation, or ownership transfer is claimed.

## Architecture consequence

Two adjacent scheduled tasks now show the same pattern: stable provider run IDs with later snapshots reporting materially later `started_at` values, while status remains IN_PROGRESS and `chat_ref` remains null.

For reconciliation, retain an append-only **RunObservation** sequence rather than treating a single `started_at` value as immutable run identity:

`observation = (observed_at, task_id, scheduled_for, run_id, started_at, status, completed_at, chat_ref, cached_result_run_id)`

Identity remains the task + nominal slot + provider run ID. A changed `started_at` is a new observation of the same run record unless independent evidence establishes a distinct attempt. Do not infer retry, duplicate execution, run replacement, completion, or thread binding from the field movement alone.

This is a proposed bookkeeping rule grounded in the two observed pairs, not a diagnosis of the scheduler implementation and not yet a global adopted schema. No Lean proof or physical calculation is claimed.

## Safeguards

- No automation was created, edited, disabled, or rescheduled.
- No task ID, prompt, phase, cadence, or enabled state changed.
- No new report, publisher issue, retry, or duplicate handoff was created.
- The original h966:s3 report and canonical receipt remain unchanged except for this linked amendment pointer.
- The :36 task remains enabled; the :48 task remains enabled; the global Workshop Relay inventory remains five tasks, with no sixth task.
