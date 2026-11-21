# Project Tocktick Registry

**Registry version:** 0.2  
**Status:** Pilot; readable IDs are canonical for now. Single-character encoding remains experimental.

## Key

`SPAS-03`

Resolution: Standard Physics Affect-Space Mapping, project-local Work Tray below.

## State vocabulary

- **TICK:** current exact position, not progress evidence.
- **TOCK:** bounded operation with durable output and updated cursor.
- **PIN:** suspended task that must be revisited, with reason and resume cue.
- **NOW:** one foreground operation.
- **NEXT:** next eligible operation; ordering can change.
- **RETURN:** authoritative file and section/heading that resumes work.
- **BRANCH:** bounded tangent with its own ID; parent TICK is preserved.
- **PARKED:** intentionally inactive, with re-entry condition.
- **BLOCKED:** cannot proceed under current constraints.

## Work Tray

- **PIN:** none active. SPAS-P01 (return to the simple-first plan after the carbon-cycle detour) is RESOLVED: a simple specimen class has now been selected.
- **NOW:** SPAS-03 — Define the beginning and end events for one representative chondrule's bounded history.
- **NEXT:** SPAS-04 — Trace only the chondrule's procession from formation to incorporation into a small rocky body.
- **NEXT:** SPAS-05 — Identify relevant external relationships around the procession, without assuming their morphology.
- **NEXT:** SPAS-06 — Describe the resulting morphology only after mapping.
- **RETURN:** SPECIMEN.md → Selected specimen; CURRENT_WORK.md → Current checkpoint; DECISIONS.md → decision log.

## Address registry

| ID | Target | Preconditions | Expected durable output | Return |
|---|---|---|---|---|
| SPAS-01 | Re-establish simple-first plan | This registry | Agreed minimal mapping sequence | TOCKTICK.md |
| SPAS-02 | Select simple specimen/history | SPAS-01 | One specified conventional history, bounded in scope | SPECIMEN.md |
| SPAS-03 | Select beginning/end events | SPAS-02 | Explicit boundary definition | CURRENT_WORK.md |
| SPAS-04 | Trace entity procession | SPAS-03 | Compact path description | PROCESSION.md (to be created when needed) |
| SPAS-05 | Trace relationships | SPAS-04 | Relationship inventory, sourced/model-qualified | AFFECT_SPACE.md (to be created when needed) |
| SPAS-06 | Characterize morphology | SPAS-05 | Descriptive characterization with no assumed shape | AFFECT_SPACE.md |

## Completed Tocks

- **SPAS-01:** Simple-first scope reinstated; rejected the global carbon-cycle detour.
- **SPAS-02:** Selected a representative chondrule, from its formation in the protoplanetary disk to incorporation into a small primitive planetesimal. Class-level path only; no unique chondrule or precise trajectory claimed.

## Addressing rules

- Stable IDs are canonical until the encoding experiment is worth running.
- No registry token silently changes meaning. Update version and record migration.
- Unknown or stale IDs resolve to this file; never guess.
- Tool/function pointers are routes, never permissions.
- A branch must include parent TICK, purpose, stop condition, and return cue.

## Message signature

`▸ TICK: SPAS-03 | TOCK: SPAS-02 specimen selected | PIN: none`

Update this line as the current operation changes. Do not accumulate stale signatures.
