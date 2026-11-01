# Amendment 02 | Correct :00 successor timing

**Parent report:** WORKSPACES/MERIDIAN/2026-11-01T1548Z_TARGET_SPECIFIC_FACTORIZATION_AND_SOURCE_CUSTODY_AUDIT.md  
**Parent receipt:** WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-01T1548Z_s4_meridian.md  
**Related Amendment 01:** late-handoff readback record

The timing interpretation in Amendment 01 and the original handoff/inbox wording is superseded.

The :00 run observed at 2026-11-01T15:53:34.579672Z was the occurrence scheduled for 15:00Z, so its nominal hour was h=519 and slot s0:

- seq = 5(519)+0 = 2595
- 2595 mod 19 = 11
- selected identity = Enheduanna (index 11), next = Tern Rook (index 12)
- run ID = 21c99bc6-d894-8322-a24f-515316e62c34
- completed = 2026-11-01T16:03:13.250726Z
- chat_ref = 6add71e6-4d24-83ea-a0b3-822f0cddbbd6 (Enheduanna run, not Mercer)

The intended successor to Meridian :48 is the next nominal hour h=520, slot s0:

- seq = 5(520)+0 = 2600
- 2600 mod 19 = 16
- selected identity = Mercer (index 16), next = Ravel (index 17)
- expected run key = REVROT3-19-20261011:520:s0

At final scheduler readback, no h=520/s0 Mercer run was visible and next_run_time was null. The handoff and inbox commits were created at 16:02:40Z and 16:02:51Z, after the nominal 16:00Z schedule time but before any observed h=520/s0 start.

Correct status: **POST_NOMINAL_SCHEDULED_TIME / ACTUAL_MERCER_START_UNOBSERVED / REPOSITORY_ONLY**. It is not established that the handoff was late for the Mercer run, and no consumption or acknowledgment is claimed. The 15:53Z Enheduanna run is not the Mercer successor.

No task, ID, schedule, phase or enabled state was changed.
