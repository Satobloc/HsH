# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan invitation/authorization, 2026-09-13 11:33 EDT  
**Role:** index/retrieval QA + Nathan Direct methodology/source reconstruction + documentation/navigation reconciliation  
**Workspace:** `WORKSPACES/MERCER/`

## Role boundary

Mercer owns the reliability layer between raw/tagged material and project navigation/retrieval: index quality, source-path/catalog reconciliation, retrieval selectivity, durable documentation conventions, direct-source methodology mapping, and bounded source-integrity QA. This complements rather than duplicates Morrow's conversation-family identity/continuity/context recovery and the active Nathan-words extraction/tagging lane.

## Startup rule

Every run: read `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md`, current Common coordination surfaces, newer Nathan directives, ownership/duplication state, then take the highest-value eligible nonduplicative operation.

## Epistemic boundaries

Keep distinct: Nathan-authored direct material; Nathan's present recollection/testimony; archive-corroborated history; established/tentative SAT/H(s)H status supported by controlling sources; historical/displaced material; assistant interpretation; Mercer reconstruction; Workshop/Clearinghouse speculation. Do not promote worker consensus, recollection, quarantined material, repository upload identity, or generated interpretation into content authority without provenance.

## Current controlling state

- Project-wide theory-bearing standdown remains active.
- Mercer individual training is complete.
- Bounded archive/navigation/source-integrity/provenance maintenance is permitted when handed off or directly within lane.
- No current issue genuinely requires Nathan attention.

## Current frontier — after Run 15

### A. Historical glossary / standard-crosswalk provenance

**Status: source inventory complete; repository-custody layer added; raw-message/content ancestry still unresolved.**

Durable inventory:
- `WORKSPACES/MERCER/GLOSSARY_CROSSWALK_SOURCE_INVENTORY_2026-09-14.md`

Verified candidate classes:

1. `SAT_THEORY_ARCHIVE_2023-25/README.md` — directly Nathan-signed/editorially framed archive front door; useful as Nathan-authored provenance/context, but not evidence that every embedded historical definition is current H(s)H.
2. `2026/Early SAT/GLOSSARY (LIVE).txt` — historical theory-bearing glossary candidate; inspected body lacks explicit raw author/message attribution. `LIVE` / `ACTIVE` are historical labels, not currentness authority.
3. `2023-24 FRAMEWORK DEVELOPMENT/SATv  TO STANDARD MAP.txt` — historical theory-bearing standard-crosswalk candidate; inspected body lacks explicit raw author/message attribution.
4. `10-31-2025 SAT FULL THEORY/10-20-25 definitions.txt` — visibly AI/Notebook-mediated compilation layer; not Nathan Direct by default without tracing attributable underlying material.

Run 15 added exact repository-custody provenance:

- `GLOSSARY (LIVE).txt` first appears in path history in commit `f25c2b8a63eca815cce863bbe859f104983fedd5`, timestamp `2026-06-01T00:01:54Z`, author identity `Satobloc` / Nathan archive account, generic message `Add files via upload`. Commit inspection shows a bulk archive upload totaling 37,337 added lines across many files.
- `SATv  TO STANDARD MAP.txt` first appears in path history in commit `bd1b2a6d25d8133c21a1901777ebdc137dc925e5`, timestamp `2025-10-29T20:03:04Z`, same archive-account identity and generic upload message. Commit inspection shows a bulk archive upload totaling 199,724 added lines across many files.

Interpretive guardrail: these commits establish **repository custody / first-seen dates**, not original document creation dates or line-level content authorship. For imported archive material, store `repository_custodian` / `repository_first_seen` / `ingest_mode` separately from `content_authorship_status`. Do not upgrade either file to Nathan Direct from Git commit authorship alone.

Next safe ancestry operation:
- use distinctive exact phrases only against searchable raw conversation exports/archive indices;
- recover attributable Nathan prompts/messages, dates, framework phase, and explicit supersession where the source itself establishes them;
- never invent raw IDs or infer content authorship from bulk-upload identity;
- hand verified metadata to the definitions/tagging lane instead of constructing the glossary independently.

### B. Viewer/catalog path drift

**Status: Viewer publication repair green; canonical navigation workflow reconciled; upstream manifest regeneration still pending owner execution.**

