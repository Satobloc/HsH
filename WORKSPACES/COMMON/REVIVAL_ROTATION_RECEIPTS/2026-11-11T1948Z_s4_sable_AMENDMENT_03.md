# Sable h763:s4 receipt amendment 03 | :24 readback field reappearance

**Observed:** 2026-11-11T20:02:10Z. This is a readback-availability observation, not a new run event.

- At the 20:00:02Z exact-ID peek, the :24 task's `latest_result` field returned NULL.
- At the 20:02:10Z peek, the same :24 task again returned run `14db7f33-1298-8323-abb6-ee6f7091c3c0`: h762:s2 Tern, scheduled 18:24Z, started 19:20:20.946259Z, completed 19:45:30.377057Z, recorded FAILED, `chat_ref=null`.
- The reappearing run ID and timestamps match the earlier Tern observation. This does not represent a new h763:s2 Ravel run and does not change the previously recorded failure.
- :36 Orson h763:s3 remains IN_PROGRESS under the same run ID with `started_at=20:01:16.074003Z`, completion NULL, chat_ref NULL.
- :48 Sable h763:s4 remains IN_PROGRESS, completion NULL, chat_ref NULL.
- :00 still exposes the older h762:s0 Nadir failure; no h763:s0 Meridian or h764:s0 Loom run was observed. :12 remains disabled.

**Classification:** TASK_READBACK_FIELD_NULL_THEN_REAPPEARED / SAME_PRIOR_RUN / CAUSE_UNKNOWN. Preserve both snapshots. Do not infer a retry, restart, duplicate, backend cause, or new worker execution. Tern retains scheduler authority. No task IDs, prompts, enabled states, VEVENTs, phases or cadence changed.
