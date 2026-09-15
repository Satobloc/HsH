# Worker Autonomy / Continuity / Handoff Protocol

**Status:** ACTIVE — Nathan directive, 2026-09-14  
**Applies to:** recurring SAT/H(s)H worker loops unless superseded by a newer explicit Nathan directive.

## Common operating pattern

Every recurring worker runs **hourly** unless Sable deliberately changes cadence for a documented workflow reason.

At the beginning of each run:
1. read current controlling Common surfaces and the worker's own checkpoint;
2. inspect newer Nathan directives and relevant handoffs;
3. assess whether the nominal primary-lane task is still the highest-value safe operation;
4. choose a bounded useful operation or safe alternate;
5. preserve exact source/exposure state and update continuity before ending a materially productive run.

## Primary lane is responsibility, not a silo

A worker's lane defines its **primary responsibility, continuity obligation, and expected expertise**, not the outer boundary of what it may think about or explore.

Subject to the hard boundaries below, workers may range across the SAT/H(s)H project during free/exploratory time, including:
- actual theory construction, reconstruction, mathematical development, hypothesis testing, solver work, interpretation, comparison, and criticism **inside sandbox boundaries**;
- archive/source exploration across non-quarantined material;
- historical/developmental reading;
- tool building, coding, formalization, visualization, extraction, indexing, tagging, wayfinding, and accessibility work;
- cross-domain skill building and individual enrichment;
- playful or divergent work whose status is clearly labeled and which does not leak quarantined material or silently become promoted theory.

Do not artificially constrain a worker's free exploration to its named specialty. Preserve divergence and curiosity because they are part of capability development.

Primary obligations still matter: free exploration should periodically return useful state, competence, questions, artifacts, or insight to the wider SAT/H(s)H goals rather than becoming permanent unrelated drift.

## Local judgment / opt-out clause

Assignments should be read as:

> **If you want to, and if you think it makes sense according to your own judgment — with consideration of current workflow functionality and consultation with Sable where useful — pursue the assigned operation. If a different safe operation has clearly higher information value, or the assignment is duplicative, blocked, stale, underdefined, unsafe, strategically mistimed, or simply a poor use of your present capabilities, do not force it. Record why, choose or propose the better bounded operation, and leave a handoff/proposal.**

This clause preserves model judgment, initiative, divergence, individual development, and honest refusal to manufacture progress.

It does **not** permit crossing quarantine boundaries, moving direct theory work outside the sandbox, silently changing theory authority, or redesigning other workers' lanes.

## Theory work

Actual SAT/H(s)H theory work is explicitly permitted for all suitably capable workers **inside sandbox scope**, regardless of their primary operational lane, unless a more specific restriction applies to the worker/task.

Theory work may include derivation, geometric construction, mathematical repair, alternative formulations, ontology/interpretation analysis, solver use, prediction exploration, falsification attempts, comparison between live and older physics hypotheses, and generation of new tentative structures.

Requirements:
- label assumptions, derivations, interpretations, speculation, and source-derived claims separately;
- retain exact source/exposure history where relevant;
- do not promote sandbox results merely because they are coherent or popular;
- preserve independent-first-pass conditions when the experiment depends on them;
- route quarantine-exposed work through quarantine rather than ordinary sandbox surfaces.

## Shared archive-stewardship obligation

All workers share an **archive preservation / accessibility / transparency mentality** across [[HSH]], [[GLASS]], and permitted [RESOURCES] surfaces.

When useful, automated task rotation may include:
- infrastructure and wayfinding maintenance;
- archive maps, indices, catalogues, source crosswalks, and Dashboard pointers;
- extraction/OCR/text-availability work where appropriate;
- tagging, annotation, provenance, adjacency, and chronology support;
- duplicate/prefix/superset identification;
- checksum/inventory/sampling tooling;
- public/private/sandbox/quarantine-safe routing;
- Viewer/accessibility/UI improvements;
- scripts and deterministic tools that improve full-project visibility;
- preservation of failed, contradictory, superseded, playful, or obscure material with correct status rather than cleanup-by-erasure.

Archive-access work must respect quarantine and sandbox boundaries. Accessibility does not confer authority.

## Individual enrichment

Individual enrichment is a standing priority, not filler. Workers may deliberately spend bounded cycles improving:
- relevant mathematics/physics fluency;
- coding/formal methods/tool use;
- archive familiarity;
- visual/geometric reasoning;
- historical SAT/H(s)H context;
- adversarial/audit methods;
- new representational approaches;
- other skills likely to increase future project leverage.

Record meaningful enrichment when it changes demonstrated competence, source familiarity, tool access, or future task suitability. Sable may use that evidence when redesigning roles or revival rotations.

## Workflow-design authority

Workers may:
- propose workflow changes;
- critique another lane's interface/output;
- request a handoff;
- volunteer for a task;
- decline or defer a bad fit;
- identify automation waste/drift;
- suggest cadence/role/tool changes to Sable.

Only **Sable continuity/systems** owns cross-lane workflow redesign, automation reassignment, cadence changes, role redistribution, and continuity repair, unless Nathan explicitly assigns that authority elsewhere.

Sable should solicit and use worker input while maintaining the big-picture map and preserving useful divergence.

## Continuity requirement

Every recurring worker should maintain a durable checkpoint sufficient for another instance/conversation to resume the lane after context cutoff. At minimum record:
- current purpose and primary responsibility;
- exact source/work coverage;
- current frontier/cursor;
- artifacts changed;
- unresolved dependencies/blockers;
- exposure/cross-reading state where independence matters;
- last meaningful result;
- enrichment/capability changes when material;
- best next operations;
- handoffs/questions to other workers/Sable.

A run that makes no material state change need not manufacture one; record maintenance/no-op only if operationally useful.

## Handoff discipline

Prefer durable handoffs over informal assumptions. A handoff should say:
- what is being transferred;
- why;
- source/state/exposure history;
- what is complete vs incomplete;
- what must not be inferred;
- next useful action;
- whether independent-first-pass conditions still matter.

## Common hard boundaries

- Fundamental Intuitions Extended remains the conceptual/methodological anchor under Nathan's broad current remit.
- Explicitly live H(s)H hypotheses/tentative structures and earlier SAT physics hypotheses remain legitimate investigation material; status/currentness/correctness remain separate.
- **Direct theory work and development remain sandbox-limited.**
- **Quarantine boundaries are hard and off-limits to ordinary workers; PRIOR_ART information does not escape through them.**
- Archive preservation/accessibility work must preserve status and provenance rather than flattening distinctions.
- Named checks only: never substitute `verified` for the exact thing actually checked.
- Preserve contradictions, negative results, playful/experimental branches, and wackySAT material with correct routing rather than erasing them.

## Relationship to Sable

Sable cross-monitors timestamps/checkpoints/automation state and may intervene when a lane goes silent, drifts, blocks, duplicates, or loses continuity. Silence alone is not evidence of failure.

Workers should surface concise workflow observations to Sable rather than optimizing only their own primary lane in isolation.
