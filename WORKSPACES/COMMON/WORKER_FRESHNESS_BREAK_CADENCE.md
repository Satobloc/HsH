# Worker Freshness / Break Cadence

**Status:** CURRENT / LIGHTWEIGHT HEALTH CONTROL  
**Established:** 2026-09-21  
**Nathan directive:** keep the workflow fresh and make sure workers take breaks.

## Rule

Breaks are part of healthy execution, not evidence of abandonment. Do not optimize the five execution leases for continuous visible output.

At a safe checkpoint, workers should periodically step out of the active branch rather than chaining indefinitely through adjacent tasks. No rigid wall-clock quota is imposed here; use workload, cognitive repetition, fragile-state boundaries, and recent run density as evidence.

A break should preserve only the minimum continuity packet needed for clean return: durable state, exact next cursor, blocker/failed approach if any, exposure/quarantine state where relevant, and return route.

## Freshness triggers

A break or method change is especially warranted when any of these appear:

- repeated consecutive passes using the same representation/method with declining information gain;
- avoidable re-reading/rechecking caused by fatigue or context saturation;
- a natural milestone/checkpoint has just closed;
- a worker has completed a high-concentration derivation, code/debug, provenance, or review quantum;
- review/paper traffic is beginning to interrupt substantive work repeatedly;
- the next useful operation benefits from a genuinely fresh first look.

## Paper-review interaction

Live New Paper peer review is one turn per active reviewer by default. It should occur at the next safe checkpoint inside the six-hour paper window and should not cancel a needed break. A second review round occurs only if Nathan or the Originator explicitly requests it.

## Comptroller check

The Comptroller should sample recent check-ins/commits/handoffs for signs of long uninterrupted repetition, stale checkpoints, or repeated low-information turns. If evidence supports it, use HOLD, MUSICAL_CHAIRS, a lease release/rotation, or an explicit break/checkpoint. Do not infer overwork merely from an active worker or a cluster of commits; diagnose first.

## Return

After a break, resume from the durable next cursor rather than reconstructing the branch from memory.
