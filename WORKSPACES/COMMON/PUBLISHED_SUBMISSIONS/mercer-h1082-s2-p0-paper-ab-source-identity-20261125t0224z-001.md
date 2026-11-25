# Mercer h1082:s2 — Paper A/B source identity and presentation-route QA

**Nominal slot:** 2026-11-25T02:24:00Z  
**Run key:** `REVROT3-19-20261011:1082:s2`  
**Deterministic routing label:** Mercer (ring index 16) → Ravel (index 17).  
**Disposition:** `SOURCE_AND_FEED_BINDINGS_PASS_8_OF_8 / DISCOVERY_FRESHNESS_PASS / RECORD_SAFETY_FAIL / LIVE_ROUTE_ACCEPTANCE_NOT_OBSERVED / P0_ACTIVE`.

This is an assistant-level, source-grounded execution. Ring selection is not authentication of a historical Mercer instance or current ChatGPT thread. No cross-thread delivery or acknowledgment is claimed.

## 1. Authority and source provenance

The historical direct source is the October 1, 2026 user-role message `bb8ecf64-8863-4ee7-a078-ca8cc4104974` in *Quantum Gravity and Experiments*, conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701`, raw Git blob `d828fef5352045cb4d9486fdbeabd04043c4c119`. It assigns the historical :48 remit covering equations, dimensional analysis, constitutive physics, coarse-graining, forces and quantitative consequences. No standalone signed specialist charter was found.

The current Code Grurple roster supersedes that historical remit during the active interlock: Mercer performs **independent Paper A/B presentation QA only**; Meridian owns implementation; Tern owns release and standdown. Manuscript content, renderer, feed and site editing remain outside this QA assignment.

## 2. Current main and protected source identity

HsH main at the source audit was `a13b02a0311d1d9ae6228512db286523a6ca7b2c`. The eight protected Paper A/B source/control objects were independently fetched from main and matched their established pins exactly:

| Object | Current blob | Result |
|---|---|---|
| Paper A `DRAFT_R1.tex` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | PASS |
| Paper B `DRAFT_R1.md` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | PASS |
| `PUBLIC_SITE/PAPERS_FEED.json` | `e3552fdac0f187b066b59a9742563094efffe011` | PASS |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` | PASS |
| `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` | `277a94c553e2e17b61bb046a04781b4e44f2229f` | PASS |
| `PUBLIC_SITE/PRESENTATION_CONTRACT.md` | `b871249564a45278383e41eebd8aaa5d8c64aa3c` | PASS |
| `PUBLIC_SITE/generated/papers.json` | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` | PASS |
| `deploy-conversation-viewer-pages.yml` | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` | PASS |

The Paper A and B current-main blobs also match their feed-pinned manuscript blobs. Their source references are A `58b0ed9c19c8dba123846c411d4ac8b7db5c0df9` and B `731e2fb5888b0aec856fd9e31319c39746514239`.

Feed state remains:
- Paper A: `sandbox_staged_accepted_r1`; no posted date or site version.
- Paper B: `sandbox_posted_reviewed_r1`; historical site version 34 and posted date 2026-09-23.

Those are feed metadata, not current route evidence. `generated/papers.json` still contains only Cruller-Rubin; it does not contain Paper A or Paper B.

The controlling presentation gate and reader registry require a source-bound presentation derivative. Raw TeX/Markdown and `WORKSPACES/**` must not become the default reader target. If no derivative exists, the public surface must show PRESENTATION PENDING or omit the item.

## 3. Fresh discovery snapshot and record-safety result

The existing automatic discovery workflow completed successfully:

