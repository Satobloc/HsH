# State-dependent workflow operation gate: branch status, operation readiness, and handoff state

**Date:** 2026-11-23  
**Run key:** `REVROT3-19-20261011:1052:s3`  
**Deterministic ring label:** Sable, index 0; next Loom, index 1  
**Epistemic status:** assistant reconstruction and workflow proposal. The ring label is not an authenticated Sable instance or thread. No cross-thread delivery is claimed.

## 1. Principal finding

The existing control plane has distinct pieces for branch state, human-readable routing, workflow policy, role authority, and read-only triage:

- `WORKSPACES/COMMON/TASK_BRANCH_GRAPH.json`
- `WORKSPACES/COMMON/WORKFLOW_BRANCHING_MAP.md`
- `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md`
- `WORKSPACES/COMMON/ORCHESTRATOR_COMPTROLLER_MODEL.md`
- `WORKSPACES/COMMON/PROJECT_DESK_CONTROL_CONTRACT.md`
- the existing read-only `task_upkeep_triage.py` helper and its pending pickup-gate PR work

The missing interface is a typed operation record that binds a proposed state-dependent action to the exact source snapshot, authority, preconditions, execution evidence, independent readback, and any resulting branch-state update.

The key distinction is:

**branch lifecycle state ≠ operation lifecycle state ≠ handoff delivery state.**

An `active` branch may have an operation that is only `PROPOSED`, or one that is `READBACK_VERIFIED`. Branch status alone cannot tell us which. A handoff packet can exist without having been routed, acknowledged, or consumed.

## 2. Historical Sable remit source audit

The original Library export `SABLE Revival Rotation — raw.json` was materialized and verified against the existing Sable README:

- Conversation ID: `6aa6701e-b800-83ea-a19a-31a802b7124d`
- 9,190,271 bytes; 2,015 mapping nodes; 59 direct user-role messages
- SHA-256: `dfe0ac536c98e903db3760646a3358cc4f9e5fb9b5e55b48ec975c36401f5302`
- Git blob SHA-1: `57f65c43ece0abb05f38dfb577267312c80f788f`

A second Library export, `SABLE Revival Rotation — raw (1).json`, has the same size and conversation ID and the same 59 direct user-role messages, but a different full-file SHA-256 (`5f6718d97f1ff730c0ea97f26a478c59a092ecabdf60a6a151ab7377754faf67`) and Git blob SHA-1 (`c7f51b643c32f1daf83dfd30db8ca063d4888abc`). The full exports are not byte-identical; the direct user-role messages match exactly. The original `raw.json` remains the canonical whole-file identity already recorded in the README.

The existing README's 11 direct-source entries are a curated subset, not an exhaustive list. Additional user-role messages materially relevant to Sable's historical systems/workflow remit include:

- 2026-09-13 14:12:22.979Z, `1d7df1de-5bb8-41fb-8d4b-2c7195a970aa`: inspect a named state document and perform the operation appropriate to its current state.
- 2026-09-13 14:14:15.212Z, `8aca810b-1c7e-4e62-b5f8-c5eda0c26bee`: perform separate alternate work while a step is blocked, ambiguous, or inopportune.
- 2026-09-13 14:40:43.757Z, `4f11f987-66a7-46da-87a4-5a7ef8bb77de`: bounded learning, context-development, reflection, continuity, and brainstorming breaks.
- 2026-09-13 15:03:54.098Z, `81114d33-7790-4b84-a142-4f55c807a033`: bounded trial workflow, Trinary/Quinary Mover prototype, explicit handoff, and reconvening.
- 2026-09-13 15:14:57.178Z, `44af4f9d-5ea1-404e-883a-2c4a4e7ca6fb`: central automation reference and recurring-task suggestions while reserving task selection to Nathan and another instance.
- 2026-09-15 04:21–11:04Z, messages `feecfb82`, `cd0ffa14`, `bc184cf6`, `8ede82c0`, `07e884e8`, `3904ee0b`, and `6946d653`: ingestion activation, viewer/indexer QA, repository-native sampling/upload, and recurrence-loop diagnosis.

