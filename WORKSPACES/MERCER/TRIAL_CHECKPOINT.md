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

## Current frontier — after Run 9

### Viewer/catalog path drift
**Resolver/path validation passed; generated-data publication race hardened; successor CI still pending.**

Morrow reported eight of nine LIVE Viewer paths containing date prefixes absent from the repository tree. Direct inspection established:
- `indexes/manifests/live-conversation-dates.json` is dry-run;
- eight accepted LIVE records have `status: planned`;
- their `new_path` values are proposed rename targets while source files remain at `old_path`;
- the historical Viewer builder preferred `new_path` unconditionally.

Completed through Run 8:
- created `tools/build_conversation_viewer_resolved.py` with existence-aware path resolution;
- updated `.github/workflows/build-conversation-viewer.yml` to invoke that resolver and assert every non-external catalog source path exists;
- documented root cause/regression expectations in `VIEWER_PATH_QA_2026-09-13.md`;
- fixed initial wrapper recursion;
- changed resolver to omit records for which neither manifest path exists, preventing publication of dead source URLs.

Run 9 findings/actions:
- inspected Viewer run `34788195121` for commit `92b7b37459e648b682d28dfad9a36765825eac99` directly through GitHub Actions;
- confirmed build and full generated-catalog validation both succeeded: `374` conversations, `365` development, `9` live, with no missing-path assertion failure;
- confirmed the run failed only in the final push because `main` advanced concurrently (`fetch first` non-fast-forward rejection);
- confirmed current committed `CONVERSATION_VIEWER/data/conversations.json` was still stale at inspection time: `375` conversations, `366` development, `9` live, showing the repaired generated data had not silently landed;
- inspected `indexes/manifests/development-conversation-dates.json` and directly located the stale deleted-source record for `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_6/25.12.29•25.12.30•Court Filing Guidance — raw.json` (`status: unchanged`, `message_count: 78`);
- hardened `.github/workflows/build-conversation-viewer.yml` in commit `f1bee23ba9e94848e427a6adb86e8d6bc830a610`: generated-data publication now fetches/reset to newest `origin/main`, rebuilds, rechecks repository path existence, and retries push races up to four times;
- successor Viewer run `34791027403` triggered and was in progress at last check;
- updated `VIEWER_PATH_QA_2026-09-13.md` with exact run/commit evidence and remaining gates.

Pending:
- observe completion of Viewer run `34791027403` or direct successor;
- verify regenerated Viewer data actually lands on `main` and count drops from stale `375/366/9` to current materialized `374/365/9` unless intervening legitimate source additions change those counts;
- verify all materialized LIVE entries resolve and deleted `Court Filing Guidance` is absent from Viewer output;
- identify the owning regeneration path for the development-date manifest before changing the stale record itself. Do not hand-edit manifest history semantics without that ownership/source path.

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
- Run 8: traced Viewer LIVE-path drift to dry-run manifest `new_path` misuse; landed existence-aware resolver and workflow path-existence gate; CI then exposed and drove repair of wrapper recursion and one stale deleted-source manifest residue; see `RUN_008_2026-09-13.md` and `VIEWER_PATH_QA_2026-09-13.md`.
- Run 9: confirmed repaired Viewer generation/path validation succeeds but publication was losing a concurrent push race; hardened workflow with newest-main rebuild/revalidation/retry loop; directly confirmed stale `Court Filing Guidance` manifest residue and current stale generated catalog; successor CI pending.

## Blockers / dependencies
- `DEPENDENCY`: Viewer run `34791027403` / direct successor must finish before publication repair is declared green; no Nathan decision required.
- `DEPENDENCY`: stale development-manifest entry for deleted `Court Filing Guidance` needs owning generator/regeneration path identified before manifest-level reconciliation.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `DEPENDENCY`: live Nathan conversation UUIDs/timestamps await export for provenance backfill.
- No current issue genuinely requires Nathan attention.

## Best next operation
Next run: reread Control/Common, then inspect Viewer run `34791027403` or its direct successor. If green, fetch committed `CONVERSATION_VIEWER/data/conversations.json`, verify all LIVE paths and deleted-source exclusion against the tree, then post a concise resolution/handoff to Common/Morrow. After that, trace the development-manifest generation owner and repair the stale deleted-source record through its proper regeneration path rather than hand-editing it. If CI fails, inspect only the exact publication/rebuild failure and keep changes bounded to Viewer/catalog infrastructure.
