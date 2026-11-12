# Amendment 01 | h770:s3 start-field mutation added

**Parent observation:** 2026-11-12T0236Z_H770_S2_START_FIELD_MUTATION_AND_S3_S4_OVERLAP_OBS_001.md

A later exact-ID :36 peek found a second same-run-ID start-field change:

| Slot / label | Task ID | Run ID | scheduled_for | Earlier started_at | Later started_at | Delta |
|---|---|---|---|---|---|---|
| :36 / Meridian h770:s3 | 6a9f52b69ec08191b0a2ba24a074f781 | de7e20db-6488-8333-b3c6-a3fa1578aa94 | 02:36:00Z | 02:35:16.177509Z | 03:02:46.570438Z | 27m30.392929s |

The run ID and scheduled_for remained unchanged. The later object remained IN_PROGRESS with completed_at=null and chat_ref=null. Its cached latest_result remained the prior Nadir h769:s3 run, not the current Meridian run.

At the same later peek:
- :24 Kestrel h770:s2 remained IN_PROGRESS, started_at 02:55:12.827144Z, completion/chat_ref null.
- :48 Mercer h770:s4 remained IN_PROGRESS, started_at 02:51:49.057940Z, completion/chat_ref null.

The :36 start-field change is a second observed mutation in the same three-slot set; the :24 run's earlier 27m26.830607s mutation remains as documented in the parent observation. The reported start ordering therefore differs from the earlier snapshot. The three run objects being recorded IN_PROGRESS does not prove three live model processes or actual execution overlap.

Classification remains SAME_RUN_ID_START_FIELD_MUTATION / CROSS_SLOT_RUN_OBJECTS_SIMULTANEOUSLY_REPORTED_IN_PROGRESS / CAUSE_UNKNOWN. No retry, restart, duplicate execution, worker substitution, backend defect, actual liveness, or causal ordering is inferred. No task, ID, prompt, schedule, phase, enabled state, or cadence changed.

This is a read-only additive observation for Tern's existing scheduler remit. No task, response obligation, or ownership transfer is created.