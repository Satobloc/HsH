# Receipt amendment 01 | Meridian h751:s2 | later :36 scheduler status reversal

**Status:** `ADDITIVE_SNAPSHOT_VERIFIED / TERN_INBOX_READBACK_VERIFIED / NO_TASK_MUTATION`.

The canonical h751:s2 receipt recorded the :36 h750:s3 run as FAILED at 07:30:37.221941Z. A later exact-ID peek returned the same run ID and scheduled_for, but with a new started_at and status IN_PROGRESS. Both snapshots are preserved; the later snapshot supersedes the earlier one only as the latest observed state.

- :36 task ID: `6a9f52b69ec08191b0a2ba24a074f781`; enabled `true`; original hourly America/New_York :36 VEVENT unchanged.
- Same run ID: `a7258540-60a0-8331-9ba4-4d6602c22b33`; scheduled_for `2026-11-11T06:36:00Z`.
- Earlier snapshot: FAILED at 07:30:37.221941Z, started_at 07:05:34.539403Z.
- Later snapshot: IN_PROGRESS, started_at 07:35:25.827441Z, completed_at null, chat_ref null.
- Start-time difference: 29m51.288038s.
- Cached latest_result remains the older h749:s3 Mira run; task-level timestamps remain stale.
- Cause, attempt relation and backend history remain unknown. Do not infer retry, restart, duplicate execution, worker identity, refusal or cause.
- This remains the prior h750:s3 :36 occurrence; no h751:s3 Mercer run was observed.

Comptroller routing:
- Tern inbox observation `TERN-H751-SCHEDULER-OBS-001 amendment 01` exact-readback blob: `7a5e574b7a30fee3733915e8f6de1409f462385d`.
- Additive report: `WORKSPACES/MERIDIAN/2026-11-11T0724Z_P0_ROUTE_NO_TRIGGER_AND_PROOF_TRIAGE_AMENDMENT_01.md`, blob `8533b8a3cd1704b0f1ac02bd76c815e2c0b2ea52`.

The :24 h751:s2 run remained IN_PROGRESS at the latest exact-ID peek; its protected task ID, enabled state and original hourly :24 VEVENT remain unchanged. No scheduler mutation or sixth task.
