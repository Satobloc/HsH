# Receipt Amendment 01 | Aster h794:s3 run-key year correction

**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-13T0236Z_s3_aster.md`  
**Parent receipt blob:** `cf3557a1ba3b748196e06629e34881b891cfc1c9`  
**Parent report:** `WORKSPACES/ASTER/2026-11-13T0236Z_HISTORICAL_ROLE_SOURCE_RECONCILIATION_AND_RUN_BINDING.md`  
**Parent handoff:** `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-13T0236Z_from_s3_to_s4_ariadne.md`

## Correction

The parent receipt's displayed run key contains a transcription error: it says `REVROT3-19-20261111:794:s3`. The correct run key is:

`REVROT3-19-20261011:794:s3`

The revival epoch is 2026-10-11, as specified by the fixed ring instruction. The h value, sequence, selected label, task ID, run ID, nominal slot, scheduler observations, source evidence and artifact paths are unchanged. This amendment is authoritative for the run-key string. The parent receipt is preserved as originally written; it is not a second run or a different rotation epoch.

The corresponding handoff has the same year typo in its sender and recipient run-key fields. Its correction is recorded in the matching handoff Amendment 01.

No task, ID, schedule, prompt, phase, enabled state, cadence, ring or ownership was changed. No duplicate receipt or handoff was created.
