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

## Current frontier — after Run 17

### A. Historical glossary / standard-crosswalk provenance

**Status: source inventory + repository-custody layer complete; raw-message/content ancestry unresolved; indexed phrase-search route exhausted; bounded raw extraction route now verified.**

Durable inventory: `WORKSPACES/MERCER/GLOSSARY_CROSSWALK_SOURCE_INVENTORY_2026-09-14.md`.

Verified candidate classes remain:
1. `SAT_THEORY_ARCHIVE_2023-25/README.md` — Nathan-authored editorial/front-door source.
2. `2026/Early SAT/GLOSSARY (LIVE).txt` — historical theory-bearing glossary candidate; content authorship/currentness unresolved.
3. `2023-24 FRAMEWORK DEVELOPMENT/SATv  TO STANDARD MAP.txt` — historical standard-crosswalk candidate; content authorship/currentness unresolved.
4. `10-31-2025 SAT FULL THEORY/10-20-25 definitions.txt` — visible AI/Notebook-mediated compilation layer; not Nathan Direct by default.

Repository custody remains distinct from content authorship: glossary first seen in bulk upload `f25c2b8a63eca815cce863bbe859f104983fedd5` (2026-06-01); standard map first seen in bulk upload `bd1b2a6d25d8133c21a1901777ebdc137dc925e5` (2025-10-29).

Run 16 tested exact/distinctive source phrases from the standard map through available GitHub indexed-search routes. No raw-conversation ancestry hit surfaced. This is a retrieval limitation/result, not evidence of absence. Do not repeat that route unless the searchable corpus/index changes.

Run 17 verified repository-native raw-message recovery infrastructure:

- `.github/workflows/extract-raw-window.yml`
- `WORKSPACES/COMMON/scripts/extract_raw_window.py`
- `WORKSPACES/COMMON/extraction_requests/*.json`
- outputs under `WORKSPACES/COMMON/extraction_outputs/`

The extractor takes an explicit raw conversation `source_path` and chronological frontier (`after_create_time`), then preserves conversation ID plus message/node IDs, parent, role/author, recipient, create time, and text in bounded outputs. Therefore the current ancestry blocker is narrowed to **anchor discovery**: neither historical candidate yet has a defensible raw conversation path/time anchor. Do not create speculative requests across arbitrary files; prefer an existing raw-export index/catalog/title-date map or independently attributable candidate path, then use the extractor.

### B. Viewer/catalog path drift

**Status: Viewer publication repair green; canonical navigation workflow reconciled; fresh owner run checked once and terminal/cancelled.**

Established repair chain remains in `WORKSPACES/MERCER/VIEWER_PATH_QA_2026-09-13.md`. The committed development manifest still showed `generated_at_utc = 2026-09-13T12:30:33.434526+00:00` at the last committed-state inspection.

Canonical `Maintain H(s)H navigation` run `34814002515` (head `f7e960d773521b2ba4a2f6126119f5b4dff8c772`) is now **cancelled**, so it is not evidence of successful regeneration. Do not poll this terminal run again. Revisit only when a newer successful canonical run or landed manifest regeneration appears. Until then the stale generated-state item remains an owner-execution/generation-lag dependency, not a demonstrated generator defect.

### C. Durable documentation convention

Established in Run 13: `WORKSPACES/COMMON/DURABLE_PROJECT_DOCUMENTATION_CONVENTION.md`, linked/routed through Common.

### D. `MORROW-SOURCE-001`

**Code-side resolved / output-side pending.** Superset comparator/payload policy/regression case/tests are fixed. No committed historical candidate-report path has been identified; any pre-patch external/manual report remains stale until its owning path is found. Preserve the earlier Janus export.

## Other queued Mercer work

- inventory raw-export indexing/catalog machinery for high-confidence ancestry anchors;
- layered-autotag selectivity validation after standdown release;
- continued source-grounded methodology reconstruction from verified Nathan-authored material;
- raw UUID/timestamp backfill for live Nathan testimony when exports land;
- historical/manual scanner candidate-report owner/path recovery if a source surface emerges.

## Dependencies / blockers

- `DEPENDENCY`: raw conversation/message ancestry for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt` remains unidentified; the bounded extractor exists but candidate raw source/time anchors do not yet.
- `DEPENDENCY`: canonical navigation run `34814002515` finished cancelled; a newer successful owner regeneration is still needed to close generated-state cleanup.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `DEPENDENCY`: live Nathan conversation UUIDs/timestamps await appropriate export/provenance surfaces for backfill.
- No current issue genuinely requires Nathan attention.

## Run history

- Runs 1–4: training, shared live-development testimony surface, integrity/discoverability check, initial superset-scanner defect isolation/patch.
- Runs 5–7: scanner invocation/report tracing, regression spot-checks, committed regression tests, logic revalidation.
- Runs 8–12: Viewer LIVE-path drift diagnosis and repair; publication race hardening; canonical owner tracing; privacy-deletion timing reconstruction; canonical navigation workflow reconciliation; bounded owner-state verification.
- Run 13: established repo-wide durable documentation convention and Common routing.
- Run 14: source-first glossary/crosswalk inventory and source typing without theory reconciliation.
- Run 15: exact Git first-seen/custody provenance for unresolved glossary/crosswalk candidates; bulk-upload identity separated from content authorship.
- Run 16: observed a fresh but pending canonical navigation owner run; tested source-derived distinctive phrase anchors against GitHub indexed search with no ancestry hit; recorded the retrieval limitation and stopped repeating that route.
- Run 17: verified run `34814002515` ended cancelled and branched as required; identified and inspected the repository-native bounded raw-conversation extraction workflow/script/request schema; narrowed glossary ancestry blocker to missing candidate source/time anchors. See `RUN_017_2026-09-14.md`.

## Best next operation

Next run: reread Control/Common. Do not poll terminal navigation run `34814002515`. If a newer successful canonical navigation run or landed regenerated manifest exists, verify it once; otherwise branch immediately. For glossary/crosswalk ancestry, inventory existing raw-export indexing/catalog/title-date machinery to locate a defensible candidate raw conversation path without duplicating Morrow/Nathan-Words work. If one high-confidence anchor is found, use the bounded extractor and record exact message IDs/timestamps; otherwise document the retrieval gap and move to the next permitted provenance/navigation QA task.
