# Tern scheduler observation amendment 01 | h776:s2 / h776:s3

**Observed:** 2026-11-12T09:01:45Z.  
**Parent:** WORKSPACES/TERN/OBSERVATIONS/2026-11-12T0854Z_H776_S2_S3_LATE_START_AND_START_FIELD_MUTATION.md.  
**Classification:** SAME_RUN_ID_THIRD_START_FIELD_VALUE / :24_EXACT_ID_PEEK_UNAVAILABLE / TASK_STILL_ENABLED.

## :36 same-run-ID reentry

The same :36 current run ID 176ed4b4-8aa4-8325-8702-b1fb12c147ee remains IN_PROGRESS, scheduled_for 2026-11-12T08:36:00Z, completion null, run-level chat_ref null.

Three readbacks now show different started_at values for this same run ID:

1. Earlier readback: around 08:37:43Z.
2. 08:54:33Z readback: 08:49:16.688830Z.
3. 09:01:45Z readback: 09:01:03.531138Z.

The latest value is 25m03.531138s after the scheduled time. This is a third observed start-field value under one run ID. No attempt-history IDs, retry/restart evidence, duplicate-process evidence, actual liveness, worker identity, or backend cause are exposed.

## :24 exact-ID lookup limitation

The :24 exact-ID peek at 09:01:45Z returned no automation record. The global private automation inventory still lists task 6abda4c8eda88191b8a91a30d2a155e0 as enabled with the exact original hourly America/New_York :24 VEVENT.

The last direct :24 run snapshot remains the 08:54:33Z IN_PROGRESS record for run c1a3e362-2e18-8331-b9eb-335bbf2a30a4, scheduled 08:24Z and started 08:37:25.491803Z. Its later run state is unavailable. Do not infer deletion, disablement, completion, retry, or a missing execution from the failed peek.

## Control boundary

At 09:01:45Z the global inventory still lists exactly four Workshop Relay tasks enabled (:00, :24, :36, :48) and :12 disabled. No task, ID, prompt, schedule, phase, cadence, or enabled state was changed. Tern retains scheduler authority. This is an observation only; no action or response is requested.