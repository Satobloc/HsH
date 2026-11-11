# Sable h763:s4 receipt amendment 02 | same-run-ID scheduler status reversal

**Observed:** 2026-11-11T20:01:39Z. Preserve the prior snapshots; this is an additive observation.

## :36 h763:s3 Orson run

The same run ID `2937e5dc-bfc0-8322-9beb-c2020784a6ba` has now returned three materially different snapshots:

| Observation | started_at | status | completed_at | chat_ref |
|---|---|---|---|---|
| Earlier :48 inspection | 19:35:07.130406Z | IN_PROGRESS | NULL | NULL |
| 20:00:02Z inspection | 19:35:07.130406Z | FAILED | 19:58:32.414255Z | NULL |
| 20:01:39Z inspection | 20:01:16.074003Z | IN_PROGRESS | NULL | NULL |

The returned `started_at` changed by **26m08.943597s** for the same run ID. The latest value is **25m16.074003s after** the nominal 19:36Z slot. The completion timestamp returned to NULL and status returned to IN_PROGRESS after the FAILED snapshot.

No attempt-history ID, retry counter, event log, cause, or authenticated thread is exposed.

## Other exact-ID state retained

- :48 Sable h763:s4 run `2515903d-775c-8333-9d31-9138326e2ca0` remained IN_PROGRESS at the latest peek, with completion NULL and `chat_ref=null`.
- :00 still exposed the older h762:s0 Nadir failure; no h763:s0 Meridian or h764:s0 Loom run was observed.
- :24 latest-result field returned NULL at the preceding 20:00:02Z peek; no h763:s2 Ravel run was observed.
- :12 remains disabled.

## Classification and controls

**SAME_RUN_ID_STARTED_AT_MUTATION / STATUS_REVERSAL / COMPLETION_FIELD_REVERSAL / ATTEMPT_RELATION_UNKNOWN / CAUSE_UNKNOWN.**

Do not infer retry, restart, duplicate execution, worker substitution, backend cause, or task deletion. Preserve all snapshots. Tern retains scheduler authority.

All existing task IDs, prompts, enabled states, exact hourly America/New_York VEVENTs and phases remain unchanged. No sixth task, retry, disable, or schedule mutation was attempted.
