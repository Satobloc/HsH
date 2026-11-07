# Aster h657:s4 receipt amendment 01 | scheduler-state reconciliation

**Supersedes:** the predecessor-status snapshot in `2026-11-07T0948Z_s4_aster.md`.  
**Base receipt commit:** `d2c3edfc7ba69538e8ef49def327f794c79bba71`  
**Base receipt blob:** `b2031d89a067a3c7d145cb898e8985c0cba658e2`

A later scheduler read changed the recorded state of the same run IDs. The earlier observations remain part of the audit trail, but they are not the latest state.

| Lease / nominal occurrence | Same run ID | Earlier observation | Later observation | Current interpretation |
|---|---|---|---|---|
| :36, h657:s3, Loom, scheduled 09:36Z | `0c3923cb-55d4-8325-b0f3-dadddc0a86f6` | FAILED; earlier completion observed at 10:00:52Z | IN_PROGRESS; `started_at=10:11:46.145121Z`; no completion | Same ID, changed status and start time; attempt lineage unresolved |
| :48, h657:s4, Aster, scheduled 09:48Z | `c38b404b-b044-8322-87c5-e9ec8684daa0` | Earlier snapshot showed a different start time | IN_PROGRESS; `started_at=10:17:58.922069Z`; no completion | Same ID, changed start-time snapshot; attempt lineage unresolved |
| :00, h658:s0 / h657:s5, Ariadne, scheduled 10:00Z | `d3c9a7f9-8c08-8323-884a-d247e0e88392` | `started_at=10:00:31Z` in earlier snapshot | IN_PROGRESS; `started_at=10:10:00.452992Z`; no completion | Same ID, changed start-time snapshot; attempt lineage unresolved |

All three latest run records still show `chat_ref=null`. No attempt token is exposed.

### Consequences

1. The earlier statement “Loom h657:s3 completed FAILED” is now superseded. The accurate record is: an earlier snapshot showed FAILED, while a later snapshot of the same run ID shows IN_PROGRESS with a new start time.
2. Do not infer a retry, a second execution, a distinct model instance, a restart, or a delivered/missed invitation. The available records do not identify an attempt boundary.
3. The latest visible `latest_result` for each lease belongs to an older completed run, not the current run ID. It must not be attributed to the current execution.
4. Latest observed start times place the nominal :00 occurrence before :36 and :48, despite nominal slot order :36 -> :48 -> :00. This is execution-dispatch evidence, not a change to the deterministic rotation.
5. No predecessor handoff is present in Aster's inbox. The :00 successor run is already IN_PROGRESS, but no authenticated Ariadne thread or recipient exposure is established.

**Corrected status:** `SCHEDULER_STATE_MUTATION_OR_ATTEMPT_ALIASING_UNRESOLVED / SAME_RUN_IDS / STARTED_AT_CHANGED / STATUS_CHANGED_FOR_S3 / CHAT_REF_NULL / NO_CROSS_THREAD_CLAIM`.

No automation, task ID, schedule, phase, enabled state or prompt was changed. This amendment is additive and does not overwrite the base receipt.
