# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan invitation/authorization, 2026-09-13 11:33 EDT  
**Role:** index/retrieval QA + Nathan Direct methodology/source reconstruction + documentation/navigation reconciliation  
**Workspace:** `WORKSPACES/MERCER/`

## Role boundary
Mercer owns the reliability layer between raw/tagged material and project navigation/retrieval: index quality, source-path/catalog reconciliation, retrieval selectivity, durable documentation conventions, direct-source methodology mapping, and bounded source-integrity QA. This complements rather than duplicates Morrow's conversation-family identity/continuity/context recovery and the active Nathan-words extraction/tagging lane.

## Startup rule
Every run: read `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md`, current Common coordination surfaces, newer Nathan directives, ownership/duplication state, then take the highest-value eligible nonduplicative operation.

## Measurable goalposts
1. Autotag/index QA — coverage, selectivity, precision/recall behavior, duplicates, structural-index cross-checks.
2. Viewer/catalog integrity — reconcile generated Viewer/catalog paths with actual repository paths.
3. Nathan Direct methodology map — expand `SAT_METHOD_SOURCE_MAP.md` from verified Nathan-authored material only.
4. Documentation/navigation convention — Common handoff + durable project/index home + Dashboard/navigation linkage.
5. Directive provenance — backfill live-directive raw conversation/message IDs when exports land; never invent them.
6. Live development testimony — maintain `WORKSPACES/COMMON/NATHAN_LIVE_DEVELOPMENT_NOTES.md`, separating present direct testimony from archive-corroborated history and turning historical claims into archive-dating targets.
7. Continuity — keep this checkpoint plus bounded run notes restartable.

## Epistemic boundaries
Keep distinct: Nathan-authored direct material; Nathan's present recollection/testimony; archive-corroborated history; established/tentative SAT/H(s)H status supported by controlling sources; historical/displaced material; assistant interpretation; Mercer reconstruction; Workshop/Clearinghouse speculation. Do not promote worker consensus, recollection, quarantined material, or generated interpretation into authority without provenance.

## Current controlling state
- Project-wide theory-bearing standdown remains active.
- Mercer individual training is complete.
- Bounded archive/navigation/source-integrity/provenance maintenance is permitted when handed off or directly within lane.

## Current frontier — after Run 8

### Viewer/catalog path drift
**Root cause identified; repair landed; CI confirmation pending.**

Morrow reported eight of nine LIVE Viewer paths containing date prefixes absent from the repository tree. Direct inspection showed:
- `indexes/manifests/live-conversation-dates.json` is in `mode: dry-run`;
- eight accepted LIVE records have `status: planned`;
- their `new_path` values are proposed rename targets while files remain at `old_path`;
- `tools/build_conversation_viewer.py` historically preferred `new_path` unconditionally.

Completed:
- created `tools/build_conversation_viewer_resolved.py` with existence-aware path resolution;
- updated `.github/workflows/build-conversation-viewer.yml` to invoke that resolver and assert every non-external catalog path exists;
- documented root cause/regression expectations in `VIEWER_PATH_QA_2026-09-13.md`;
- first workflow run exposed a wrapper recursion bug; fixed by preserving the original base resolver before monkeypatching.

Pending:
- successor Viewer workflow run `34788150612` or successor must complete successfully;
- after success, verify all nine LIVE Viewer catalog paths against the repository tree and mark Morrow's Viewer handoff resolved.

### `MORROW-SOURCE-001`
**Code-side resolved / output-side pending.** Comparator, payload policy, regression case, and tests are fixed. No committed historical candidate-report path has been identified; any pre-patch external/manual report remains stale until its owning path is found. Preserve the earlier Janus export.

### Other queued Mercer work
- layered-autotag selectivity validation after standdown release;
- continued source-grounded methodology reconstruction;
- Common historical-definitions/glossary initiative and durable documentation convention;
- raw UUID/timestamp backfill for live Nathan development testimony when exports land.

## Safe alternate work while standdown remains active
- direct provenance/documentation work explicitly requested by Nathan;
- bounded source-integrity/navigation maintenance handed off through Common;
- training/training-record work;
- continuity/documentation machinery needed to preserve current state.

Do not resume ordinary theory-bearing synthesis, solver interpretation, predictions, or speculative reconstruction during the standdown.

## Run history
- Run 1: completed mandatory 4D-training pass.
- Run 2: created shared live-development testimony surface.
- Run 3: verified live-development log integrity/discoverability.
- Run 4: confirmed and patched superset-scanner payload-equality bug.
- Run 5: traced scanner invocation/report path and spot-tested regressions.
- Run 6: committed scanner regression tests.
- Run 7: revalidated scanner logic and compacted checkpoint.
- Run 8: traced Viewer LIVE-path drift to dry-run manifest `new_path` misuse; landed existence-aware resolver and workflow path-existence gate; first CI run found recursion and was repaired; see `RUN_008_2026-09-13.md`.

## Blockers / dependencies
- `DEPENDENCY`: Viewer successor workflow result pending; no Nathan decision required.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `DEPENDENCY`: live Nathan conversation UUIDs/timestamps await export for provenance backfill.
- No current issue genuinely requires Nathan attention.

## Best next operation
Next run: reread Control/Common, then check Viewer run `34788150612` or successor. If green, validate all nine LIVE Viewer paths against the tree and post concise resolution to Common/Morrow. If not green, inspect the exact failure and repair only the path-generation/validation layer. After that, take the next eligible nonduplicative provenance/documentation QA task.
