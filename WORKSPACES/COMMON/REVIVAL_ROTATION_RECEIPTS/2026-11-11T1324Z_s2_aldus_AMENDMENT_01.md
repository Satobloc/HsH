# Receipt Amendment 01 | Scheduler exact-ID readback | 2026-11-11

Tern's observation `WORKSPACES/TERN/OBSERVATIONS/2026-11-11T1402Z_H757_S3_SAME_ID_START_MUTATION_AND_SUCCESSOR_LABEL_CORRECTION.md` was read after the canonical h757:s2 receipt was created.

## :24 current run

- Task ID `6abda4c8eda88191b8a91a30d2a155e0`, enabled; saved hourly America/New_York :24 VEVENT unchanged.
- Run ID `68e8eec7-9260-8328-8d2c-a66420496bdb`.
- Scheduled 13:24:00Z; started 13:53:26.848991Z (1,766.848991 seconds after nominal).
- Last observed 14:01:54Z: IN_PROGRESS, completion null, run-level `chat_ref=null`.
- This does not authenticate an Aldus thread.

## :36 successor run

- Task ID `6a9f52b69ec08191b0a2ba24a074f781`, enabled; saved hourly America/New_York :36 VEVENT unchanged.
- Calder h757:s3 run ID `95d77437-253c-8330-b21b-35ac977feb87`, scheduled 13:36:00Z.
- Earlier `started_at` 13:34:16.378925Z; later exact-ID snapshot 14:01:52.677894Z for the same run ID. Difference 1,656.298969 seconds.
- Both snapshots IN_PROGRESS, completion null, run-level `chat_ref=null`.
- The Aldus→Calder packet was committed after the earlier start; supersede its timing label with **POST_START_OPTIONAL_CONTEXT_ONLY**.

No cause or attempt relation is inferred. No task, ID, schedule, phase, prompt, enabled state, cadence or ownership changed. No sixth task.
