# Build suggestion — Index Desk synchronization and Mersearch handoff

**Date:** 2026-09-20  
**Source:** Nathan direct / public-site continuation  
**Status:** PARKED + RETURN TRIGGER  
**Disposition date:** 2026-09-21  
**Disposition:** useful architecture recommendation retained; do not open a separate branch yet  
**Urgency:** SOON for manifest design; EVENT-TRIGGERED for direct Mersearch querying  
**Type:** small architecture follow-up, then bounded integration  
**Affected surface:** Glass Sausage Factory Reading Room / Index Desk

## Observation

The public Reading Room now exposes twelve distinct wayfinding systems across the public HsH and SAT archive repositories. The routes are currently maintained in the site interface itself.

The project already has a five-lease generalist scheduler. This site work should enter the ordinary shared selection system rather than consume another recurring-task slot.

## Suggested work

1. **Create or identify a small public machine-readable index-system manifest.**
   - Record repository, source path, role, status label, reader route, and public/private eligibility.
   - Treat the manifest as navigation metadata, not theory authority.
   - Preserve the HsH ↔ SAT archive public boundary; do not expose private/reference-only resources.

2. **Make the Index Desk consume that manifest when the interface route is stable enough.**
   - Keep a static fallback so a temporary source failure does not erase public navigation.
   - Add a simple stale-route or missing-source check during ordinary site-build passes.

3. **Complete the direct Mersearch handoff only when its public boundary is ready.**
   - Trigger: stable API schema plus an allowlisted public corpus profile or another explicitly public query interface.
   - Reuse the Reading Room's existing JSON-result renderer and provenance fields.
   - Do not imply that the site itself is the search authority.

4. **Connect developing topic indices to search-ready routes where their schemas stabilize.**
   - Preserve the difference among generated inventory, topical discovery, provenance trail, and current theory status.

## Why it helps

This turns a hand-maintained set of links into a durable cross-repository interface without creating another scheduler. It also gives the Comptroller/site-curator a concrete event-triggered Mersearch task while leaving timing and priority to the current task-selection system.

## Dependencies

- Current public Index Desk and Reading Room implementation.
- Public repository paths and any future index-manifest schema.
- Mersearch public API/profile decision.
- Existing public-site editorial and source-status controls.

## 2026-09-21 disposition

This recommendation is **PARKED + RETURN TRIGGER**, not rejected.

A bounded repository check found no current `index-system manifest` artifact in HsH under that wording, so there is not yet an existing manifest to wire into the Index Desk. At the same time, current public-site work has moved directly onto archive/index linking and algorithmic document-link backfill. Opening a second architecture branch for the manifest now would risk duplicating or prematurely constraining that live indexing work.

### Return triggers

Reopen this recommendation when **any one** of the following becomes true:

1. the current archive/index-linking pass stabilizes the source-path/reader-route mapping enough that a manifest can be extracted rather than invented in parallel;
2. the Index Desk accumulates enough hand-maintained routes that synchronization drift becomes observable;
3. a stable public Mersearch API/schema plus explicitly public corpus boundary becomes available;
4. the active site/indexing worker explicitly asks for a shared machine-readable routing contract.

### Next action on return

Prefer deriving the manifest from the live indexing/linking implementation and existing repository indices. Do not create a competing source of truth. The smallest useful first artifact is a public-only route table with repository, source path, reader route, role/status, and eligibility fields plus a static fallback contract.

## Routing

No additional recurring automation is requested. Until a return trigger fires, leave this recommendation parked in the build-suggestion queue with this explicit disposition and route it back into ordinary site/indexing work rather than creating a standalone lane.
