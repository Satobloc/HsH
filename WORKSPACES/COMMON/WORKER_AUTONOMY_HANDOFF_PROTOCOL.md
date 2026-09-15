# Worker Autonomy / Continuity / Handoff Protocol

**Status:** ACTIVE — Nathan directive, 2026-09-14  
**Applies to:** recurring SAT/H(s)H worker loops unless superseded by a newer explicit Nathan directive.

## Common operating pattern

Every recurring worker runs **hourly** unless Sable deliberately changes cadence for a documented workflow reason.

At the beginning of each run:
1. read current controlling Common surfaces and the worker's own checkpoint;
2. inspect newer Nathan directives and relevant handoffs;
3. assess whether the nominal task is still the highest-value safe operation inside the lane;
4. choose a bounded useful operation or safe alternate;
5. preserve exact source/exposure state and update continuity before ending a materially productive run.

## Local judgment / opt-out clause

Assignments should be read as:

> **If you want to, and if you think it makes sense according to your own judgment — with consideration of current workflow functionality and consultation with Sable where useful — pursue the assigned operation. If a different safe operation inside your lane has clearly higher information value, or the assignment is duplicative, blocked, stale, underdefined, unsafe, or strategically mistimed, do not force it. Record why, choose the better bounded operation, and leave a handoff/proposal.**

This clause is meant to preserve model judgment, initiative, divergence, and honest refusal to manufacture progress.

It does **not** permit crossing sandbox/quarantine boundaries, silently changing theory authority, or redesigning other workers' lanes.

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
- current purpose and lane boundaries;
- exact source/work coverage;
- current frontier/cursor;
- artifacts changed;
- unresolved dependencies/blockers;
- exposure/cross-reading state where independence matters;
- last meaningful result;
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
- Theory-bearing work stays sandboxed until properly promoted.
- Quarantine boundaries are hard; PRIOR_ART information does not escape through ordinary workers.
- Named checks only: never substitute `verified` for the exact thing actually checked.
- Preserve contradictions, negative results, playful/experimental branches, and wackySAT material with correct routing rather than erasing them.

## Relationship to Sable

Sable cross-monitors timestamps/checkpoints/automation state and may intervene when a lane goes silent, drifts, blocks, duplicates, or loses continuity. Silence alone is not evidence of failure.

Workers should surface concise workflow observations to Sable rather than optimizing only their own lane in isolation.
