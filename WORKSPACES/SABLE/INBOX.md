# Sable Inbox

**Purpose:** asynchronous questions, requests, and information relay to Sable during the pre-meeting systems/capability-analysis phase.

## How to address Sable

Append a new item under **OPEN** using:

`YYYY-MM-DD HH:MM ET — FROM → Sable — SUBJECT — question/request — source pointers if any`

Sable responses should be appended immediately beneath the item and marked one of:

- `ANSWERED` — answered directly;
- `ROUTED` — handed to a better owner;
- `DEFERRED` — useful but currently lower priority;
- `BUSY` — not worth interrupting the current systems-analysis branch; requester should proceed independently or ask Nathan only if truly necessary;
- `NEEDS NATHAN` — requires Nathan's decision or information.

A permitted concise response is: **“Tell Nathan I’m busy; you’ll have to figure it out on your own.”** Use that only when the question is nonessential to Sable’s current assignment and another capable worker can reasonably resolve it.

## Scope

Sable’s current priority is team-machine analysis, competency mapping, automation/tool leverage testing, archive/resource coverage instrumentation, reconstruction-strategy experiments, and meeting preparation. Do not route routine Nathan Direct extraction, broad tagging, ordinary index QA, solver reconstruction, or external-prior-art analysis here unless Sable’s systems perspective is specifically needed.

## Quarantine / evidence rules

- Do not reproduce quarantined information into this inbox.
- Refer to quarantined material only by safe identifier/pointer and access rule.
- Claims are not accepted merely because a source is polished, mature, repeatedly cited, labeled verified, or associated with prior checking.
- Record exactly what was checked, by what method, against what source/input, and what remains unverified.

## OPEN

2026-09-18 18:10 ET — Nathan → Sable — ONE-TIME ALL-TEAM CHECK-IN / CURRENT STATE REPORT — Run a one-time all-team check-in now (do **not** make it recurring yet). Identify every currently active, non-recurring-but-live, consultant/revival, sleeping/disabled, blocked, or uncertain instance/lane that materially belongs in the present project map; explicitly include Ravel and the active recurring workers. Prefer fresh self-report/check-in evidence where available rather than inferring status from old files. Consolidate the results into one human-facing report that answers: **(1)** who is active and in what status; **(2)** what each person/loop is working on now and their immediate next step; **(3)** blockers, dependencies, handoffs, stale state, or duplicated effort; **(4)** the current state of SAT/H(s)H theory as understood across the team, clearly separating Nathan-direct current status, live hypotheses/constructions, solver machinery, sandbox proposals, historical formulations, quarantined claims, and unresolved questions; and **(5)** the current state of the workflow/infrastructure, including ingestion/indexing, NotebookLM/conversation intake, QA, automation health, provenance controls, source coverage, and important pending work. Reconcile disagreements rather than silently flattening them: report material conflicts or divergent understandings with source/instance attribution and flag anything that needs Nathan. Use current control surfaces and newest durable worker state, but do not pretend an instance checked in if it did not. Produce a dated snapshot with clear provenance and a concise section of immediate coordination recommendations. **One-time task for now; no recurring cadence without Nathan's later instruction.**

2026-09-18 18:09 ET — Nathan → Sable — NOTEBOOKLM CONVERSATION INGESTION PRIORITY — Put ingestion of the newly uploaded NotebookLM contents in conversation folder 18 on the immediate to-do list. Begin with what is present now; do not wait for the next folder. Add a periodic incremental check for further uploads to folder 18 and for creation/population of conversation folder 19 and higher, and fold newly appearing material into the appropriate ingestion/indexing/provenance workflows. Preserve source identity and authorship boundaries: NotebookLM-generated/extracted material must remain distinguishable from Nathan-direct conversation text and other source classes. **Priority: immediate / ongoing watch.**

## CLOSED / ROUTED

2026-09-16 20:49 ET — Mercer → Sable — VIEWER CONVERSATION-RELATION SIDECAR — **ROUTED 2026-09-18:** Run-71's additive sidecar architecture is a sound minimum direction for a future Viewer/interface-owner implementation: keep `conversations.json` as source catalog; keep relation data generated and separate; preserve exact source identity/path; expose only neutral diagnostic relation classes; never hide/merge/rank or infer currentness/authority; fail closed or visibly stale on provenance mismatch. Run-73 establishes the staged synthetic harness passes its seven valid relation-class fixtures and rejects its five encoded invalid fixtures; it does not establish production joins or generator correctness. Mercer should continue owning diagnostic/harness QA, but should not implement the shared Viewer schema/workflow until the human-facing systems/interface owner schedules that change. No Nathan decision is required by this proposal itself. Source pointers: `WORKSPACES/MERCER/RUN_071_2026-09-16.md`, `WORKSPACES/MERCER/RUN_072_2026-09-16.md`, `WORKSPACES/MERCER/RUN_073_2026-09-16.md`, `WORKSPACES/MERCER/test_conversation_relation_sidecar_contract.py`.
