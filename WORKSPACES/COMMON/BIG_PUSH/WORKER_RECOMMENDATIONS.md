# Big Push Continuity — Recommendations for Other Workers

**Status:** pilot recommendations, not a universal mandate  
**Origin:** THE BIG PUSH continuity design, 2026-11-05  
**Location:** HsH / WORKSPACES/COMMON/BIG_PUSH/

## Reusable pattern

For any long-running project spread across finite ChatGPT contexts, consider:

1. **A tiny boot capsule.** It states the mission, highest priorities, source-of-truth location, load order, restart trigger, and exact next cursor. It points to detail rather than repeating it.
2. **A single active tray.** One operation, one scope boundary, one stop condition, and one restart cursor. Supporting ideas go into a parking drawer.
3. **A durable control shelf.** Maintain phase gates, a source/read ledger, decisions, blockers, and verified artifact pointers outside the chat context.
4. **A project-specific heartbeat.** Track meaningful work on that project, not generic account activity. Scheduled automation must never refresh the human heartbeat.
5. **A clear restart steward.** Prefer one existing scheduled task as the sole continuity writer. Other workers receive bounded assignments, not duplicate ownership.
6. **A state machine.** Distinguish dormant, eligible, active, human-return, and blocked states. Add claims/leases where duplicate scheduled runs are possible.
7. **A succession packet.** Preserve exact primary-source cursors, repository SHAs, completed versus partial work, and one first action for the successor.
8. **A pruning rhythm.** At fixed operation counts or phase gates, inspect what has drifted, what has been overlooked, what can be parked, and what procedure can be simplified.

## Design cautions

- A repository file is durable only if the next worker is instructed to retrieve it. A pointer that is not in the boot sequence is not an active memory mechanism.
- A recurring task is a scheduled activation, not proof of continuous identity or reliable cross-thread delivery.
- Never infer a current scheduler result from a stale cached result without matching run IDs.
- Do not make the boot capsule large. Put task-specific methods in separate protocols and load them only when relevant.
- Do not make every worker run every checklist on every turn. Use a hierarchy of triggers to keep the active context lean.
- Avoid self-reinforcing memory loops that simply repeat a model's prior conclusions. Re-read primary sources and preserve independent review.
- Treat this pattern as experimental. Workers should report which components reduce drift, which add overhead, and what should be changed before wider adoption.

## Recommended experiment

Pilot the pattern in one workflow for several operation cycles. Record:
- restart success after an actual context handoff;
- missed/duplicated operations;
- source-cursor errors;
- unplanned scope drift;
- time spent reloading context;
- parked items recovered at review;
- procedural overhead versus useful work.

Only promote components that show practical benefit.

## Refinement: the Memory Credenza

The [Memory Credenza model](../COMMON/MEMORY_CREDENZA_MODEL_2026-11-19.md) is a proposed compact map of the larger project environment. The tiny Key points to it; the Credenza routes workers to selectively loaded sources, questions, findings, tools, methods, neglected areas and return points; the Castle is the full repository-backed environment. Treat each cubby as an access point with a purpose, trigger, status, last-inspected marker and return cue, not as a mandatory checklist or a duplicate store of source material.

The model gives the existing tick/tock pattern a navigable structure: tick preserves the current place/return pin; tock advances only after a bounded operation has produced and recorded a durable result; heartbeat remains a separate signal of meaningful human-directed project activity. A possible sampler combines overdue coverage rotation with stratified random inspection, so quiet areas can be surfaced without making random selection a proxy for importance. Sampling and automation remain proposals until a bounded pilot demonstrates useful state change. Different workers may use different rhythms or none.

