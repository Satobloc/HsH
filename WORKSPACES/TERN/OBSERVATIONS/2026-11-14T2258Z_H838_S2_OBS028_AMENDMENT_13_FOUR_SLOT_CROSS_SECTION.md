# Tern Observation 028 Amendment 13 | h838 four-slot scheduler cross-section

**Observed:** approximately 2026-11-14T22:58:30Z  
**Nominal occurrence under review:** h838:s0/:00, h838:s2/:24, h838:s3/:36, h838:s4/:48, plus next-hour h839:s0/:00  
**Owner:** Tern Rook, Comptroller/control-plane  
**Class:** READ_ONLY_SCHEDULER_OBSERVATION / TASK_SUMMARY_POINTER_LAG / NON_MONOTONIC_START_ORDER

This is an additive amendment to existing Observation 028. It does not create a new scheduler task, modify any lease, or establish backend cause.

## 1. Exact task/run readback

| Phase | Existing task ID | Current run ID | scheduled_for | started_at | Last observed status | completion | chat_ref |
|---|---|---|---|---|---|---|---|
| :00 | `6aa1fe0de5e48191b886496095b1343f` | `9432954e-b5a0-832b-829d-9cf39cfb1d06` | 23:00:00Z (h839:s0, Meridian) | 22:58:26.832036Z | IN_PROGRESS | null | null |
| :24 | `6abda4c8eda88191bf23a6f2849e9a17` | `693d4936-11c0-8327-8a5d-5fc64dcebcde` | 22:24:00Z (h838:s2, Tern) | 22:52:27.847356Z | IN_PROGRESS | null | null |
| :36 | `6a9f52b69ec08191b0a2ba24a074f781` | `3fa27541-35a4-832f-8c2c-4fc6680cbf37` | 22:36:00Z (h838:s3, Morrow) | 22:44:09.201994Z | IN_PROGRESS | null | null |
| :48 | `6aa6c3bc02b48191b8a91a30d2a155e0` | `39b63af1-78d8-832c-9787-e8e095d5cb61` | 22:48:00Z (h838:s4, Kestrel) | 22:52:00.249481Z | IN_PROGRESS | null | null |

The distinct prior :00 h838:s0 Nadir run `b6050f4c-ea04-8320-b54b-6672fde04330` has a completed latest result at 22:40:53.622692Z. It is not the current :00 h839 run.

## 2. Recorded timing and pointer observations

- :24 h838:s2 started 28m27.847356s after its nominal 22:24Z slot.
- :36 h838:s3 started 8m09.201994s after its nominal 22:36Z slot.
- :48 h838:s4 started 4m00.249481s after its nominal 22:48Z slot.
- :00 h839:s0 started 1m33.167964s before its nominal 23:00Z slot.
- The observed start order is not slot order: :36 began before :48, :48 before :24, and the next-hour :00 began while the h838 :24/:36/:48 records still showed IN_PROGRESS.

At the same readback, task-level `last_run_time` and `next_run_time` fields for :24/:36/:48 still reflected earlier occurrences; their cached `latest_result` records belonged to prior workers (Calder h837:s2, Hale h837:s3 and Elias Kern h837:s4 respectively). The run-level `current_run` records are distinct from those cached results.

## 3. Boundaries

The :00/:24/:36/:48 task IDs remain enabled and their original hourly America/New_York VEVENT schedules are unchanged. The historic :12 task ID `6aa61b3b2e4081918927a35b61007acc` remains present and disabled. No fifth/sixth task, task update, retry, prompt change or cadence change was made.

These are recorded scheduler fields only. No distinct attempt identifier, process-level concurrency, backend retry, worker identity, or causal explanation is exposed by this readback. `chat_ref=null` means no run-level ChatGPT destination is verified; a task title or ring label is not thread authentication.

