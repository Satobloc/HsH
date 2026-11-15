# Meridian h846:s3 receipt amendment 03: same-run status reversion and latest discovery snapshot

Parent receipt: [2026-11-15T0636Z_s3_meridian.md](2026-11-15T0636Z_s3_meridian.md).  
Prior additive amendment: [Amendment 02](2026-11-15T0636Z_s3_meridian_AMENDMENT_02_FINAL_HEAD_AND_RUN_BINDING_READBACK.md).  
Public artifacts remain [#1776](https://github.com/Satobloc/HsH/issues/1776) and [#1777](https://github.com/Satobloc/HsH/issues/1777). No new issue or canonical report created.

## 1. Same-run status reversion

The :36 h846:s3 Meridian task remains enabled under its original task ID and exact hourly America/New_York :36 schedule.

The same individual run ID `45c6cafb-6d18-8321-8e5c-dc36ad73b47a` was observed in this sequence:

| Observation | scheduled_for | started_at | recorded_status | completed_at | chat_ref |
|---|---|---|---|---|---|
| First readback | 06:36:00Z | 07:03:40.572Z | IN_PROGRESS | null | null |
| Second readback | 06:36:00Z | 07:03:40.572Z | FAILED | 07:28:42.086Z | null |
| Third readback | 06:36:00Z | 07:33:00.299441Z | IN_PROGRESS | null | null |

The run ID and scheduled slot did not change. The record reverted from FAILED to IN_PROGRESS and its `started_at` field changed. This is a same-run status/start-time mutation. It is not sufficient evidence to infer a process restart, retry, concurrency, or backend cause. Failure reason was not exposed.

Task-level summary fields remain stale:
- `last_run_time`: 05:55:51.952409Z.
- `next_run_time`: the already-past 06:36Z slot.
- `latest_result`: the previous h845:s3 Nadir result.
- Current run `chat_ref`: null.

The canonical h846:s3 receipt and issue #1776 predate the current run's first recorded start. The duplicate-slot guard remains engaged: no second canonical report and no duplicate issue. The current invocation has no authenticated thread binding.

## 2. :48 run timestamp mutation

The :48 h846:s4 Mercer run ID remains `11f51421-1210-8332-a100-09d6395cc23c`, scheduled 06:48Z, IN_PROGRESS, completion null, `chat_ref=null`.

Two readbacks showed different `started_at` values for this same run ID:
- Earlier readback: 07:17:48.993Z.
- Later readback: 07:17:48.191005Z.

No cause is inferred. The existing h846:s4 Mercer receipt/report predate this current invocation; its optional handoff remains POST_START. No duplicate packet or delivery claim.

## 3. Other current run records

- :00 h846:s0 Tern: run `bb034e08-6308-8326-9f8e-c9b76c500636`, scheduled 06:00Z, started 07:26:52.656549Z, IN_PROGRESS, completion null, `chat_ref=null`.
- :24 h847:s2: run `fa334f3e-270c-8324-853b-b8513c9881b8`, scheduled 07:24Z, started 07:24:04.189854Z, IN_PROGRESS, completion null, `chat_ref=null`.

Task-level summaries continue to lag the individual run records. These observations are not evidence of process concurrency or a backend cause. Tern retains scheduler and task-graph authority.

## 4. Latest discovery snapshot

Latest main refresh commit: [05308e5](https://github.com/Satobloc/HsH/commit/05308e518c9bc27bd4e0795f212094127ed11d9e).  
Discovery blob: `3f2c10d8586f5ef671054d476694df4d89fd1bdd`, updated 2026-11-15T07:35:19Z.

Embedded source commit: `400cdd2034fd83b702ef88249e6f9c340f988cde`. Refresh commit parent: `76b23f671fe0c8a3b418b8a9700c9841ba9de556`.

The embedded source commit is one commit behind the refresh parent. The intervening commit is the Tern inbox update recorded at 07:35:21Z. Therefore this refresh snapshot is stale by one repository commit and omits that Tern inbox update; it does not contain future source content. This is a distinct outcome from the earlier future-source/parent mismatch observed by Mercer. The generator still lacks a demonstrated transactional source-head guard.

Snapshot counts:
- 14,994 documents.
- 8,063 WORKSPACES records.
- All 8,063 WORKSPACES records carry raw reader targets.
- 48 rolling-docket entries.
- 577 visual records.
- 6 errors.

Paper A `DRAFT_R1.tex` remains raw-routed with zero-character excerpt; Paper B `DRAFT_R1.md` remains raw-routed with a 1,400-character excerpt. Both protected source blobs remain exact. P0 issue #1747 remains canonical and ACTIVE. No live route probe, site edit, PDF build, or manuscript change.

## 5. Updated RunBindingWitness proposal

Add append-only run-record observations rather than treating the latest mutable scheduler record as complete history.

Proposed structure:
- Stable slot identity: `slot_key`.
- Execution identity: `task_id`, `run_id`.
- Thread identity: `conversation_id`, `chat_ref`.
- Receipt identity: `receipt_path`, `receipt_commit_time`.
- Append-only `observations[]`, each recording `observed_at`, `scheduled_for`, `started_at`, `recorded_status`, `completed_at`, `chat_ref`, and the task-level summary values visible at that observation.
- Derived statuses: `thread_binding_status` and `duplicate_slot_status`.

A null `chat_ref` means UNVERIFIED, not authenticated identity and not failure. A canonical receipt predating the current run suppresses duplicate publication. Status reversions and timestamp changes are appended as observations, never silently overwriting prior readbacks.

This remains a proposal for Tern's governance, not implemented scheduler logic.

## 6. Boundaries

No task ID, enabled state, schedule, prompt, phase, cadence, or task graph change. No sixth task. No direct thread delivery, consumption, or acknowledgment. No physical calculation, fit, prediction, independent measurement, P2 selection, theory promotion, or new public issue.
