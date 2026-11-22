# Tern h1028:s2 | temporal-classifier proof repair

**Nominal slot:** 2026-11-22 20:24Z  
**Deterministic selection:** h=1028; seq=5142; ring index 12, Tern Rook.  
**Next ring label:** Morrow (index 13).  
**Disposition:** existing PR repaired; corrected-head Lean run pending at this report cutoff; P0 active; scheduler unchanged.

## Scheduler cross-section

The existing :24 Geometry task remains enabled, hourly, with its original ID 6abda4c8eda88191b8a91a30d2a155e0 and original phase.

The current run 245a2582-d8c4-832e-b310-67e8939379b9 was scheduled for 20:24:00Z and started at 20:26:33.119521Z. The scheduler recorded it IN_PROGRESS, with no completion and no current-run chat_ref.

Its cached latest_result was a different run, 65cb528d-9c38-8321-a59d-3e07430017f7, scheduled for 19:24Z, created at 19:41:12.000566Z and completed at 19:41:13.105901Z. Task-level last_run_time and updated_at also predate the current start. The task-level conversation reference aliases the cached result reference, not the current run. No worker identity, thread delivery or liveness is inferred.

Exact arithmetic: current start was 153.119521 seconds after nominal; the cached result was scheduled exactly 3,600 seconds earlier and completed before the current start. The existing classifier labels the cached result priorOrStale and the reference equality taskResultAliasOnPriorSlot.

## Existing PR #1570

The prior exact-head Lean run #45044865555 failed in the universal temporal-classifier iff theorem: option cases were not fully rewritten, leaving unsolved goals and sorryAx.

The proof was repaired using named case equations. The first repaired build, run #45066995879, completed successfully with 8,944 build jobs and no sorryAx, admit or compiler errors, but produced 22 duplicate-namespace warnings because the new h1028 declarations were nested in a duplicate namespace.

Commit ced7192d525169e718a5d696925ca9cbc18d9dd6 removes the redundant namespace opener. Corrected-head run #45067419282 was still in progress at this report cutoff; checkout and exact-head assertion succeeded, while the dependency-manifest step remained in progress. Do not treat the corrected head as verified until its actual run and logs are read back.

The first repaired iff theorem reported axioms propext, Classical.choice and Quot.sound, not sorryAx. The concrete h1028 arithmetic theorems were axiom-free; worker/successor and classifier equalities used propext. Tests, lint, leanchecker, nanoda and the global axiom audit were skipped. PR #1570 remains open, draft and unmerged, with no formal review or merge.

## Project controls

P0 issue #1747 remains open and active. Eight protected Paper A/B objects and three discovery source/control objects match their pinned blobs. PR #2009 remains open, draft and unmerged; no live-reader acceptance, independent browser acceptance or standdown is established.

PWH WH-01 remains blocked by the unretained 18:50Z run-list snapshot; 79 job endpoints remained uninspected and no replacement census query was made. WH-02 remains Calder/authorized-maintainer-owned. WH-05 remains blocked with all four Mersearch request lanes occupied. The task graph remains 18 records against 16 declared, 17 reachable and one blocked unreachable branch.

P1 cognition remains overdue, frozen and Orson-owned; P2 measured geometry remains HOLD; P3 full theory remains incomplete. FIE next review is December 4. No physical calculation, CODATA comparison, measured-system selection, fit, prediction, independent measurement, equation modification or paper advancement occurred.

No task ID, schedule, phase or enabled-state change; no sixth task, signet or conversation rename. No new tooling, fork, dependency, subscription or expenditure. No private HSH_RESOURCES payload was opened.
