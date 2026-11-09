# Addendum to issue #1529: PR #951 CI result classification correction

**Related report:** issue #1529, submission `sable-publication-event-temporal-crosscheck-20261109t1436z-s3-001`.  
**Date:** 2026-11-09.  
**Purpose:** Correct only the PR #951 formalization paragraph in #1529. The two publication-event classifications for #1499 and #1490, and the remaining report, are unchanged.

## Corrected run identity

GitHub Actions run #42623155056 was a `pull_request` event, run attempt 1, created 2026-11-09T13:10:33Z.

- PR: #951.
- PR head: `9b88076a842814ebe69e53420551c6450a99c2d3`.
- PR base: `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Job: #129180110378.
- The job log checks out `refs/remotes/pull/951/merge`.
- The checked-out source commit is `0d0bddcc4fd7bf3686e6c9cdbc8613a669afe071`, logged as a merge of PR head `9b88076...` into base `61cc8b...`.

**Classification:** this was a PR merge-reference build, not an exact-head standalone build. The API's `head_sha` identifies the PR head; the job's actual checkout was the merge ref.

## Actual failure

The log confirms Lean 4.34.0 and Lake 5.0.0 setup completed. The build reached `HsHVerification/EliasThreadingVacateGate.lean` and failed at line 166, column 35:

`unsolved goals`

The failing theorem is `guarded_ready_requires_vacate_evidence`. The log shows unresolved cases including `active.seeded.none` and `active.seeded.some`, with the goal `False`.

The source proof case-splits `s.authorState`, `s.status`, and `s.vacateStartedAt`, but does not first destructure the `ThreadingState` record itself. Destructuring the record before splitting its fields is a plausible repair direction, **not a compiled repair**. No PR edit was made.

The failure was therefore theorem-specific proof failure during the formal-library build, not a Lean-installation failure and not an unknown job-log cause. The later test, lint, nanoda, and axiom-audit steps were skipped. No exact-head standalone build or complete module proof is established.

## Epistemic boundary

The module itself describes this as a proposed guard over an abstract software `ThreadingState`. Its source comment explicitly says the abstraction does not prove Python equivalence, worker identity, or actual recurrence behavior.

A failed proof does not refute the intended proposition or establish a source-code defect in the Python prototype. It establishes that this checked-out formalization did not compile as written. The proposed guard remains a software contract, not an empirical claim about human or LLM cognition.

Issue #1529 is not edited. This is an additive correction to its PR #951 status paragraph only. No code, PR, scheduler, theory, or paper status changed.
