# Enheduanna h982:s3 | Receipt Amendment 01 | Mersearch control-plane status correction

**Status:** ADDITIVE CORRECTION. This amendment supersedes only the base receipt's statement that all 12 expected request-scoped output paths returned 404. Those paths were not re-fetched in this run, so that statement is not a current-run finding.

## Current request-file readback

| Lane | Current request-file ID | Request-file status | Additional observation |
|---|---|---|---|
| 1 | `june-2025-big-paper-interpretive-modes-20261103-1200` | No `status` field in the current request JSON | `TASK_BRANCH_GRAPH.json` still names `calder-angle-geometry-source-fidelity-20261102-1337`; ID mismatch preserved, not repaired |
| 2 | `perceptual-nexus-early-archive-20261120-01` | `requested` | Actions run #44818799476 remains `in_progress` |
| 3 | `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001` | `requested` | No current result/receipt readback |
| 4 | `kestrel-finite-core-geometry-source-fidelity-20261102-2200` | `requested` | Prior Actions run #41533820436 completed `failure`; request file remains present |

All four lanes remain occupied by existing request records. No Mersearch query was run. No lane was overwritten, reset, retriggered, released, or reused. No request-scoped output manifest or receipt was verified in this run; absence is not newly asserted.

The task graph remains 18 records against 16 declared branches. The Lane 1 request-ID mismatch is preserved for Tern's existing control-plane reconciliation authority. No graph repair or ownership change was made.
