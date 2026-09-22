# Instance Onboarding Review State

**Status:** CLEAN COLD-START PASS RECORDED / MONITOR  
**Current as of:** 2026-09-21

Purpose: track whether the central onboarding material remains accurate enough for new, newer, reassigned, and revived instances to navigate all three SAT/H(s)H repositories and their tools without relying on oral tradition.

## Current material-change flag

`CARPE_TURNEM_POLICY.md` was added on 2026-09-20 and integrated into the onboarding path. This is a material onboarding change. Established workers should absorb it at their next appropriate control/onboarding review; after absorption it does not require full rereading every recurrence.

A 2026-09-21 cold-start review found and repaired a stale orientation pointer in `INSTANCE_ONBOARDING_3REPO.md`: the guide had still routed fresh instances to historical `CURRENT_WORKFLOW_ORIENTATION.md` in two places even though `NEW_INSTANCE_START_HERE.md` correctly designated `CURRENT_WORKFLOW_ORIENTATION_V2.md` as current. The three-repository guide now points to V2 and explicitly labels the unversioned file historical. Treat that repair as absorbed once an instance has read the 2026-09-21 guide; it does not itself require repeated full-package rereads.

A second 2026-09-21 cold-start pass found that `NEW_INSTANCE_START_HERE.md` told a fresh worker to inspect the current task/branch, directive, milestone, check-in, handoff, and lease state without naming the live files. That ambiguity is now repaired: the start-here surface explicitly names the live control-plane files while retaining the instruction to read only the portions needed for the immediate bounded task.

A third 2026-09-21 cold-start pass found a scope/authority ambiguity in the new pointer block: `NATHAN_DIRECT_WORKFLOW_STATE.md` had been presented as if it supplied generic project-wide phase/milestone state, although it is specifically the Nathan Direct corpus/provenance lane state. `NEW_INSTANCE_START_HERE.md` now routes project-wide purpose/phase through `CURRENT_WORKFLOW_ORIENTATION_V2.md`, active-edge/milestone routing through `TASK_BRANCH_GRAPH.json`, directive authority through the current provenance/Common surfaces, and `NATHAN_DIRECT_WORKFLOW_STATE.md` only when the selected work actually enters that lane. This repair is also QA history, not a cold-start certification.

## Required onboarding sources

Primary guide: `WORKSPACES/COMMON/INSTANCE_ONBOARDING_3REPO.md`  
Execution rule: `WORKSPACES/COMMON/CARPE_TURNEM_POLICY.md`

The guide must cover, and periodically re-check:

