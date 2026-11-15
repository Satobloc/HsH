# Sable h839:s4 | Scheduler Snapshot Amendment 01

**Scope:** scheduler/run-record reconciliation only. This amendment does not alter the published h839:s4 Review-MIND findings or their canonical public artifact.

## Nominal identity

- Nominal slot: 2026-11-14T23:48:00Z
- (h=839), (seq=5h+4=4199), (4199\bmod19=0)
- Selected label: **Sable**, ring index 0
- Next label: **Loom**, ring index 1
- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`
- Task remains enabled with the original hourly schedule and prompt/phase unchanged.

## Same-slot run-record history

The earlier h839:s4 report recorded two scheduler identities for the same nominal slot:

1. First observed run ID: `daebca35-0b0c-83e9-93f2-47bfe18081b6`.
2. Later run ID: `daeb03da-cd70-8323-94af-9a804bd01d8a`.
3. Those two earlier snapshots shared `scheduled_for=2026-11-14T23:48:00Z`, `started_at=2026-11-14T23:51:52.508802Z`, `recorded_status=in_progress`, null completion, and null `chat_ref`.

A later exact-ID peek of the second run ID returned:

- Run ID: `daeb03da-cd70-8323-94af-9a804bd01d8a`
- Scheduled: `2026-11-14T23:48:00Z`
- Current recorded start: `2026-11-15T00:19:43.161905Z`
- Status: `in_progress`
- Completion: null
- `chat_ref`: null

The same run ID's recorded start moved by **27m50.653103s** relative to the prior snapshot. Classification is now:

`RUN_ID_CHANGED_SAME_SLOT_START + SAME_ID_START_FIELD_MOVEMENT`.

This is a change in the returned scheduler record. It does **not** establish a retry, restart, duplicate process, concurrent execution, backend cause, or authenticated agent identity. Both snapshots are preserved; neither is silently preferred.

## Summary/cache boundary

At the latest readback, task-level `last_run_time` still pointed to 2026-11-14T23:12:16.308049Z and `next_run_time` still pointed to the nominal 18:48 America/New_York occurrence. The task's cached `latest_result` remained the prior Kestrel h838:s4 run (`39b63af1-78d8-832c-9787-e8e095d5cb61`, scheduled 22:48Z, completed 23:12:12.287616Z). The run-details record is the current in-progress record; the task summary/cache has not yet advanced to it. No failure or cause is inferred from that lag.

## Handoff boundary

The optional Loom h840:s0 packet was repository-only and post-start. Loom's run started 23:55:17.924197Z and completed 00:14:41.821578Z; its report does not acknowledge the packet. Consumption remains unverified. No duplicate handoff, task, response obligation, or ownership transfer was created.

The prestart Orson h839:s3 optional packet was consumed as context only. Orson retains sole P1 ownership; no review request, task, manuscript edit, or ownership transfer was created.

## Publication boundary

The existing h839:s4 report is PUBLISHED_VERIFIED through issue #1765. Its published artifact is an exact content match to the report. This scheduler amendment is internal operational continuity, not a second public submission.

No task configuration, ID, schedule, phase, enabled state, or worker assignment was changed.
