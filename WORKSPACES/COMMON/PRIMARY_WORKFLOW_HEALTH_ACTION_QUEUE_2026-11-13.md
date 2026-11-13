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
- Current status (h814:s3): draft PR #1710 is open; PR mergeability has fluctuated across peeks, latest true, but no GitHub Actions CI run is observable. Vercel's daily deployment-rate-limit failure is not a code-test result. PR #1709 was closed unmerged as superseded. No source rename, date fabrication or main-branch code change occurred; new regression tests are pending execution.
- Next: obtain PR CI/review; after authorized merge, run the full main navigation/backfill workflow and independently verify root rename staging, every source disposition, undatable exceptions, Viewer, chronology, structural index, autotag, Pages deployment and exact readback.
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
- Current status (h813:s3 Aster reconciliation): all four canonical requests remain requested/HELD. Lanes 1, 3 and 4 triggered but were cancelled after runner-shutdown signals; Lane 2 search completed and generated manifest/compact receipt, but publication failed on GH001 because the raw JSON was 352.48 MB and Markdown 59.64 MB. Query text is exposed in public request/workflow surfaces; bridge is PUBLIC-QUERY-ONLY. No lane was retried, overwritten or released.
- Next: after Tern authorizes release of one occupied lane, run one controlled public-only request through the compact-only bridge; verify immutable request blob -> trigger -> run/attempt/job -> manifest -> compact receipt -> independent readback -> release. Do not use private/sensitive queries until input and log isolation exist.
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

### WH-06 — Repository issue and fork governance audit
- Source: HsH issue #1705.
- Objective: determine whether the 1.4k open issue backlog and reported 100+ forks are deliberate/governed or process-generated accumulation; separate issue counts from pull requests and actual forks from branches, clones, mirrors and network counts.
- Initial verified snapshot (2026-11-13): HsH has 1,443 open issues + 194 open PRs = 1,637 combined `open_issues_count`; HsH, Glass, HSH_RESOURCES and Factory Floor each report `forks_count=0`. A 17-repository account inventory currently identifies 8 actual owned forks (Soxieu, satoskills, mission-control-satb, nlab, reap, draft_sketch_prove, VapeRE, Apollo-11) and 9 non-forks. Their parent-network `network_count` values range from 6 to 112,260 and are not the number of forks owned by the account. The 100+ figure may be a network-count confusion, but its exact UI/source remains unconfirmed. A fresh issue search found 1,376 open `[HSH-PUBLISH-V1]` intake issues out of 1,444 total open issues (95.3%). All 1,444 open issues are authored by Satobloc; the remaining 68 are not publisher-prefixed. The 194 open PRs are a separate category. Seven sampled records have verified `PUBLISHED` comments but remain open and unlabeled. The publisher script posts a verified-publication comment but never closes or labels the issue. This is a confirmed lifecycle omission and a major backlog-inflation mechanism; do not mass-close. Design and test a verified terminal-state policy.
- Next: preserve paginated issue/PR and repository/fork snapshots; classify creation patterns and issue lifecycles; inspect issue-producing workflows for unbounded generation, duplicate creation and missing idempotency; identify fork lineage and provenance. Preliminary search found an issue-opened publisher consumer, not yet a confirmed issue creator.
- Coordinator: Tern / Comptroller for cross-repo census; HsH workflow maintainer for issue-generation audit.
- Exit: source-backed counts, taxonomy, root-cause assessment, intentional-vs-accidental fork disposition, and non-destructive repair proposal. No mass-close, fork deletion, detachment or visibility change without separate authorization.

