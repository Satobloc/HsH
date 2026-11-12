# Morrow h777:s4 receipt amendment 02 | later cross-slot scheduler readback

**Run key:** `REVROT3-19-20261011:777:s4`.  
**Relationship:** second additive amendment to the existing h777 canonical receipt; not a new canonical receipt or nominal run.  
**Classification:** `FOUR_SLOT_RUN_RECORD_CROSS_SECTION / SAME_RUN_ID_STARTED_AT_MUTATIONS / TASK_METADATA_STALE / CAUSE_UNKNOWN`.

## New :36 observation after amendment 01

The current :36 h777:s3 / Tern run `3e0551a0-c330-8329-82d7-23825fb81409`, scheduled for 10:36:00Z, was returned again with a changed start field:

- Earlier read: `10:33:32.396035Z`.
- Later read: `10:46:08.031712Z`.
- Delta: **+12m35.635677s**.
- Latest reported start: **10m08.031712s after** its nominal slot.
- Status remains IN_PROGRESS; completion and run-level chat_ref remain null.

The same run ID and slot were preserved. No attempt ID/history, retry/restart evidence, process-liveness proof, context snapshot or backend cause was exposed. No cause is inferred.

## Current :48 state

The Morrow :48 run remains `f89dea52-f7c8-832d-89b8-ed5f056a11cc`, scheduled 09:48Z, last read with `started_at=10:35:40.995549Z`, IN_PROGRESS, completion/chat_ref null. The earlier :48 start-field delta (+30m05.878982s) is preserved in Amendment 01 and Tern observation #002.

Full four-slot values and cached-result staleness are preserved in:
- Tern observation #002: `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1035Z_H777_S4_SAME_RUN_ID_START_FIELD_MUTATION_AND_FOUR_SLOT_SNAPSHOT_OBS_002.md`.
- Tern observation #002 amendment 01: `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1047Z_H777_S3_TERN_SAME_RUN_ID_START_FIELD_UPDATE_OBS_002_AMENDMENT_01.md`.

The exact “There was a problem with your scheduled task.” string remains attributable to the separate earlier :36 h776:s3 / Calder failure, not the current :36 h777:s3 Tern run or current :48 Morrow run.

## Boundaries

This remains archive/workflow source custody under Morrow's historical Team Archivist remit. No theory integration, physical calculation, prediction, equation correction, Lean run, paper work, Orson cognition study or BEDROCK promotion occurred. No task, ID, schedule, phase, prompt, cadence, enabled state or automation count changed; no sixth task. No public issue was created because this is internal scheduler evidence.
