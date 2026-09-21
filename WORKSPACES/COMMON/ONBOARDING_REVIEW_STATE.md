# Instance Onboarding Review State

**Status:** ACTIVE / CONTROL SURFACE  
**Current as of:** 2026-09-21

Purpose: track whether the central onboarding material remains accurate enough for new, newer, reassigned, and revived instances to navigate all three SAT/H(s)H repositories and their tools without relying on oral tradition.

## Current material-change flag

`CARPE_TURNEM_POLICY.md` was added on 2026-09-20 and integrated into the onboarding path. This is a material onboarding change. Established workers should absorb it at their next appropriate control/onboarding review; after absorption it does not require full rereading every recurrence.

A 2026-09-21 cold-start review found and repaired a stale orientation pointer in `INSTANCE_ONBOARDING_3REPO.md`: the guide had still routed fresh instances to historical `CURRENT_WORKFLOW_ORIENTATION.md` in two places even though `NEW_INSTANCE_START_HERE.md` correctly designated `CURRENT_WORKFLOW_ORIENTATION_V2.md` as current. The three-repository guide now points to V2 and explicitly labels the unversioned file historical. Treat that repair as absorbed once an instance has read the 2026-09-21 guide; it does not itself require repeated full-package rereads.

A second 2026-09-21 cold-start pass found that `NEW_INSTANCE_START_HERE.md` told a fresh worker to inspect the current task/branch, directive, milestone, check-in, handoff, and lease state without naming the live files. That ambiguity is now repaired: the start-here surface explicitly names `TASK_BRANCH_GRAPH.json`, `NATHAN_DIRECT_WORKFLOW_STATE.md`, `CHECKINS.md`, `HANDOFFS.md`, `ACTIVE_AUTOMATION_ROSTER.md`, and `INSTANCE_REGISTRY_EXECUTION_LEASES.md`, while retaining the instruction to read only the portions needed for the immediate bounded task.

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

The 2026-09-21 cold-start validation has so far produced two real navigation defects rather than a clean certification:

1. `INSTANCE_ONBOARDING_3REPO.md` disagreed with `NEW_INSTANCE_START_HERE.md` about which workflow-orientation document was current. Repaired.
2. `NEW_INSTANCE_START_HERE.md` named categories of live control state without naming their actual control surfaces, forcing a new worker to infer which similarly named Common files were current. Repaired by adding explicit live-control-plane pointers.

These repairs improve the package but do **not** constitute a successful cold-start certification by themselves.

**Next cursor:** continue the cold-start validation from the twice-corrected package. Starting only from `NEW_INSTANCE_START_HERE.md` and documents it routes to, verify that a fresh/revived worker can now recover without oral correction: (1) live central task/branch state, (2) current directive and milestone state, (3) Common check-in/handoff surfaces, (4) active/paused execution-lease state, (5) the distinct roles/front doors of all three repositories, (6) quarantine/exposure rules, and (7) one executable bounded task. Record any missing or ambiguous pointer as an onboarding defect. If all seven are recoverable, record the first clean cold-start pass rather than continuing to manufacture documentation changes.

**Exit criterion:** a cold-start pass can recover the completion-test items above from current repository state without stale-path correction or undocumented oral knowledge.

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
