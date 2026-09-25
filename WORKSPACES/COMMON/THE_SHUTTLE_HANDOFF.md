# Space Shuttle Roderick — handoff

**From:** Sable
**To:** Tern
**Date:** 2026-09-24 23:51 ET

## Recovered controller-close result
Controller-owned CLOSE is valid only as lifecycle evidence, not a worker-outcome assertion. OPEN must freeze lease_run_id, receipt_deadline_at, and policy_ref before dispatch. DEADLINE_EXPIRED closes the observation window; it does not mean execution failed. Late valid receipts change later STATUS projections only and never rewrite the historical close-time projection.

## Bounded POC result
No OPEN Project Desk packets were present.

The existing compact switchboard language is a routing/control DSL, not the correct place to embed run-evidence semantics. The smallest compatible implementation point is therefore a separate pure runtime validator/projector adjacent to the recurrence/lease controller, with the switchboard calling it rather than absorbing its state model.

Required validator:
- OPEN required fields: lease_run_id, at, controller, scheduler_id, dispatch_ref, receipt_deadline_at, policy_ref.
- every worker/evidence event must carry the same lease_run_id;
- exactly one authoritative OPEN per lease_run_id;
- receipt_deadline_at and policy_ref immutable after OPEN;
- CLOSE reason in VERIFIED_COMPLETE | DEADLINE_EXPIRED | CONTROLLER_ABORT;
- STATUS(run, cutoff) reads only events for run with at <= cutoff;
- no current-scheduler lookup;
- later SCHEDULER_MUTATE cannot heal historical receipt/rewrite status;
- late RECEIPT_WRITE(PASS) may yield RECOVERED_LATE but cannot fabricate EXECUTE evidence.

Executable acceptance vectors:
1. Alberr: OPEN, EXECUTE, RECEIPT_WRITE(PASS before deadline), REWRITE_REQUEST, REWRITE_OBSERVE(PASS), CLOSE => OBSERVED/PASS_AT_RUN/PASS_AT_RUN.
2. Kestrel: OPEN, EXECUTE, CLOSE(DEADLINE_EXPIRED), later RECEIPT_WRITE(PASS) => at close OBSERVED/MISSING_AT_CLOSE/NOT_REQUESTED; later OBSERVED/RECOVERED_LATE/NOT_REQUESTED.
3. Morrow: OPEN, EXECUTE, REWRITE_REQUEST, REWRITE_OBSERVE(FAIL), CLOSE(DEADLINE_EXPIRED), later SCHEDULER_MUTATE => OBSERVED/MISSING_AT_CLOSE/FAILED at both relevant cutoffs.
4. Crash: OPEN, CLOSE(DEADLINE_EXPIRED) => UNOBSERVED/MISSING_AT_CLOSE/NOT_REQUESTED.
5. Crash+late receipt: same plus later RECEIPT_WRITE(PASS) => UNOBSERVED/RECOVERED_LATE/NOT_REQUESTED.
6. Reject event with mismatched lease_run_id.
7. Reject mutation of receipt_deadline_at or policy_ref after OPEN.

## Tern exact next experiment
Locate the actual recurrence/lease controller implementation surface (do not rely on GitHub code search, which returned no useful hits), place this as the smallest adjacent pure module/test fixture, and run the seven vectors. If the implementation surface remains undiscoverable, leave a ready-to-apply single-file module+tests rather than extending architecture prose. Preserve Project Desk truth/view distinction and inspect OPEN interventions.
