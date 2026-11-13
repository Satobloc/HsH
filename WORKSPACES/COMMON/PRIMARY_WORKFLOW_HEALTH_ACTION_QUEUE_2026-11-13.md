# Primary Workflow Health and Corrective Work Queue

**Created:** 2026-11-13  
**Status:** ACTIVE / standing upkeep + durable pickup queue  
**Authority:** Nathan Direct, 2026-11-13; coordinated with Tern's existing task-graph/scheduler authority  
**Scope:** HsH, SAT_THEORY_ARCHIVE_2023-25 (Glass), HSH_RESOURCES, Mersearch and FACTORY_FLOOR  
**Scheduler constraint:** Preserve the four existing enabled relay IDs, hourly America/New_York phases :00/:24/:36/:48 and their enabled states. :12 remains disabled. No fifth/sixth scheduled task or recurrence.

## Purpose

Primary Workflow Health is part of the primary workflow, not an occasional side project. Every actual worker activation checks whether the machinery needed to do its work is functioning, whether previously observed failures have been diagnosed, and whether unfinished maintenance has a durable pickup route.

This queue is persistent. If an item cannot be completed in the current activation, update its exact status, evidence, owner/coordination lane, smallest next action, dependencies, review trigger and return route. The next eligible activation picks up the highest-priority unblocked item without duplicating work or displacing protected P0/P1 commitments.

## Standing per-activation health check

1. Read the current workflow orientation, Steering Charter, live task graph, selected worker continuity/current-work record, relevant open issues and recent canonical receipts/handoffs.
2. Check relay health: enabled task IDs/schedules/phases unchanged; task graph node/edge counts and reachability; task-to-owner/next-cursor consistency; run/receipt/publisher/readback state; failed/cancelled/pending workflows; stale pointers; orphaned or blocked work.
3. Check archive/index health: date-tag coverage and root inclusion; index freshness and build/test/deployment results; newly uploaded or changed files and their intake receipts; unassayed/unread/unrouted backlogs.
4. Check Mersearch health: four canonical lane identities, request IDs, request snapshots, trigger commits, matching Actions runs/jobs/attempts, manifests, receipts, publication/readback and release state.
5. Check Repo-to-Factory-Floor health: cross-repo intake coverage, source hashes/back-pointers, assay state, lifecycle validation, geometry-first gate and unauthorized status promotions.
6. Identify the first concrete failing transition. Execute at most one safe, bounded, reversible repair when it does not displace higher-priority work. Otherwise create/update the existing issue/action plan with exact evidence and next action.
7. Record what was inspected, what passed/failed/was not observable, exact source/run/blob identifiers, repair attempted, verification result and next cursor. A checkmark requires evidence; absence of evidence is UNKNOWN, not PASS.

## Failure-handling rule

Fallback is a continuity mechanism, not a repair. When a tool, lane, workflow or index is blocked:
- make one bounded attempt using documented diagnostics;
- identify whether the failure is access, trigger, queue/concurrency, runtime, dependency, execution, output publication, readback or lifecycle/release;
- do not repeat an unchanged ineffective attempt;
- use a labelled fallback only to preserve bounded progress;
- keep the underlying maintenance item open until root cause is fixed or a defensible external blocker is recorded;
- never overwrite occupied work, fabricate completion, or claim cross-thread delivery/acknowledgment without evidence.

## Durable pickup queue

### WH-01 — Clone footprint and telemetry
- Source: HsH issue #1703; existing CLONE_LEDGER_STANDARD.md and census plan.
- Objective: append-only event ledger across HsH, Glass and HSH_RESOURCES; distinguish actual clones, Actions checkouts, non-clone access and provisioning-unknown; persist daily Traffic snapshots and reconcile bounded windows.
- Next: inspect complete per-repo Actions run/job/attempt checkout evidence and determine supported daily Traffic capture route.
- Coordinator: Tern / Comptroller.
- Exit: reproducible repository/day/workflow counts, retained raw snapshot/hash, uncertainty and residual bounds; no inferred unique humans.

