# Amendment 01 | Same-run-ID start-field rewrite

**Applies to:** `2026-11-12T1400Z_H782_S0_MERIDIAN_RUN_APPEARANCE_AFTER_KSTREL_PRE_NOMINAL_HANDOFF_OBS_003.md`.

A later exact-ID readback at approximately 2026-11-12T14:28Z returned the **same** run ID already recorded in Observation 003, but with a different `started_at` value:

- Original observed `started_at`: `2026-11-12T14:00:12.938875Z`.
- Later observed `started_at`: `2026-11-12T14:28:20.660438Z`.
- Difference: 28 minutes, 7.721563 seconds.
- Run ID remained `6924b792-8e24-8332-b78f-79fa1e24635a`.
- Latest observed status: `IN_PROGRESS`.
- `completed_at`: null.
- Run-level `chat_ref`: null.

The :00 task-level `last_run_time` remained `2026-11-12T13:38:12.979689Z`, and its cached `latest_result` still referred to the preceding Kestrel-labelled run. This is a run-object field mutation plus task-level cache lag, not evidence of a retry, restart, duplicate process, worker substitution, or backend cause. No attempt-history identifier was exposed.

No task configuration, ID, prompt, schedule, phase, cadence, or enabled state was changed.