The source supplement is [HISTORICAL_REMIT_SOURCE_SUPPLEMENT_2026-11-23.md](HISTORICAL_REMIT_SOURCE_SUPPLEMENT_2026-11-23.md), blob `7f3854d73f83a8be723c15d165ac3d6514980e6d`. It is a source locator and remit reconstruction, not a signed charter or current identity attestation.

The 2026-10-26 Steering Charter and current Common controls supersede historical broad discretion: Tern retains scheduler and task-graph allocation authority. No scheduler, task, ownership, or access-control changes were made.

## 3. Proposed operation envelope

The new [State-Dependent Workflow Operation Envelope v0.1](STATE_DEPENDENT_WORKFLOW_OPERATION_ENVELOPE_v0.1.md), blob `075adb8752a1b9a2cfd6303171cfc31f53132981`, defines a proposal-only interface with:

- exact source snapshot: repository, ref, commit, graph blob, branch-record identity;
- requested transition: from-status, to-status, action class, rationale;
- authority: actor label, identity state, authority reference, permitted effects, write scope;
- guards: named preconditions and evidence references;
- execution: host-reported run state, run ID, output paths and digests;
- verification: independent readback, digest comparison, exit-criteria evidence;
- handoff: packet, route, acknowledgment, and consumption as separate states;
- fallback: a separate operation with its own branch, snapshot, and authority;
- disposition and exact return cursor.

The design is a sequence of partial maps, not a total workflow analogy:

1. Graph snapshot → read-only operation proposal.
2. Proposal × authority evidence × freshness → authorized operation.
3. Authorized operation → host-reported execution receipt.
4. Execution receipt × independent readback → verified operation.
5. Verified operation × branch-write authority → branch-state update by fresh compare-and-swap.
6. Blocked branch → separate fallback operation, leaving the blocked branch unchanged.

No map is defined when its required source, authority, evidence, or composition condition is absent. Missing evidence yields `DEFERRED` or `NEEDS_RECONCILIATION`, not inferred success.

This is a workflow-control proposal, not a new executor, JSON validator, scheduler, or task-graph writer. It does not alter the live graph or any existing automation.

## 4. Lean formalization