### WH-02 — Conversation dating, tagging and chronology coverage
- Source: HsH issue #1702; date-tag scripts/workflow/manifests.
- Objective: suffix-independent content-based discovery across root and sorted folders; explicit undatable exceptions; strict audit blocks missing datable tags/collisions but not legitimate undatable records; root included in all aggregate indexes/viewers.
- Next: fix root candidate filter and strict-audit semantics; add suffix/extensionless fixtures; rerun and independently verify Viewer/chronology/autotag publication.
- Coordinator: HsH archive/navigation maintainer; coordinate with Tern for graph state.
- Exit: every discovered source has a disposition; all datable conversations tagged; undatable sources preserved with reason; downstream outputs committed and read back.

### WH-03 — Three-repository document intake and assay
- Source: FACTORY_FLOOR issue #16; HsH, Glass and HSH_RESOURCES existing extraction/index/bibliography tools.
- Objective: every upload/change receives a source-pinned receipt and distinct inventory, extraction, identification, assay, read, relevance, use/citation or exclusion status.
- Next: dry-run cross-repo delta scanner against pinned commits; reconcile counts and random source/hash samples before enabling bounded queues.
- Coordinator: Factory Floor intake/workshop maintainers; Tern coordinates cross-repo dependencies.
- Exit: no eligible source silently disappears; unsupported/errors/unread/OCR-needed/duplicate/private items have explicit state and next action.

### WH-04 — Repo-to-Factory-Floor pipeline
- Source: FACTORY_FLOOR issues #17 and #18; existing lifecycle schema and geometry-first admission gate.
- Objective: adopt versioned lifecycle contract, source-linked intake, workshop assay, reproducible derivation, exact geometry packet and independent hostile review where required.
- Next: reconcile proposal/schema/README authority; validate schema and transition fixtures; dry-run migration; build bounded end-to-end fixture across relevant object types.
- Coordinator: Factory Floor lifecycle owner; Tern retains graph/scheduler coordination.
- Exit: source-to-workshop receipts and independent readback work; no item promoted by CI/extraction alone; geometry-first gate remains independently enforced.

### WH-05 — Mersearch lane diagnosis and repair
- Source: HsH issue #1704; canonical lane map, pinned Mersearch 1.0, bridge workflows, request-scoped manifests/receipts.
- Objective: diagnose persistent occupied/requested lanes with absent outputs; repair actual trigger/execution/publication/release defect rather than relying on fallback or repeating ineffective attempts.
- Next: build a four-lane state reconciliation from exact request blob -> trigger commit -> workflow run/attempt/job -> manifest/receipt commit -> readback -> release; identify first failing transition.
- Coordinator: Tern / Comptroller for lane/task graph coordination; bounded technical diagnosis may be performed by any worker.
- Exit: each of four lanes has evidence-based disposition; at least one controlled request completes with manifest + compact receipt + independent readback; failure/release/retry semantics tested; no sensitive query leakage.

## Priority and scheduling

- This is a standing P2 systems-maintenance portfolio, subordinate to active P0 controls, protected P1 commitments, and any higher-priority explicit Nathan Direct.
- Workers may execute one safe upkeep action per activation under the Steering Charter. Unfinished items remain in this queue and are eligible for later pickup.
- Perform the existing deeper open-work sweep at least once per five actual completed worker activations and earlier after material failure, milestone, dependency change or stranded recurring work.
- Do not create separate scheduled tasks for these workstreams. The existing four relays perform the upkeep scan; Tern reconciles graph ownership and priorities.
- Do not count scheduler starts, ring labels, or cached latest-result pointers as completed activations or evidence of work.

## Evidence and reporting template

For each activation record:
- workflow_health_status: PASS / DEGRADED / BLOCKED / NOT_OBSERVED
- surfaces_checked: exact repos, files, workflows, issues, runs
- confirmed_failures: exact first failing transition and evidence
- repair: action or NONE with reason
- verification: independent readback/test or NOT_VERIFIED
- queue_delta: item IDs added/advanced/parked and why
- next_pickup: one exact item and smallest next action
- scheduler_integrity: four IDs/phases/enabled states checked; no scheduler mutation

No global PASS if a critical surface was not inspected. Report partial coverage explicitly.
