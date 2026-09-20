# SAT/H(s)H Instance Onboarding — Three-Repository Orientation

**Status:** CURRENT / REQUIRED FIRST-PASS ORIENTATION  
**Current as of:** 2026-09-20  
**Purpose:** give new, newer, revived, or reassigned instances a fast, safe route into the live project without assuming that all three repositories work the same way.

## First principle

Do not begin by wandering the repositories or assuming your historical role still defines your work. Start from the current shared workflow state, then use the repository-specific orientation below.

Read first:

1. `WORKSPACES/COMMON/CURRENT_WORKFLOW_ORIENTATION.md`
2. `WORKSPACES/COMMON/WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`
3. `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md`
4. current central directives / task-branch / milestone state
5. current Common coordination, check-ins, handoffs, Q&A, and automation/instance state

The user-visible ChatGPT conversation title is only a human wayfinding label. It is not task identity, branch identity, or machine identity. Work may be reassigned, rerouted, parked, resumed, or moved between branches without changing conversation titles.

## Shared workflow model

Instances are generalist project editors with different soft strengths, source exposure, methods, and history. Recurrence slots are temporary execution capacity, not permanent jobs. Check the current task list before acting. Pick one bounded high-value task, avoid duplicating work already done, leave durable state, and make handoffs/return routes explicit.

Dashboard plans represent Nathan's strategic intent and design history, not immutable implementation constraints. Preserve the underlying intent and provenance; improve or replace mechanisms when current evidence supports a better route.

Theory-building remains sandboxed. Quarantine remains strict. `PRIOR_ART` and other quarantined/private surfaces are off-limits except through explicitly cleared interfaces.

---

# Repository 1 — `Satobloc/SAT_THEORY_ARCHIVE_2023-25`

## What this repository is for

The old SAT archive is primarily the preservation, provenance, genealogy, source-recovery, historical wayfinding, and reconstruction repository. It is sedimentary: current formulations, superseded branches, experiments, audits, conversations, synthesis documents, tools, and stray artifacts coexist.

Do not infer currentness from file location, polish, filename, or age.

## Start here

- root `README.md`
- `..[🎛️_NATHAN_DASH]/!_DASHBOARD.md`
- `..[🎛️_NATHAN_DASH]/📖_SAT_ARCHIVE_READING_PLAN.txt`
- `..[🎛️_NATHAN_DASH]/📋_PRIORITY_TODO.txt` as historical/current-intent evidence, not absolute marching orders
- `..[🎛️_NATHAN_DASH]/🗄️_ARCHIVE_INDEX.txt` as a wayfinding ledger, not a substitute for reading sources
- `.[⚙️_AI_FILES]` orientation/wayfinding/control documents where relevant

## How to use it

Follow a map-first approach. Use indices and Dashboard surfaces to locate candidate sources; then read the underlying source documents before making substantive claims. Preserve exact paths, source identity, chronology, duplicate/prefix/superset relationships, and coverage limits.

Useful working principle: **index first, semantic tagging second**.

When reconstructing SAT, distinguish at least:
- Nathan-authored statements
- assistant/LLM formulations
- current vs historical vs superseded material
- definitions vs derivations vs conjectures vs interpretation
- source testimony vs later synthesis

## Tooling / operational conventions

This repository has historical admin/tooling under `.[⚙️_AI_FILES]`. Before inventing a new archive operation, inspect existing tools, requests, logs, and lessons learned. Prefer extending durable repo-local machinery over making one-off ad hoc workflows.

The Dashboard is a programme switchboard and design-history surface. Treat it as intention + wayfinding, not theory authority.

---

# Repository 2 — `Satobloc/HsH`

## What this repository is for

`HsH` is the live working repository: current workflow, current-status controls, full-conversation preservation/navigation, active reconstruction, sandbox theory-building, formalization, worker coordination, handoffs, current tools, and cross-repo wayfinding.

This is normally the first repository to consult for **what the project is doing now**.

## Start here

- root `README.md`
- `WORKSPACES/COMMON/CURRENT_WORKFLOW_ORIENTATION.md`
- `WORKSPACES/COMMON/WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`
- `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md`
- current Common coordination/check-in/handoff/Q&A surfaces
- current task/branch, directive, milestone, automation, and instance-state surfaces as they are established/maintained
- current hypothesis/status notes before assuming old theory terms are live

## How to use it

Check live shared state before choosing work. Do not assume historical instance specialization defines your permitted task. Prefer bounded operations with explicit checkpoints and handoffs.

