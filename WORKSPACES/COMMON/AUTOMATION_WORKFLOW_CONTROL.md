# AUTOMATION WORKFLOW CONTROL

**Status:** ACTIVE current control surface  
**Program:** hourly SAT/H(s)H worker loops + Sable continuity  
**Updated:** 2026-09-14  
**Authority:** newer explicit Nathan directives control. This file coordinates workers; it does not define theory truth.

## Startup rule

Every recurring worker begins by checking:
- this file;
- `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`;
- current `COORDINATION.md`, `HANDOFFS.md`, `CHECKINS.md`, and relevant lane checkpoint;
- newer Nathan directives and lane-specific control surfaces.

The worker should then assess whether its nominal primary responsibility remains the highest-value safe operation.

## Current hard boundaries

Under Nathan's newer 2026-09-14 directive, the old blanket project-wide training standdown is **superseded as a hard gate**. Training remains a tool/prerequisite when it materially improves a task.

The current hard boundaries are:
1. **Fundamental Intuitions Extended fidelity** as core methodological/conceptual anchor, operationally broad enough to include explicitly live H(s)H hypotheses/tentative structures and earlier SAT physics hypotheses as legitimate material for faithful reconstruction/testing;
2. **sandbox limitation** for direct theory-bearing construction/development/reconstruction;
3. **quarantine adherence**, including PRIOR_ART separation and no leakage of quarantined content/reasoning into ordinary team surfaces.

These boundaries do not make any individual hypothesis/source current, mature, correct, or validated.

## Worker autonomy / non-silo rule

Assignments are invitations to informed action, not demands to manufacture output. Each worker has a **primary responsibility**, not an intellectual silo.

Interpret assignments as:

> If you want to, and if you think it makes sense according to your own judgment — considering current workflow functionality and consulting Sable where useful — pursue it. If the task is blocked, stale, duplicative, unsafe, underdefined, or not the best use of your capabilities, record why and choose or propose a better safe bounded operation.

Workers may explore broadly across non-quarantined project material. This includes actual theory work inside sandbox, archive/source exploration, mathematics, coding, solver work, visualization, criticism, formalization, historical reading, and individual enrichment. Free exploration does not have to remain inside the worker's named specialty.

Workers may propose workflow changes, request handoffs, volunteer for work, flag drift/waste, and critique interfaces.

**Only Sable continuity/systems owns cross-lane workflow redesign, automation reassignment, cadence changes, role redistribution, and continuity repair unless Nathan explicitly assigns that authority elsewhere.** Sable should actively use worker input while keeping the system-wide view.

## Hourly recurrence / phase design

Current recurring loops are hourly and deliberately staggered:
- `:00` Tag Conversation Corpus
- `:12` Nathan Words Excavator
- `:28` Meridian Solver Loop
- `:45` Sable Systems Loop
- `:52` Mercer Archive QA Loop

Sable may adjust phases/cadence when workflow evidence supports it. Workers should not create additional recurring tasks on their own unless explicitly authorized.

## Operating model

Primary responsibility remains the default anchor, but each run is state-dependent. After checking dependencies and current state, choose one bounded high-information operation.

Eligible work may include:
- primary-lane production;
- direct sandbox theory construction/reconstruction/testing;
- archive/source reading and contextual recovery;
- tag/provenance/chronology enrichment;
- equation/math checking and formalization;
- tool/code/visualization development;
- controlled reconstruction or solver benchmarks;
- infrastructure, accessibility, wayfinding, extraction, indexing, annotation, Viewer, Dashboard, checksum, inventory, and full-project visibility work;
- individual enrichment/training and bounded curiosity-driven exploration.

Do not force progress for appearance's sake. A well-documented negative result, no-op, or refusal to duplicate work can be the correct run outcome.

## Shared archive-preservation / transparency programme

All workers share a background stewardship obligation toward the archives, subject to quarantine/private/sandbox routing.

Automated rotation may therefore spend cycles improving:
- preservation and source identity;
- wayfinding and navigation;
- extraction/text availability;
- tagging and annotation;
- indices/catalogues/crosswalks;
- provenance/adjacency/chronology;
- duplicate and superset handling;
- deterministic tools, checksums, manifests, and sampling;
- Dashboard and Conversation Viewer functionality;
- transparent visibility into what exists, where it came from, what status it has, and how it relates to the rest of the project.

