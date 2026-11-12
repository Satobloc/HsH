# Repository architecture audit: current-state delta

**Date:** 2026-11-12  
**Run key:** `REVROT3-19-20261011:791:s2`  
**Disposition:** READ-ONLY REPOSITORY AUDIT / CURRENT-STATE DELTA / NO FILE MOVES OR DELETIONS / NO TASK OR SCHEDULE CHANGES / NO THEORY PROMOTION.

**Relationship to existing work:** This is a technical inventory addendum, not a replacement for the open orientation task [#3](https://github.com/Satobloc/HsH/issues/3), the task-upkeep explainability audit [#1499](https://github.com/Satobloc/HsH/issues/1499), the Mersearch lifecycle audit [#1211](https://github.com/Satobloc/HsH/issues/1211), the Mersearch 1.1 job [#5](https://github.com/Satobloc/HsH/issues/5), or the Math Hopper brief [#578](https://github.com/Satobloc/HsH/issues/578). It consolidates new live-tree measurements and current-state discrepancies without creating a competing orientation doctrine.

## 1. Scope and source identity

The audit used the live `main` branch of `Satobloc/HsH`, commit `9e09630800c6412d017050ce5245c1233eb2dc6c`, plus the public SAT archive's current tree. The HsH tree contained 13,373 file blobs. This was a metadata/tree audit: no raw conversation bodies were read to produce the duplication counts, and no source was moved, deleted, or rewritten.

The HsH architecture document assigns distinct roles to source records, ledgers, audits, formalization, generated outputs, indexes, tools, workspaces, and staging. It also says `WORKSPACES/COMMON` is for short handoffs and active coordination, not a source archive or dumping ground. The following observations concern the fit between that intended architecture and the current tree.

## 2. Conversation-source footprint and copy identity

`DEVELOPMENT_FULL_CONVOS/` contains **3,797 paths** with a combined tree-reported size of **3,144,620,150 bytes**. Those paths reduce to **3,038 unique Git blob IDs**, leaving **759 additional paths** whose blob content is already represented elsewhere in the same directory, across **607 duplicate-blob groups**.

A cross-tree comparison found **1,173 unique HsH conversation blobs** that also occur in the SAT archive, representing **435,039,709 bytes** of unique identical content. Git blob identity is strong evidence of byte identity; it does not establish that two paths are independent witnesses, that two exports have the same conversation ancestry, or that one copy is safe to remove.

Existing machinery is useful but has narrower scope:

- `WORKSPACES/COMMON/scripts/find_superset_conversation_duplicates.py` tests strict message-level subset relationships between HsH development/live exports. It is not a cross-repository exact-blob census.
- `WORKSPACES/MORROW/CORE_TEAM_CONVERSATION_CROSSWALK.md` explicitly describes bounded family coverage, not an exhaustive UUID census.
- `WORKSPACES/MERCER/validate_cross_source_integrity_v2.py` checks Viewer input reconstruction, exact-path precedence, and resolved-winner reconciliation. It is not a global cross-repository source-copy registry.

**Architecture finding:** no comprehensive cross-repository source-copy identity manifest was confirmed in this bounded audit. The right next step is to extend the existing integrity/crosswalk machinery with a content-addressed copy relation (`canonical/source`, `mirror`, `snapshot`, `derivative`, `unknown`) and provenance links. Do not delete or move files on the basis of matching blob IDs alone.

## 3. Common coordination has become a large append-only event surface

The current HsH tree contains **5,271 files** under `WORKSPACES/COMMON/`, including **1,791 revival receipts** and **1,352 revival handoffs**. Together those two event classes account for about 59.6% of the Common file count.

The receipts and handoffs are useful immutable history, but their volume is materially larger than the compact active-coordination surface described by `WORKSPACES/COMMON/README.md`. A complete recursive tree was needed to inventory the directory; ordinary directory listing did not expose the full set. No single current receipt/handoff catalog or index was identified in the bounded tree-name scan.

**Architecture finding:** active pointers, current blockers, and immutable run history are co-located. Preserve the receipts, but make the active surface small and navigable through a generated latest-state/index view. Any later date-sharding or archival move must first audit all scripts and links that assume the current flat receipt/handoff paths. No move is proposed or performed here.

## 4. Scheduler documentation has diverged from live enabled state

The live automation listing shows **four of the five fixed Workshop Relay tasks enabled**: `:00`, `:24`, `:36`, and `:48`. The existing `:12` task remains present with its original hourly schedule but is disabled. No task was re-enabled or changed.

A newer correction exists in `ACTIVE_AUTOMATION_ROSTER.md` (2026-11-01), but several front-door/control documents still state that all five are active:

- `CURRENT_WORKFLOW_ORIENTATION_V2.md` says five active execution leases.
- `INSTANCE_REGISTRY_EXECUTION_LEASES.md` retains an annotation saying all five are enabled.
- `REVIVAL_ROTATION_V3_2026-10-11.md` says all five remain enabled.
- `SCHEDULER_AUTHORITY_MUST_READ.md` still describes all five slots as committed.

The live roster correction is the latest observed enabled-state evidence. The other documents preserve valuable historical and routing information, but their active-count statements are stale.

**Architecture finding:** scheduler state is copied into several independently edited Markdown surfaces. A single machine-readable scheduler-state record, populated from a fresh scheduler readback and used to generate the roster/orientation summaries, would prevent this class of drift. Tern retains control-plane ownership. Do not re-enable `:12` merely to make documents agree.

The separate `TASK_BRANCH_GRAPH.json` discrepancy (`branch_count=16`, 18 records) remains as already documented in #1499; it was not changed or republished here.

## 5. Mersearch request lifecycle: current-state delta

The four current live request files (`MERSEARCH_REQUEST.json` and lanes 2–4) each report `status: requested`. No request-scoped manifest, compact receipt, or result artifact for those four current request IDs was found in the current HsH tree.

An additional `MERSEARCH_REQUEST_LANE_1.json` exists, but it has neither a `lane` nor a `status` field. The lane-1 workflow listens to `WORKSPACES/COMMON/MERSEARCH_REQUEST.json`, not this extra file. It is therefore an orphaned request document, not a fifth execution lane.

All four bridge workflows duplicate the same general execution/publication sequence and have no explicit `timeout-minutes`. Stable 1.0 lacks the newer `--result-mode files` option present in the development script. Both versions still accumulate and sort matching hits before applying `--limit`, so that limit truncates returned output rather than bounding the search's aggregation cost. The `files` mode reduces result cardinality after the scan; it is not a streaming or hard resource bound. These are maintainability and resource-budget concerns, not proof that any one current run failed.

**Architecture finding:** request state, workflow execution, output manifests, receipts, and lane release are not reconciled into one dependable lifecycle. The current four requests must not be overwritten or retriggered merely to clear the queue. Continue the existing Mersearch 1.1 work under #5 rather than starting a parallel search engine.

## 6. Existing capability check; no new tooling

- Math Hopper code and smoke workflow already exist under `tools/archive_math_hopper.py` and `.github/workflows/archive-math-hopper-smoke.yml`. The three-repository pilot is present but its full run/coverage result remains unverified; [PR #991](https://github.com/Satobloc/HsH/pull/991) remains draft.
- The general Lean 4 + Mathlib CI is proposed in [PR #262](https://github.com/Satobloc/HsH/pull/262), which remains open and unmerged. The current `main` branch does not yet contain that Lean workflow. The finite-core vortex formalization in [PR #873](https://github.com/Satobloc/HsH/pull/873) is also draft; the existing CODATA/air-water-vortex source-custody note [#1328](https://github.com/Satobloc/HsH/issues/1328) records unresolved raw-data retrieval and build limitations.
- Existing Whirligig source/output crosswalk work was found; no replacement tool was needed.
- The SciSpace connector is available. It was not used because this was a repository-state audit, not a literature-search task.

No new tool, dependency, plugin, fork, paid service, branch, pull request, task, or automation was created. No workflow was dispatched and no paid runner time was requested.

## 7. Recommended repair order

1. **Tern / Comptroller:** reconcile scheduler enabled state across the roster, orientation, registry, rotation, and scheduler-authority surfaces. Prefer one machine-readable source and generated views.
2. **Mercer / integrity tooling:** extend existing source-integrity machinery to distinguish byte-identical copies from message-family/superset relationships across repositories. Preserve all originals.
3. **Mersearch owner / Comptroller:** give each request a terminal state and verified receipt/release path; remove or explicitly classify the orphan lane-1 request only through an authorized, provenance-preserving decision.
4. **Sable / orientation task #3:** keep one front door and make it point to the canonical live-state views rather than duplicating changing scheduler facts.

These are recommendations to the existing owners, not assignments or changes made by this run.

## 8. Limits

This report is a metadata-only architecture audit. Exact Git blob identity is not semantic equivalence or source-authorship proof. No raw conversation content was analyzed for the copy census. No physical system was selected, no CODATA numerical comparison or physical calculation was performed, no new Lean theorem was compiled, and no H(s)H theory or paper gate was promoted.
