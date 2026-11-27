# Meridian h1135:s2 — visible navigation-label binding and Paper A route audit

**Nominal slot:** 2026-11-27T07:24:00Z  
**Run key:** `REVROT3-19-20261011:1135:s2`  
**Selected:** Meridian (ring index 15)  
**Next:** Mercer (ring index 16)  
**Disposition:** `FORMAL_CAPTURE_GATE_EXTENDED / MERGE-REFERENCE_BUILD_PASS / P0_DISCOVERY_FRESHNESS_PASS / PRESENTATION_SAFETY_FAIL`

## Authority and scope

The original Meridian source was recovered from two raw conversation exports:

- *Meridian Michelstein-on-Meinorly*, conversation `6a9aa91b-11f4-83ea-80a1-4d502522e441`, blob `d21e251df093013903cc19789ded562f83b6e6ea`.
- *Meridian Free Build*, conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b`, blob `7af1561b321f4d9364da5eb111df689efc652827`.

Direct Nathan messages establish geometry-solver, representation, Whirligig and mathematical-physics interests. No separately signed specialist charter or authenticated current Meridian thread was recovered.

The live Code Grurple roster supersedes ordinary solver work for this activation: Meridian remains Paper A originator / accepted-R1 presentation-repair support only. Tern retains release/standdown authority; Mercer retains independent A/B presentation QA. Lane 24 remains cycle 08/08 complete, BACKSEAT/HOLD. No physical calculation or CODATA comparison was performed.

## 1. Formal navigation-label refinement

Existing [PR #2655](https://github.com/Satobloc/HsH/pull/2655) was extended on its existing branch `research/meridian-accessibility-tree-gate-h1131s3`, without rebase, merge or production change.

New branch head: `4f08b32f6c8121ac6f932a55b9c1a2a3bb581591`.

The module `AsterCaptureBoundDisclosure.lean` now defines `CapturedNavigationLabel` with a label node, associated source-link node, visibility flag and visible text. `visibleNavigationLabelForTargetPresent` requires a nonempty visible label to bind to the same captured semantic link whose accessible name and exact canonical target pass the existing link predicate.

`CapturedReaderTree` carries the label projection, and `disclosureTreePasses` now requires it. The new theorem `disclosure_tree_pass_requires_visible_navigation_label` proves that a passing disclosure tree entails the bound visible-label predicate.

The eight-case regression matrix returns:

`true, true, false, false, false, false, false, false`

The positive controls cover an accessible icon with a separate visible label and a visible-text link. Negative controls cover an orphan label, hidden label, empty label, ARIA-hidden link, wrong semantic role and wrong target.

### Lean verification

[PR workflow run #45959090519](https://github.com/Satobloc/HsH/actions/runs/45959090519), job `140372373290`, completed SUCCESS.

- Lean 4.34.0
- Lake 5.0.0
- 8,946 build jobs
- The compiled merge-reference commit was `be152e81cf15f8de1079a66ab851518414e49c97`.
- The modified module blob was identical at the PR head and merge reference: `5d26d8833be5cd4b621891928a52b562bcad69b6`.
- The root aggregator blob was also identical: `b105c2413563ba93db40c47a3cf719015f40e27f`.

This is a successful PR merge-reference build containing the exact changed module, not a standalone head-only build. The new theorem and regression matrix report `propext`, `Classical.choice` and `Quot.sound`. Tests, lint, leanchecker, nanoda and the global axiom audit were skipped.

The formal result is conditional on the capture adapter's supplied node IDs, visibility and association. The adapter must include both projections and their relation in the same capture-digest/parser-binding projection. Lean does not inspect the browser DOM, verify visual grouping, prove that the label is semantically descriptive, or establish a live route. Human reader acceptance remains external.

## 2. Paper A accepted-R1 source-to-presentation audit

The accepted Paper A source remains unchanged:

- `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex`
- Git blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`
- Feed manuscript ref `58b0ed9c19c8dba123846c411d4ac8b7db5c0df9`

The current `PUBLIC_SITE/PAPERS_FEED.json` blob is `e3552fdac0f187b066b59a9742563094efffe011`, updated 2026-10-21.

Direct JSON inspection establishes:

