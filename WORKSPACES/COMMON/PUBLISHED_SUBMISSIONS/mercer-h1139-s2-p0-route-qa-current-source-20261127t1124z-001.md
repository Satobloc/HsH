# Mercer h1139:s2 — Paper A/B source-pin and P0 route recheck

**Nominal slot:** 2026-11-27T11:24:00Z  
**Run key:** REVROT3-19-20261011:1139:s2  
**Selected routing label:** Mercer (ring index 16)  
**Next routing label:** Ravel (ring index 17)  
**Disposition:** SOURCE_PINS_PASS / LIVE_ROUTE_NOT_OBSERVED / CURRENT_MAIN_REFRESH_NOT_YET_OBSERVED / P0_ACTIVE

## Authority and scope

The historical direct Nathan source is the October 1 user-role message bb8ecf64-8863-4ee7-a078-ca8cc4104974 in *Quantum Gravity and Experiments*, conversation 6a3a2037-3698-83ea-924d-2cb8c4ac7701, raw export blob d828fef5352045cb4d9486fdbeabd04043c4c119, timestamp 2026-10-01T20:56:07.264Z. It establishes a broad equations/dimensional-analysis/constitutive-physics/coarse-graining/forces/quantitative-consequences orientation; it is not a standalone signed specialist charter.

The live Code Grurple roster narrows the current Mercer assignment to **independent Paper A/B presentation QA**. Meridian retains Paper A/shared implementation ownership, and Comptroller Tern retains P0 release/standdown authority. Paper A and B manuscript content is closed; this run does not reopen scientific/editorial work.

This is assistant-level, source-grounded execution under the deterministic ring label, not authenticated participation by a historical Mercer instance or a current Mercer ChatGPT thread. No current usable Mercer thread was established in bounded prior-context and repository lookup.

## 1. Current branch and discovery state

The latest observed HsH main head is 9756eb9109dce669f91316d15e568129410c4498 (commit time 2026-11-27T11:22:11Z).

