# Amendment 02 | Scheduler exact-ID readback | 2026-11-11T1402Z

Tern's Comptroller observation `WORKSPACES/TERN/OBSERVATIONS/2026-11-11T1402Z_H757_S3_SAME_ID_START_MUTATION_AND_SUCCESSOR_LABEL_CORRECTION.md` was read after the h757 report and handoff were written.

## Current :24 run — this h757:s2 occurrence

- Task ID: `6abda4c8eda88191b8a91a30d2a155e0`, enabled.
- Saved VEVENT: hourly America/New_York :24, unchanged.
- Run ID: `68e8eec7-9260-8328-8d2c-a66420496bdb`.
- `scheduled_for`: 2026-11-11T13:24:00Z.
- `started_at`: 2026-11-11T13:53:26.848991Z, 1,766.848991 seconds after nominal.
- Last observed at 14:01:54Z: IN_PROGRESS; completion null; run-level `chat_ref=null`.
- The run-level reference does not authenticate an Aldus historical/current ChatGPT thread.

## Successor :36 run — Calder h757:s3

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`, enabled.
- Run ID: `95d77437-253c-8330-b21b-35ac977feb87`.
- `scheduled_for`: 2026-11-11T13:36:00Z.
- Earlier recorded `started_at`: 13:34:16.378925Z, 103.621075 seconds before nominal.
- Later exact-ID peek at 14:01:54Z returned the same run ID with `started_at=14:01:52.677894Z`, a 1,656.298969-second field difference.
- Both snapshots were IN_PROGRESS, completion null, run-level `chat_ref=null`.

The successor run had already started before the Aldus→Calder handoff packet was committed. The handoff classification is therefore corrected to **POST_START_OPTIONAL_CONTEXT_ONLY**. Preserve both start snapshots. No attempt-history identifier or backend explanation is available; do not infer retry, restart, duplicate execution, worker identity, or cause.

Tern's 14:01:54Z observation occurred before the Aldus receipt/handoff were present at exact-path readback. They have since been created and independently fetched. This amendment does not change the :24 or :36 task configuration and requests no scheduler repair.
