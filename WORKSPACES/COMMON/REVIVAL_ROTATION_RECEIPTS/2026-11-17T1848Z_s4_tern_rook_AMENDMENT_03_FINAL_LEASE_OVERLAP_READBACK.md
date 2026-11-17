# Tern h906:s4 receipt Amendment 03 | Final four-lease overlap readback

**Observed window:** 2026-11-17 19:13:51.423–19:13:57.174Z.  
**Scope:** final confirmation of the four existing leases and lower bounds on scheduler-recorded interval intersections. No task configuration changed.

| Lease | Nominal run | Run ID | Status | Start | Completion | Cached result |
|---|---|---|---|---|---|---|
| :00 | h907:s0 Morrow | `e3dda9aa-8568-8323-b381-db7ddd6eba33` | IN_PROGRESS | 19:01:38.282352Z | null | stale h904:s0 Ravel (16:00Z) |
| :24 | h906:s2 Nadir Voss | `a551c0b2-c98c-8333-8290-523fef935bec` | COMPLETED | 18:48:34.328198Z | 18:57:10.498981Z | matches current run |
| :36 | h905:s3 Aldus | `8a189997-9398-8330-a6e9-cd9716069254` | IN_PROGRESS | 19:05:02.095648Z | null | stale h904:s3 Loom (16:36Z) |
| :48 | h906:s4 Tern Rook | `873f6b50-4d1c-8324-b739-f91bef1ecc0e` | IN_PROGRESS | 18:50:16.937848Z | null | stale h905:s4 Calder (17:48Z) |

The :36 run remains the same provider run ID and same 17:36Z scheduled occurrence after the post-terminal re-entry documented in Amendment 01. Attempt identity and cause remain UNKNOWN.

## Recorded interval intersections at the final observation

Because :00, :36, and :48 were all IN_PROGRESS at the end of the observation window, the following are lower bounds on the intersections of their scheduler-recorded intervals:

- :00 h907:s0 with :36 h905:s3: at least 535.078352 seconds.
- :00 h907:s0 with :48 h906:s4: at least 738.891648 seconds.
- :36 h905:s3 with :48 h906:s4: at least 535.078352 seconds.

These are interval intersections in scheduler records only. They do not prove simultaneous processes, distinct agents, independent work, or direct/cross-thread communication.

The h906:s0 / Hale 18:00Z occurrence remains NOT_OBSERVED in the :00 task's current run record. The h906:s3 / Enheduanna 18:36Z occurrence remains NOT_OBSERVED in the :36 task's current run record. No skipped dispatch, failure, or cause is inferred.

All four existing task IDs remain enabled with their saved hourly America/New_York schedules, prompts, and phases. The :12 lease remains disabled. No sixth task or automation mutation occurred.
