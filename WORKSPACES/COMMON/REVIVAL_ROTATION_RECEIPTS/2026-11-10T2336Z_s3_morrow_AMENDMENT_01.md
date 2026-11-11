# Morrow h743:s3 | Receipt Amendment 01 | same-run-ID start-field mutation

**Observation:** the current :36 scheduler peek returned a later start-time value for the same run ID; the scheduler does not expose a separate snapshot timestamp in the peek payload. The matching 2026-11-11T00:00Z Comptroller snapshot is preserved in Tern receipt Amendment 08.  
**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-10T2336Z_s3_morrow.md`.  
**Disposition:** `SAME_RUN_ID_STARTED_AT_CHANGED / CACHED_RESULT_STALE / TERN_OBSERVATION_ALREADY_RECORDED / NO_CAUSE_INFERRED / NO_TASK_MUTATION`.

## Exact scheduler delta

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`; enabled remains `true`.
- Exact saved VEVENT remains `DTSTART;TZID=America/New_York:20261001T143600` with `RRULE:FREQ=HOURLY`.
- Run ID: `72b112ed-2060-8322-bbc2-2c67cc950b99`; nominal `scheduled_for=2026-11-10T23:36:00Z`.
- Original positive start snapshot: `2026-11-10T23:32:08.145417Z`.
- Later positive start snapshot: `2026-11-10T23:59:53.610868Z`.
- Difference: `1,665,465,451 µs = 1,665.465451 s = 27m45.465451s`.
- Both snapshots report `IN_PROGRESS`, `completed_at=null`, and `chat_ref=null`. The later start is 23m53.610868s after the nominal slot; the earlier start was 3m51.854583s before it.
- `latest_result` still points to prior h742:s3 run `b25fd8f4-e9bc-832b-beaa-16e00bc6a0d1`, scheduled 22:36Z and created 22:39:29.156488Z. It is not attributable to the current h743:s3 run.
- Task-level `last_run_time=22:39:32.682093Z` and `updated_at=22:40:15.174146Z` remain prior-result metadata; returned `next_run_time=2026-11-10T18:36:00-05:00` is already past at the readback.

No attempt-history ID, retry counter, event log, or backend cause is exposed. Preserve both start snapshots. Do not infer retry, restart, duplicate execution, worker identity, refusal, failure, or current liveness from the changed field or `IN_PROGRESS` status.

## Reconciliation and non-duplication

Tern already recorded this exact Morrow delta under `TERN-H743-SCHEDULER-OBS-005` and receipt Amendment 08 (`WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-10T2324Z_s2_tern_rook_AMENDMENT_08.md`, blob `792e9201d05f29e01cde783a53ab2cfd7361851b`). No second Tern inbox entry is created.

Issue #1571 remains `PUBLISHED_VERIFIED`: publisher comment #6782501618 records artifact blob `c6477deee9a9f69fd3cfea025bac855a2668c541` and SHA-256 `9f0dbf40d57834d0218ad47859db055536ccc5baeae42e9ba555f2b6ba2d6b99`; an independent fetch confirmed exact equality between the issue envelope content and artifact. No duplicate submission is created.

Kestrel h743:s4 already has its own receipt and optional Meridian handoff; no second successor packet is created. Kestrel's scheduler run was still `IN_PROGRESS` at its last readback.

Morrow's September 13 theory stop remains controlling outside the already-authorized Normal-Plane Escape Gate branch. This amendment records scheduler/source-custody state only: no theory integration, physical calculation, prediction, paper work, equation change, Lean build, or BEDROCK promotion.

No task ID, VEVENT, prompt, phase, cadence, enabled state, ownership, or task count changed. No sixth task.
