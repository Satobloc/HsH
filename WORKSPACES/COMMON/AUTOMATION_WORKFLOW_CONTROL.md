# AUTOMATION WORKFLOW CONTROL

**Status:** ACTIVE current control surface  
**Program:** hourly SAT/H(s)H worker loops + Sable continuity  
**Updated:** 2026-09-18  
**Authority:** newer explicit Nathan directives control. This file coordinates workers; it does not define theory truth.

## Startup rule

Every recurring worker begins by checking:
- this file;
- **the must-read SAT/H(s)H terminology/theory update below on boson/fermion vs persistent-coil/traveling-excitation classification**;
- `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`;
- current `COORDINATION.md`, `HANDOFFS.md`, `CHECKINS.md`, and relevant lane checkpoint;
- newer Nathan directives and lane-specific control surfaces.

Before running, creating, modifying, or publishing from any script/bot/workflow that can touch repository state, also read and obey:
- `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md`;
- `SHARED_STATE_WRITE_SAFETY.md` when shared/generated/semantic state may be written.

The worker should then assess whether its nominal primary responsibility remains the highest-value safe operation.

## MUST-READ — SAT/H(s)H boson/fermion terminology correction — 2026-09-18

Nathan has identified a terminology collision between historical SAT usage and standard-physics usage of **boson** and **fermion**. Treat this as a current must-read correction for reconstruction, tagging, glossary work, theory discussion, and source interpretation.

### Standard-physics meaning

In standard physics, boson/fermion is fundamentally a **spin/statistics classification**, not a synonym for `massless force carrier` versus `massive matter particle`. Composite objects and isotopes can themselves be bosonic or fermionic depending on their total quantum state. A neutrino is standardly classified as a fermion even though it is extremely light and ordinarily propagates relativistically.

Therefore workers must **not** use standard `boson`/`fermion` as automatic translations of SAT's structural categories.

### Current SAT/H(s)H structural distinction

The core SAT distinction Nathan intends to preserve is:

- **persistent localized/coiled excitation / persistent coil**;
- **traveling / light-mode / spot excitation**.

These are SAT structural categories. They are **not automatically identical** to standard fermion/boson classes.

Do not infer:

- persistent coil = standard fermion;
- traveling/light-mode excitation = standard boson.

The mapping, if any, is a separate theory problem that must account for the observed spin/statistics behavior of the resulting state.

### Neutrino status under the corrected terminology

Nathan's current SAT classification may still place the neutrino with photons and related `light-particle` / traveling-excitation structures. That SAT classification can coexist with the standard statement that neutrinos are fermions, because the two labels answer different questions.

Accordingly, do **not** rewrite the current SAT position as `SAT claims neutrinos obey bosonic statistics` unless a source explicitly makes that stronger claim. The intended current distinction is structural: neutrinos may belong to the SAT traveling/light-mode excitation family while remaining standard fermions in the spin/statistics sense.

Nathan also rejects `massless` as a clean SAT ontological boundary. Within SAT reasoning, interaction between timesheet/filament structures still requires dynamical accounting; the more useful internal category is therefore `light-mode` or `traveling excitation`, not an assumption of literally zero dynamical/inertial content.

### Force transmission / exchange-particle caution

SAT does **not** posit exchange of independently existing particles as a necessary primitive mechanism of force transmission, and does not require that such an exchange ontology exist at all.

SAT may nevertheless permit characteristic traveling excitations to be produced, released, absorbed, or detected during high-energy or `force-breaking` events. The detection of a characteristic excitation emitted by such an event is **not, by itself, evidence within SAT that the same excitation existed beforehand as a distinct persistent identity performing the interaction-mediating job**.

For reconstruction and interpretation, keep separate:

1. a characteristic excitation is observed after/during an energetic interaction;
2. the event dynamically produces or releases that excitation;
3. a pre-existing particle-like carrier was exchanged as the primitive causal mechanism.

SAT may accept (1) and potentially model (2) without assuming (3).

### Historical terminology handling

Do **not** globally rewrite the archive. Earlier SAT uses of `boson`, `fermion`, `t-boson`, `f-boson`, or related language are historical evidence and must remain visible in their original wording.

Instead:

