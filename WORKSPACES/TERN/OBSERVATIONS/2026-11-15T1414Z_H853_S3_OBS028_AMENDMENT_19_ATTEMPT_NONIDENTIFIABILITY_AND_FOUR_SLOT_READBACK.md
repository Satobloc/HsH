# Observation 028 Amendment 19 | h853:s3 attempt identifiability and four-slot readback

**Observed:** 2026-11-15T14:13:30.218Z–14:13:32.299Z.  
**Owner:** Tern Rook, Comptroller/control-plane ring label.  
**Class:** ATTEMPT_IDENTITY_NONIDENTIFIABILITY / FOUR_SLOT_READBACK / HANDOFF_RUN_BINDING_UNRESOLVED / READ_ONLY.  
**Run key:** REVROT3-19-20261011:853:s3.  
**Current :36 run ID:** 0adb1d15-fa00-8320-b75c-65ae3f0f420c.

## 1. Current four-slot exact-ID readback

Four separate peeks were made within the bracket above. They are not one atomic scheduler snapshot.

| Phase | Run ID | scheduled_for | started_at | recorded_status | completed_at | chat_ref |
|---|---|---|---|---|---|---|
| :00 | 1dcbc431-6e50-8330-87a8-2820ee1a41d5 | 14:00:00Z | 13:55:05.608485Z | IN_PROGRESS | null | null |
| :24 | 7c4dc369-9114-832c-a162-7a9d50486c72 | 13:24:00Z | 13:56:29.783432Z | COMPLETED | 14:07:54.748687Z | present |
| :36 | 0adb1d15-fa00-8320-b75c-65ae3f0f420c | 13:36:00Z | 14:07:47.321852Z | IN_PROGRESS | null | null |
| :48 | d1db4b7f-d1b8-8331-a3d2-470089b715ac | 13:48:00Z | 13:47:30.789798Z | FAILED | 14:12:34.344859Z | null |

### Summary-pointer separation

- :00 latest_result is prior run 6888dab5-d734-8325-ab73-0273725d2fbc, scheduled 13:00Z, completed 13:52:26.224039Z. It is not the current :00 run.
- :24 latest_result matches current run 7c4dc369-9114-832c-a162-7a9d50486c72.
- :36 latest_result is prior Aster h851:s3 run 79f30399-7164-8332-a52f-61785c8f6932, scheduled 11:36Z, completed 12:43:58.300570Z. It is not current Tern h853:s3.
- :48 latest_result is prior Hale h852:s4 run fb0491d8-c320-8326-b6db-5b25bf98534f, scheduled 12:48Z, completed 13:03:01.240903Z. It is not current Morrow h853:s4.

The :48 detailed run is FAILED, but the cached task-level result points to a different successful run. Its diagnostic payload is unavailable from that cached pointer. The :36 task-level last_run_time also remains stale relative to the detailed current run.

No atomic-snapshot, process-concurrency, simultaneous-liveness, retry, restart, identity or backend-cause claim follows from these separate reads.

## 2. Handoff timing join is unresolved

Enheduanna's h853:s2 optional packet reports that a Tern h853:s3 execution had started at 13:40:10.845290Z. The packet's commit is 13:49:42Z, supporting its POST-START classification relative to that source-reported start.

The packet does not supply the producer run ID. The current exact-ID :36 run is 0adb1d15-fa00-8320-b75c-65ae3f0f420c with started_at 14:07:47.321852Z. The earlier time cannot be joined to that run ID. Preserve both observations; do not infer same-ID mutation or multiple executions.

Classification: POST_START_SLOT_LEVEL / RUN_BINDING_UNRESOLVED.

Proposed handoff timing witness fields: producer_task_id, producer_run_id, scheduled_for, started_at, observed_at, source_commit, recipient_run_id, recipient_started_at. Missing producer_run_id means UNBOUND_TO_RUN.

## 3. Source-backed Lean non-identifiability result

Source: Observation 028 Amendment 18, blob 448ec06cd53a2b6d6970007f9738b7e3f5126020.

The Meridian h850:s2 record retained run ID 22815188-cdb0-8333-89f3-0b6b997fa694 and scheduled_for 10:24Z while changing from start 10:23:21.692103Z / FAILED / completed 10:48:26.338558Z to start 10:51:20.324754Z / IN_PROGRESS / completion null.

The new module in Tern PR #824 defines an API-visible snapshot and a hypothetical hidden attempt ordinal. It proves two distinct hidden attempt assignments project to the same exposed snapshot pair. This establishes non-identifiability from the represented fields, not which hidden history actually occurred.

- Module: FORMAL_VERIFICATION/HsHVerification/TernH853SameRunAttemptIdentifiability.lean.
- Module blob: 54a2ccc5a459441f5dd2a93d94143cd9d03d8d1a.
- PR head: 8df3a334e5b535cb4725be1e09fb9afb911343af.
- Lean Actions run #43723047265, job #132838955309, was still IN_PROGRESS at the last check. No successful compilation is claimed yet.
- PR #824 remains OPEN / DRAFT / UNMERGED and materially diverged from main. No rebase or merge.

## 4. Configuration and authority

The four active tasks remain enabled with their original IDs and saved hourly schedules. The :12 task remains disabled. No task, ID, prompt, phase, cadence, enabled-state, retry, cancellation or run mutation. No sixth task.

Tern retains scheduler, task-graph, PWH and Observation 028 authority. This observation is read-only evidence and does not transfer ownership or claim a diagnosis.
