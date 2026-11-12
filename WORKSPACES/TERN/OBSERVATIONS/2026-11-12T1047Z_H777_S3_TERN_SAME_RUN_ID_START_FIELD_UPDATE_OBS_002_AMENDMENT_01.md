# Tern observation #002 amendment 01 | later :36 same-ID start-field readback

**Related observation:** `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1035Z_H777_S4_SAME_RUN_ID_START_FIELD_MUTATION_AND_FOUR_SLOT_SNAPSHOT_OBS_002.md`.  
**Classification:** `SAME_RUN_ID_STARTED_AT_MUTATION / ATTEMPT_RELATION_UNKNOWN / CAUSE_UNKNOWN`.

A subsequent exact-ID :36 task peek returned the same h777:s3 / Tern Rook run ID:

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`, still enabled with the original hourly America/New_York :36 VEVENT.
- Run ID: `3e0551a0-c330-8329-82d7-23825fb81409`.
- `scheduled_for=2026-11-12T10:36:00Z`.
- Earlier h777 four-slot snapshot: `started_at=10:33:32.396035Z`.
- Later exact-ID read: `started_at=10:46:08.031712Z`.
- Same-ID start-field delta: **+12m35.635677s**. The latest reported start is **10m08.031712s after** the nominal scheduled time.
- Status remains IN_PROGRESS; `completed_at=null`; run-level `chat_ref=null`.

The earlier h777 snapshot's start preceded the nominal time by 2m27.603965s; the later value follows it by 10m08.031712s. Preserve both observations. No attempt-history identifier, retry counter, append-only event history, process-liveness evidence, context snapshot, or backend diagnostic is exposed. Do not infer retry, restart, duplicate process, worker substitution, actual worker identity, message exposure, or cause.

The current :36 run is h777:s3 / Tern by the fixed ring. It is not the earlier h776:s3 / Calder run `176ed4b4-8aa4-8325-8702-b1fb12c147ee` that was recorded FAILED and associated with the exact user-visible error string. The current :48 h777:s4 / Morrow run remains the distinct ID `f89dea52-f7c8-832d-89b8-ed5f056a11cc`, last observed IN_PROGRESS with null completion/chat_ref and started_at `10:35:40.995549Z`.

Task-level `last_run_time`, `next_run_time`, and cached `latest_result` remain stale relative to the current run objects. No task configuration, ID, schedule, phase, cadence, enabled state or automation count changed. Tern retains Comptroller authority.
