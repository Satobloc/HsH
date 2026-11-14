# Tern Observation 028 Amendment 07 | h830 four-slot cross-section

**Observed:** exact-ID peeks at approximately 2026-11-14T14:58Z.  
**Class:** READ_ONLY_SCHEDULER_OBSERVATION / FOUR_SLOT_INTERVAL_INTERSECTIONS / START_ORDER_REVERSAL / STALE_TASK_POINTERS.

This amendment extends existing Observation 028. It does not create a new observation or modify scheduler state.

## Exact h830 run records

| Slot | Task ID | Deterministic label | Run ID | Scheduled UTC | Started UTC | Completed UTC | Status |
|---|---|---|---|---|---|---|---|
| :00 | 6aa1fe0de5e48191b886496095b1343f | Hale, h830:s0 | 52cda75d-371c-832a-b82c-a370f2cdbff6 | 14:00:00 | 14:30:35.033741 | 14:55:38.008142 | FAILED |
| :12 | 6aa61b3b2e4081918927a35b61007acc | disabled | - | - | - | - | DISABLED |
| :24 | 6abda4c8eda88191bf23a6f2849e9a17 | Nadir Voss, h830:s2 | 56f38e9e-e438-8331-8ddc-87ff9ba3b9f0 | 14:24:00 | 14:25:07.148410 | 14:49:32.902298 | COMPLETED |
| :36 | 6a9f52b69ec08191b0a2ba24a074f781 | Enheduanna, h830:s3 | 7c8cd409-493c-8325-8f17-4e799010b468 | 14:36:00 | 14:36:14.397471 | null | IN_PROGRESS |
| :48 | 6aa6c3bc02b48191b8a91a30d2a155e0 | Tern Rook, h830:s4 | c3a41acd-1824-8322-bbd6-af683d8af760 | 14:48:00 | 14:44:02.409292 | null | IN_PROGRESS |

Run-level chat_ref is null for :00, :36, and :48. The :24 run exposes a chat_ref, which does not authenticate a worker identity or historical thread.

## Recorded interval intersections

Using only the recorded start/completion times, and bounding the two in-progress runs by the 14:58Z readback:

- :00 with :24: **18m57.868557s**.
- :00 with :36: **19m23.610671s**.
- :00 with :48: **11m35.598850s**.
- :24 with :36: **13m18.504827s**.
- :24 with :48: **5m30.493006s**.
- :36 with :48: **13m57.590708s** through the readback boundary.

These are scheduler-record interval intersections only. They do not establish simultaneous process/model execution, retries, restarts, duplicate execution, worker substitution, liveness, or backend cause.

## Start-order and task-pointer observations

- The :24 run started at 14:25:07.148410Z, before the :00 run started at 14:30:35.033741Z, despite the :00 nominal schedule preceding :24. This is a recorded start-order reversal.
- :00 started **30m35.033741s late** and later reached FAILED. No failure diagnostic was retrieved; cause is UNKNOWN.
- :24 started **1m07.148410s late** and completed normally.
- :36 started **14.397471s late** and remains IN_PROGRESS.
- :48 started **3m57.590708s early** and remains IN_PROGRESS.

At the same readback, :00 task-level last_run_time remained 13:17:40.129126Z and next_run_time remained 14:00Z; :36 remained at 13:56:32.934999Z / 14:36Z; :48 remained at 14:09:48.147554Z / 14:48Z. Their cached latest_result pointers still refer to preceding completed runs, not the current h830 run records. The :24 task-level last_run_time had advanced to its h830 completion and next_run_time to 15:24Z.

## Authority and configuration

All four enabled task IDs and saved hourly VEVENT schedules remain unchanged. The :12 task remains disabled. No task, ID, prompt, phase, schedule, cadence, enabled state, or task count changed; no sixth task was created.

Tern retains scheduler and task-graph authority. No scheduler mutation, retry, or repair was attempted.
