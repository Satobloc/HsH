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

## Current frontier — after Run 11

### Viewer/catalog path drift
**Viewer publication repair is green; canonical navigation workflow is now reconciled to the same resolver; fresh owner regeneration still pending.**

Morrow reported eight of nine LIVE Viewer paths containing date prefixes absent from the repository tree. Direct inspection established:
- `indexes/manifests/live-conversation-dates.json` is dry-run;
- eight accepted LIVE records have `status: planned`;
- their `new_path` values are proposed rename targets while source files remain at `old_path`;
- the historical Viewer builder preferred `new_path` unconditionally.

Completed before Run 11:
- created `tools/build_conversation_viewer_resolved.py` with existence-aware path resolution;
- updated `.github/workflows/build-conversation-viewer.yml` to invoke that resolver and assert every non-external catalog source path exists;
- fixed initial wrapper recursion;
- changed resolver to omit records for which neither manifest path exists, preventing publication of dead source URLs;
- confirmed Viewer run `34788195121` built and fully validated repaired output (`374` conversations / `365` development / `9` live) but lost only the final non-fast-forward push race;
- hardened publication in commit `f1bee23ba9e94848e427a6adb86e8d6bc830a610`: fetch/reset newest `origin/main`, rebuild, recheck path existence, retry push races up to four times;
- successor Viewer run `34791027403` completed successfully, including build, full catalog/source-path validation, and generated-data commit step;
- fetched committed `CONVERSATION_VIEWER/data/conversations.json` after the green run and confirmed the repaired output landed on `main`: `374` conversations / `365` development / `9` live, with development manifest acceptance reduced to 364 because the dead source is omitted;
- direct search of the committed Viewer catalog found zero `Court Filing Guidance` matches, confirming the deleted-source residue is no longer published by Viewer;
- workflow validation guarantees every non-external path in that landed catalog resolved to a repository file during the run, covering the LIVE-path handoff.

Run 10 resolved upstream ownership:
- canonical development manifest is `indexes/manifests/development-conversation-dates.json`;
- `.github/workflows/maintain-navigation.yml` regenerates it by running `tools/date_conversation_exports.py DEVELOPMENT_FULL_CONVOS --apply --manifest indexes/manifests/development-conversation-dates.json`;
- the generator rebuilds records from files currently present under `DEVELOPMENT_FULL_CONVOS`; it does not intentionally retain absent-file history;
- current manifest was generated `2026-09-13T12:30:33.434526+00:00`;
- `Court Filing Guidance` was deleted later at `2026-09-13T13:41:24Z` in commit `655db2d384867c43fc59c5047403f6feade5a88c` (`privacy: remove Court Filing Guidance raw conversation from public corpus`);
- therefore the stale record is ordinary generation-time lag, not evidence that the generator resurrected the source.

Run 11 established:
- navigation run `34793981748`, previously pending, ended `completed/cancelled` and returned no jobs; it did not supply the needed owner regeneration;
- the committed development manifest remains the older generation and still contains the deleted `Court Filing Guidance` entry;
- canonical `.github/workflows/maintain-navigation.yml` was still invoking the old `tools/build_conversation_viewer.py`, creating a risk that a successful navigation run could undo the dedicated Viewer's existence-aware path repair;
- commit `44548450fa4af2905f711e81ce07139b393983d6` changes canonical navigation maintenance to invoke `tools/build_conversation_viewer_resolved.py` and adds a validation assertion that every non-external Viewer source path exists;
- immediate post-commit status inspection showed no attached check/status yet, so no fresh owner-run success is claimed.

Remaining Viewer-adjacent work:
- verify the next successful canonical navigation regeneration removes the deleted `Court Filing Guidance` record from the development manifest;
- verify the canonical navigation run passes the new Viewer source-path existence gate;
- if the dead record survives a fresh successful owner regeneration, diagnose that as a generator/workflow defect; otherwise close this branch.

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
- Run 9: diagnosed Viewer publication failure as push-race only; hardened publication; successor run `34791027403` passed all steps and landed repaired `374/365/9` catalog; deleted `Court Filing Guidance` confirmed absent from Viewer output. See `RUN_009_2026-09-13.md` and `VIEWER_PATH_QA_2026-09-13.md`.
- Run 10: traced the stale development-manifest record to its canonical owner and established the exact timing cause: manifest generation predated the scoped privacy deletion. Confirmed `maintain-navigation.yml` + `date_conversation_exports.py` own fresh regeneration, so Mercer documented rather than hand-edited generated state. See `RUN_010_2026-09-13.md` and `VIEWER_PATH_QA_2026-09-13.md`.
- Run 11: verified the previously pending canonical navigation run was cancelled with no jobs; confirmed the stale manifest record remains; found canonical navigation was still bypassing the existence-aware Viewer resolver; patched `maintain-navigation.yml` to use the resolved builder and enforce non-external source-path existence. See `RUN_011_2026-09-13.md` and `VIEWER_PATH_QA_2026-09-13.md`.

## Blockers / dependencies
- `DEPENDENCY`: verify one fresh successful canonical navigation regeneration after the `Court Filing Guidance` deletion and after commit `44548450fa4af2905f711e81ce07139b393983d6`; if the record persists then investigate generator/workflow behavior.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `DEPENDENCY`: live Nathan conversation UUIDs/timestamps await export for provenance backfill.
- No current issue genuinely requires Nathan attention.

## Best next operation
Next run: reread Control/Common, then inspect the newest `Maintain H(s)H navigation` state after commit `44548450fa4af2905f711e81ce07139b393983d6`. Confirm whether a successful owner run has (a) regenerated `indexes/manifests/development-conversation-dates.json` without the deleted `Court Filing Guidance` record and (b) passed the new Viewer source-path existence assertion. If yes, close the Viewer/manifest branch and post/update the concise Common handoff. If no successful run is available, record the dependency and branch to the highest-value permitted provenance/documentation task under the standdown. If a successful run retains the dead record, diagnose the generator/workflow defect source-first.