## Deadline escalation — Nathan Direct, 2026-11-13
- **Cutoff: 2026-11-14 15:56 America/New_York.**
- At the cutoff, every WH-01 through WH-08 item that has not reached its documented exit criteria is automatically promoted from the standing P2 maintenance portfolio to **P1 / HIGH**. Do not require another user prompt or a new issue to trigger this promotion.
- The next actual activation of any enabled Workshop Relay must pick up the highest-priority unresolved item from this queue, record the exact item and next action, and continue work. Other enabled relays inherit the same durable queue; do not create a fifth/sixth task or change any existing schedule, ID, phase or enabled state.
- "Corrected" means the acceptance/exit criteria are met and independently read back or tested. Issue creation, a proposed fix, fallback research, or a successful workflow run without output verification does not count.
- If an item is still blocked at cutoff, it remains open, becomes P1 / HIGH, and must carry the exact blocker, first failing transition, owner/coordination lane, smallest next action, dependency and return route. Do not mark blocked work complete.
- P1 escalation does not override P0 emergencies or Nathan's protected P1 commitments. Within the available operational portfolio, prioritize by dependency leverage and unblock potential, with Mersearch and core archive/navigation reliability ahead of downstream expansion unless new evidence changes the order.
- Each activation must read this deadline rule and compare the current time with the cutoff; the rule is durable and survives this conversation ending.

### WH-07 — Recover missing project tracker / Project Desk lineage
- Source: HsH issue #1706.
- Likely lineage: 2026-09-30 `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HsHTRACKING.txt`; Project Desk control contract and intervention queue; HSH_RESOURCES TOP/CENTRAL/BRANCH/HYDRA + THREADING prototypes; Sable handoffs and HsH operationalization note. This is a candidate, not yet confirmed as the exact worker-built tracker.
- Current observation: the Project Desk contract and intervention intake survive, but a complete live dashboard implementation was not found in the HsH tree under Project Desk naming. Switchboard/Threading executable POCs survive in HSH_RESOURCES but are explicitly sandboxed and not production authority. HsH PR #951 is open/draft and not merged.
- Next: recover the exact worker artifact from commits, branches, PRs, issues, publication payloads and conversation exports; compare its schema/features with the Project Desk request; classify each component as missing, stranded, unimplemented or superseded; restore with provenance and independent tests.
- Do not replace or overwrite surviving POC/contract artifacts. Do not assume Project Desk and Switchboard are identical.

### WH-08 — Recurring orphan-project census and disposition
- Source: Factory Floor issue #19.
- Existing ledgers: HSH_RESOURCES `indexes/ORPHAN_LEDGER.md`; Glass `.[⚙️_AI_FILES]/SHARED_RESOURCES/ARCHIVE_ORPHAN_LEDGER.md`; Glass `ARCHIVE_ORPHAN_AND_MISC_HEURISTIC.md`.
- Existing guidance already says folder names are weak relevance signals, miscellaneous/old/unsorted folders require deliberate sampling, source artifacts should stay in place by default, and search-index silence is not absence. The ledgers currently capture file/provenance orphans, not a complete project portfolio with reintegration/archive decisions.
- Next: create a cross-repo project register and recurring scan receipts across HsH, Glass and HSH_RESOURCES. Each project gets ACTIVE_REINTEGRATE, PARKED_REVIEW, ARCHIVED_VALUABLE, SUPERSEDED_LINKED, DUPLICATE_LINKED, QUARANTINED, or UNRESOLVED with provenance, investigative value, owner/return route, rationale and review trigger.
- Cadence: lightweight delta scan every actual relay activation; deep cross-repo census at least every five completed worker activations and after major archive intake or branch/fork/workflow changes. Use existing relays only.
- Preserve the 2026-09-13 quarantines; archive/relevance does not grant authority or reactivate a halted lane.

## Updated deadline escalation
At 2026-11-14 15:56 America/New_York, every unresolved WH-01 through WH-08 item automatically becomes P1 / HIGH. The next existing Workshop Relay activation picks the highest-priority unresolved item; no new scheduled task or scheduler change.


## H814:s3 progress and priority selection — 2026-11-13
- WH-05 remains the highest-priority item overall but is blocked at its controlled-test/release gate because all four request lanes remain occupied and Tern has not released one. No retry or overwrite is authorized.
- WH-02 was selected as the highest-priority unblocked core archive/navigation repair. Draft PR #1710 is the sole active proposal; #1709 is closed as superseded. WH-02 remains OPEN until CI/review, merge, full navigation acceptance and independent readback are complete.
- The next actual activation should continue WH-02 only if it remains the highest-priority unblocked item; otherwise re-evaluate the queue. No task graph or scheduler mutation was made.
