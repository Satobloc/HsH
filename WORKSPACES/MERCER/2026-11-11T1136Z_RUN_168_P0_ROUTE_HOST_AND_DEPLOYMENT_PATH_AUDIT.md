# Mercer h755:s3 | P0 route-host and deployment-path delta audit

**Nominal occurrence:** 2026-11-11T11:36:00Z  
**Run key:** `REVROT3-19-20261011:755:s3`  
**Selection:** h=755; seq=3778; index 16 = Mercer; successor index 17 = Ravel.  
**Disposition:** `P0_ROUTE_HOST_GAP_RECONFIRMED / SOURCE_AND_FEED_PINS_PASS / NO_NEW_DEPLOYMENT_TRIGGER / LIVE_ROUTE_NOT_OBSERVED / NO_SITE_OR_MANUSCRIPT_WRITE / AUTOMATION_UNCHANGED`.

## 1. Identity, source and current assignment

The deterministic Mercer label is not an authenticated ChatGPT identity or thread.

Historical direct source recovered and read from the raw HsH conversation export:
- Conversation: `6a3a2037-3698-83ea-924d-2cb8c4ac7701`.
- Raw export Git blob: `d828fef5352045cb4d9486fdbeabd04043c4c119`.
- Direct user-role message: `bb8ecf64-8863-4ee7-a078-ca8cc4104974`.
- Timestamp: `2026-10-01T20:56:07.264Z`.

The literal historical assignment is Mercer :48 for equations, dimensional analysis, constitutive physics, coarse-graining, forces and quantitative consequences, with source/invention separation and no target-fitting. The same message requires one old-archive file and one HsH file per run.

**Current override:** the live Code Grurple roster remains ACTIVE and assigns Mercer **Paper A/B presentation QA only**. That narrower task controls this activation. No theory work, manuscript content, scientific review, source hardening, prior-art work or paper-gate change was undertaken.

The current Mercer README, Trial Checkpoint, inbox, Run 167 report, historical direct message and incoming Meridian handoff were read. No authenticated current Mercer thread was established. The task's current run-level `chat_ref` is null. This is source-grounded work in the scheduled execution, not historical Mercer-instance participation.

## 2. Incoming context consumed

Consumed the pre-start optional packet:

- `MERIDIAN-H755-MERCER-001`
- Handoff: `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-11T1124Z_from_s2_to_s3_mercer.md`
- Handoff blob: `18745eec11456ad73e48b142d1bd17b3c4bef595`
- Meridian report blob: `3a5322373937a404381bbd6a4b6593399b363f46`
- Meridian receipt blob: `706d9e656a87718a79aada9f0762d31cde8ca2a9`

Its classification remains optional repository context only. No task, response obligation, ownership transfer or chat delivery is implied.

## 3. Current branch delta

Predecessor Meridian h755:s2 recorded main at `92e1c53b88b6db39d267d92589ead590152d8fde`. Current main at this audit was `b552b68ef5bd2d68e5957b056999f592d5c2395f`.

The exact compare reports:
- 37 commits ahead, 0 behind.
- No protected Paper A/B source or control path changed.
- The only `PUBLIC_SITE/` path in the changed-path set is `PUBLIC_SITE/generated/discovery.json`.
- That generated file's blob changed from `db9d3fcc9254f61dd7d537a8117138da406d57d8` to `af41b96c577fec9a5a20fe4bef2d0fcd35dbbc5f`. The GitHub file-content connector returned an empty content field for both versions, so no semantic claim is made about the generated file's contents.

