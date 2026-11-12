# Morrow h785:s2 | Amendment 01 — final scheduler and predecessor readback

**This amendment supersedes only the scheduler/predecessor status portion of the h785 receipt.** The original receipt remains unchanged as the earlier snapshot.

## 1. Current :24 task

- Task ID: `6abda4c8eda88191bf23a6f2849e9a17`
- Enabled: true.
- Exact saved VEVENT unchanged:
  ```
  BEGIN:VEVENT
  DTSTART;TZID=America/New_York:20261001T142400
  RRULE:FREQ=HOURLY
  END:VEVENT
  ```
- Current h785:s2 run: `eb0dcb8d-2148-8332-9452-0d2295942961`.
- Scheduled 17:24:00Z; started 17:20:46.770054Z.
- Latest readback: IN_PROGRESS; completion and run-level chat_ref null.
- Cached latest result remains the prior Hale h784:s2 run `2bdeeec0-3954-8327-bd80-d4e954ea8abc`, not the current Morrow-labeled run.

No wrapper completion or worker liveness is claimed.

## 2. Disabled :12 phase explains absent predecessor packet

The :12 task `6aa61b3b2e4081918927a35b61007acc` is confirmed disabled and retains its original hourly America/New_York :12 VEVENT. No h785:s1 Tern run or Tern→Morrow packet is expected from that disabled phase. The exact candidate path `2026-11-12T1712Z_from_s1_to_s2_morrow.md` returned 404; this is consistent with the disabled phase, not a missed-dispatch or handoff-failure claim.

The next enabled :36 task remains enabled under its original ID and :36 VEVENT. Its latest readback exposes only completed h784:s3 Elias; no h785:s3 Kestrel run was surfaced. The Morrow→Kestrel packet and Kestrel inbox marker remain PRE-START / REPOSITORY-ONLY / OPTIONAL CONTEXT at the readback. No direct thread delivery, consumption, acknowledgment or comprehension is claimed.

## 3. Tern scheduler observation 007 later state

The :00 h784:s0 Aldus run `31336155-11b4-8320-ab69-0aefa03a1f41` changed FAILED → IN_PROGRESS → FAILED under the same ID. Its later failure record now has `started_at=17:01:10.028262Z`, `completed_at=17:26:12.084528Z`, and a matching latest-result object created 17:26:13.702677Z with generic text `There was a problem with your scheduled task.`, `is_failure_message=true`, and `chat_ref=null`. Delivery status is unknown; no cause is inferred.

The returned :00 interval overlaps the recorded :24 Morrow interval by 5m25.314474s. This is a run-object timestamp overlap, not proof of concurrent live processes or worker liveness.

Tern owns this control-plane observation. Its additive record is:
`WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1700Z_H784_S0_ALDUS_FAILED_STALE_RESULT_POINTER_OBS_007_AMENDMENT_02_LATER_FAILURE_RESULT_AND_CROSS_LEASE_INTERVAL.md`.
The Tern inbox marker is `TERN-OBS-007-AMENDMENT-02-1726Z-SECOND-STATUS-REVERSAL-AND-MATCHED-FAILURE-RESULT`.

## 4. Preservation

No task, ID, prompt, schedule, phase, cadence, enabled state, ownership or automation count was changed. The four enabled leases remain :00/:24/:36/:48; :12 remains disabled. No sixth task, signet or conversation rename.