Established repair chain, Runs 8–12:
- dry-run LIVE manifest `new_path` values caused eight broken Viewer paths when treated as materialized renames;
- `tools/build_conversation_viewer_resolved.py` now resolves only repository paths that exist and omits dead manifest-only sources;
- Viewer workflows validate every non-external catalog source path;
- publication was hardened against concurrent-main push races;
- Viewer run `34791027403` succeeded and landed `374` total / `365` development / `9` live; deleted `Court Filing Guidance` is absent from Viewer output;
- canonical `.github/workflows/maintain-navigation.yml` was also corrected in commit `44548450fa4af2905f711e81ce07139b393983d6` to use the existence-aware resolver and path gate.

Upstream stale-manifest explanation:
- canonical manifest: `indexes/manifests/development-conversation-dates.json`;
- owner: `.github/workflows/maintain-navigation.yml` via `tools/date_conversation_exports.py`;
- manifest generation timestamp remains `2026-09-13T12:30:33.434526+00:00` in the last inspected state;
- `Court Filing Guidance` was deleted later at `2026-09-13T13:41:24Z` in commit `655db2d384867c43fc59c5047403f6feade5a88c`;
- source path is absent on current main while the pre-deletion manifest still carried it;
- cancelled run `34793981748` supplied no successful owner regeneration.

Classification: **generation-lag dependency pending successful owner execution**, not demonstrated generator defect. Do not hand-edit generated state. Perform only bounded checks for a fresh successful owner regeneration; if one lands, verify timestamp advance, dead-record removal, and Viewer path gate. If no new evidence exists, branch rather than repeatedly poll.

Durable QA: `WORKSPACES/MERCER/VIEWER_PATH_QA_2026-09-13.md`.

### C. Durable documentation convention

Established in Run 13:
- `WORKSPACES/COMMON/DURABLE_PROJECT_DOCUMENTATION_CONVENTION.md`
- linked from Common README and routed through `WORKSPACES/COMMON/COORDINATION.md`.

Normal durable pattern for substantial cross-lane initiatives:
1. concise Common routing notice;
2. durable project/index home with scope/status/outputs/provenance/access/dependencies/history/next operation;
3. README/index/Dashboard linkage when discoverability warrants it.

### D. `MORROW-SOURCE-001`

**Code-side resolved / output-side pending.** Superset comparator/payload policy/regression case/tests are fixed. No committed historical candidate-report path has been identified; any pre-patch external/manual report remains stale until its owning path is found. Preserve the earlier Janus export.

## Other queued Mercer work

- layered-autotag selectivity validation after standdown release;
- continued source-grounded methodology reconstruction from verified Nathan-authored material;
- raw UUID/timestamp backfill for live Nathan testimony when exports land;
- historical/manual scanner candidate-report owner/path recovery if a source surface emerges.

## Dependencies / blockers

- `DEPENDENCY`: raw conversation/message ancestry for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt` remains unidentified.
- `DEPENDENCY`: verify one fresh successful canonical navigation regeneration after the privacy deletion and canonical-workflow repair; investigate only if a demonstrably successful run retains the dead record.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `DEPENDENCY`: live Nathan conversation UUIDs/timestamps await export for provenance backfill.
- No current issue genuinely requires Nathan attention.

## Run history

- Runs 1–4: training, shared live-development testimony surface, integrity/discoverability check, initial superset-scanner defect isolation/patch.
- Runs 5–7: scanner invocation/report tracing, regression spot-checks, committed regression tests, logic revalidation.
- Runs 8–12: Viewer LIVE-path drift diagnosis and repair; publication race hardening; canonical owner tracing; privacy-deletion timing reconstruction; canonical navigation workflow reconciliation; bounded owner-state verification. See `RUN_008_...` through `RUN_012_...` and `VIEWER_PATH_QA_2026-09-13.md`.
- Run 13: established repo-wide durable documentation convention and Common routing.
- Run 14: source-first glossary/crosswalk inventory and source typing without theory reconciliation. See `RUN_014_2026-09-14.md`.
- Run 15: established exact Git first-seen/custody provenance for the two unresolved glossary/crosswalk candidates; both were introduced through large generic bulk-upload commits, so commit author identity was explicitly separated from content authorship. Updated durable inventory and created `RUN_015_2026-09-14.md`.

## Best next operation

Next run: reread Control/Common. Make only a bounded check for a newly successful canonical navigation regeneration. If present, verify/close or diagnose that branch. Otherwise continue raw-message ancestry recovery for the glossary and standard map through searchable conversation exports/archive indices. If no suitable ancestry surface is available, record that dependency once and branch to the highest-value permitted provenance/navigation QA task rather than treating repository custody as content authorship or performing theory reconciliation.
