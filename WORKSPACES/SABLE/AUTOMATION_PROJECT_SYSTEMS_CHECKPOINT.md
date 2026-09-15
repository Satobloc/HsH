# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Sable's human-facing continuity checkpoint remains Sable-owned semantic state.

## Current run finding — mixed navigation publisher uses correct race disposition

Direct inspection of `WORKSPACES/COMMON/INFRASTRUCTURE_QA_ROTATION.md` and `.github/workflows/maintain-navigation.yml` confirms the mixed HsH navigation workflow now follows the critical rule for a publisher that can mutate canonical/source files as well as generated derivatives.

The workflow stages possible source conversation renames plus structural indexes, chronology/manifests, autotag indexes, and Viewer catalog data. If its push to `main` is rejected because `main` advanced, it does **not** rebase, merge, force-push, or replay the stale mixed snapshot. It emits an error and exits nonzero, explicitly requiring a fresh maintenance run to recompute from current main.

This matches the active INFRA-QA rule for mixed source/generated workflows: stale source mutations must not be replayed after a race. Unlike a pure generated publisher, failure-and-fresh-rerun is the safe disposition.

This closes the specific mixed-navigation false-green/replay concern named in the September 15 generated-artifact publication regression class. It does not establish that every navigation run is race-free or that full source -> Viewer -> autotag -> Nathan Direct -> Stage-2 convergence holds.

## Prior finding — archive-wide autotag generated-artifact publish safety

The archive-wide autotag/Nathan Direct publisher implements the newer generated-artifact transaction rule rather than the older rebase-generated-output pattern: concurrency group; validated generated snapshot; fetch/hard-reset to current `origin/main`; declared generated scope only; revalidation; non-force push; discard/retry after race; visible failure after bounded retries.

## Inventory provenance handoff remains open

Current published tooling/output inspected by this automation identifies as `sable-source-inventory/0.2.1`; the earlier human-facing continuity claim of a published `0.3.0` / `input_refs.json` state remains unsubstantiated by current-main evidence inspected here. Do not overwrite the human-facing continuity checkpoint from this backend loop; route this as worker-local handoff under `SHARED_STATE_WRITE_SAFETY.md`.

A reusable consistency check should compare atomically:

`sampler TOOL_VERSION -> workflow expected filenames -> published summary/run manifest -> continuity/Dashboard claim`

and include source commit triplet + inventory hash so ordinary source growth is not misdiagnosed as pipeline drift.

## Control / safety state

`AUTOMATION_WORKFLOW_CONTROL.md` requires `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md` before write-capable script/workflow publication. Shared semantic state uses fresh-read/current-SHA semantics; generated state uses deterministic rebuild plus current-main publication discipline. This automation re-fetched this worker-local checkpoint immediately before this update and used the returned current blob SHA.

No PRIOR_ART content was opened, listed, hashed, sampled, indexed, or exposed. No theory-bearing work was promoted. No Q&A/prior-art disposition changed. No Nathan decision is required.

## Next high-information operations

1. Inspect the remaining publishers named in the current INFRA-QA regression class (Cross podcast transcript index and GLASS structural indexing) and confirm their actual current publish semantics.
2. Inspect workflow-run artifacts/logs or non-main refs for the unsupported inventory `0.3.0` identifiers before deciding whether that state was transient/unpublished versus subsequently replaced.
3. Implement or propose the reusable inventory-state consistency check above as generated QA output.
4. Resume full source -> Viewer -> autotag -> Nathan Direct -> Stage-2 identity/count/hash convergence QA.