- shared project workflow and current-state entry points;
- Carpe Turnem execution discipline: act on already-authorized safe next steps in the current turn rather than ending on empty agreement;
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25` purpose, front doors, Dashboard/AI-files orientation, archive indices, admin/tooling conventions;
- `Satobloc/HsH` purpose, Common/current-state surfaces, conversation/viewer/index tooling, live workflow conventions;
- `Satobloc/HSH_RESOURCES` purpose, permitted resource/index/extraction/bibliography surfaces, exposure controls, and strict `PRIOR_ART` boundary;
- cross-repository source identity and routing rules;
- tool discovery: inspect existing tools before inventing replacements;
- current task/branch, handoff, check-in, revival, and scheduler/instance-pool conventions.

## Who must review it

Review is required when an instance is:

1. new to the project;
2. newly connected to the current workflow after substantial project evolution;
3. revived from an older historical instance;
4. reassigned into a repository/tooling environment it has not used recently;
5. showing navigation/tool-use errors that suggest stale orientation;
6. active when a material onboarding change is flagged and has not yet absorbed it.

Routine established workers do not need to reread the entire guide every recurrence. They should reread only when one of the triggers above applies or the guide has materially changed.

## Completion test

An instance is adequately onboarded when it can locate and explain:

- current central purpose/phase;
- current task/branch state;
- current directive and milestone state;
- where Common coordination/check-ins/handoffs live;
- which of the three repositories is authoritative for the material/task at hand;
- the repository-specific front doors and relevant tools;
- quarantine/exposure constraints;
- how to leave a durable checkpoint/return route;
- how to discover existing tools before creating new infrastructure;
- when Carpe Turnem requires immediate safe execution versus when a blocker/decision/freeze legitimately prevents it.

## Cold-start validation state

The 2026-09-21 cold-start validation first produced three real navigation defects:

1. `INSTANCE_ONBOARDING_3REPO.md` disagreed with `NEW_INSTANCE_START_HERE.md` about which workflow-orientation document was current. Repaired.
2. `NEW_INSTANCE_START_HERE.md` named categories of live control state without naming their actual control surfaces, forcing a new worker to infer which similarly named Common files were current. Repaired by adding explicit live-control-plane pointers.
3. The resulting pointer block over-scoped `NATHAN_DIRECT_WORKFLOW_STATE.md` as though it were generic project-wide phase/milestone authority. Repaired by separating project-wide orientation/task-graph routing from Nathan Direct lane state.

### First clean cold-start pass — 2026-09-21

A fresh validation starting only from `NEW_INSTANCE_START_HERE.md` and the surfaces it explicitly routes to recovered all seven required items without oral correction or guessed repository paths:

1. **Live central task/branch state:** `TASK_BRANCH_GRAPH.json` is explicitly named by Start Here and exposes branch status, dependencies, active edge, next cursor, and return route.
2. **Current directive and milestone state:** Start Here separates project-wide phase (`CURRENT_WORKFLOW_ORIENTATION_V2.md`), active-edge/milestone routing (`TASK_BRANCH_GRAPH.json`), and directive authority/provenance (`NATHAN_DIRECTIVES_PROVENANCE.md` plus newer explicitly controlling Common artifacts). It no longer misuses the Nathan Direct lane state as generic project authority.
3. **Common check-in/handoff surfaces:** `CHECKINS.md` and `HANDOFFS.md` are explicitly named; the orientation also routes routine questions through Common/Q&A surfaces.
4. **Active/paused execution-lease state:** `ACTIVE_AUTOMATION_ROSTER.md` and `INSTANCE_REGISTRY_EXECUTION_LEASES.md` are explicitly named and correctly distinguish scheduled leases from paused/unscheduled/historical instance identity.
5. **Three repository roles/front doors:** `INSTANCE_ONBOARDING_3REPO.md` gives distinct purposes, start-here surfaces, operational conventions, and cross-repository routing for `SAT_THEORY_ARCHIVE_2023-25`, `HsH`, and `HSH_RESOURCES`.
6. **Quarantine/exposure rules:** the onboarding package explicitly preserves strict `PRIOR_ART`/private quarantine, exposure history, source-role separation, and repository-specific evidentiary roles.
7. **One executable bounded task:** the live task graph itself exposes `CTRL-05` as the bounded cold-start validation operation with an explicit completion test; the current prompt/lease also authorizes taking the highest-value bounded operation immediately.

**Result:** the onboarding package now satisfies the `CTRL-05` cold-start exit criterion on this pass. No fourth documentation defect was found. Do not manufacture additional onboarding edits merely to keep the branch active.

**Routing disposition:** `CTRL-05` is ready to be marked completed in `TASK_BRANCH_GRAPH.json`; once that graph reconciliation is made, parent `CTRL-2026-09-20-GENERALIST` may also be evaluated against its exit criterion because cold-start QA was its remaining stated dependency. This file records the QA result; the task graph remains the routing authority.

**Next cursor:** reconcile the task graph to this clean-pass result, then return execution capacity to the highest-value substantive active edge. Re-open onboarding QA only on a material-change trigger or a concrete navigation/tooling failure.

## Maintenance trigger

Any worker who encounters a stale path, missing tool explanation, changed repository role, confusing front door, undocumented workflow, or recurring empty-agreement behavior should open/update an onboarding-documentation or workflow task rather than silently working around the defect.

The Comptroller/generalist workflow should periodically choose a bounded onboarding-review operation when:

- major workflow/milestone changes occur;
- repository control surfaces change;
- new tooling is introduced;
- revived/new instances repeatedly ask the same navigation question;
- a repo-specific orientation is discovered to be misleading or incomplete;
- workers repeatedly acknowledge settled actions without executing them despite having authority and tools.

Onboarding is infrastructure, not theory authority. Keep it concise, current, navigational, and explicit about uncertainty/status boundaries.