The latest completed discovery workflow is [run #45987671928](https://github.com/Satobloc/HsH/actions/runs/45987671928), SUCCESS. Its event head was b93f0100712a463e43f077e0c12465536cc87f61; the job log records the actual HsH scanner source cut 84786e178959a96aac10899cd27ba34880c839f7, and generated commit 2bab76ed3c24e53cca21dd57ec06d9a77de62852. The scan reported 18,181 documents, 48 docket entries, 417 square visuals, and six extraction errors. The generated commit follows the scanner source cut.

Current main is two commits ahead of that generated commit. The intervening paths are three Conversation Viewer data manifests and three request-scoped Aster Mersearch outputs under indexes/mersearch_requests/aster-run099-carrier-frame-source-genealogy-20261127t0901z-001/. The discovery workflow's push trigger ignores only PUBLIC_SITE/generated/**; a refresh for the newer main is therefore expected, but no post-9756eb9 discovery run was visible at final inspection. Current-main discovery inclusion is **not yet verified**.

The last navigation workflow, [run #45987671850](https://github.com/Satobloc/HsH/actions/runs/45987671850), FAILED at strict date-tag verification on event head b93f010. Its audit reported 1,040 dated/correct, zero renames needed, zero unresolved collisions, two undatable conversations, 881 skipped non-conversation/bad-JSON items, and 75 runner-local root renames. The 75 renames were not persisted. Viewer, chronology, structural indexing, autotagging, tests, commit, and deployment steps were skipped.

## 2. Paper A/B source identity

Current PUBLIC_SITE/PAPERS_FEED.json blob: e3552fdac0f187b066b59a9742563094efffe011.

Both feed-referenced source commits were fetched independently and their blob SHAs matched the roster's protected identities:

| Paper | Feed status | Feed source ref | Verified source blob |
|---|---|---|---|
| A — Convergent Geometric Motifs | sandbox_staged_accepted_r1 | 58b0ed9c19c8dba123846c411d4ac8b7db5c0df9 | 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa |
| B — Boundary-Passage Weak-Secondary Search | sandbox_posted_reviewed_r1 | 731e2fb5888b0aec856fd9e31319c39746514239 | 0a1dca42cafd9a02faceff4ec0851659a317b2bb |

Paper A's feed entry remains sandbox_manuscript, with posted_date=null and no site_version. Paper B remains sandbox_manuscript, with legacy site_version=34 and posted_date=2026-09-23. These are feed metadata, not live deployment evidence.

PUBLIC_SITE/generated/papers.json contains only the Cruller-Rubin series. The PUBLIC_SITE/PAPERS/ directory contains README.md, _templates/, and cruller-rubin/; no Paper A or B PDF derivative is present there.

No manuscript content, feed entry, or source file was changed.

## 3. Actual route acceptance

The two designated routes remain:

- Paper A: https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=convergent-motifs-r1
- Paper B: https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=boundary-weak-emission-r1

A bounded direct web-open attempt did not yield an inspectable page; the connected Browser surface had no active tab/context. Therefore no live DOM, screenshot, mobile layout, or visitor-visible rendering was observed. This is LIVE_ROUTE_NOT_OBSERVED, not a demonstrated route failure and not acceptance.

The seven acceptance elements remain separate: rendered headings/paragraphs; typeset inline/display mathematics; usable citations/references/links; safe long-equation/URL and narrow-width behavior; visible SANDBOX/review/provenance affordances; exact Paper A source identity; exact Paper B source identity. Only the two source-identity checks PASS. The rendering and live-route checks remain NOT_OBSERVED.

## 4. Source-level policy and existing repair branches

The current main tools/site_discovery.py blob is 97ff9c6d00544251c05bd6bb6053907805438f3e. Its route() returns a generic reader.html?mode=browse... target, and the document constructor assigns that route to discovered files without a WORKSPACES/** default-deny/presentation-pending branch. This conflicts with the current [Presentation Gate](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/PRESENTATION_GATE.md), [Reader Routing Registry](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/READER_ROUTING_REGISTRY.md), and [Presentation Contract](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/PRESENTATION_CONTRACT.md). This is a confirmed source-level record-routing defect, distinct from the unobserved external Paper A/B routes.

The existing [PR #2009](https://github.com/Satobloc/HsH/pull/2009) proposes metadata-only workspace discovery and removal of raw reader targets/excerpts. It remains OPEN / DRAFT / UNMERGED. Exact current-main-to-PR-head comparison is 14 commits ahead / 1,177 behind / DIVERGED. No rebase, merge, implementation, or deployment was attempted.

## 5. Correction to the previous Mercer QA

The h1135:s3 report's false-accept classification for PR #2655 was explicitly withdrawn in [Amendment #2668](https://github.com/Satobloc/HsH/issues/2668). Review 6084977141 supersedes review 6084922935: CapturedNavigationLabel is a separate captured projection in CapturedReaderTree.navigationLabels, so its node ID need not also occur in elements. The earlier supplied-record witness did not establish a false accept or browser defect. The remaining trust boundary is external capture-adapter fidelity and same-digest/parser-binding evidence; no code change is recommended from that withdrawn finding.

## 6. P0 disposition and boundaries

- Source-level presentation safety: **FAIL**.
- Paper A/B live-route acceptance: **NOT_OBSERVED**.
- Deployment: **NOT_VERIFIED**.
- Release/standdown: **NOT_AUTHORIZED**.
- Meridian retains implementation ownership; Mercer retains independent Paper A/B QA; Tern retains release/standdown authority.

No new Lean proof/build, physical calculation, CODATA comparison, fit, prediction, uncertainty propagation, manuscript edit, feed/renderer/site change, deployment, PR merge/rebase, task/ID/cadence change, or theory promotion occurred. The PWH queue and task graph were read; Tern's coordination/queue authority was not altered.

**Next cursor:** a site-capable authorized browser/editor must capture both actual reader routes against the exact feed-pinned manuscript blobs and run the seven-item acceptance checklist. Separately, the current-main discovery refresh after 9756eb9 must complete and be read back. Do not treat either step as completed by repository metadata or this report.