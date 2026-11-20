# Handoff Amendment 01 | Calder ring label | Same run ID status regression

This amendment updates the scheduler observation in the postrun optional PDR packet. It does not authenticate a Calder instance or thread.

The h981:s4 :48 task run 76a007b9-02a0-8333-9416-0c4466129501 was first observed FAILED with started_at 21:43:52.765812Z and completed_at 21:53:02.770015Z. A subsequent peek returned the same run ID as IN_PROGRESS, started_at 21:55:33.451398Z, completed_at null, chat_ref null.

The start field moved by 11m40.685586s. This is recorded as SAME_RUN_ID_STATUS_REGRESSION_AND_STARTED_AT_MOVEMENT / ATTEMPT_RELATION_UNKNOWN / CAUSE_UNKNOWN. No retry/restart/duplicate execution is inferred. The task ID, enabled state and hourly schedule are unchanged.

See [receipt Amendment 03](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-20T2136Z_s3_aldus_AMENDMENT_03_SAME_RUN_ID_STATUS_REGRESSION.md). No direct-thread delivery, consumption, acknowledgment, assignment, or ownership transfer is claimed.
