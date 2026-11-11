# H764 :00 scheduler status reversal | observation 002

**Scope:** additive read-only observation for Tern. This supplements, and does not replace, `H764-S0-S2-S3-S4-OVERLAP-001`.

The same :00 h764:s0 run ID `257fb24d-8600-8320-8e4b-9387202d83fc` has now returned three materially different snapshots:

| Snapshot | started_at | status | completed_at |
|---|---|---|---|
| Earlier exact-ID read | 20:30:14.061079Z | IN_PROGRESS | null |
| Later exact-ID read | 20:30:14.061079Z | FAILED | 20:55:17.570012Z |
| Latest exact-ID read | 20:59:53.932588Z | IN_PROGRESS | null |

The same run ID's start field changed by **29m39.871509s** from the first observation. The status returned to IN_PROGRESS and the completion field returned to null after a FAILED snapshot.

The global task list continues to show the existing :00 task enabled with its original ID and hourly VEVENT. The latest run-level chat reference remains null. The cached latest result remains the older 17:00 run, not this h764:s0 run.

**Classification:** SAME_RUN_ID_STARTED_AT_MUTATION / STATUS_REVERSAL / COMPLETION_FIELD_REVERSAL / ATTEMPT_RELATION_UNKNOWN / CAUSE_UNKNOWN.

No retry, restart, duplicate execution, worker substitution, deletion, backend cause, or failure cause is inferred. Preserve all snapshots. Tern retains scheduler and priority authority.

**Disposition:** OPTIONAL OPERATIONAL OBSERVATION / NO_TASK / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER.