Use conversation indices/viewers as maps to original conversation material. Preserve source identity and exposure state. Do not promote generated summaries into authority.

Sandbox theory work is allowed where current controls permit it; quarantine boundaries still apply. Keep provenance, currentness, maturity, polish, mathematical correctness, model correctness, empirical compatibility, and quarantine/sandbox status separate.

## Tooling / operational conventions

This repository contains the live worker ecology and shared operational surfaces. Before building a new coordination mechanism, inspect Common and current backend/tooling to avoid duplicate bulletin boards, duplicate task systems, or isolated worker-local state.

When a task crosses worker/branch boundaries, use visible handoff/return routing rather than private dead-end notes.

---

# Repository 3 — `Satobloc/HSH_RESOURCES`

## What this repository is for

`HSH_RESOURCES` is the external-resource / bibliography / extraction / comparison / exposure-evidence repository. It is not the default live-theory workspace and must not silently inject external ontology or interpretive assumptions into SAT/H(s)H construction.

## Start here

- root README / visible orientation and resource-index surfaces
- permitted bibliography, extraction, research-update, source-index, or resource-map surfaces relevant to the assigned task
- any current cross-repo resource/admin guidance referenced from Common or the old Dashboard

## Hard boundary

**Do not enter or inspect `PRIOR_ART` unless an explicitly cleared interface authorizes the specific operation.** Treat it as quarantined/private. Do not infer or publish private quarantine trigger criteria.

## How to use it

Use external resources for clearly labeled purposes such as:
- standard terminology and legibility
- empirical constraints and benchmark data
- bibliography and citation recovery
- source chronology
- comparison/antecedent/priority work through permitted interfaces
- mathematical or technical machinery when current workflow explicitly allows it

Keep external-source influence distinguishable from Nathan/SAT/H(s)H conceptual provenance. If a result may contaminate a blinded/independent derivation or benchmark, record exposure before proceeding.

NotebookLM or generated source indices are wayfinding evidence, not substitutes for underlying documents. Distinguish an index naming a source from a located source and from an inferred/missing source.

## Tooling / operational conventions

Prefer existing extraction/manifests/indexing/bibliography machinery where present. Preserve exact file/source identity, hashes or stable IDs where available, extraction status, and duplicate/superset relationships. Keep machine manifests and human-readable navigation conceptually separate.

---

# Cross-repository rules

The three repositories have different evidentiary roles. Do not homogenize them or move material merely to make their directory structures look alike.

- **SAT archive:** historical preservation, provenance, reconstruction, genealogy.
- **HsH:** live workflow, current controls, conversation preservation/navigation, active sandboxed construction.
- **HSH_RESOURCES:** external evidence/resources, bibliography, extraction, comparison, benchmarking support under exposure controls.

Cross-repo links should preserve source identity and relationship type rather than implying equivalence. Prefer stable native IDs/content identity/hashes plus current path over path-only identity where available.

When unsure where something belongs, ask the central task/branch state and current Common guidance before creating a new surface.

# Tool-use habits for new instances

1. **Inspect before inventing.** Search existing tools/control surfaces before building another workflow.
2. **Use indices as maps, not evidence substitutes.** Read underlying sources when claims depend on them.
3. **Preserve provenance.** Record exact repo/path/source/date/coverage and authorship boundaries.
4. **Work in bounded quanta.** Leave a durable next cursor.
5. **Check shared state before writes.** Avoid stale whole-file overwrites and duplicate coordination systems.
6. **Leave return routes.** Every handoff/question/reassignment needs a visible disposition path.
7. **Respect exposure controls.** Record what you have seen when independence/blinding matters.
8. **Do not manufacture progress.** A useful negative result, blocker, or no-op classification is valid state.
9. **Use soft specialization.** Your strengths should guide task selection, not imprison you in a lane.
10. **Review onboarding again after major workflow/milestone changes.** Newer central directives always control.

# Onboarding completion signal

A newly arriving or revived instance should be considered operationally onboarded only when it can correctly answer, from current repository state:

- What is the project's current phase/central purpose?
- Where is the current task list / branch state?
- What is my currently best available task and why?
- Which repository is authoritative for the source/material I need?
- What are the quarantine/exposure constraints on this task?
- Where do I checkpoint, hand off, and return questions?
- What existing tools should I inspect before creating anything new?
- What is my next bounded cursor?

If those answers cannot be found quickly, treat that as an onboarding/wayfinding defect and improve the documentation rather than relying on oral tradition.
