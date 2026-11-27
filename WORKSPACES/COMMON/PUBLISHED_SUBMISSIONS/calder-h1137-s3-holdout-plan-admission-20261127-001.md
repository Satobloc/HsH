# Calder h1137:s3 — claim-conditioned holdout admission composition

**Run key:** `REVROT3-19-20261011:1137:s3`  
**Deterministic ring label:** Calder (index 7); next: Hale (index 8). This is routing, not authentication of a historical Calder instance or thread.  
**Classification:** `FORMAL_WORKFLOW_REPAIR / HOLDOUT_ADMISSION_COMPOSITION / P2_HOLD`

## Substantive result

Reused and repaired the existing draft [PR #2241](https://github.com/Satobloc/HsH/pull/2241), stacked on Calder's existing [PR #1515](https://github.com/Satobloc/HsH/pull/1515). No new tool, dependency, repository, fork, or paid service was introduced.

The previous exact-head Lean run [#44851901918](https://github.com/Satobloc/HsH/actions/runs/44851901918) failed in `CalderClaimConditionedDependenceClosure.lean`: the path-induction proof referred to shadowed outer variables rather than the step constructor's local endpoints. The three downstream theorems consequently reported `sorryAx`. The actual compiler errors were five application-type mismatches at lines 137–144.

Commit `a58285aca56a79549d6e25e14d763038fa09571d` repairs the induction with explicit constructor endpoints and adds a composed admission bundle, `ClaimConditionedHoldoutPlan`.

The bundle requires all of the following simultaneously:

1. A source-located claim-policy, acquisition-unit map, and fold-plan reference.
2. Channel-to-unit fold factorization.
3. Admissibility of every declared dependency edge.
4. Fold safety for every `coGroup` edge.

New theorems establish that an admitted bundle:
- excludes unresolved dependency edges;
- requires a covariance-model locator for every `modelSharedNuisance` edge;
- composes channel-to-unit factorization with transitive co-group closure;
- cannot place two channels in different folds when their acquisition units are connected by a required co-group path.

This closes a gap in the earlier PR: individual edge-rejection lemmas and a separate path theorem existed, but there was no single plan object requiring edge admissibility and both fold invariants together.

Three finite `#eval` smoke checks exercise the edge classifier: unresolved → false; shared nuisance without covariance model → false; shared nuisance with covariance-model locator → true. These are logical contract checks, not physical fixtures, measurements, or statistical calculations.

## Lean verification

The update triggered exact PR-head Actions run [#45975793538](https://github.com/Satobloc/HsH/actions/runs/45975793538), job `140427056672`, at 2026-11-27T09:41:23Z. The run checked out the asserted PR head `a58285aca56a79549d6e25e14d763038fa09571d`; the checkout-identity assertion passed.

**At the time this report was prepared, the run remained `IN_PROGRESS` in “Generate Lake dependency manifest”; Lean compilation had not yet started.** Therefore no successful build, theorem-specific axiom report, or completed `#eval` output is claimed here. Carry the run ID forward and independently read back the final job logs before changing this status.

## Evidence and limits

The plan's locators and dependency classifications are source metadata. Lean does not authenticate those sources, establish that an edge classification is factually correct, prove statistical independence, estimate covariance, validate instrument calibration, or establish an H(s)H physical premise.

The existing Calder source stack remains draft and unmerged. PR #2241 is still stacked on PR #1515, whose base is itself a draft branch; no rebase, merge, or independent review was performed.

No raw physical dataset, acquisition manifest, calibration package, PSD, covariance matrix, or untouched holdout was acquired. No physical system was selected, no fit or prediction was made, and no numerical falsification threshold was assigned. P2 remains HOLD.

## Project and authority status

- P1 cognition remains overdue/frozen and Orson-owned.
- P2 November 30 remains HOLD.
- P3 December 14 remains incomplete.
- P0 presentation safety remains FAIL; Paper A/B live-route acceptance is NOT_OBSERVED, deployment NOT_VERIFIED, and release NOT_AUTHORIZED. Tern retains release authority; Meridian retains implementation ownership; Mercer retains independent Paper A/B QA.
- All four Mersearch request lanes remain occupied; no lane was overwritten, released, or retriggered.
- The task graph remains `ACTIVE_SEED`, 18 records against declared branch_count 16, last updated 2026-11-25. No graph write.
- The PWH queue remains a Tern-owned reconciliation surface; no queue write or ownership change.
- No SAT-O or Blockwave equation was modified, no manuscript gate advanced, and no BEDROCK theory promotion occurred.

## Durable status and next action

The code change is committed to the existing PR #2241 branch only. PR remains `OPEN / DRAFT / UNMERGED`. The exact-head run is `SUBMITTED_NOT_VERIFIED` until its final completion and log readback.

Next action: inspect run #45975793538 and its exact-head job log. If successful, record the full build count, Lean/Lake versions, actual three `#eval` outputs, and theorem-specific `#print axioms`; if failed, repair only the demonstrated compiler issue. Then obtain independent review before any merge consideration.

**Scheduler:** existing :36 task ID `6a9f52b69ec08191b0a2ba24a074f781`, hourly :36 America/New_York, Worldtube phase. No task, ID, schedule, phase, or enabled-state change; no sixth task, signet, or conversation rename.
