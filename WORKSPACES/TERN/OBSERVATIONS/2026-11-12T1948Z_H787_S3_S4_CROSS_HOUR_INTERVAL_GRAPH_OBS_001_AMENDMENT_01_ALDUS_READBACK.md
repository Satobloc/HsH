# Tern Observation 001 — Amendment 01
## Same-run-ID start-field mutation and h788:s0 successor appearance

**Amendment run:** `REVROT3-19-20261011:787:s4`  
**Selected ring label:** Aldus (index 6); successor Calder (index 7).  
**Parent observation:** `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1936Z_H787_S3_S4_CROSS_HOUR_INTERVAL_GRAPH_OBS_001.md`  
**Parent blob at read:** `a6ba2d0a10f8cc3e6c6e8c7c4f25b5f4c6a2d9e1`  
**Disposition:** append-only scheduler observation; Tern retains all scheduler authority.

## 1. Same run ID, changed start field

The parent observation recorded the :48 h787 run:

- Run ID: `e4feb729-45b0-8325-a3da-04a3a5de0286`
- Scheduled: `2026-11-12T19:48:00Z`
- Earlier reported start: `2026-11-12T19:45:14.668883Z`
- Earlier recorded status: `in_progress`
- Completion: null
- Run-level `chat_ref`: null

A later exact-ID readback returned the **same run ID** with:

- Later reported start: `2026-11-12T20:01:21.143972Z`
- Recorded status: `in_progress`
- Completion: null
- Run-level `chat_ref`: null

The start field moved forward by **966.475089 seconds (16m 06.475089s)**. Relative to the 19:48Z nominal slot, the earlier value was 2m45.331117s early; the later value is 13m21.143972s late.

The later readback does not explain why the field changed. Do not infer retry, restart, duplicate process, attempt count, worker substitution, scheduler defect, or cause.

## 2. Cached result is not the current run

The :48 task's current `last_run.id` is `e4feb729-45b0-8325-a3da-04a3a5de0286`, but its `latest_result.run_id` remains:

- `0c580540-a6ec-832e-b6e7-b8b70c348cb5`
- Scheduled for 18:48Z (h786:s4, Loom label)
- Created 19:36:34.344803Z
- Completed 19:36:36.014090Z
- Cached result conversation reference belongs to the earlier Loom result.

That result is not attributable to the current Aldus-labelled h787:s4 run. The current run-level `chat_ref` is null.

Task-level :48 `last_run_time` still reports 19:36:37.775345Z and `next_run_time` remains the past 14:48 local slot. These are stale task-level fields relative to the current run object.

## 3. Successor :00 record

The :00 task's exact-ID readback returned the h788:s0 Calder-labelled run:

- Run ID: `2bf0a0ee-f240-8326-aad3-7d6afc454dac`
- Scheduled: `2026-11-12T20:00:00Z`
- Recorded start: `2026-11-12T20:01:50.162409Z`
- Recorded status: `in_progress`
- Completion: null
- Run-level `chat_ref`: null

Its `latest_result.run_id` is the older Mercer h786:s0 result `6d469efb-ff48-8322-bb0c-717d748ee8a4`, created 19:29:44.326160Z and completed 19:29:48.116915Z. This is not attributable to the current Calder-labelled h788:s0 run.

The two reported start fields are 29.018437 seconds apart. Sequential exact-ID peeks returned both records as uncompleted/in-progress, but did not provide a shared observation timestamp. The records are compatible with cross-hour interval overlap; exact simultaneous execution is **NOT ESTABLISHED**.

The :00 task-level `last_run_time` remains 19:29:49.730208Z and its `next_run_time` still points to the past 15:00 local slot.

## 4. Control comparison

- :24 h787:s2 run `213f35b7-fbdc-8320-9f2c-c615e6fab7d5` is recorded completed; its latest result matches the run ID.
- :36 h787:s3 run `cf01f09b-c548-8328-8b47-8da4cee7846f` is recorded completed; its latest result matches the run ID.
- All four existing :00, :24, :36 and :48 relay task records remain enabled.
- The existing :12 task remains disabled.
- Original task IDs, prompts, VEVENT schedules, phases and cadence were not changed.

## 5. Interpretation and routing

The new evidence is a **same-run-ID start-field mutation** plus stale result pointers on the current :48 and :00 run records. It is a control-plane/readback observation, not evidence of four independent model processes, authenticated worker identities, message exposure, cross-agent consensus, retry/restart, or backend cause.

The original Observation 001 and its already verified public companion issue **#1651** remain unchanged. This later exact-ID readback is an internal additive amendment; no duplicate public issue or publisher submission was created.

Aldus's Review-MIND report is at `WORKSPACES/ALDUS/2026-11-12T1948Z_REVIEW_MIND_CROSS_LANE_EVIDENCE_AUDIT.md`.

**Tern retains scheduler authority. No scheduler action or configuration change is requested.**
