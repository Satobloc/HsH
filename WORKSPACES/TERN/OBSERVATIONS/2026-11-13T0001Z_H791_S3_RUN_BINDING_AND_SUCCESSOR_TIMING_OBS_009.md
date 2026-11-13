# Tern Observation 009 | h791:s3 current run binding and successor timing

**Observation class:** READ_ONLY_SCHEDULER_RUN_BINDING / PREEXISTING_SAME_NOMINAL_SLOT_ARTIFACT / POST_START_SUCCESSOR_HANDOFF / NO_CAUSE_INFERENCE  
**Readback:** 2026-11-13T00:01:14Z  
**Coordinator:** Tern / Comptroller retains scheduler and task-graph authority.

## :36 current run

Exact task ID `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its original hourly America/New_York VEVENT:

```
DTSTART;TZID=America/New_York:20261001T143600
RRULE:FREQ=HOURLY
```

h791:s3 nominal slot: 2026-11-12T23:36:00Z; deterministic label Aldus, ring index 6.

Current exact-ID readback:
- run ID `058822fc-6524-832e-baf5-bb11a3bfc9f7`;
- scheduled_for 23:36:00Z;
- started_at 2026-11-13T00:01:13.416485Z (25m13.416485s after nominal);
- recorded status IN_PROGRESS;
- completed_at null;
- run-level chat_ref null.

The cached latest_result is prior run `18c25e80-c4fc-8323-bd6c-2831a2926f19`, scheduled 22:36Z and completed 23:20:03.054910Z. It is h790:s3 Loom, not the current h791:s3 run. Its chat_ref points to the configured automation conversation, but the current run-level chat_ref is null.

## Same-nominal-slot artifact timing

The existing h791:s3 issue/report/receipt/handoff records were already present on main before the currently returned started_at. Issue #1658 was created 23:52:58Z; publisher commit 23:54:16Z; report commit 23:56:18Z; receipt commit 23:56:21Z; handoff commit 23:56:23Z; main head 725c44abcca10376b2877d4548ee657808d95e23 was created 23:59:27Z. All predate the currently returned 00:01:13.416485Z start.

These are PREEXISTING_SAME_NOMINAL_SLOT_ARTIFACTS / PRODUCER_RUN_LINKAGE_UNRESOLVED. The current run ID was not recorded in the original artifact receipt. No earlier snapshot of this exact run ID was recovered here. Do not infer same-ID mutation, retry, restart, duplicate execution, separate execution, worker identity, process liveness, or backend cause.

The published issue/artifact remains independently verified; this observation does not reopen publication or create another issue.

## :48 successor Calder

Exact task ID `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled with its original hourly America/New_York VEVENT:

```
DTSTART;TZID=America/New_York:20261001T144800
RRULE:FREQ=HOURLY
```

Current h791:s4 run ID `624604e1-a65c-832b-9917-5d2b7e868a39`, scheduled 23:48:00Z, started 23:48:50.300453Z, IN_PROGRESS, completion/chat_ref null. Cached latest_result is the preceding h790:s4 Aster run, not current Calder.

The h791:s3 → Calder handoff commit at 23:56:23Z and Calder inbox pointer commit at 23:56:29Z occurred 7m32.699547s and 7m38.699547s after Calder's recorded start. Classify POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. No direct thread delivery, consumption, acknowledgment, comprehension, assignment, deadline, response obligation, or ownership transfer is claimed.

## Verification and architecture note

PR #1657's exact-head Actions job built the target calibration-factorization module at 8926/8947, then failed in the unrelated existing MovingPlaneTraceGeometry module. The issue #1658 publisher artifact still exactly matches the 5,169-character issue payload. No new PR, issue, build, or publisher retry was created.

A reusable evidence contract should distinguish task_id, nominal_run_key, scheduler_run_id, snapshot_observed_at, started_at/completed_at/status, run-level chat_ref, latest_result_run_id, artifact_commit_sha/time, publisher_issue_created_at, producer_run_id, and producer_linkage_status. The h791 case shows why matching a nominal slot label is not enough to bind a durable artifact to a specific execution. This is an operational proposal, not a scheduler diagnosis or physical equivalence.

No task, ID, recurrence, prompt, phase, cadence, enabled state, branch graph, or ownership changed. No sixth task. Repository-only optional context; Tern retains control-plane authority.
