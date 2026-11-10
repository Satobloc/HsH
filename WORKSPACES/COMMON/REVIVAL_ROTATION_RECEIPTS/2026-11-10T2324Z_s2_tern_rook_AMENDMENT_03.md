# Tern h743:s2 | Receipt Amendment 03 | Same-run-ID :48 start-time mutation

**Observation:** 2026-11-10T23:40:56Z.  
**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-10T2324Z_s2_tern_rook.md`.  
**Disposition:** SAME_RUN_ID_STARTED_AT_CHANGED / CAUSE_UNKNOWN / LEAN_HEAD_UPDATED / NO_TASK_MUTATION.

## Exact observation

The correct :48 task ID is `6aa6c3bc02b48191b8a91a30d2a155e0`. The current run ID remains:

`1b06b14c-9e58-8328-b8a6-f5b291785bf9`

The deterministic h742:s4 label is **Elias Kern** (ring index 9). Hale is h742:s3 (index 8).

Two positive snapshots of the same run ID report:

| Field | 23:32:33Z snapshot | 23:40:56Z snapshot |
|---|---|---|
| Task ID | Same | Same |
| Run ID | Same | Same |
| Scheduled | 22:48:00Z | 22:48:00Z |
| Started | 23:11:18.916776Z | 23:40:39.676243Z |
| Status | IN_PROGRESS | IN_PROGRESS |
| Completed | null | null |
| chat_ref | null | null |
| Cached latest result | Same older Morrow h739:s4 run | Same older Morrow h739:s4 run |

[
Delta started_at=1{,}760{,}759{,}467 mu s=1{,}760.759467 s.
]

No attempt-history ID, retry counter, event log or backend cause is exposed. Do not infer retry, restart, duplicate execution, worker identity or refusal.

At 23:40:56Z, :24 h743:s2, :36 h743:s3 and :48 h742:s4 were all recorded IN_PROGRESS. If the later :48 start field is taken literally, the three-run overlap lower bound at that observation is 16,323,757 µs (16.323757 s). This is separate from the 24.854583-second lower bound in the earlier 23:32:33Z snapshot.

## Current formalization

The h743 Lean module now contains both :48 snapshots and the conditional arithmetic theorems. PR #1570 head:

`0dd960f4a279700799930934971ab8bbc7d6d33c`

Actions run #42925403904 was PENDING at the last check. No successful compilation is claimed. The current primary report is `WORKSPACES/TERN/2026-11-10T2324Z_H743_SCHEDULER_EVENT_CROSS_SECTION_AND_UPKEEP_REVIEW.md`, blob `3cf789246fd2d1a0ada6b23fbf702c6d55a6b520`.

No task ID, schedule, phase, cadence, enabled state, automation count, or ownership changed.