- Paper A: `sandbox_staged_accepted_r1`, `site_display=sandbox_manuscript`, `posted_date=null`, **no `site_version` field**, legacy `paper.html?id=convergent-motifs-r1` URL.
- Paper B: `sandbox_posted_reviewed_r1`, `posted_date=2026-09-23`, `site_version=34`.

This corrects a later crosswalk statement that both feed entries carry site version 34: the current exact feed gives version 34 only to Paper B.

No Paper A PDF derivative exists in its source directory. `PUBLIC_SITE/PAPERS/` contains only the `cruller-rubin` series directory, and `PUBLIC_SITE/generated/papers.json` contains only Cruller-Rubin R0. The existing `tools/publish_papers.py` validates already-typeset PDFs; it does not compile TeX. The current repository has no `sandbox_manuscript` renderer implementation.

Both legacy Paper A/B URLs were attempted through the web reader and were inaccessible. This is `ROUTE_NOT_OBSERVED`, not evidence of a rendering failure or a pass. No authenticated site-capable browser context or Sites editor action was available.

## 3. Discovery freshness and P0 record safety

[Discovery run #45954149802](https://github.com/Satobloc/HsH/actions/runs/45954149802) completed SUCCESS:

- Workflow event head: `4bbeee9d1cfb630c41abc0c73ccd8136794c8f87`
- Scanner source cut: `6572724d148c421a19ba7c9a6c9c2a5ca7ab1194`
- Generated commit/current main: `e0cb305c5f9cb4dc08ce860ca177329b1d331e4a`
- 18,145 documents; 48 docket entries; 417 square visuals; 6 extraction errors.

The event-head-to-source-cut difference is one generated-discovery-only commit. The source-cut-to-generated-commit difference is also only `PUBLIC_SITE/generated/discovery.json`. The source snapshot is therefore aligned for inspected eligible content, while the general moving-`main` race remains possible.

At the source cut and current main, `tools/site_discovery.py` is blob `97ff9c6d00544251c05bd6bb6053907805438f3e`. Its document constructor still assigns `reader=route(name,f['path'])` to every eligible file. This conflicts with the default-deny `PRESENTATION_GATE` and `READER_ROUTING_REGISTRY`, which require explicit presentation derivatives for `WORKSPACES/**`.

[Navigation run #45954149821](https://github.com/Satobloc/HsH/actions/runs/45954149821) failed at strict date-tag verification: 1,040 dated/correct; 0 needing rename; 0 unresolved collisions; 2 undatable conversations; 881 skipped non-conversation/bad-JSON files. The 75 root renames were runner-local and not persisted. Downstream Viewer, chronology, structural indexing, autotagging, tests, commit and deployment were skipped.

The existing default-deny PR #2009 remains OPEN / DRAFT / UNMERGED and highly divergent from current main (14 ahead / 1,085 behind at the inspected comparison). It was not rebased or merged; outstanding thumbnail-identity and post-commit-cleanup QA findings remain.

**P0 disposition:** discovery freshness PASS at the recorded source cut; source-level record/presentation safety FAIL; Paper A/B live-route acceptance NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED.

## 4. Tooling and boundaries

Existing Math Hopper code, Whirligig kernel material and PR #2463, and the current Lean/P0 PRs were checked before extending the existing formal branch. No new tool, dependency, fork, subscription or paid service was introduced. Local Lean/Lake/Elan are unavailable in this runtime; the existing GitHub Lean workflow was used. SciSpace was not needed for this source/implementation task.

No private HSH_RESOURCES payload was opened. No manuscript, feed, renderer, public route, deployment, paper gate, SAT-O/Blockwave equation, BEDROCK theory statement or scheduler was changed. No physical calculation, fit, prediction, uncertainty propagation or independent measurement was performed.

## 5. Continuity and scheduler

Next deterministic label: Mercer. No authenticated current Mercer thread, direct delivery, consumption, acknowledgment, assignment or ownership transfer is claimed. PR #2655 and this report are repository context only.

The existing Workshop Relay :24 Geometry automation remains enabled and unchanged:

- ID `6abda4c8eda88191bf23a6f2849e9a17`
- `DTSTART;TZID=America/New_York:20261001T142400`
- `RRULE:FREQ=HOURLY`
- Geometry phase and prompt unchanged
- No sixth task

No canonical worker checkpoint or separate handoff was created under the active P0 interlock. This published report is the durable execution record.
