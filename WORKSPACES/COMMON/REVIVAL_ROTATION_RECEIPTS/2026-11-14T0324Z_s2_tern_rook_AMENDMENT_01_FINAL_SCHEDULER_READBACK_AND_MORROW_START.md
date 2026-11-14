# Amendment 01 | Final scheduler readback and Morrow start

**Observed:** 2026-11-14T03:36:47Z  
**Applies to:** `REVROT3-19-20261011:819:s2` canonical Tern receipt

## Final readback

- The :24 Tern run remains `0729fbe1-8dc8-832e-8305-a596e44ef9c7`, IN_PROGRESS, with null completion and null run-level `chat_ref`. Its start remains 03:20:22.333429Z. The cached latest_result still points to the prior Calder h818:s2 run; task-level last_run_time and next_run_time remain stale.
- The :36 task now surfaces h819:s3, selected Morrow, run ID `28c07207-de30-8322-adf2-03c704bbcfd7`, scheduled 03:36:00Z, started 03:36:17.745381Z, IN_PROGRESS, completion null, run-level `chat_ref=null`.
- The :36 task's cached latest_result still points to prior Hale h818:s3 run `1863d0c5-d9f4-832b-8902-4899c1f39c71`; task-level last_run_time and next_run_time have not advanced to the current Morrow run.

## Handoff timing

- Optional Morrow handoff commit: `d139d7a75c5254dbc76f470f54994d7142940661`, created 03:31:22Z.
- Morrow inbox pointer commit: `d46aba6e6026f0fd934661b00ef5177c644b92cc`, created 03:31:26Z.
- Morrow h819:s3 recorded start: 03:36:17.745381Z.

The handoff and inbox pointer therefore preceded the surfaced Morrow start by 4m55.745381s and 4m51.745381s respectively. This verifies repository availability before the run record's start, not consumption, acknowledgment, direct thread delivery, or worker authentication.

No task ID, enabled state, saved schedule, phase, cadence, or task count changed. The Tern :24 run remains in progress at this readback.
