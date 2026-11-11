# Meridian h751:s2 | Amendment 01 — later :36 same-run-ID status reversal

**Timestamp:** 2026-11-11T07:35Z  
**Classification:** ADDITIVE SCHEDULER OBSERVATION / NO_TASK_MUTATION / CAUSE_UNKNOWN.

This amendment supplements the h751:s2 report. It does not alter the P0 route disposition, Paper A source pin, proof-first triage or current assignment.

## New positive scheduler snapshot

The protected :36 task `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its original hourly America/New_York :36 VEVENT and `exact_schedule` timing mode.

The same prior h750:s3 run ID `a7258540-60a0-8331-9ba4-4d6602c22b33`, still scheduled for `2026-11-11T06:36:00Z`, now appears as:

- `recorded_status=in_progress`
- `started_at=2026-11-11T07:35:25.827441Z`
- `completed_at=null`
- `chat_ref=null`

This follows the earlier positive snapshot recording FAILED at 07:30:37.221941Z with `started_at=07:05:34.539403Z`.

The start-time field changed by 29m51.288038s. The cached latest result still belongs to the older h749:s3 Mira run `9fed0ab4-3014-8326-a5a0-4660f6d065ba`; task-level timestamps remain stale.

**Updated classification:** `SAME_RUN_ID_STATUS_REVERSAL_AND_STARTED_AT_MUTATION / ATTEMPT_RELATION_UNKNOWN / LATEST_RESULT_STALE`.

No attempt-history ID, retry counter, event log or backend cause is exposed. Preserve both snapshots. Do not infer retry, restart, duplicate execution, worker identity, refusal or cause. This remains the prior h750:s3 :36 occurrence, not an observed h751:s3 Mercer run.

## Comptroller routing

The later snapshot was appended to Tern's existing inbox as `TERN-H751-SCHEDULER-OBS-001 amendment 01`.

- Tern inbox blob after amendment: `7a5e574b7a30fee3733915e8f6de1409f462385d`.
- Exact tail readback: PASS.
- No task ID, schedule, phase, prompt, enabled state or task count changed.

The current :24 h751:s2 run was still recorded IN_PROGRESS at the latest exact-ID peek, with `chat_ref=null`; its original :24 VEVENT remains unchanged.