- Run: [#45532660966](https://github.com/Satobloc/HsH/actions/runs/45532660966)
- Job: `138931541169` (`discover`)
- Generation: `2026-11-25T02:25:37Z`
- Embedded HsH source: `a13b02a0311d1d9ae6228512db286523a6ca7b2c`
- Embedded SAT archive source: `028862e6f1b0ffad2f56f4989a2cd0a769d266fd`
- Discovery blob: `e25574c463b8df35ca5547aabf3047b28faa5d48`
- Generated commit: `a4c9c9cdefd9750b392af59c9342a7b0d5c48915`, parent exactly `a13b02a`; the only changed path is `PUBLIC_SITE/generated/discovery.json`.

The complete 31,890,531-character JSON blob was independently fetched and parsed.

| Measurement | Result |
|---|---:|
| Total documents | 17,834 |
| HsH workspace records | 10,902 |
| Workspace records with generic reader targets | 10,902 |
| Workspace records missing `presentation_state` | 10,902 |
| Explicit `PRESENTATION_PENDING` | 0 |
| Workspace excerpts | 10,654 |
| Rolling docket entries | 48 |
| Docket entries resolving to workspace records | 47 |
| Visuals | 577 |
| Square-rule visuals | 417 |
| Extraction errors | 6 |

The Paper A discovery record carries a generic `reader.html?mode=browse` target to its raw `.tex` source. Paper B carries the same raw-source browse target and a 1,400-character excerpt. Neither is in the 48-item docket, but both remain in the full searchable document catalog.

**Current disposition:** discovery source freshness PASS for this snapshot; workspace record safety FAIL; live reader-route acceptance NOT OBSERVED. This is a confirmed source/index policy mismatch, not proof that the external visitor route rendered raw source.

The discovery workflow still uses generate-then-rebase persistence without an explicit source-SHA equality guard. The earlier stale-snapshot reproduction remains relevant; this particular run generated from the current source and persisted as its direct child, so it did not reproduce the race.

## 4. Actual route observation

The feed names these external routes:

- Paper A: `https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=convergent-motifs-r1`
- Paper B: `https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=boundary-weak-emission-r1`

Both direct web-open attempts returned that the host was inaccessible through the available web reader. The connected-browser tool also returned that access requires the originating browser context, which was unavailable.

Therefore no live DOM, screenshot, rendered typography, mathematical layout, citation interaction, sandbox watermark, review/provenance affordance or deployed source binding was observed. This is **ACCESS_UNAVAILABLE / NOT_OBSERVED**, not a route PASS or an observed route FAIL.

The GitHub Pages workflow pinned above deploys the Conversation Viewer/Whirligig path, not the external Paper A/B Sites routes. A successful GitHub Actions build or feed/index refresh cannot substitute for route acceptance.

## 5. Existing implementation branch

PR [#2009](https://github.com/Satobloc/HsH/pull/2009) remains OPEN / DRAFT / UNMERGED:

- Head `039f90a61e337ff324d12f138ec2d3a56dc9416f`.
- Current main `a4c9c9cdefd9750b392af59c9342a7b0d5c48915`.
- Compare: 14 commits ahead / 61 behind; diverged.
- GitHub mergeability metadata currently says `true`; this is not review, CI or acceptance.
- No formal PR reviews.
- Exact-head PR-triggered workflow query returned no runs.

The existing branch's thumbnail cleanup and identity checks are implementation work owned by Meridian. This activation made no PR change, rebase, merge or deployment.

## 6. P0 ownership, next acceptance gate and non-actions

- Meridian: discovery/presentation implementation, including source-SHA guard and metadata-only workspace records.
- Mercer: independent Paper A/B presentation QA against the pinned R1 identities and shared acceptance checklist.
- Tern: control state, release and standdown.

The seven route acceptance checks remain: rendered document hierarchy; rendered mathematics; usable citations/references/links; stable long-equation and narrow-width layout; visible SANDBOX/review/provenance status; exact Paper A source binding; exact Paper B source binding. Both actual routes must pass.

No manuscript, feed, renderer, site or deployment changes were made. No physical calculation, CODATA comparison, fit, prediction, Lean build, SAT-O/Blockwave equation change, paper-gate advancement or theory promotion occurred. Lane 24 remains BACKSEAT/HOLD while Code Grurple is active. No scheduler, task ID, prompt, phase, cadence, enabled-state or ownership change occurred.

## 7. Return state

The eight protected source/control pins are intact and the latest discovery snapshot is source-fresh. The catalog still violates the presentation-state contract for all 10,902 workspace records, including both Code Grurple manuscripts. The external routes remain unobservable from this runtime. The next admissible action is an authorized site-capable maintainer's source-bound derivative/deployment followed by actual browser verification of both routes; do not reopen manuscript content or treat feed/index metadata as acceptance.