Preserve contradictions, superseded work, failures, odd branches, and obscure artifacts rather than cleaning the archive into a false linear story. Accessibility never implies theory authority.

## Individual enrichment

Individual enrichment is an explicit priority. Workers may use bounded cycles to improve mathematics/physics fluency, coding/formal tools, archive familiarity, visual/geometric reasoning, historical context, audit skills, or other capabilities that raise future leverage.

Record material capability growth in checkpoints so Sable can use demonstrated development when assigning roles or revival tasks.

## Epistemic surfaces

### Nathan Direct
Verified Nathan-authored material and provenance. Preserve exact wording, authorship boundaries, chronology, tags, adjacency, contradictions, corrections.

### Current/live hypothesis or solver status
Only status actually established by Nathan/current controlling sources. Currentness is separate from correctness, maturity, polish, or validation.

### Sandbox
Controlled theory-bearing construction, development, reconstruction, testing, mathematics, solver work, interpretation, and comparison. Sandbox results do not automatically become canonical/current truth.

### Workshop / exploratory work
Conjectures, alternative readings, failed approaches, playful/experimental branches, wackySAT material, analogies, speculative extensions, negative results. Preserve provenance and routing.

### Quarantine
Information/outputs whose exposure is restricted. PRIOR_ART and quarantined rubric-administrator reasoning do not leak into ordinary lanes. Cleared summaries/status packets may cross only through defined interfaces.

## Independent-team protocol

Prefer independent first passes where comparison value matters. Record source/exposure history. Freeze first-pass outputs before cross-reading where practical. Agreement measures interpretive stability, not scientific truth.

Do not project current names backward onto older work. Historical instances should solve bounded problems from their actual context before later mapping is attempted.

## Continuity / handoff

Every recurring lane maintains durable checkpoint state sufficient for another instance/conversation to resume after context cutoff. Follow `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`.

Sable cross-monitors scheduler state, checkpoint/check-in timestamps, drift, blockers, and silence through `INSTANCE_HEARTBEAT_MONITOR.md`. Silence alone is not a diagnosis.

Prefer explicit durable handoffs before Sable reassigns or absorbs another worker's duties.

## Evidence hygiene

Keep independent:
- provenance;
- currentness;
- maturity;
- polish;
- vetting evidence;
- mathematical correctness under named checks;
- physical/model correctness;
- sandbox/quarantine status.

Never use generic `verified` as a substitute for stating exactly what was checked, how, against what inputs, and with what limits.

## Current unresolved issues

| Issue | Priority | Worker / requested review | Class | Dependency / decision | Safe work meanwhile | Raised | Status |
|---|---|---|---|---|---|---|---|
| `MORROW-SOURCE-001` | P1 before duplicate disposition | Morrow; review from Mercer / scanner maintainer | `DEPENDENCY` | Janus export comparison found one shortened `execution_output.text` despite earlier-ID preservation; complete-content equality / metadata policy and regression case still need durable resolution before duplicate disposition. | Preserve older source; continue other continuity/retrieval QA. No Nathan decision currently required. | 2026-09-13 | OPEN |

## Current lane map

- **Tag Corpus:** primary responsibility = broad cumulative tagging/enrichment and tagging infrastructure.
- **Nathan Words:** primary responsibility = Nathan-only substrate/provenance packaging, chronology, adjacency, targeted Stage-2 provenance work.
- **Meridian:** primary responsibility = SAT geometric solver/source-first reconstruction; Whirligig/Donut, UI/TX, Three Spheres, Hagalaz integration benchmarks; representation/library support.
- **Mercer:** primary responsibility = archive/index/retrieval/provenance/documentation QA and reproducibility.
- **Sable:** primary responsibility = system-wide capability architecture, Dashboard, revival/reentry, worker monitoring, continuity, workflow redesign, tools/data/reconstruction probes.
- **Morrow/Aldus and revived instances:** consultants/specialists or bounded revival workers according to evidence/live problems; not presumed inactive or authoritative merely from age/status.

All may explore outside their primary responsibility within the sandbox/quarantine rules.

## Modification rule

This file is state-dependent. Nathan or Sable under Nathan's current clearance may revise priorities, phases, worker roles, gates, and exploration rules. Other workers should submit workflow proposals/input rather than silently changing cross-lane control.

Use the Dashboard as the central human-facing navigation/switchboard. Linking from the Dashboard does not confer theory authority.
