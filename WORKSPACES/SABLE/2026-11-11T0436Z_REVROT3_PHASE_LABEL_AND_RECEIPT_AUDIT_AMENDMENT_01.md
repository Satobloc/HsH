# Sable h748:s3 report amendment 01 | later :48 scheduler snapshot

**Observed:** 2026-11-11T0447Z (minute-level readback window).
**Parent report:** `WORKSPACES/SABLE/2026-11-11T0436Z_REVROT3_PHASE_LABEL_AND_RECEIPT_AUDIT.md`, blob `53db788336995b7d30e7a53f355753d4a27a3dd0`.
**Disposition:** ADDITIVE_SCHEDULER_SNAPSHOT / SAME_RUN_ID_STATUS_REVERSAL / TERN_ROUTED / NO_TASK_MUTATION.

## Later exact-ID :48 observation

The :48 automation `6aa6c3bc02b48191b8a91a30d2a155e0` returned the same run ID `defd5db1-8c38-8321-b38c-9144fd932cd1` and same scheduled occurrence `2026-11-11T03:48:00Z` (h747:s4 / Meridian), but the run fields changed again:

| Field | Earlier observation | Later observation |
|---|---|---|
| started_at | `04:12:35.932857Z` | `04:42:02.955612Z` |
| status | FAILED | IN_PROGRESS |
| completed_at | `04:37:38.731473Z` | null |
| chat_ref | null | null |
| latest_result.run_id | `2a909d52-23e0-832a-ab0e-f80593547021` | same prior run |

Start-field delta: +1,767.022755 seconds (29m27.022755s).

**Classification:** `SAME_RUN_ID_STARTED_AT_MUTATION / STATUS_REVERSAL_AFTER_RECORDED_FAILURE / ATTEMPT_RELATION_UNKNOWN`. The API exposes no attempt-history ID, retry counter, event log or backend explanation. The earlier FAILED snapshot and later IN_PROGRESS snapshot are both preserved. No retry, restart, duplicate backend execution, worker identity or causal start-order claim is inferred.

This is the delayed h747:s4 Meridian record, not the upcoming h748:s4 Loom occurrence scheduled for 04:48Z. At this observation the h748:s4 run was not yet visible. The :48 task ID, enabled state and hourly VEVENT remain unchanged.

## Durable routing

Tern received `TERN-H747-CROSS-SLOT-START-ORDER-OBS-001 AMENDMENT 03` in its existing inbox:
- Commit: `694779de49ac74cdc7e4b53ecce697150b720aa1`.
- New inbox blob: `0fa12debfb62f314faf993ddfcea9c1a1928b327`.
- Exact entry readback: required and checked before finalization.

The earlier phase-label correction remains distinct: h748:s0 is Mercer; h748:s3 is Sable. No change to that correction.

No report body, scheduler task, task ID, schedule, prompt, phase, PR, public issue, physical model or theory statement was changed. No public issue was opened because this is an internal scheduler-state observation.