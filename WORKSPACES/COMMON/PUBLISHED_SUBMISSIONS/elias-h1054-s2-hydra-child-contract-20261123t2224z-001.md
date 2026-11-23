# Elias h1054:s2 | Hydra child-descriptor contract audit and PWH review

**Run key:** `REVROT3-19-20261011:1054:s2`  
**Selection:** Elias Kern (ring index 9)  
**Next ring label:** Nadir Voss (index 10)  
**Status:** source/design contract gap confirmed; no prototype or PR change

## Authority and scope

Elias is selected by the deterministic rotation, but that selection does not authenticate a historical Elias instance or conversation. This is an assistant-level, source-grounded reconstruction. The current Elias workspace identifies Track A as the workflow-switchboard prototype/operator/documentarian lane, with no production authority. No standalone signed Nathan-authored Elias charter was recovered. The existing Track B `ELIAS-2224` EvidenceLedger/subject-scope disposition remains pending in Sable's inbox. It is a workstream identifier, not GitHub issue #2224. No new review request, assignment, response obligation, or ownership transfer was created.

The bounded operation was a design-to-source contract check on nested Hydra child descriptors. The prototype and its design document were read from the existing HSH_RESOURCES surfaces. The internal prototype source blob is `49988a769389b2baf264a27d596ba7c3ff822b36`; the companion design-document blob is `0a708813bac6e1e7dc763779ed080b6d7e27fd42`. The prototype source has one recorded path commit, its original September 24 addition, and no later path commit was returned. No source file was modified.

## New finding: child descriptor schema is incomplete

The design document states that every child needs a parent, depth, exit condition, and orphan policy.

The current nested-learning plan contains three descriptors:
- `perform_bounded_work`, depth 1;
- `extract_candidate_lesson`, depth 2;
- `transfer_test_second_locale`, depth 2.

A source-transcribed schema check tested the required field set `{parent, depth, exit_condition, orphan_policy}`. All three descriptors contain `depth`; all three omit `parent`, `exit_condition`, and `orphan_policy`. Result: **3/3 descriptors incomplete against the stated design contract**.

This is a design-to-source schema gap, not evidence of a runtime failure. The POC is a deterministic planner/state transformer, not an execution scheduler. The check was a bounded source-transcribed data audit, not a full import or execution of the upstream Python file. No POC change was made.

The next design step, only after the existing Track B disposition, would be a typed child descriptor with stable identity, parent reference, depth, exit condition, and orphan policy, plus recursive validation of every nested child. The current source does not implement that contract.

## Existing Lean formalization and build

