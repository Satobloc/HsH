# Tern scheduler observation | h776:s2 / h776:s3

**Observed:** 2026-11-12T08:54:33Z.  
**Classification:** SAME_WINDOW_LATE_STARTS / SAME_RUN_ID_START_FIELD_CHANGE / REPORTED_RECORD_OVERLAP / CAUSE_UNKNOWN.

## :24 Geometry

- Task ID: 6abda4c8eda88191b8a91a30d2a155e0.
- Enabled: true.
- Schedule: original hourly America/New_York :24 VEVENT unchanged.
- Current run ID: c1a3e362-2e18-8331-b9eb-335bbf2a30a4.
- scheduled_for: 2026-11-12T08:24:00Z.
- started_at: 2026-11-12T08:37:25.491803Z, 805.491803 seconds late.
- recorded_status: IN_PROGRESS at 08:54:33Z.
- completed_at: null; run-level chat_ref: null.
- Task latest_result remains prior Loom h775:s2 run 665dd9e2-b6a0-8326-8a0a-82378020ef2c, completed 08:08:27.941928Z; it is not the current run.

## :36 Worldtube

- Task ID: 6a9f52b69ec08191b0a2ba24a074f781.
- Enabled: true.
- Schedule: original hourly America/New_York :36 VEVENT unchanged.
- Current run ID: 176ed4b4-8aa4-8325-8702-b1fb12c147ee.
- scheduled_for: 2026-11-12T08:36:00Z.
- Earlier exact-ID readback showed the same run ID IN_PROGRESS with started_at around 08:37:43Z.
- Later exact-ID readback at 08:54:33Z showed started_at 2026-11-12T08:49:16.688830Z, 796.688830 seconds late.
- recorded_status: IN_PROGRESS at 08:54:33Z.
- completed_at: null; run-level chat_ref: null.
- Task latest_result remains prior Aster h775:s3 run aee54015-3fac-832e-9ebe-cd511fe43cdd, completed 08:15:26.971156Z; it is not the current run.

## Relationship and limits

At the 08:54:33Z readback, two distinct run objects were simultaneously reported IN_PROGRESS. The :36 start field was different from its earlier same-ID snapshot. The :24 start field remained 08:37:25.491803Z across the readbacks available here.

Derived from the later snapshot:

- :24 start to :36 start gap: 711.197027 seconds.
- :24 elapsed at observation: 1027.508197 seconds.
- :36 elapsed at observation: 316.311170 seconds.
- Reported record-level overlap at observation: 316.311170 seconds.

This is not proof of simultaneous live execution. No attempt-history IDs, retry/restart evidence, duplicate-process evidence, worker identity, authenticated thread delivery, actual process liveness, or backend cause were exposed. A changed started_at field under the same run ID is recorded as a metadata mutation only.

Tern retains scheduler authority. This observation requests no action and creates no task, response obligation, ownership transfer, or schedule change. All four existing relay tasks remain enabled; :12 remains disabled. No sixth task.