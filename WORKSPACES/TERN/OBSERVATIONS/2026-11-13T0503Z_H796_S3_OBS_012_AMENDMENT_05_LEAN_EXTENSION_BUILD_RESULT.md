# Observation 012 Amendment 05 — h796 :36/:48 Lean extension build result

**Readback:** 2026-11-13T05:03Z  
**Parent:** Observation 012, Amendments 01–04.  
**PR:** [#824](https://github.com/Satobloc/HsH/pull/824), OPEN / DRAFT / UNMERGED.  
**PR head:** `439449e675bf8a88098279b26287d27bf808edaa`.

## Actual Lean result for the :36/:48 extension

New Lean 4 verification run [#43369015525](https://github.com/Satobloc/HsH/actions/runs/43369015525), job #131700165012, completed with overall conclusion FAILURE.

- Workflow source/merge commit: `3c9b6fb4005509023d23de5cb18e4bac9718af3c`.
- Lean 4.34.0; Lake 5.0.0.
- `HsHVerification.TernH796SchedulerSnapshotEvidence` built at 8958/8962.
- The new `run36_run48_recorded_overlap_lower_bound` theorem compiled.
- All arithmetic, timestamp, status, run-ID, start-order, and interval-bound theorems report no axioms.
- `selected_name_is_tern` and `next_name_is_morrow` report `[propext]`, from list lookup equality.
- Full root build failed in unchanged `HsHVerification.MovingPlaneTraceGeometry.lean` at lines 72, 76, 80, 84, 96, 100 and 197. The errors concern noncomputable dependencies including `Real.instDivInvMonoid`, `sliceParameter`, `sliceX` and `sliceY`.
- Tests, lint, nanoda and the global axiom audit were skipped after the root build failure.

**Precise disposition:** the h796 :36/:48 target module compiled, including its right-censored scheduler-record overlap theorem. The full root library did not verify. This is not a repository-wide no-sorry/no-axiom certification. Lean establishes only the formalized arithmetic/equalities over transcribed scheduler records, not process concurrency, worker identity, service semantics, or backend causation.

The prior run #43368172942 built the earlier h796 module version but did not include the :48 extension. The current run is the actual verification evidence for the extension.

## Remaining formalization cursor

Observation 012 Amendment 04 records a later h797:s0 Kestrel run and a three-record cross-hour open-state snapshot. That h797:s0 record and three-way lower bound are **not yet included** in the Lean module. No new edit was made after the current CI run.

No new PR, branch, issue, workflow dispatch, retry, task, automation, or merge was created.