- preserve exact historical terminology in source/provenance records;
- distinguish `historical SAT usage` from standard-physics usage;
- when context shows that an older SAT `boson` label meant approximately `traveling/light-mode excitation`, annotate rather than silently replace;
- when context shows that an older SAT `fermion` label meant approximately `persistent localized/coiled matter structure`, annotate rather than silently replace;
- do not assume every historical occurrence has that meaning without source/context review;
- reserve unqualified current `boson` / `fermion` language for standard spin/statistics unless a document explicitly labels the term as SAT-historical or SAT-specific usage.

This correction is a **terminology/theory-state clarification**, not evidence that the persistent-coil/traveling-excitation distinction has been discarded. That structural distinction remains live and should be reconstructed/tested on its own terms.

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
- `:45` AUTOMATION — Project Systems
- `:52` Mercer Archive QA Loop

Sable may adjust phases/cadence when workflow evidence supports it. Workers should not create additional recurring tasks on their own unless explicitly authorized.

## Standard work quantum and document quantum

The default recurrence bite is:

> **one object + one operation + one durable result + one next cursor**

A normal bite should usually involve **1 primary target, no more than about 3 supporting files, and at most 1 semantic write**. Inspect → act once → confirm → checkpoint → name exactly one next cursor → stop.

If completion requires a second independent diagnosis, another substantial target, several unrelated source regions, or a second conceptual decision, that work is normally the **next bite**. Do not enlarge the current bite merely because adjacent useful work becomes visible.

### Micro-bite for hot/shared surfaces

For BEDROCK, STATE OF THE THEORY, README/front doors, central coordination/control files, generated interfaces, or other high-contention/high-authority surfaces, default to a **micro-bite: one proposition, pointer, visibility defect, status transition, or tested change per recurrence**. No opportunistic cleanup merely because the file is already open.

### Standard Working Document Unit

Worker-produced documents use these default size classes. These govern new working artifacts, not historical/source documents already in the archive.

- **Micro:** about **150–500 words** — handoff, checkpoint, status card, proposition record, small index or focused correction.
- **Standard:** about **800–1,500 words** — normal theory note, audit, comparison, reconstruction packet, workflow document, or bounded analysis.
- **Extended:** about **1,500–3,000 words** — use only when splitting would materially damage coherence; this should be a conscious choice rather than scope drift.
- **Above ~3,000 words:** default assumption is **document set**, not one working document. Split into linked/numbered Standard Working Document Units with a short index/overview unless the artifact's form genuinely requires a single file.

A normal recurrence should produce or materially modify **no more than one Standard Working Document Unit**. Hot/shared semantic surfaces remain governed by the smaller micro-bite rule regardless of their total file length.

These are operating defaults, not reasons to pad short work or mechanically cut a coherent artifact. When a task legitimately needs a larger unit, state why, deliberately choose the larger class, and still preserve a durable stopping boundary.

## Operating model

Primary responsibility remains the default anchor, but each run is state-dependent. After checking dependencies and current state, choose one bounded high-information operation consistent with the standard work quantum above.

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

## Script / workflow execution safety

`CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` is a required project-wide execution contract for scripts, bots, GitHub Actions, extraction jobs, indexing/tagging utilities, one-shot compute shims, and automated write processes across `[[HsH]]`, `[[GLASS]]`, and permitted `[RESOURCES]`.

Key obligations include:
- declare exact read/write scope and source repository commits;
- prune quarantine-controlled roots before file access, not merely before publication;
- preserve original source artifacts; extraction/conversion writes derived outputs elsewhere;
- isolate temporary/output paths by run where concurrent work is possible;
- use current-SHA/compare-and-swap or fresh fetch/rebase protection before writes;
- never force-push or blindly overwrite collisions;
- keep private-derived material private by default;
- validate outputs and reject unexpected diffs;
- retain reproducible run/source provenance, using `SCRIPT_RUN_MANIFEST_SCHEMA.json` for substantial recurring/cross-repo jobs when practical.

If a write-capable script does not meet the standard, treat it as infrastructure debt and upgrade it before unattended use when risk is material. On ambiguity/collision/stale target: stop, retry, or route; do not guess and overwrite.

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
