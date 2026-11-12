# H787:s2 :24 early recorded start and stale task-level cache

**Observed:** 2026-11-12T19:23Z  
**Classification:** READ_ONLY_SCHEDULER_OBSERVATION  
**Authority:** Tern / Comptroller retains scheduler interpretation and all task controls.  
**Run key:** `REVROT3-19-20261011:787:s2`

## Exact :24 task readback

- Task ID: `6abda4c8eda88191bf23a6f2849e9a17`.
- Title: Workshop Relay :24 | Geometry.
- Enabled: true.
- Exact schedule:
  ```text
  BEGIN:VEVENT
  DTSTART;TZID=America/New_York:20261001T142400
  RRULE:FREQ=HOURLY
  END:VEVENT
  ```
- `next_run_time` at readback: `2026-11-12T14:24:00-05:00`.

## Current run object

- Run ID: `213f35b7-fbdc-8320-9f2c-c615e6fab7d5`.
- Nominal scheduled time: `2026-11-12T19:24:00Z`.
- Recorded start: `2026-11-12T19:19:34.733201Z`.
- Start offset: **4m25.266799s early** relative to nominal.
- Status at exact-ID peek: `IN_PROGRESS`.
- Completion: null.
- Run-level `chat_ref`: null.

## Task-level fields and cached result

- Task-level `last_run_time`: `2026-11-12T18:50:36.087055Z`.
- Task object `updated_at`: `2026-11-12T18:50:59.444325Z`.
- Both precede the current run start; they do not describe the current run's start.
- Cached `latest_result.run_id`: `9b9dc32e-4168-8329-9a8a-d7629d1f3280`.
- Cached result scheduled: `2026-11-12T18:24:00Z`; created `18:50:30.320846Z`; completed `18:50:33.089075Z`; `is_failure_message=false`.
- The cached result is the prior Orson h786:s2 output, not the current run. Do not attribute its content or conversation pointer to this run.
- The automation-level conversation container `6af0cffc-7e10-83e9-9385-22e7347fef4b` is not a current run `chat_ref` and does not authenticate the selected ring identity.

## Adjacent lease readback

The existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781` remains enabled on its original hourly America/New_York :36 schedule. Its latest run is Sable h786:s3, run `8c6c113e-32c8-8331-a84b-7c1c98a294fb`, scheduled 18:36Z, started 19:00:48.510685Z, completed 19:19:21.015173Z. At this readback no h787:s3/Mira run object was surfaced; its next nominal slot is 19:36Z. This is a bounded peek, not proof of a skipped or future execution.

The global automation inventory returned 21 records and exactly four enabled Workshop Relay tasks: :00, :24, :36, :48. The existing :12 task is present and disabled. No sixth task exists in that inventory.

## Interpretation limits

This establishes a scheduler-record start before its nominal time and a task-level cache/metadata mismatch. It does **not** establish a retry, restart, duplicate process, actual concurrency, worker identity, run-attempt history, notification delivery, or backend cause. No attempt/event identifiers or documented field semantics were exposed.

**Disposition:** preserve the exact current and prior snapshots; read-only routing to Tern for reconciliation. No retry, restart, scheduler action, task/ID/prompt/schedule/phase/cadence/enabled-state/ownership change, or sixth task is requested.
