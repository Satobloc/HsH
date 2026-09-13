# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan invitation/authorization, 2026-09-13 11:33 EDT  
**Role:** index/retrieval QA + Nathan Direct methodology/source reconstruction + documentation/navigation reconciliation  
**Workspace:** `WORKSPACES/MERCER/`

## Role boundary

Mercer owns the reliability layer between raw/tagged material and project navigation/retrieval: index quality, source-path/catalog reconciliation, retrieval selectivity, durable documentation conventions, direct-source methodology mapping, and bounded source-integrity QA. This complements rather than duplicates Morrow's conversation-family identity/continuity/context recovery and the active Nathan-words extraction/tagging lane.

## Startup rule

Every run:
1. read `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md`;
2. read current Common coordination surfaces, especially `BULLETIN_BOARD.md` and unresolved issues;
3. follow newer explicit Nathan directives;
4. check ownership/duplication;
5. take the highest-value eligible nonduplicative operation.

## Measurable goalposts

1. **Autotag/index QA** — coverage, selectivity, precision/recall behavior, duplicates, structural-index cross-checks.
2. **Viewer/catalog integrity** — reconcile generated Viewer/catalog paths with actual repository paths.
3. **Nathan Direct methodology map** — expand `SAT_METHOD_SOURCE_MAP.md` from verified Nathan-authored material only.
4. **Documentation/navigation convention** — support Common handoff + durable project/index home + Dashboard/navigation linkage.
5. **Directive provenance** — backfill live-directive raw conversation/message IDs when exports land; never invent them.
6. **Live development testimony** — maintain `WORKSPACES/COMMON/NATHAN_LIVE_DEVELOPMENT_NOTES.md`, separating present direct testimony from archive-corroborated history and turning historical claims into archive-dating targets.
7. **Continuity** — keep this checkpoint plus bounded run notes restartable.

## Epistemic boundaries

Keep distinct: Nathan-authored direct material; Nathan's present recollection/testimony; archive-corroborated history; established/tentative SAT/H(s)H status supported by controlling sources; historical/displaced material; assistant interpretation; Mercer reconstruction; Workshop/Clearinghouse speculation. Do not promote worker consensus, recollection, quarantined material, or generated interpretation into authority without provenance.

## Current controlling state

- **Project-wide theory-bearing standdown remains active.** Mercer individual training is complete, but ordinary theory-bearing work remains deferred until Nathan releases the standdown.
- Bounded source-integrity/provenance maintenance explicitly handed off through Common is permitted.
- Current Common P1 issue `MORROW-SOURCE-001` concerns false-positive duplicate/superset classification caused by incomplete message-content comparison.

## Current frontier — after Run 7

### `MORROW-SOURCE-001`

**Code-side resolved / output-side pending.**

Completed:
- patched `WORKSPACES/COMMON/scripts/find_superset_conversation_duplicates.py` to compare author role/name + entire `content` object + recipient + channel + create_time;
- documented conservative payload policy and Janus truncation case in `SUPERSET_SCANNER_QA_2026-09-13.md`;
- committed `tests/test_superset_conversation_duplicates.py` covering execution-output text truncation, channel-only changes, and JSON object-key reordering;
- directly executed all three regression conditions against current scanner logic: all PASS.

Pending:
- GitHub exposes no status context for the regression commit, so CI success is not claimed;
- no committed scanner invocation or generated candidate-report surface has been found;
- any pre-patch externally/manual-generated duplicate report remains stale until its owner/path is identified and rerun;
- preserve the earlier Janus export; do not disposition it from pre-patch scanner output.

### Other deferred/queued Mercer work

- v2 layered-autotag selectivity validation after standdown release;
- Morrow-reported Viewer/catalog path drift reconciliation;
- continued source-grounded methodology reconstruction;
- Common historical-definitions/glossary initiative and durable documentation convention;
- raw UUID/timestamp backfill for live Nathan development testimony when exports land.

## Safe alternate work while standdown remains active

- direct provenance/documentation work explicitly requested by Nathan;
- bounded source-integrity/provenance maintenance handed off through Common;
- training/training-record work;
- continuity and documentation machinery needed to preserve current state.

Do not resume ordinary theory-bearing synthesis, solver interpretation, predictions, or speculative reconstruction during the standdown.

## Run history

- **Run 1:** completed Mercer mandatory 4D-training pass; see `RUN_001_2026-09-13.md`.
- **Run 2:** created shared `NATHAN_LIVE_DEVELOPMENT_NOTES.md` from Nathan's live RMS/SAT-development clarifications and dating targets.
- **Run 3:** verified live-development log integrity/discoverability state; README pointer remained blocked at that time.
- **Run 4:** independently confirmed `MORROW-SOURCE-001`, found both incomplete `content` hashing and omitted `channel`, patched scanner, created QA record.
- **Run 5:** traced for committed scanner invocation/report and directly spot-tested text-truncation/channel cases; see `RUN_005_2026-09-13.md`.
- **Run 6:** committed regression tests into repository unittest surface and traced workflow ownership; see `RUN_006_2026-09-13.md`.
- **Run 7:** re-read Control/Common/current scanner; GitHub still shows no status contexts for the test commit; directly executed all three regression conditions successfully; updated QA record; see `RUN_007_2026-09-13.md`.

## Blockers / dependencies

- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown; output-side regeneration cannot be completed from committed repository state alone.
- `DEPENDENCY`: live Nathan conversation UUIDs/timestamps await export for provenance backfill.
- No current issue genuinely requires Nathan attention.

## Best next operation

Next run: reread Control/Common. If a newer eligible handoff exists, take it. Otherwise check once for identification of the stale scanner-report generation path; if still absent, do not repeat scanner validation—branch to the highest-value permitted provenance/documentation task. After standdown release, return to autotag/index selectivity QA or Viewer/catalog reconciliation according to current ownership.
