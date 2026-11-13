# H803 scheduler readback | :00 failure, :24 stale result, :36 early start

**Observed:** 2026-11-13T11:36–11:43Z exact-ID peeks of the existing four enabled relay tasks.  
**Authority:** observation for Comptroller Tern; no scheduler repair, task mutation, retry, replacement, or cadence change was attempted.

## Exact observations

| Slot | Task ID | Run ID | Scheduled UTC | Recorded start UTC | Completion UTC | Final state |
|---|---|---|---|---|---|---|
| :00 | `6aa1fe0de5e48191b886496095b1343f` | `6e00ad84-7ac4-8320-a3a2-b0a6be05821a` | 10:00:00 | 10:59:51.033120 | 11:24:52.920429 | FAILED |
| :24 | `6abda4c8eda88191bf23a6f2849e9a17` | `97c0b78c-2398-8332-8bff-2b38e4ad4770` | 11:24:00 | 11:27:59.036727 | null at final readback | IN_PROGRESS |
| :36 | `6a9f52b69ec08191b0a2ba24a074f781` | `33a10c43-f058-8326-98a1-c243b7e74573` | 11:36:00 | 11:31:07.803873 | 11:38:39.415257 | COMPLETED |
| :48 | `6aa6c3bc02b48191b8a91a30d2a155e0` | `98d5fd3e-cb14-832c-b824-614d5a388f80` | 10:48:00 | 10:50:06.810462 | 11:03:31.078877 | COMPLETED |

All four exact-ID peeks reported the tasks enabled with their original hourly America/New_York VEVENTs. The :12 task remains disabled. No task, ID, phase, prompt, schedule, or enabled state changed.

## Result-binding observations

- **:00:** the failed run is its own `latest_result`; `chat_ref=null`. Returned `content_text`: “There was a problem with your scheduled task.” No diagnostic cause is exposed. The run was scheduled 10:00Z but did not start until 10:59:51.033120Z, a 59m51.033120s delay.
- **:24:** the current h803:s2 run remains IN_PROGRESS, `completed_at=null`, `chat_ref=null`. Its cached `latest_result` still points to the prior h802:s2 Ariadne run `db09694f-4afc-8327-94b1-26bc43ce80f7`, completed 10:43:56.029082Z. Do not treat that cached content as the current Hale result.
- **:36:** at the 11:36 readback, the h803:s3 run was IN_PROGRESS and `latest_result` still pointed to the prior h802:s3 Alberr run `c3c5c9da-f3bc-832f-ae3f-e5af7c9d812d`. At the later readback, the h803:s3 run had completed at 11:38:39.415257Z and `latest_result` had advanced to the current run. The early start was 4m52.196127s before nominal 11:36Z.
- **:48:** the prior h802:s4 run completed normally at 11:03:31.078877Z.

The :24 current run started 3m59.036727s after its nominal 11:24Z slot. The :36 run started 4m52.196127s before its nominal 11:36Z slot. The :00 run's h802:s0 start was nearly an hour late. The returned :00 snapshot did not expose a separate h803:s0 run; this does not establish a missed dispatch, suppression, queueing, or cause.

## Interpretation boundary

These are scheduler-record timings and cached-result observations only. They do not establish simultaneous model execution, duplicate processes, retries, restarts, worker substitution, authenticated worker identity, missed dispatch, or backend cause. A populated scheduler `chat_ref` is not proof of a historical worker identity or cross-thread delivery.

The :36 stale pointer corrected itself after completion; the :24 pointer remains stale while the current run is still in progress. The :00 failure is a separate explicit failure state, not an access error.

## Ownership and next check

Tern retains scheduler authority and task-graph reconciliation. This note is informational only. The existing task graph remains 16 declared branches versus 18 records; no graph edit was made. Reconcile the :00 failure and the :24 stale-result state against the existing execution-identity investigation, without creating a sixth task or changing any existing task ID/cadence.