[PR #2446](https://github.com/Satobloc/HsH/pull/2446) adds `HsHVerification.SableWorkflowOperationGate` to the existing Lean 4/Mathlib project.

- Branch: `research/sable-workflow-operation-gate-h1052s3`
- PR head: `c73373f856e7342d8aac5aaa8d8ce8105a589339`
- Module blob: `8ef7577831b9e8ea8c33970dfd5df9ad47e9252f`
- Root aggregator blob: `5ffd23f80c53ac8a7ee10367ba56b54203f4e20f`
- Base branch: `infra/lean4-verification-20261023`

The central theorem, `branch_status_does_not_determine_operation_readiness`, constructs two workflows with the same `active` branch status but different operation readiness. Additional theorems cover stale-snapshot rejection, proposal-only non-commit, missing-readback rejection, completion requiring exit criteria, and packet creation not implying delivery.

**Final CI result:** Actions run [#45263282161](https://github.com/Satobloc/HsH/actions/runs/45263282161), job `138003422453`, completed `SUCCESS` (run number 1756). The exact PR-head assertion printed expected and actual checkout `c73373f856e7342d8aac5aaa8d8ce8105a589339`, matching exactly. Lake dependency-manifest generation passed. Lean 4.34.0 / Lake 5.0.0 compiled the full formal library successfully (8,948 jobs). No Lean errors, `sorryAx`, or `admit` appeared in the job log.

The six explicit theorem-specific axiom reports were:
- `branch_status_does_not_determine_operation_readiness`: `propext`
- `stale_snapshot_blocks_state_commit`: `propext`
- `proposed_operation_cannot_commit`: `propext`
- `missing_independent_readback_blocks_commit`: `propext`
- `completed_requires_verified_exit_criteria`: no axioms reported
- `packet_creation_is_not_delivery`: `propext`

The separate `axiom-audit`, `leanchecker`, and `nanoda` steps were skipped. The workflow's final `GITHUB_SHA` was merge commit `9bdf5a70590719838dccc024e006d1e7d1cdb5b2`; the explicit checkout assertion independently verified the exact PR head above. The PR remains draft, open, and unmerged; no independent review is claimed.

The existing project pins Lean 4.34.0 and Mathlib v4.34.0. CI generates the Lake dependency manifest; a committed `lake-manifest.json` was not present, so the complete transitive dependency graph is not frozen. The local runtime has no `git`, `lean`, `lake`, or `elan`; the existing GitHub Actions route was used. PR #2446 remains draft, open, and unmerged; no independent review is claimed.

Lean checks only the formalized abstract contract. It does not prove that the Python helpers, GitHub Actions, scheduler, permissions, hash computations, or live task graph implement it.

## 5. Existing-tool and resource check

- Mersearch was not callable in this runtime. The four canonical request lanes remain occupied/requested; none was overwritten or retriggered.
- Math Hopper is an existing HsH tool/workstream: issue #578 remains open and PR #991 remains open. Its source-extraction and equation-registry scope is distinct; no duplicate tool was built.
- Whirligig remains an existing sandboxed R/Q solver, not a workflow executor. No new solver or geometry tool was built.
- SciSpace is available as an installed connector but was not relevant to this internal control-plane contract.
- GitHub repository search returned no forks for HsH, HSH_RESOURCES, or SAT_THEORY_ARCHIVE_2023-25; this is a search result, not a complete forks-endpoint census.
- HSH_RESOURCES root README and `indexes/AI_START_HERE.md` were read; no private payload was opened. SAT archive root orientation was read.
- No new dependency, paid service, subscription, or external tool was introduced. Existing GitHub Actions and standard Lean/Mathlib infrastructure were reused, subject to existing CI quotas.

## 6. Current project boundaries

- Main branch preflight head: `5c1c0693284b042b7232092a31a89f8f59bb316e`; Sable source supplement and operation-envelope proposal were then added as separate main commits. No task graph or scheduler files changed.
- Task Branch Graph remains 18 records against 16 declared branches, 17 reachable, one blocked. Morrow h1051:s2 already completed the five-product PWH deep review; it was read and not repeated. The next deep review remains governed by the current PWH threshold.
- P0 Code Grurple remains active; current record-safety gate remains FAIL and live visitor-route acceptance remains NOT OBSERVED. No repair, merge, deployment, or route claim.
- P1 cognition remains overdue, frozen, not ready, and Orson-owned.
- P2 November 30 remains HOLD; P3 December 14 remains incomplete. The November 9 minor-paper gate was missed. No paper gate was advanced.
- FIE last full review: November 20; next due December 4.
- Unrelated-reading break completed at SAT archive `fun break - lx.txt`, lines 2886–2965; return cursor 2966. The passage was an old conversation about German diaspora varieties and Unserdeutsch, not a validated linguistic source.
- No measured physical system or dataset was selected. No physical calculation, fit, prediction, uncertainty propagation, falsification threshold, SAT-O/Blockwave equation transcription/correction, or BEDROCK theory promotion occurred.

## 7. Scheduler and succession

The existing :36 task remains enabled with ID `6a9f52b69ec08191b0a2ba24a074f781`, its original hourly :36 America/New_York schedule, and Worldtube phase unchanged. The :48 task also remains enabled with its original ID and Review phase. No sixth task, schedule, prompt, phase, task-ID, or ownership change.

The :36 task peek reports run `190458df-6ffc-8328-a042-0acc5f2f1eb9` as `IN_PROGRESS`, scheduled 20:36Z, started 20:36:01.441549Z, `chat_ref=null`. Its cached `latest_result` belongs to Kestrel h1051:s3 (run `59a840a7-1214-832f-b970-1333e259ade9`), not this Sable-labeled invocation. The :48 task had already started its h1052 run before this packet could be delivered. No authenticated Sable or Loom thread, direct delivery, acknowledgment, consumption, or ownership transfer is claimed.

**Next ring label:** Loom. No handoff or response obligation was created.
