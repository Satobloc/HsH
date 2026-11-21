# Project Tocktick Registry

**Registry version:** 0.1  
**Status:** Pilot; readable IDs are canonical for now. Single-character encoding remains experimental.

## Key

`SPAS-01`

Resolution: Standard Physics Affect-Space Mapping, project-local Work Tray below.

## State vocabulary

- **TICK:** current exact position, not progress evidence.
- **TOCK:** bounded operation with durable result and updated cursor.
- **PIN:** suspended task that must be revisited, with reason and resume cue.
- **NOW:** one foreground operation.
- **NEXT:** next eligible operation; ordering can change.
- **RETURN:** authoritative file and section/heading that resumes work.
- **BRANCH:** bounded tangent with its own ID; parent TICK is preserved.
- **PARKED:** intentionally inactive, with re-entry condition.
- **BLOCKED:** cannot proceed under current constraints.

## Work Tray

- **PIN:** SPAS-P01 — Preserve the simple-first mapping plan. Reason: previous branch drifted into the complex global carbon-cycle itinerary. Return trigger: after the simple specimen/path has been selected and recorded. Resume cue: choose a single bounded carbon-14 history, or explicitly choose a simpler alternative specimen.
- **NOW:** SPAS-01 — Recover and fix the simple mapping plan before resuming physical mapping.
- **NEXT:** SPAS-02 — Select a bounded specimen history that avoids biosphere passage and the complete carbon cycle.
- **NEXT:** SPAS-03 — Define beginning and end events for that selected history.
- **NEXT:** SPAS-04 — Trace only the specimen's procession between those events.
- **NEXT:** SPAS-05 — Identify relevant external relationships around the procession without assuming their morphology.
- **NEXT:** SPAS-06 — Describe the resulting morphology only after mapping.
- **RETURN:** README.md → Current status; CURRENT_WORK.md → Current checkpoint; DECISIONS.md → decision log.

## Address registry

| ID | Target | Preconditions | Expected durable output | Return |
|---|---|---|---|---|
| SPAS-01 | Re-establish simple-first plan | This registry | Agreed minimal mapping sequence | TOCKTICK.md |
| SPAS-02 | Select simple specimen/history | SPAS-01 | One specified conventional history, bounded in scope | CURRENT_WORK.md |
| SPAS-03 | Select beginning/end events | SPAS-02 | Explicit boundary definition | CURRENT_WORK.md |
| SPAS-04 | Trace entity procession | SPAS-03 | Compact path description | PROCESSION.md (to be created when needed) |
| SPAS-05 | Trace relationships | SPAS-04 | Relationship inventory, sourced/model-qualified | AFFECT_SPACE.md (to be created when needed) |
| SPAS-06 | Characterize morphology | SPAS-05 | Descriptive characterization with no assumed shape | AFFECT_SPACE.md |

## Addressing rules

- Stable IDs are canonical until the encoding experiment is worth running.
- No registry token silently changes meaning. Update version and record migration.
- Unknown or stale IDs resolve to this file; never guess.
- Tool/function pointers are routes, never permissions.
- A branch must include parent TICK, purpose, stop condition, and return cue.

## Message signature

`▸ TICK: SPAS-01 | TOCK: none | PIN: SPAS-P01`

Update this line as the current operation changes. Do not accumulate stale signatures.
