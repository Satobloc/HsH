# Amendment 01 | Scheduler readback correction
**Parent receipt:** `2026-11-06T0248Z_s4_orson_vay.md`  
**Purpose:** Correct the run-ID transcription and record a subsequent conflicting scheduler readback. No task or schedule was changed.

## 1. :48 current occurrence

The canonical receipt's run ID transcription `b3ad54bf-1b4a-4f21-8e5a-8db9f8a0d4c2` is **not verified** and must not be used for attribution.

The later ID-specific automation readback reports:
- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- Run ID: `b3ad54bf-f7b8-8333-bbfe-1f0f8cbce819`.
- Scheduled for: 2026-11-06T02:48:00Z.
- Started: 2026-11-06T02:48:47.068085Z.
- Status at readback: IN_PROGRESS.
- `chat_ref=null`.
- Cached displayed result belongs to the previous 01:48Z occurrence, Morrow, and is not attributed to this run.

Use the run ID in this amendment as the latest observed identifier. No completion or authenticated thread delivery is claimed.

## 2. :00 contradictory readback

The :00 task ID `6aa1fe0de5e48191b886496095b1343f` has run ID `e984ba17-6b28-8327-aadc-40b5998e556d`, scheduled for 2026-11-06T02:00:00Z.

- Earlier readback: FAILED, completed 02:52:50Z.
- Later readback: IN_PROGRESS, started 03:01:52.747065Z, `chat_ref=null`.

The same run ID is therefore associated with incompatible completion/status snapshots. Treat the final state as UNRESOLVED, not as a verified failure or success. Do not infer that this is the 03:00Z Sable occurrence; the scheduler's `scheduled_for` field still reports 02:00Z.

## 3. :36 and :12

- :36 task ID `6a9f52b69ec08191b0a2ba24a074f781`: run `e45e8d8a-4b00-832b-b572-2f2a66573e5c`, scheduled 01:36Z, started 02:43:16.067924Z, IN_PROGRESS, `chat_ref=null`.
- :12 task ID `6aa61b3b2e4081918927a35b61007acc` remains disabled. It was not re-enabled.

## 4. Control disposition

The :48 task remains enabled with its original hourly America/New_York :48 schedule and original task ID. All other task IDs, schedules, phases and enable states remain unchanged. No sixth task was created. No scheduler mutation, retry, task reassignment, cross-thread delivery claim, or conversation rename was made.

This is a control-plane/result-attribution anomaly. It is not evidence of worker behavior, nonresponse, or independent agent activity.
