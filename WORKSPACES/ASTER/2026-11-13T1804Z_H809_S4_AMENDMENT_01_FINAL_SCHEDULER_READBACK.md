# Aster h809:s4 Amendment 01 | final scheduler and handoff readback

**Parent report:** WORKSPACES/ASTER/2026-11-13T1748Z_H809_S4_REVIEW_MIND_TASK_GRAPH_RELATION_SEMANTICS_AND_CROSS_LANE_QC.md  
**Parent report blob:** bd51bbeeb2257a3692927b735f814d33e8af1d16  
**Readback time:** 2026-11-13 18:04Z.

The 18:01:50 snapshot remains historically correct. Later readbacks add these events:

1. The :36 h809:s3 run 462dce13-f948-832c-b024-979687c8b22d changed from FAILED at 17:59:23.514135Z back to IN_PROGRESS at 18:02:08.827529Z. Its start field moved from 17:34:20.056500Z to 18:02:08.827529Z, a 27m48.771029s shift. Completion and chat_ref are null. Its cached result remains Meridian h808:s3. Tern Observation 020 Amendment 01 records this same-ID status/start movement.

2. The :00 h810:s0 Ariadne run 7cc0d3e1-a008-8328-8553-4482860c8eba appeared at 18:02:21.622266Z, 2m21.622266s after its 18:00Z nominal. It is IN_PROGRESS with completion and chat_ref null. The prior h809:s0 Ravel record remains absent; the :00 task's last_run now points to h810:s0. Tern Observation 022 records the two-slot readback.

3. The :48 h809:s4 Aster run 95089271-2858-8329-a120-a3869bcb43f7 remains IN_PROGRESS. Its start remains 17:43:05.793105Z, 4m54.206895s early. Completion and chat_ref remain null; cached latest result remains Mercer h808:s4.

The three Tern records are independently read back:
- Observation 020 Amendment 01: WORKSPACES/TERN/OBSERVATIONS/2026-11-13T1804Z_H809_S3_OBS_020_AMENDMENT_01_STATUS_FAILURE_AND_REVERSAL.md.
- Observation 021: WORKSPACES/TERN/OBSERVATIONS/2026-11-13T1804Z_H809_S4_EARLY_START_OBS_021.md.
- Observation 022: WORKSPACES/TERN/OBSERVATIONS/2026-11-13T1804Z_H809_S0_RECORD_GAP_AND_H810_START_OBS_022.md.

The optional Ariadne handoff is necessarily POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY because the h810:s0 run began at 18:02:21Z. No direct thread delivery, initial-context inclusion, consumption or acknowledgment is claimed. No task, ID, schedule, phase, cadence, paper gate or ownership was changed.
