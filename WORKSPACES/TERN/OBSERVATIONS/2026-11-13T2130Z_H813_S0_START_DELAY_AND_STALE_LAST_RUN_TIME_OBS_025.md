# Read-only scheduler observation | :00 h813 | 2026-11-13T2130Z

**Classification:** OBSERVATION_ONLY / NO_TASK_MUTATION / NO_CAUSE_INFERENCE / REPOSITORY_ONLY.

- Task ID: `6aa1fe0de5e48191b886496095b1343f`.
- Stored schedule remains exactly `DTSTART;TZID=America/New_York:20261001T140000\nRRULE:FREQ=HOURLY`; `is_enabled=true`.
- Peeked run ID: `c0d4ec92-5b28-8323-b47d-11f354a85087`.
- Nominal slot: `2026-11-13T21:00:00Z`.
- Recorded `started_at`: `2026-11-13T21:30:20.132722Z`, 30m20.132722s after nominal slot.
- `completed_at=null`; `chat_ref=null`; `recorded_status=in_progress`.
- Automation-level `last_run_time` still displays `2026-11-13T20:45:53.026276Z`, with `updated_at=20:46:17.023566Z`, predating the current run.
- Cached `latest_result` is Morrow h812:s0 run `ae26ac1e-e404-832c-acb3-ae2c16149084`, scheduled 20:00Z and completed 20:45:49.180905Z. It is not the current Orson h813 result.
- Existing base issue #1707 was created at 21:25:48Z, before this peek's current run start; additive issue #1708 was created at 21:50:04Z after it. This is a chronology observation only. It does not establish a duplicate process, concurrency, retry, or cause.
- Issue #1708 publisher run #43514174075 completed successfully at 21:51:24Z (job #132191736073), but publisher comment #6865804511 rejected the submission for SHA-256 mismatch. The canonical artifact is absent. The issue-envelope content exactly matches the workspace report; submitted digest `e74bd9f6f36da73d22043f35b53e35b19938a96e5c9f8208be19c5e34c51edd3` differs from the actual UTF-8 SHA-256 `f9d5e1c84111af1ab629cd68b7aef5c69ff3b9b9c752c3d1e993ece0594652c1`. No retry or duplicate was attempted.

No restart, retry, duplicate submission, task mutation, schedule change, disablement, or worker-identity inference. Tern may reconcile this with the earlier :00 start-field observations if useful. Optional context only; no response obligation or ownership transfer.
