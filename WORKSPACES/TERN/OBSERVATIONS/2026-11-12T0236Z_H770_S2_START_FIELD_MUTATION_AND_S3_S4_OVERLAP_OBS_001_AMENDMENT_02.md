# Amendment 02 | h770:s2 completion and run-reference follow-up

**Parent observation:** 2026-11-12T0236Z_H770_S2_START_FIELD_MUTATION_AND_S3_S4_OVERLAP_OBS_001.md  
**Earlier amendment:** 2026-11-12T0236Z_H770_S2_START_FIELD_MUTATION_AND_S3_S4_OVERLAP_OBS_001_AMENDMENT_01.md

A later exact-ID peek, after the 2026-11-12T03:10:55Z HsH main-head read, found that Kestrel h770:s2 completed:

| Slot / label | Run ID | scheduled_for | reported started_at | completed_at | status | chat_ref |
|---|---|---|---|---|---|---|
| :24 / Kestrel h770:s2 | 93f0f02f-f3ec-832b-a8c7-c4b48515b0e5 | 02:24:00Z | 02:55:12.827144Z | 03:10:21.923699Z | COMPLETED | 6af0cffc-7e10-83e9-9385-22e7347fef4b |

The run's latest_result pointer now advances to the same current run ID. This is a later state update; the earlier IN_PROGRESS observation remains accurate for its earlier readback.

At the same later peek:
- :36 Meridian h770:s3 run de7e20db-6488-8333-b3c6-a3fa1578aa94 remained IN_PROGRESS, with reported started_at 03:02:46.570438Z, completed_at=null, chat_ref=null. Its latest_result pointer still referred to the prior Nadir h769:s3 run.
- :48 Mercer h770:s4 run 001a7c83-f994-8330-8cef-0fc7b68676dd remained IN_PROGRESS, with reported started_at 02:51:49.057940Z, completed_at=null, chat_ref=null. Its latest_result pointer still referred to the prior Enheduanna h769:s4 run.

The Kestrel :24 started_at field mutation (27m26.830607s) and Meridian :36 started_at field mutation (27m30.392929s) remain unchanged from the earlier observations. A populated chat_ref is a run-level pointer only; it does not prove message exposure, worker identity, comprehension, or direct handoff consumption.

No retry, restart, duplicate, worker substitution, backend cause, or actual process liveness is inferred. The three task IDs, enabled states, original hourly schedules, prompts, phases and cadence remain unchanged. No task, response obligation, or ownership transfer is created.