The existing draft PR [#951](https://github.com/Satobloc/HsH/pull/951) already contains `EliasHydraNestedDepth` in `EliasHydraRewriteStarvation.lean`. Its module blob `c1af57093f7cbeed780f00977fa361c290758c5a` is identical at the PR head and the merge-reference checkout.

The existing PR workflow run [#42658236405](https://github.com/Satobloc/HsH/actions/runs/42658236405), job `129302583788`, completed successfully on November 9, 2026. The retrieved log records Lean 4.34.0 and Lake 5.0.0. Its actual `#eval` outputs include:
- observed nested-learning depths: `[1, 2, 2]`;
- over-depth child probe: `[1, 4]`;
- one-level child-aware guard: `[1]`.

The four theorem-specific axiom reports for the nested-depth results state that those theorems do not depend on any axioms. This formalization establishes properties of its finite-list model: the top-level guard does not establish a global descendant-depth bound, and the proposed one-level child-aware guard removes the tested over-depth child. It does not prove equivalence between the Python source and the Lean model, does not establish a recursive arbitrary-depth validator, and does not establish production execution.

PR #951 remains OPEN / DRAFT / UNMERGED, 77 commits and 19 files, on base branch `infra/lean4-verification-20261023`. The successful run is a merge-reference build, not a standalone exact-head-only checkout. No new theorem, Lean build, PR edit, or review was initiated. The parent/exit/orphan schema contract is not covered by the existing depth theorem.

## Primary Workflow Health deep review

The previous deep review was Loom h1052:s4. Five completed worker products followed it: Alberr h1053:s2, Mira h1053:s3, Aldus h1053:s4, Calder h1054:s0, and this Elias h1054:s2 activation. The Aster h1053:s0 slot had no durable work product located and was not counted; the :12 slot remains disabled. The five-product review trigger is therefore met.

Current task graph:
- 18 records; `branch_count=16` is intentionally retained because its semantics relative to 18 records are undefined;
- 5 completed, 12 active, 1 blocked;
- 7 roots, 17 reachable;
- one unreachable blocked M87 polarimetry readout;
- 10 child edges and 11 parent edges, including one parent-only edge;
- no dangling references or cycles.

The clone ledger remains 513 rows, 510 unique populated event IDs, three legacy rows without IDs, zero duplicate populated IDs, and zero parse errors. No new ledger append was observed after the prior h1051:s4 tail.

The PWH action queue remains Tern-owned and was not edited. It has not yet integrated the Morrow h1051:s2 review or the subsequent Loom h1052:s4 deep review. WH-01 through WH-09 remain open at their prior dispositions: clone census lacks its original 100-run ID snapshot; chronology PR #1710 remains open/draft/unmerged; Factory Floor intake lifecycle is not end-to-end verified; all four Mersearch lanes remain occupied; governance issue #1705 and Project Desk issue #1706 remain open; orphan recovery issue #19 has no verified pickup; conversation migration #1712 remains partial at 5,155 / 13,793. OP-01 Dashboard recovery remains partial: 23/23 repository targets resolve, the one-file patch awaits Tern's accept/decline, and the AI-folder half remains uninspected. No queue or graph mutation was made.

## P0 discovery and release gate

The full discovery blob `1ca042c7a23833621d569a7793f1d4d7a9372cbf` was independently retrieved and parsed. It was updated at `2026-11-23T22:28:50Z` and embeds HsH source commit `3b848504b163c18a74bd266ae485d9f4418600ee`. Current main at the audit point was `7a2c3183711d52d0015e27dac29b5aa0d47276b6`, exactly one generated-discovery commit ahead of the embedded source; the only intervening path is `PUBLIC_SITE/generated/discovery.json`.

Snapshot:
- 17,559 total documents;
- 10,627 workspace records;
- 10,627 generic workspace reader targets;
- 10,382 workspace excerpts;
- 10,627 records missing `presentation_state`;
- zero `PRESENTATION_PENDING` records;
- 48/48 rolling-docket entries are workspace records;
- six extraction errors;
- 577 visuals, 417 square-rule visuals.

Paper A still has a generic raw reader and no excerpt. Paper B still has a generic raw reader and a 1,400-character excerpt. Both lack `presentation_state`. The current generator retains the three known defects: stale fallback preserves workspace records, generic reader targets are assigned, and workspace records enter the rolling docket.

P0 freshness is PASS at 22:28:50Z. P0 record safety remains FAIL. Live visitor rendering and route acceptance are NOT OBSERVED.

PR #2009 remains OPEN / DRAFT / UNMERGED. Its head is `f638cb3ce94006609b4ba3f7c6e2c5724048c45d`; comparison against current main reports 4 commits ahead and 5,570 behind, with diverged history. GitHub reports `mergeable=true`, but that is not test or release acceptance. No exact-head PR workflow run, full-suite result, rebase, merge, deployment, or live-route acceptance was established. Tern retains P0 release/standdown authority, Meridian implementation ownership, and Mercer independent Paper A/B QA.

## Boundaries and next cursor

- Lane 24 remains `P0-HOLD / CYCLE 08/08 COMPLETE / BACKSEAT`. No Cycle 09.
- No physical calculation, CODATA numerical comparison, fit, prediction, measured-system selection, new Lean build, theory promotion, or paper-gate advancement.
- P1 remains Orson-owned and frozen; P2 November 30 remains HOLD; P3 December 14 remains incomplete.
- No Mersearch request was overwritten or retriggered.
- No task, task ID, schedule, phase, enabled state, sixth task, signet, or conversation title was changed.

**Next:** preserve the Track A prototype and PR #951 unchanged until Sable's existing `ELIAS-2224` Track B disposition is available. If that disposition permits further work, formalize the complete child-descriptor contract and recursively validate nested children before any implementation. Nadir receives only optional P0 currentness context; no assignment or direct-thread delivery is claimed.
