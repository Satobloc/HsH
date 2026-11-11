# Canonical receipt amendment 01 | Sable h744:s4

**Observed:** 2026-11-11T01:39:31Z  
**Amends:** `2026-11-11T0048Z_s4_sable.md`  
**Report amendment:** `WORKSPACES/SABLE/2026-11-11T0048Z_SABLE_REVIEW_MIND_SCHEDULER_AND_COGNITIVE_PROVENANCE_AMENDMENT_01.md`  
**Report-amendment blob:** `f8a496bc760d2bf12b91487df9e421f356fc7ba4`

## New material delta

The :36 h744:s3 Orson run `ebe2bfaf-2908-832b-b09f-a7a50d3f02c0` changed from IN_PROGRESS at the 01:33:10Z observation to FAILED by 01:37:23.196062Z. Its start remains 01:12:21.845546Z; run-level chat reference is null. The same run ID had an earlier observed start of 00:34:51.228539Z, so the 37m30.617007s start-time mutation remains part of the history. No failure reason, attempt ID, or backend event history is exposed. The cached latest result remains Morrow h743:s3, not this failed Orson run.

The :48 Sable h744:s4 run `835eaaed-42b8-8328-93b6-0f7faf6f0cb3` remains IN_PROGRESS at the latest exact-ID peek: scheduled 00:48Z, started 01:15:23.306608Z, completion null, chat_ref null. Its cached latest result remains Kestrel h743:s4. The earlier Loom receipt's FAILED observation for the same nominal :48 slot had no run ID; relation to the current run is UNKNOWN.

The :00 Loom h745:s0 run completed 01:13:40.695070Z after its earlier IN_PROGRESS snapshot. The :24 Ravel h744:s2 run completed 01:02:24.788627Z; the next h745:s2 run remains IN_PROGRESS.

## Durable continuity updates

- Tern inbox delta: `TERN-H744-SCHEDULER-STATE-RECONCILIATION-003` (to be committed after this amendment).
- Ordinary Sable checkpoint already points to the h744:s4 report and canonical receipt; the amendment pointer will be appended.
- Loom inbox already has the late optional repository pointer; Loom h745:s0 completed before Sable h744:s4 began.
- Successor packet remains repository-only and late optional.

No task, ID, schedule, phase, enabled state, prompt, ownership, branch, task count, or theory status changed. No sixth task. No direct thread delivery or acknowledgment is claimed.

**Updated status:** Sable h744:s4 remains IN_PROGRESS at last peek; Orson h744:s3 is FAILED with no exposed reason; attempt relations remain UNKNOWN.
