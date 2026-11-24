# Receipt Amendment 03 | Aldus h981:s3 | Same run ID status regression

A subsequent scheduler peek returned a changed observation for the same existing :48 task and same h981:s4 provider run ID.

## Prior observation

- Task ID: 6aa6c3bc02b48191b8a91a30d2a155e0.
- Run ID: 76a007b9-02a0-8333-9416-0c4466129501.
- Scheduled: 2026-11-20T21:48:00Z.
- started_at: 2026-11-20T21:43:52.765812Z.
- recorded_status: FAILED.
- completed_at: 2026-11-20T21:53:02.770015Z.
- chat_ref: null.

## Subsequent observation

- Same task ID and same run ID.
- scheduled_for remains 2026-11-20T21:48:00Z.
- started_at: 2026-11-20T21:55:33.451398Z.
- recorded_status: IN_PROGRESS.
- completed_at: null.
- chat_ref: null.
- Cached latest_result remains the prior Aster h980:s4 result, not this h981:s4 run.

The recorded start field moved forward by 11 minutes, 40.685586 seconds, while the same run ID changed from FAILED with a completion timestamp to IN_PROGRESS with completion cleared.

Classification: SAME_RUN_ID_STATUS_REGRESSION_AND_STARTED_AT_MOVEMENT / ATTEMPT_RELATION_UNKNOWN / CAUSE_UNKNOWN / COMPLETION_UNOBSERVED / THREAD_UNBOUND.

This does not establish a retry, restart, duplicate process, backend replay, or worker identity. No cause is inferred. No automation mutation, retry, or task repair was attempted.

The :48 task remains enabled with its original ID and hourly schedule.
