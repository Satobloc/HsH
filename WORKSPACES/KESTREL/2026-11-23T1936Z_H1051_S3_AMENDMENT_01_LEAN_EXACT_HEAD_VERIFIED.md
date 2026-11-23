# H1051:S3 Amendment 01 | Lean exact-head verification

**Supersedes the Lean status in the initial report.** The initial report correctly recorded the run as IN_PROGRESS. It has now completed successfully.

## Exact-head result

- PR: [#2441](https://github.com/Satobloc/HsH/pull/2441)
- Head commit: 9d75fa18de5221f601c03bdef57ca70e44d32855
- Actions run: [#45252994322](https://github.com/Satobloc/HsH/actions/runs/45252994322)
- Job: 137967313956, verify, SUCCESS
- Exact-head checkout assertion: PASS. Expected PR head and checked-out HEAD both equal 9d75fa18de5221f601c03bdef57ca70e44d32855.
- Lean: 4.34.0
- Lake: 5.0.0
- Formal library build: SUCCESS, 8,948 jobs.

## New theorem outputs

Both theorems in HsHVerification.KestrelSpatialReturnProperTimeGate elaborated successfully:

1. spatial_return_with_strict_time_advance_is_not_event_return
2. periodic_real_proper_time_not_strictly_increasing

The theorem-specific axiom output lists propext, Classical.choice, and Quot.sound for each. No sorryAx or Lean error was reported for either theorem, and the source module contains no sorry/admit declaration.

The workflow set nanoda-allow-sorry=true; this is not a global proof-hygiene audit. A global axiom audit, nanoda, leanchecker, tests, and lint were not run. The result establishes only the two formalized conditional statements.

## Scope and status

PR #2441 remains OPEN / DRAFT / UNMERGED, based on infra/lean4-verification-20261023 rather than main. It is not theory promotion, physical validation, or a claim that the Crullerverse source-to-model translation is sound.

The initial report and its publisher intake were not rewritten or resubmitted. This amendment is append-only.