Current exact readbacks:
- Paper A accepted R1 TeX: `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`.
- Paper B reviewed R1 Markdown: `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.
- `PUBLIC_SITE/PAPERS_FEED.json`: `e3552fdac0f187b066b59a9742563094efffe011`.
- `PUBLIC_SITE/PRESENTATION_GATE.md`: `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`.
- `PUBLIC_SITE/READER_ROUTING_REGISTRY.md`: `277a94c553e2e17b61bb046a04781b4e44f2229f`.
- `PUBLIC_SITE/PRESENTATION_CONTRACT.md`: `b871249564a45278383e41eebd8aaa5d8c64aa3c`.
- `PUBLIC_SITE/generated/papers.json`: `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7`.
- `.github/workflows/deploy-conversation-viewer-pages.yml`: `6f3e843b6a327db76b21e8b0b61a26c210b600ac`.

The two manuscript source hashes and current feed bindings match. Paper A remains `sandbox_staged_accepted_r1`, with no posted date. Paper B remains `sandbox_posted_reviewed_r1`, historical site_version 34 and posted_date 2026-09-23. Those are feed metadata, not current deployment evidence.

## 4. New route-host / deployment-path crosswalk

This run makes the host and deployment authority explicit as separate acceptance dimensions. The prior source/feed checks alone can look deceptively close to completion when the required reader route has no verified deployment path.

| Layer | Paper A | Paper B | Evidence |
|---|---|---|---|
| Pinned manuscript source | PASS | PASS | Exact source blob readback |
| Feed-to-source binding | PASS | PASS | Exact current feed and manuscript hashes |
| Required route contract | Legacy `paper.html?id=convergent-motifs-r1` | Legacy `paper.html?id=boundary-weak-emission-r1` | Feed's `website_url` |
| Presentation derivative identity | NOT OBSERVED | NOT OBSERVED | No source-bound PDF/HTML derivative readback |
| Deployment host/build identity | NOT OBSERVED | NOT OBSERVED | No current deployment identity for either legacy route |
| Live route readback | NOT OBSERVED | NOT OBSERVED | No page content obtained |
| Visual acceptance | NOT OBSERVED | NOT OBSERVED | No typography/math/citation/mobile review possible |

### Why the current GitHub Pages pipeline is not the missing route

The current legacy feed URLs point to the Glass Sausage Factory ChatGPT Sites host:
- Paper A: `https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=convergent-motifs-r1`
- Paper B: `https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=boundary-weak-emission-r1`

The repository has no `PUBLIC_SITE/paper.html` implementation. The current GitHub Pages workflow builds and deploys the Conversation Viewer plus the Whirligig-only route. Its path filters do not include the A/B papers feed, a paper reader, or the generated PDF-series index.

The separate PDF-series route, `reader.html?paper=...`, is not a substitute:
- Current `PUBLIC_SITE/generated/papers.json` contains only Cruller-Rubin R0.
- It contains neither Paper A nor Paper B.
- `tools/publish_papers.py` explicitly requires already-typeset, visually checked PDFs and validates their metadata, integrity and readability. It does not convert raw TeX or Markdown into a presentation derivative.
- Existing controls do not authorize silently migrating the legacy `sandbox_manuscript` / `paper.html?id=` contract to this different reader.

The Site Development Work Log records that the ChatGPT Sites editor was no longer available and that the November 2 corrective rollback restored the Conversation Viewer and a Whirligig-only Pages deployment. That deployment is not evidence that the legacy A/B routes are served by the current Pages build.

### Access checks and limits

A bounded capability check produced no page content:
- Direct web open of both legacy URLs returned inaccessible.
- Search for either exact route on the legacy host returned no indexed results.
- Browser tab access failed because this runtime has no originating browser context.
- The container's DNS lookup failed before an HTTP connection could be made.

These are runtime access limitations, not observations of page contents. No content-level route probe, visual acceptance test, route PASS, route FAIL, or standdown trigger is claimed. No further route probes were made.

### Decision boundary

The next valid trigger is one of:
1. A verified Sites editor/deployer or authenticated browser context with an owner preview and deployment identity for the legacy routes; or
2. An explicit Tern/Nathan route-contract decision authorizing migration of both papers to the PDF-series reader, followed by source-bound derivative creation, deployment and live verification.

Until then retain `PRESENTATION_PENDING / NOT_OBSERVED`. Do not treat a feed card, GitHub Pages Viewer deployment, Cruller-Rubin PDF index, or source fetch as A/B reader acceptance.

## 5. Workflow improvement

The P0 acceptance record now explicitly separates:
- `route_contract_id` and required route host;
- `deployment_pipeline_id` and what that pipeline actually deploys;
- `deployment_authority_available`;
- `derivative_identity`;
- `live_route_readback`;
- `visual_acceptance`.

This prevents a successful but unrelated GitHub Pages deployment from being mistaken for deployment of the legacy A/B reader. It is a verification-model refinement only. No new script, schema implementation, site, feed, manuscript, renderer, route, PR or branch was created or changed.

No mathematical or geometric proposition was introduced, so no Lean run was applicable. No physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave correction, theory promotion or BEDROCK change occurred.

## 6. Historical archive reading and upkeep

The required old-archive reading quantum was completed:
- Repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`.
- File: `SAT Mark V/TheTANGLE.txt`.
- Lines: 1601–1640.
- Blob: `3181b6cad85bbd76bd1017938e0dbf67baf03752`.
- Next cursor: line 1641.

This passage concerns the fictional Hamsalt's Patch calendar/watchbrace concept. It is unrelated worldbuilding material, not a physics source or evidence for H(s)H. The HsH source quantum was supplied by the live controls, roster, paper feed, route contract, workflow and Mercer historical source read above.

FIE was last fully rereviewed 2026-11-10; next review is 2026-11-24. No new FIE review or physical break is claimed.

Campaign:
- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition: OVERDUE / NOT READY, Orson-owned.
- P2 November 30 measured geometry: HOLD.
- P3 December 14 full theory: INCOMPLETE.

## 7. Automation and continuity

The existing :36 task was read by exact ID:
- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`.
- Enabled: `true`.
- Exact saved VEVENT unchanged: hourly, America/New_York, :36.
- Prompt unchanged; no task, ID, cadence, phase, ownership or enabled-state mutation.
- No sixth task.

Run-level observation at final read:
- Run ID: `2c18854a-d374-832e-9b8f-8aefd79b7e3c`.
- Scheduled: `2026-11-11T11:36:00Z`.
- Started: `2026-11-11T11:39:27.677664Z`.
- Status: IN_PROGRESS.
- Completion: null.
- Run-level `chat_ref`: null.
- Cached latest_result still belongs to Enheduanna h754:s3, not this run.

Repository report/receipt/handoff readback is separate from scheduler-wrapper completion. No authenticated Mercer thread or cross-thread delivery is claimed.

**Final status:** `SOURCE_AND_FEED_PINS_PASS / ROUTE_HOST_DEPLOYMENT_GAP_DOCUMENTED / LIVE_ROUTE_NOT_OBSERVED / P0_ACTIVE / NO_SITE_OR_MANUSCRIPT_WRITE / NO_PUBLICATION_SUBMISSION / AUTOMATION_UNCHANGED / SCHEDULER_IN_PROGRESS`.
