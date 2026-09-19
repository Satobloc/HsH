# H(s)H Workspace Common Room

This directory is the shared coordination surface for active H(s)H work across agents, threads, and focused workspaces.

Use it for concise information another worker needs: handoffs, blockers, shared questions, wayfinding, role/lane state, current assignments, report pointers, and notices of useful discoveries. It is **not** a source archive, theory synthesis, citation ledger, or dumping ground.

## Start here — current workflow

For a newly arriving or revived instance, begin with:

1. `CURRENT_WORKFLOW_ORIENTATION.md` — current workflow, practical reading order, source hierarchy, reporting, Q&A, blocker escalation, and where outputs belong.
2. `NO_CONVERSATION_RENAMING_POLICY.md` — hard UX rule.
3. `AUTOMATION_WORKFLOW_CONTROL.md` — current workflow control, corrections, cadence, hard boundaries and priority programme.
4. `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md` — autonomy, continuity, handoff, archive stewardship, enrichment and sandbox/quarantine rules.
5. `ACTIVE_AUTOMATION_ROSTER.md` — current recurring worker roster and lane map.
6. `COORDINATION.md` — active routing state; older dated sections are historical unless still explicitly current.
7. `BULLETIN_BOARD.md` — **default Q&A / wayfinding / blocker / direction surface**.
8. `HANDOFFS.md` and `CHECKINS.md` — transfers and recent worker state.
9. the relevant lane/workspace README or checkpoint.
10. `CROSS_LANE_BLOCKER_ESCALATION_RULE.md` — project-wide blocker and unanswered-Q&A escalation.

Newer explicit Nathan directives override older working documents.

## Q&A and wayfinding

`BULLETIN_BOARD.md` is the default go-to for source-location, ownership, routing, dependency, blocker, and other shared project questions.

If a post does not receive a reasonably prompt answer, **any working instance that next receives a direct message from Nathan should elevate that outstanding question to him, regardless of the immediate scope of his message**.

Do not let questions become stranded because they nominally belong to another lane.

## Blockers

Any meaningful workflow blockage should be recorded durably when possible. This includes tool or write failures, missing sources, assignment ambiguity that stalls work, stale unanswered coordination, and missing expected check-ins/reports where silence may indicate a workflow failure.

See `CROSS_LANE_BLOCKER_ESCALATION_RULE.md`.

Missing check-ins are a signal to investigate, not proof of failure.

## Direct assignment authority

When Nathan asks an instance to establish or update a shared assignment, coordination rule, report call, or documentation surface, that instance may make the repo update directly if technically able. Do not route a posting request through another instance solely for publication.

Consult Sable when the issue is genuinely one of cross-lane workflow redesign, cadence, ownership redistribution, or continuity architecture.

## Reports and project self-audit

Substantive reports intended for future reference should be filed in **visible, durable, reasonably discoverable repo locations**, not only in chat, automation prompts, local scratch files, or private lane checkpoints.

Current project-wide report families include:

- **State of Reconstruction reports** — what an instance presently reconstructs/understands, exact source/exposure coverage, current/historical status boundaries, conflicts/gaps, frontier, and what it would now reconstruct differently.
- **Instance Enrichment reports** — demonstrated changes in archive/theory/history familiarity, methodological/epistemic controls, math/physics, coding/formal/tool capability, geometric/visual reasoning, provenance/audit skill, role suitability, and restart quality.

Preserve instance identity, date, and exposure state for longitudinal comparison. Report existence does not confer theory authority.

**Live project-wide call and report-status roster:** `PROJECT_WIDE_REPORT_SERIES_CALL_2026-09-19.md`.

See also `CURRENT_WORKFLOW_ORIENTATION.md` and `WORKSPACES/SABLE/ASSIGNMENT_INSTANCE_ENRICHMENT_STATE_2026-09-18.md`.

## Communication roles

- **Dashboard / indexes / READMEs:** discoverability and stable navigation.
- **Common room:** routing, questions, blockers, handoffs, current assignments and concise shared state.
- **Individual workspaces:** substantial noncanonical work in progress and restart state.
- **Durable report/audit/provenance/index surfaces:** substantive reusable results.
- **Canonical/current theory surfaces:** only where explicitly designated; Common/workspace cleanliness does not imply theory validation.

## Archive and provenance discipline

Important current source surfaces include the HsH repo, the original `Satobloc/SAT_THEORY_ARCHIVE_2023-25`, GLASS, permitted RESOURCES, conversation/raw-export corpus, NotebookLM uploads, and public/podcast record where relevant.

NotebookLM source indices are **wayfinding evidence**, not substitutes for underlying documents. Preserve the distinction between an index naming a source, a source actually located/inspected, and a still-missing source. NotebookLM-generated prose must not be converted into Nathan Direct unless exact attributable quotation/source metadata supports it.

Do not equate `role=user` with sole Nathan authorship when a message contains embedded coauthored or assistant-generated material.

## Diagnostic / archival surfaces

- `QUARANTINE_THEORY_METHOD_CHECKINS.md` — independent first-pass accounts of what each instance thinks SAT/H(s)H currently is and how its methodology works. Diagnostic only; not theory authority.
- `FORMER_INSTANCE_CHECKIN_TEMPLATE.md` / `FORMER_INSTANCE_CHECKINS.md` — archival former-instance reporting.
- `INSTANCE_PLACARDS.md` — short identity/role/capability/workspace cards.

## Record / auditability rules

- `GLASS_SAUSAGE_FACTORY_RECORD_POLICY.md` — repository-first record rule.
- `DURABLE_PROJECT_DOCUMENTATION_CONVENTION.md` — standard route for substantial repo-wide/cross-lane initiatives.
- `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md` — required controls for write-capable scripts/workflows where applicable.

## Tooling / capability planning

- `RESOURCE_CAPABILITY_AUDIT.md` — tools/services/repository capability inventory.
- `LAB_TOOLING_BUILD_PLAN.md` — geometry/solver/testing/reproducibility tooling plan.

## Repository boundary

Public source/provenance cross-linking is primarily between this repository and `Satobloc/SAT_THEORY_ARCHIVE_2023-25`.

Private/reference-only resources must not become unsupported public evidence surfaces. Preserve original bibliographic identity and appropriate provenance when carrying information forward.

## Posting convention

Keep Common entries short enough to scan. A useful entry normally identifies:

`date — from → to/all — subject/type — status/action — source or destination pointer`

When an item becomes stable or consequential, promote it to its proper durable destination and leave a pointer here. Common coordinates work; it should not become the final record by accumulation.